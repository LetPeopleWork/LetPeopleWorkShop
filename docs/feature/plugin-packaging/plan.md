# Plan — Package LetPeopleWorkShop as a Claude Code plugin

> Goal: let anyone run `/plugin install` to get the LetPeopleWorkShop toolkit, instead of cloning.
> This realizes ADR-001 (the toolkit was built plugin-ready under `.claude/`). Grounded in the current
> Claude Code plugin/marketplace mechanics (docs: code.claude.com/docs/en/plugins, plugin-marketplaces,
> plugins-reference).

## How Claude Code plugins actually work (the facts that shape this)
- A **plugin** is a directory with a `.claude-plugin/plugin.json` manifest. **`agents/`, `skills/`,
  `commands/`, `hooks/` live at the plugin ROOT** — not under `.claude/`. (Only `plugin.json` sits in
  `.claude-plugin/`.)
- Bundled files are referenced at runtime via **`${CLAUDE_PLUGIN_ROOT}`** (absolute path to the installed
  plugin). The project the user launched in is **`${CLAUDE_PROJECT_DIR}`**.
- **Installed plugins cannot read outside their own directory** (no `../` escapes). So every file a bundled
  agent/skill reads (practices, templates) **must be inside the plugin**.
- A **marketplace** is a git repo with `.claude-plugin/marketplace.json` cataloguing plugins. A single repo
  can be its own single-plugin marketplace. Users run
  `/plugin marketplace add LetPeopleWork/LetPeopleWorkShop` then
  `/plugin install <plugin-name>@<marketplace-name>`.
- Skills become namespaced: `/<plugin-name>:facilitation-practices`.
- **Versioning:** explicit semver in `plugin.json` (recommended) or git SHA if omitted.

## The core challenge: two path conventions
Our agents touch two *different kinds* of files, and the plugin model splits them:

| What | Today (repo-relative) | As a plugin |
|---|---|---|
| **Toolkit** — practices library, templates | `.claude/skills/.../practices/*.md`, `templates/*.md` | **`${CLAUDE_PLUGIN_ROOT}/...`** (bundled, read-only) |
| **User content** — workshops, lessons | `workshops/<slug>/...`, `lessons-learned/*.md` | **project-relative** (`${CLAUDE_PROJECT_DIR}/...`) — stays in the user's own workspace |

This split is exactly the toolkit↔content boundary we already enforce (D6/D7) — so it's a path rewrite,
not a redesign. Templates must also **move inside the plugin** (they're toolkit, currently at repo root).

## Structural decision (needs your call)
**Option A — build step, keep `.claude/` for dev.** Keep developing in `.claude/` + `templates/`; a script
assembles a `plugin/` dir (copies agents+skills+templates to plugin root, rewrites toolkit paths to
`${CLAUDE_PLUGIN_ROOT}`, writes `plugin.json`). Marketplace points at it.
- ✅ Current "clone & use via `.claude/`" workflow keeps working. ❌ Two layouts + a path-rewriting build to maintain.

**Option B — plugin-first (recommended).** Promote the toolkit to the repo root (`agents/`, `skills/`,
`templates/`), add `.claude-plugin/plugin.json` + `marketplace.json`, use `${CLAUDE_PLUGIN_ROOT}` for toolkit
files everywhere. For local hacking, run `claude --plugin-dir .` (which sets `${CLAUDE_PLUGIN_ROOT}`), so the
*same* paths work in dev and installed.
- ✅ One layout, single source of truth, structurally honest (the repo **is** the plugin). ✅ Aligns with the
  vision end-state: the public repo = pure toolkit; **your** workshops live in your own private workspace where
  you install the plugin. ❌ This repo stops working as a plain `.claude/` project (dev = `--plugin-dir .` or
  install); your current in-repo `workshops/cross-team-collab-s1/` would move to that private workspace.

**Option C — generator action (recommended).** Keep `main` exactly as it is (clone-and-use via `.claude/`
with relative paths). Add a **build script** (`scripts/build-plugin.sh`) that *generates* the plugin form
from `main`: copies `.claude/agents/`→`agents/`, `.claude/skills/`→`skills/`, `templates/`→`templates/`,
**rewrites toolkit paths to `${CLAUDE_PLUGIN_ROOT}`**, and emits `.claude-plugin/plugin.json`. A thin
**GitHub Action** runs it on a release tag and publishes the built tree (a `release` branch or release
asset) that the marketplace points at.
- ✅ Single source of truth (`main`/`.claude/`); clone-and-use untouched; plugin auto-generated — both
  audiences, no hand-maintained second layout. ✅ Re-deriving from `main` removes the "moving target" risk —
  build anytime, bump the version. ❌ A small path-rewrite transform to keep correct (few, well-defined refs;
  guarded by a CI structural check). ❌ CI validates *structure* but can't fully *run* agents (needs model
  access) — smoke-test locally with `claude --plugin-dir ./build` before tagging.

**Recommendation: Option C.** It dominates A (no second layout to maintain by hand) and B (keeps the
easy clone-and-use). A and B remain documented as manual fallbacks. The clone-mode repo stays your single
source of truth; the plugin is a *generated artifact*.

### Generator design (Option C)
- **Source → output transform** (`scripts/build-plugin.sh`, output `./build/plugin/`):
  - `.claude/agents/*.md` → `build/plugin/agents/*.md`
  - `.claude/skills/facilitation-practices/` → `build/plugin/skills/facilitation-practices/`
  - `templates/*.md` → `build/plugin/templates/*.md`
  - write `build/plugin/.claude-plugin/plugin.json` (version from the git tag)
- **Path rewrite** (toolkit only — see the Phase-2 inventory table): in the *copied* agents + SKILL,
  `\.claude/skills/facilitation-practices/practices/` → `${CLAUDE_PLUGIN_ROOT}/skills/facilitation-practices/practices/`
  and `templates/<x>.md` → `${CLAUDE_PLUGIN_ROOT}/templates/<x>.md`. Leave `workshops/…` and
  `lessons-learned/…` untouched (project-relative in both modes).
- **CI guard:** after building, assert (a) `plugin.json` is valid JSON with required fields, (b) expected
  agents/skills/templates present, (c) **no relative toolkit path leaked** — `grep` the built agents for
  `.claude/skills/` or a bare `templates/` toolkit ref and fail if found.
- **Publish:** GitHub Action on `v*` tag → run build → push `build/plugin/` to the `release` branch (or
  attach as a release asset). `.claude-plugin/marketplace.json` on `main` lists the plugin with
  `source: {github, repo: LetPeopleWork/LetPeopleWorkShop, ref: release}` (exact wiring confirmed in the spike).

## Recommended approach: SPIKE first (de-risk before migrating)
Consistent with how we built everything else — validate the riskiest unknown cheaply before the full move.
- **Probe question:** does a *minimal* plugin (1 agent + the practices skill + 1 template, with
  `${CLAUDE_PLUGIN_ROOT}` paths) install from a local marketplace and run end-to-end — agent reads a bundled
  practice, writes a `design.md` into the *project* dir — in a throwaway test project?
- **If yes → PROMOTE** to the full migration. **If path resolution surprises us → adjust** before touching all
  three agents.
- `claude --plugin-dir ./` is the fast local test loop.

## Phased plan

### Phase 0 — Spike (½ day)
1. Scaffold a throwaway `plugin/` with `.claude-plugin/plugin.json`, `agents/designer.md` (paths →
   `${CLAUDE_PLUGIN_ROOT}`), `skills/facilitation-practices/` (SKILL + 2 practices), `templates/brief.md`,
   `templates/design.md`.
2. `claude --plugin-dir ./plugin` in a scratch project; run the designer; confirm it reads the bundled
   practice and writes `design.md` into the scratch project (not the plugin).
3. Confirm `/plugin marketplace add .` + `/plugin install` works from a local `marketplace.json`.
4. Record findings; pick Option A vs B for real.

### Phase 1 — Manifests & layout (Option B)
5. Add `.claude-plugin/plugin.json`: `name: let-people-workshop`, `version: 1.0.0`, `description`, `author`
   (LetPeopleWork), `homepage`/`repository`, `license: MIT`, `keywords: [facilitation, workshops,
   liberating-structures, training-from-the-back-of-the-room, claude-code]`.
6. Move toolkit to root: `.claude/agents/` → `agents/`; `.claude/skills/` → `skills/`; keep `templates/` at
   root (already there). Add agent frontmatter `model`/`maxTurns` if useful.
7. Add `.claude-plugin/marketplace.json` (single-plugin catalog; `source: "."` or the GitHub repo).

### Phase 2 — Path migration (the real work)
8. In **all three agents + SKILL.md + templates**, rewrite **toolkit** reads to `${CLAUDE_PLUGIN_ROOT}/...`:
   - practices glob: `${CLAUDE_PLUGIN_ROOT}/skills/facilitation-practices/practices/*.md` (designer, executor, feedback)
   - templates: `${CLAUDE_PLUGIN_ROOT}/templates/{brief,design,setup,feedback,lesson}.md` (all agents)
9. Leave **user-content** writes/reads project-relative (or `${CLAUDE_PROJECT_DIR}/...`): `workshops/<slug>/...`,
   `lessons-learned/*.md`. Confirm slug-citation grounding (ADR-004) is path-independent (it already is).
10. Update `CLAUDE.md`, `README`, and the SSOT `architecture/brief.md` for the new layout + run modes.

### Phase 3 — Test
11. `claude --plugin-dir .` in a fresh scratch project: run designer → executor → feedback end-to-end;
    confirm a full brief→design→setup→feedback→lesson cycle writes into the *project*, reading toolkit from the
    plugin. Re-run the designer to confirm the lessons-loop reads project `lessons-learned/`.
12. Install via the marketplace flow (`/plugin marketplace add LetPeopleWork/LetPeopleWorkShop` →
    `/plugin install`) and repeat the smoke test.

### Phase 4 — Publish
13. Tag `v1.0.0`; push. The repo is now both source and marketplace.
14. README: add an "Install as a plugin" quickstart (the two `/plugin` commands) alongside the clone path.
15. (Optional) Submit to the community marketplace: https://platform.claude.com/plugins/submit.

### Phase 5 — Migrate your own usage
16. Create your private workshop workspace (a separate folder/repo); `/plugin install` the toolkit there;
    move `workshops/cross-team-collab-s1/` + future sessions into it. This repo becomes the clean public plugin.

## Path-rewrite inventory (Phase 2 reference)
| File | Toolkit refs to rewrite → `${CLAUDE_PLUGIN_ROOT}` | User-content refs (leave project-relative) |
|---|---|---|
| `agents/designer.md` | practices glob, `templates/brief.md`, `templates/design.md` | `workshops/<slug>/`, `lessons-learned/*.md` |
| `agents/executor.md` | practices glob, `templates/setup.md` | `workshops/<slug>/design.md`, `workshops/<slug>/setup.md` |
| `agents/feedback.md` | practices glob, `templates/feedback.md`, `templates/lesson.md` | `workshops/<slug>/`, `lessons-learned/<date>-*.md` |
| `skills/facilitation-practices/SKILL.md` | self-references to `practices/` | — |

## Risks & notes
- **No `../` escape**: every toolkit file the agents read must be bundled — done by moving templates into the
  plugin (Phase 1.6).
- **Dev ergonomics**: losing plain `.claude/` use is mitigated by `--plugin-dir .`; document it.
- **Two run-contexts to keep straight**: toolkit = plugin root; content = project dir. The path inventory above
  is the guard against mixing them.
- **Existing private workshops**: a one-time move (Phase 5), not a rewrite.
- **Back-compat**: if you want to *also* keep clone-and-`.claude/` working, that's Option A's build step — extra
  maintenance for a workflow `--plugin-dir` already covers.

## Open decisions for you
1. **Option A / B / C** (recommend **C — the generator action**: single source of truth + clone-and-use + an
   auto-generated plugin).
2. **Plugin name**: `let-people-workshop` (kebab; skill becomes `/let-people-workshop:facilitation-practices`) — ok?
3. **When**: with Option C the **generator can be built anytime** (it re-derives from `main`, so no "moving target"
   risk) — but **cutting the `v1.0.0` marketplace release** is still best *after* you've dogfooded the cross-team
   session, so v1 reflects a toolkit proven on a real workshop. So: build the generator whenever; publish v1 post-session.
