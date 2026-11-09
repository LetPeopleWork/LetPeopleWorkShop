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
- **Add a practice:** copy `skills/facilitation-practices/practices/_TEMPLATE.md` → `<slug>.md`, fill frontmatter + body. No code change. **Must pass the four gates** (see below + `NOTICE.md`).
- **Add an agent:** drop a file in `agents/`. It composes via the `workshops/<slug>/` folder; reference bundled toolkit files via `${CLAUDE_PLUGIN_ROOT}`.

## Licensing & the rights layer (hold this)
Dual-licensed: **MIT** for the toolkit (agents, templates, skill plumbing, docs — see `LICENSE`) and
**CC BY-SA 4.0** for the practice *content* (`skills/facilitation-practices/practices/*.md` — see
`LICENSE-CONTENT`). `plugin.json` declares `MIT AND CC-BY-SA-4.0`. The per-source rights registry is
[`NOTICE.md`](NOTICE.md) — keep it current when adding a source.

**The four gates — every new method (added by a human OR the `designer`) must pass all four:**
1. **Original expression only** — our words and our schema; never copy/close-paraphrase the source text.
2. **No protected instruments** — never reproduce a source's worksheet, diagram, assessment, or exact
   question sequence. Describe the *process*. If it can't be described without copying the instrument,
   it does not go in.
3. **Attribute the originator** — `source` + `source_url` + a body credit line.
4. **Disclaim affiliation + acknowledge trademark** — add a `NOTICE.md` row; set frontmatter
   `rights_status`/`trademark`/`attribution` where relevant. The standing `NOTICE.md` disclaimer covers
   endorsement. This is what keeps the dual-license valid for *any* source, however commercially protected.

## Distribution
The repo IS the plugin (ADR-007). Submit once to the community marketplace
(claude.ai/settings/plugins/submit; run `claude plugin validate` first); after approval, every push
auto-updates the pin. No build step, no release branch, no committed artifacts.

## Method
Built with the nWave methodology (DISCUSS → DESIGN → SPIKE → …). Feature specs in
`docs/feature/<id>/feature-delta.md`; product SSOT in `docs/product/`. Paradigm: N/A (no code).

<!-- BEGIN nWave-beta-section (managed by nwave-ai; do not edit) -->

## nWave (beta) — How to Work in This Project

Three routes are open to a Request:
- Spine waves (whole-feature default): wave gates, independent review and
  source-blind EXAMINE where applicable; durable authorities. Evolution retains
  lasting facts; integration closes delivered work.
- Host-led nwdes steps: the root runs roles with generated prompts. Roles record
  typed values with kind verbs and close. nwdes builds and
  writes authority/run records; the host submits/retains no role reply.
  Public oracle before code; nwdes launches no model. Details: nw-nwdes skill and nwdes --help.
- Working directly: fastest; no gates, independent review or retained authority,
  so nothing attests the result.

The LLM chooses the route by what survives and the cost of late refusal,
and invokes the applicable waves. The final whole-candidate review and integration happen once per Request; embedded per-slice refinement reviews provide early feedback, not final approval.
Each Request opens with the LLM's working S/M/L assessment and why, which never decides the route.
The LLM revises it as evidence changes and suggests the fastest route that
keeps what must survive, naming what a faster one gives up; the user decides genuine scope and trade-offs.
Working directly remains open when little must survive.
Human WIP limit: 2. Finish open work before starting new work; nWave refuses
nothing by count.
When a review or EXAMINE rejects work, or new work is ready, the Lane flow
of the nw-throughput skill holds what comes next.
Whichever route this Request takes, say which one.

nWave is a spine-driven delivery framework. Wave commands (`/nw-*`) carry the
gates; skills carry on-demand knowledge; agents execute. This section is an
INDEX.

Human authority decides genuine scope/trade-offs.

| User wants... | Load / run |
|---|---|
| Validate a problem is real | `/nw-discover` |
| Compare solution directions | `/nw-diverge` |
| Clarify jobs, journeys, outcomes | `/nw-discuss` |
| Architecture, reuse, boundaries | `/nw-design` |
| Deployment / operational constraints | `/nw-devops` |
| Executable public oracle | `/nw-distill` |
| Dispatch one Request | `/nw-deliver` |
| Fix one observed defect | `/nw-bugfix` |
| Review an artifact or diff | `/nw-review` |
| Reduce a noisy test suite | `/nw-optimize-tests` |
| Explicit mutation probe | `/nw-mutation-test` |
| Resume after an interruption | Read-only: `git worktree list`, then `lanes/<feature>/docs/feature/<feature>/handoff.json` and skill `nw-nwdes` |
| Run several lanes in parallel | skill `nw-swarm` |
| Fuller S/M/L evidence, splitting a Request | skill `nw-auto` |
| Anything else — methodology, routing, "what do I do" | skill `nw-buddy` |

**Batch independent tool calls in one turn (one per turn is a violation); sequence only when one result feeds the next.**

### Asking the User a Question

Fixed shape, every time: **context** -> **recommendation** -> **options** (each
with its consequence/risk) -> one direct question. Real section headers and
bold labels — never a wall of text. User-facing output follows **ASD-STE100**
(Simplified Technical English).

Owner answer pending: independent ready work continues; only dependent work waits. Boundary and durable record: `nw-auto` §4.

### Communication

<!-- GENERATED:communication-rules START — source of truth: nwave_ai.platform.effective_config() (ADR-CFG-001 Slice 2 -- ~/.nwave/config.json + .nwave/config.json); do not hand-edit (docgen renders this region) -->
- Communication verbosity: **standard**
- Commit attribution: **enabled**
<!-- GENERATED:communication-rules END -->

### Privacy — Non-Negotiable

nWave stores workflow data locally and collects no telemetry. Jev, a remote question service, is on by default for supported questions and sends only permitted data classes; refuse it with `--jev unauthorized` or `"jev": "unauthorized"` in `~/.nwave/config.json`. `TYPESAFE_API_KEY` is only Jev's technical prerequisite, not its authorization ([PRIVACY.md](../../PRIVACY.md)). Feedback via GitHub Issues is welcome, never required.

<!-- END nWave-beta-section -->
