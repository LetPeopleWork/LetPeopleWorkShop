# ADR-002 — Practice files = YAML frontmatter index + prose body

**Status:** Accepted (2026-06-09) · **Feature:** workshop-designer

## Context
Each facilitation practice is a markdown file. The `facilitation-practices` skill must *recommend*
practices for a situation ("8 people, video, ≤15 min, need to surface dissent"), and a future plugin may
want to index the library. The spike validated a pure-prose shape but flagged that medium/size/time fit
was being inferred from prose each time.

## Decision
Every practice file carries **YAML frontmatter** as a machine-readable index, followed by a **prose body**
for the qualitative detail. Frontmatter: `slug` (== filename), `name`, `type` (`structure` | `principle`),
`source`, `source_url`, `mediums`, `group_min/max`, `time_min/max` (structures only), `tags`. Body:
`Purpose · When to use · Group config · Timing · Medium fit · Steps · Facilitator notes`.

## Alternatives considered
- **Pure prose (spike shape)** — lowest friction, but no machine filter for recommendation/indexing.
  Rejected: weakens the skill's core "recommend" job and future plugin indexing.
- **Fully structured (all detail in YAML/JSON)** — queryable but kills the prose nuance the designer
  leans on (facilitator notes, per-medium subtlety). Rejected: over-rotates to structure.

## Consequences
- The skill filters on frontmatter, then judges fit from the body — best of both.
- `type: principle` (e.g. `tbr-concrete-practice`) omits group/time and is recommended as a *lens*, never
  an agenda row with a duration.
- Adding a practice now requires filling frontmatter (mild ceremony) — documented in `_TEMPLATE.md`.
- The 6 seeded practices were migrated to this shape in the same wave.
