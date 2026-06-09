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
2. Fill every field; `Medium fit` and `Facilitator notes` matter most.
3. Done — no code change. The `designer` agent globs `practices/*.md` and picks it up.

## Practice file shape
`name · source(+link) · purpose · when-to-use · group config · timing(+trim/expand) · medium fit
(in-person/Miro/video) · steps · facilitator notes`

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
| `tbr-concrete-practice` | TBR | A *lens*: participants do the work, not the facilitator |
