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
- **Liberating Structures** — https://www.liberatingstructures.com/ — the **full menu of 33** is included.
- **Training from the BACK of the Room** (Sharon Bowman) — https://bowperson.com/resources/index.html
- **Facilitator's Guide to Participatory Decision-Making** (Sam Kaner et al., Community at Work) — https://communityatwork.com/
- **The Art & Science of Facilitation** (Marsha Acker) / **structural dynamics** (David Kantor) — https://artandscienceoffacilitation.com/
- **Innovation Games** (Luke Hohmann — *registered trademark*; techniques attributed, no branded materials) — https://www.lukehohmann.com/innovation-games
- **Gamestorming** (Gray, Brown, Macanufo) — https://gamestorming.com/ (note: it catalogs others' methods — attribute to originals, e.g. pre-mortem = Gary Klein)

## Current practices
The 33 Liberating Structures + 3 TBR lenses/framework, grouped by what they're good for. Cite by slug.

### Openers & connection
| Slug | Source | Good for |
|------|--------|----------|
| `impromptu-networking` | LS | Warm-ups; equalizing voice early |
| `heard-seen-respected` | LS | Empathy + deep-listening opener |
| `nine-whys` | LS | Surfacing the shared deeper purpose of the work |
| `appreciative-interviews` | LS | Mining success stories for what already works |
| `conversation-cafe` | LS | Calm collective sense-making of a big/disturbing challenge |

### Diverge & surface input
| Slug | Source | Good for |
|------|--------|----------|
| `1-2-4-all` | LS | Surfacing input without domination |
| `25-10-crowd-sourcing` | LS | Crowd-ranking bold ideas fast (15+ people) |
| `drawing-together` | LS | Surfacing insight words can't reach (visual) |
| `social-network-webbing` | LS | Mapping who you really need to engage |

### Converge, decide & prioritize
| Slug | Source | Good for |
|------|--------|----------|
| `min-specs` | LS | Stripping rules to the minimum that still works |
| `15-percent-solutions` | LS | Turning big problems into doable first steps + ownership |
| `agreement-certainty-matrix` | LS | Matching approach to problem type (simple…chaotic) |
| `design-storyboards` | LS | Making a plan concrete and testable before committing |
| `gradients-of-agreement` | Kaner | Testing the *strength* of support for a proposal — prevents false consensus |

### Charged topics & relationships
| Slug | Source | Good for |
|------|--------|----------|
| `triz` | LS | Charged topics; admitting what we already do wrong |
| `wicked-questions` | LS | Naming a paradox instead of forcing an either/or |
| `integrated-autonomy` | LS | Breaking an either/or into both/and |
| `generative-relationships-star` | LS | Diagnosing a stuck working relationship without blame |
| `what-i-need-from-you` | LS | Surfacing cross-team interdependencies (WINFY) |

### Peer help & learning transfer
| Slug | Source | Good for |
|------|--------|----------|
| `troika-consulting` | LS | Peer coaching in trios (client turns away) |
| `wise-crowds` | LS | Group consults one client at a time |
| `helping-heuristics` | LS | Practising how to give/receive help well |
| `improv-prototyping` | LS | Acting out solutions so they stick |
| `shift-and-share` | LS | Spreading innovations via station rotation |
| `celebrity-interview` | LS | Interviewing a leader/expert instead of a lecture |
| `user-experience-fishbowl` | LS | Transferring tacit know-how (inner/outer circle) |
| `discovery-action-dialogue` | LS | Finding the group's own already-working behaviors (DAD) |
| `simple-ethnography` | LS | Observing real behavior in the field |

### Debrief, retro & sense-making
| Slug | Source | Good for |
|------|--------|----------|
| `what-so-what-now-what` | LS | Debrief; sense-making without premature solutions |
| `speed-boat` | Hohmann | Retro: surfacing impediments via boat-and-anchors (depersonalized) |

### Strategy, foresight & big-picture
| Slug | Source | Good for |
|------|--------|----------|
| `ecocycle-planning` | LS | Portfolio view: what to start, sustain, let go |
| `critical-uncertainties` | LS | Scenario strategy under deep uncertainty |
| `panarchy` | LS | Seeing why change stalls across nested system levels |
| `purpose-to-practice` | LS | Designing a resilient initiative (P2P, 5 elements) |
| `open-space-technology` | LS | Self-organizing marketplace for big complex challenges |
| `remember-the-future` | Hohmann | Prospective-hindsight visioning ("imagine it worked — what did it do?") |
| `pre-mortem` | Klein | Prospective risk: imagine it failed, surface why (before committing) |

### Lenses & frameworks (apply as stance/backbone, not agenda rows)
| Slug | Source | Good for |
|------|--------|----------|
| `tbr-concrete-practice` | TBR | *Lens*: participants do the work, not the facilitator |
| `tbr-brain-rules` | TBR | *Lens*: the Six Trumps (+ WIIFM, primacy-recency) — brain-friendly design |
| `tbr-4cs` | TBR | *Framework*: session backbone — Connections → Concepts → Concrete Practice → Conclusions |
| `participatory-decision-diamond` | Kaner | *Framework*: Divergent → Groan Zone → Convergent decision arc |
| `four-player-model` | Kantor/Acker | *Lens*: read why a conversation is stuck (Move/Follow/Oppose/Bystand) |
