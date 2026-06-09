---
name: facilitation-practices
description: The library of facilitation structures (Liberating Structures, Training from the BACK of the Room, and more). Use to list, explain, recommend, or ground a design in proven practices. Extensible — add a practice by dropping a markdown file in practices/.
---

# Facilitation practices library

A curated, extensible library of facilitation **structures**, one markdown file per practice in
`practices/`. This skill is the grounding source for the `designer` agent and a browsable reference
for the facilitator.

## What you can do with it
- **List** the available practices and what each is good for.
- **Explain** a practice (purpose, steps, medium fit, facilitator notes).
- **Recommend** structures for a situation (charged topic, surfacing input, debrief, naming a paradox…).
- **Ground a design** — every structure in a workshop `design.md` must cite a practice that exists here.

## Citation convention (important)
Practices are cited by **slug** — the filename without `.md`. Examples: `triz`, `1-2-4-all`,
`impromptu-networking`. A design is "grounded" only if every cited slug resolves to a
`practices/<slug>.md` in this skill. Designs never hardcode the physical path — they cite the slug —
so the library can move (e.g. into a packaged plugin) without rewriting any design.

## How to add a practice
1. Copy `practices/_TEMPLATE.md` to `practices/<kebab-slug>.md`.
2. Fill the frontmatter (the index) and the prose body (the detail).
3. Done — no code change. The `designer` agent and this skill glob `practices/*.md` and pick it up.

## Practice file shape: frontmatter index + prose body
Each practice is YAML frontmatter (machine-readable) followed by a markdown body (the rich detail).

**Frontmatter fields:**
`slug` (== filename) · `name` · `type` (`structure` | `principle` | `framework`) · `source` · `source_url` ·
`mediums` (subset of `in-person`/`miro`/`video`) · `group_min` / `group_max` · `time_min` / `time_max`
(minutes; structures only) · `tags` (optional).

`type` meanings: **`structure`** = a timed activity that becomes an agenda row; **`principle`** = a lens
applied across the agenda (no timing); **`framework`** = a macro-arc you map structures onto (e.g. the 4Cs).

**Body sections:** `Purpose · When to use · Group config · Timing · Medium fit (per-medium notes) ·
Steps · Facilitator notes`.

## Recommending practices (use the frontmatter)
To recommend structures for a situation, filter on frontmatter first, then judge fit from the body:
- **Medium** → `mediums` contains the session medium.
- **Group size** → `group_min ≤ size ≤ group_max`.
- **Time** → `time_min ≤ available slot`.
- **Purpose** → match `tags` + the `Purpose`/`When to use` prose.
A `type: principle` entry (e.g. `tbr-concrete-practice`, `tbr-brain-rules`) is a *lens* applied across the
agenda, not a timed block. A `type: framework` entry (e.g. `tbr-4cs`) is a *backbone* you sequence
structures onto. Recommend both as stance/structure-of-the-whole, never as an agenda row with a duration.

## Sources seeded so far
- **Liberating Structures** — https://www.liberatingstructures.com/
- **Training from the BACK of the Room** (Sharon Bowman) — https://bowperson.com/resources/index.html

## Current practices
| Slug | Source | Good for |
|------|--------|----------|
| `impromptu-networking` | LS | Warm-ups, equalizing voice early |
| `1-2-4-all` | LS | Surfacing input without domination |
| `triz` | LS | Charged topics; admitting what we already do wrong |
| `what-so-what-now-what` | LS | Debrief; sense-making without premature solutions |
| `wicked-questions` | LS | Naming a paradox instead of forcing an either/or |
| `tbr-concrete-practice` | TBR | *Lens*: participants do the work, not the facilitator |
| `tbr-brain-rules` | TBR | *Lens*: the Six Trumps (+ WIIFM, primacy-recency) — brain-friendly design |
| `tbr-4cs` | TBR | *Framework*: session backbone — Connections → Concepts → Concrete Practice → Conclusions |
