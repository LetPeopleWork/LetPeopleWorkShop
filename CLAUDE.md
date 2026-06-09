# CLAUDE.md — LetPeopleWorkShop

Guidance for Claude Code working in this repo. Keep this current; it's loaded every session.

## What this is
A markdown-native facilitation toolkit, shipped as a **Claude Code plugin**: the repo root *is* the
plugin (`.claude-plugin/plugin.json` + `agents/` + `skills/`). No app, no runtime, no build. "Logic"
lives in agent prompts + skill knowledge; "data" is markdown + YAML frontmatter on the filesystem.

**Developing here:** test with `claude --plugin-dir .` (loads this repo as a plugin). Users get it via
`/plugin install let-people-workshop@letpeoplework` (or the community marketplace once approved).

## Architecture in one breath
Ports-and-adapters, document-oriented. **Agents are stateless transformers** over two things: the
**library** (read-only knowledge, bundled in the plugin) and a **`workshops/<slug>/` folder** (the
user's work-in-progress). Agents never call each other — they compose by reading/writing files in the
shared folder. Full detail + C4 diagrams: `docs/product/architecture/brief.md` and `adr-001..007`.

## Two path worlds (important)
- **Toolkit files** (bundled in the plugin) are read via **`${CLAUDE_PLUGIN_ROOT}/...`** — e.g.
  `${CLAUDE_PLUGIN_ROOT}/skills/facilitation-practices/practices/*.md`, `${CLAUDE_PLUGIN_ROOT}/templates/*.md`.
  Resolves both when installed and under `--plugin-dir`.
- **User content** is **project-relative** (in the user's workspace, not the plugin): `workshops/<slug>/`,
  `lessons-learned/`. Never read/write user content via `${CLAUDE_PLUGIN_ROOT}`.

## Directory roles
| Path | Role |
|---|---|
| `.claude-plugin/plugin.json` | plugin manifest (no `version` → commit-SHA auto-versioning) |
| `.claude-plugin/marketplace.json` | single-plugin marketplace (source `.`) for direct `/plugin marketplace add` |
| `agents/` | the agents (`designer`, `executor`, `feedback`) — driving ports |
| `skills/facilitation-practices/` | the practices **library** as a skill |
| `templates/` | `brief`/`design`/`setup`/`feedback`/`lesson` scaffolds (schemas) |
| `docs/` | product + architecture SSOT, ADRs, feature specs |
| `workshops/EXAMPLE-*/` | committed sanitized sample; real sessions live in the **user's** workspace (gitignored here) |
| `lessons-learned/` | user content (gitignored; only README committed) |

## Conventions (hold these)
- **Cite practices by slug**, never by path — `triz`, not a file path (ADR-004). A design is grounded only
  if every cited slug resolves to a practice in the `facilitation-practices` skill.
- **Toolkit reads via `${CLAUDE_PLUGIN_ROOT}`; user content project-relative.** (See "Two path worlds".)
- **Grounded, never generic** — every agenda structure traces to a real practice; if none fits, say so and
  flag a library gap. Don't invent un-backed structures.
- **Status lifecycle** on a brief: `draft → designed → run → archived`. Designer advances `draft→designed`,
  feedback advances `designed→run`, the facilitator owns `archived`.
- **Frontmatter is the index, prose is the detail.**
- **Assistant, not autopilot.** Propose; the facilitator decides. Designs must read like *they* could run them.

## Schemas (quick reference)
- **Practice** — fm: `slug,name,type(structure|principle|framework),source,source_url,mediums,group_min/max,time_min/max,tags`; body: Purpose · When to use · Group config · Timing · Medium fit · Steps · Facilitator notes. Template: `skills/facilitation-practices/practices/_TEMPLATE.md`.
- **Brief** — fm: `slug,status,created,medium,group_size,duration_min/max`; body: convener, goal, audience, constraints/sensitivities. Template: `templates/brief.md`.
- **Design** — fm: `slug,status,designed,total_min,time_band,grounding,lessons_applied,reuse`; body: goal, design stance, agenda, time reconciliation, facilitator notes, lessons applied, grounding check. Template: `templates/design.md`.
- **Setup / Feedback / Lesson** — `templates/{setup,feedback,lesson}.md`.

## Extending
- **Add a practice:** copy `skills/facilitation-practices/practices/_TEMPLATE.md` → `<slug>.md`, fill frontmatter + body. No code change.
- **Add an agent:** drop a file in `agents/`. It composes via the `workshops/<slug>/` folder; reference bundled toolkit files via `${CLAUDE_PLUGIN_ROOT}`.

## Distribution
The repo IS the plugin (ADR-007). Submit once to the community marketplace
(claude.ai/settings/plugins/submit; run `claude plugin validate` first); after approval, every push
auto-updates the pin. No build step, no release branch, no committed artifacts.

## Method
Built with the nWave methodology (DISCUSS → DESIGN → SPIKE → …). Feature specs in
`docs/feature/<id>/feature-delta.md`; product SSOT in `docs/product/`. Paradigm: N/A (no code).
