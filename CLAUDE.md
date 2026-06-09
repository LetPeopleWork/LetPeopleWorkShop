# CLAUDE.md — Facilitation Hub

Guidance for Claude Code working in this repo. Keep this current; it's loaded every session.

## What this is
A markdown-native, Claude-Code-native **facilitation toolkit + workshop archive + planning hub**.
**The repo *is* the tool** — there is no app, no runtime, no build. "Logic" lives in agent prompts and
skill knowledge; "data" is markdown + YAML frontmatter on the filesystem.

## Architecture in one breath
Ports-and-adapters, document-oriented. **Agents are stateless transformers** over two things: the
**library** (read-only knowledge) and a **`workshops/<slug>/` folder** (work-in-progress they read and
write). Agents never call each other — they compose by reading/writing files in the shared folder.
Full detail + C4 diagrams: `docs/product/architecture/brief.md` and `adr-001..004`.

## Directory roles
| Path | Role | Git |
|---|---|---|
| `.claude/agents/` | the agents (e.g. `designer`) — driving ports | committed (toolkit) |
| `.claude/skills/facilitation-practices/` | the practices **library** as a skill | committed (toolkit) |
| `templates/` | `brief.md` / `design.md` scaffolds (schemas) | committed |
| `workshops/<slug>/` | real sessions: `brief.md` → `design.md` (→ future `setup.md`, `feedback.md`) | **gitignored** (except `EXAMPLE-*`) |
| `lessons-learned/` | aggregated reusable lessons | **gitignored** |
| `docs/` | product + architecture SSOT, feature specs | committed |

**Public toolkit vs. private content (D6):** the repo is published publicly; real workshop content and
lessons are gitignored. Never commit anything under `workshops/<slug>/` (other than `EXAMPLE-*`) or
`lessons-learned/`. The whole reusable toolkit is the self-contained `.claude/` subtree (D7 / ADR-001) —
it mirrors a Claude Code plugin layout, so keep it free of any dependency on user content.

## Conventions (hold these)
- **Cite practices by slug**, never by path — `triz`, not `practices/triz.md` (ADR-004). A design is
  grounded only if every cited slug resolves to a `practices/<slug>.md`.
- **Grounded, never generic** — every agenda structure traces to a real practice; if none fits, say so
  and flag a library gap. Don't invent un-backed structures.
- **Status lifecycle** on a brief: `draft → designed → run → archived`. The designer advances
  `draft → designed`; the facilitator owns `run`/`archived`.
- **Frontmatter is the index, prose is the detail.** Practice/brief/design files lead with YAML
  frontmatter (machine-readable) then markdown body (the nuance).
- **Assistant, not autopilot.** Propose; the facilitator decides. Designs must read like *they* could run them.

## Schemas (quick reference)
- **Practice** — fm: `slug,name,type(structure|principle),source,source_url,mediums,group_min/max,time_min/max,tags`; body: Purpose · When to use · Group config · Timing · Medium fit · Steps · Facilitator notes. Template: `.claude/skills/facilitation-practices/practices/_TEMPLATE.md`.
- **Brief** — fm: `slug,status,created,medium,group_size,duration_min/max`; body: convener, goal, audience, constraints/sensitivities. Template: `templates/brief.md`.
- **Design** — fm: `slug,status,designed,total_min,time_band,grounding,reuse`; body: goal, design stance, agenda table, time reconciliation, facilitator notes, grounding check. Template: `templates/design.md`.

## Extending
- **Add a practice:** copy `_TEMPLATE.md` → `<slug>.md`, fill frontmatter + body. No code change.
- **Add an agent:** drop a file in `.claude/agents/`. It composes via the `workshops/<slug>/` folder.

## Method
This project is built with the nWave methodology (DISCUSS → DESIGN → SPIKE → … ). Feature specs live in
`docs/feature/<id>/feature-delta.md`; product SSOT in `docs/product/`. Paradigm: N/A (no code); if a
small tool (e.g. a grounding linter) is ever added, default to OOP and revisit.
