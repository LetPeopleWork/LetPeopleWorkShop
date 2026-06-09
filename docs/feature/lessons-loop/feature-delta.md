# Feature: lessons-loop

> Combined lean DISCUSS+DESIGN (the feature is thin and pre-designed: the job exists, and the lesson
> schema was built loop-ready in ADR-005). **Extends the `designer`** — no new agent. Closes the
> learning cycle: each debrief makes the next design smarter.

---

## Wave: DISCUSS / [REF] Persona ID
`facilitator` — designing a new workshop, wanting the benefit of everything learned before. See `docs/product/personas/facilitator.yaml`.

## Wave: DISCUSS / [REF] JTBD one-liner
**`reuse-lessons-in-design`** — *When I design a new workshop, I want the designer to surface relevant lessons from my past sessions, so I stop repeating mistakes and reuse what landed.* (Opportunity 7; depends on `design-grounded-agenda` + `learn-from-sessions`.)

## Wave: DISCUSS / [REF] Pre-requisites
- `workshop-designer` (the designer) + `feedback-capture` (writes tagged lessons) shipped.
- **Lesson schema is already loop-ready (ADR-005):** one file per lesson, frontmatter `practices` (slugs)
  + `themes`. This feature is the *reader* the schema was designed for.

## Wave: DISCUSS / [REF] Driving ports
- Same as the designer — invoke the `designer` subagent on a `brief.md`. Lessons consultation is now part of its flow (no separate entry point).

## Wave: DISCUSS / [REF] User stories

### Story 1 — Designer applies relevant past lessons
**As** the facilitator, **I want** the designer to recall and apply lessons from my past sessions while designing, **so that** I stop repeating mistakes and reuse what worked.
`job_id: reuse-lessons-in-design`

#### Elevator Pitch
Before: I design fresh each time and only remember past lessons by luck; the same mistakes recur.
After: run the **designer agent** on a `brief.md` → the design now reflects relevant past lessons (e.g. *"swapped TRIZ → wicked-questions: a lesson flagged TRIZ fell flat with senior execs"*), with a **Lessons applied** note + `lessons_applied` frontmatter citing which lessons informed it.
Decision enabled: I trust the design carries my hard-won experience, and I can see exactly which lessons shaped it.

**Acceptance criteria**
- AC1: Before writing a design, the designer globs `lessons-learned/*.md` and selects lessons whose `practices` intersect the candidate structures OR whose `themes` match the brief's context/sensitivities.
- AC2: Relevant lessons **shape** the design — a swap, a facilitator note, or a timing adjustment — not just a footnote.
- AC3: The design cites applied lessons in a **Lessons applied** body section + `lessons_applied` frontmatter (filenames).
- AC4: Irrelevant lessons are not surfaced; if none are relevant (or `lessons-learned/` is empty), the section is omitted silently — no invented lessons, no nagging.
- AC5: The designer applies judgement — a lesson from a clearly different context is noted as possibly-non-transferring rather than force-fit.

## Wave: DISCUSS / [REF] WS strategy
**Strategy B — extend an existing agent.** No new component; adds a lesson-consultation step + a `design.md` element. One slice.

## Wave: DISCUSS / [REF] Out of scope
- Changing the lesson schema (already set, ADR-005).
- A separate "browse lessons" UI/agent (the `facilitation-practices` skill pattern could later list lessons, but not this feature).
- Ranking/ML relevance — simple tag intersection + judgement is enough at this scale.
- Cross-session trend analytics.

## Wave: DISCUSS / [REF] Outcome KPIs
- **Lesson application rate** — % of designs (where ≥1 relevant lesson exists) that actually cite a `lessons_applied`. Target ≥ 90%. Measure: `lessons_applied` non-empty vs. available relevant lessons.
- **Repeat-mistake rate** — mistakes recurring across sessions despite a prior lesson. Target: trend → 0. Measure: feedback debriefs flagging a known, previously-captured issue.
- **Signal, not noise** — applied lessons judged relevant by the facilitator. Target ≥ 80% "yes, relevant".

## Wave: DISCUSS / [REF] Definition of Done
1. Designer consults `lessons-learned/` before writing. 2. Relevance = `practices` ∩ structures OR `themes` ∩ context. 3. Lessons shape the design (swap/note/timing). 4. `Lessons applied` section + `lessons_applied` frontmatter. 5. Empty/irrelevant → silent omission. 6. Judgement on transfer applied. 7. design.md template carries the element. 8. SSOT loop closed (designer reads lessons; C4 updated). 9. CLAUDE.md/README note the loop.

## Wave: DISCUSS / [REF] DoR validation
| # | DoR item | Status | Evidence |
|---|---|---|---|
| 1 | User value clear | ✓ | JTBD `reuse-lessons-in-design`, opportunity 7 |
| 2 | Persona identified | ✓ | `personas/facilitator.yaml` |
| 3 | Job traceability | ✓ | story → `reuse-lessons-in-design` |
| 4 | AC testable | ✓ | observable `lessons_applied` + Lessons-applied section on a design |
| 5 | Journey mapped | ✓ | extends `journeys/design-workshop.yaml` (lessons now feed the design step) |
| 6 | Scope bounded | ✓ | extends designer; schema fixed; analytics/UI out |
| 7 | Walking skeleton | ✓ (N/A) | brownfield; Strategy B |
| 8 | KPIs measurable | ✓ | application rate / repeat-mistake / signal, numeric targets |
| 9 | Dependencies known | ✓ | needs designer + feedback (lessons exist); ADR-005 schema |

## Wave: DISCUSS / [REF] Scope Assessment
**PASS (right-sized).** 1 story, extends one agent, consumes an existing schema. No oversize signal.

---

## Wave: DESIGN / [REF] DDD list
- **[DD1] Extend the `designer`, not a new agent.** The loop is a consultation step inside the existing design flow (ADR-003 keeps agents folder-composing; here the designer reads one more driven port).
- **[DD2] Relevance = tag intersection + judgement.** `practices` (slugs) ∩ candidate structures, OR `themes` ∩ brief context; then the designer judges transfer. No ranking/ML.
- **[DD3] Lessons both shape AND are cited.** Transparency (`lessons_applied` + a body section) so the loop is visible and trusted, never silent magic.
- **[DD4] Silent when empty/irrelevant.** No nagging, no invented lessons.

## Wave: DESIGN / [REF] Component decomposition
| Component | Path | Change |
|---|---|---|
| `designer` agent | `.claude/agents/designer.md` | EXTEND (consult + apply + cite lessons) |
| design template | `templates/design.md` | EXTEND (`lessons_applied` fm + Lessons-applied section) |
| lessons store | `lessons-learned/*.md` | REUSE (read; schema unchanged, ADR-005) |
| architecture SSOT | `docs/product/architecture/brief.md` | EXTEND (loop closed; C4 edge solid) |

## Wave: DESIGN / [REF] Driving / driven ports
- Driving: invoke `designer` (unchanged entry point).
- Driven (new): **read** `lessons-learned/*.md`. (Existing: read brief, read practices, write design, set brief status.)

## Wave: DESIGN / [REF] Technology choices
- Unchanged: Markdown + YAML frontmatter, Claude Code subagent, filesystem. No runtime/build. Paradigm N/A.

## Wave: DESIGN / [REF] Decisions table
| ID | Decision |
|---|---|
| DD1 | Extend designer (no new agent) |
| DD2 | Relevance = tag intersection + judgement |
| DD3 | Lessons shape AND are cited (`lessons_applied`) |
| DD4 | Silent when empty/irrelevant |

## Wave: DESIGN / [REF] Reuse Analysis
| Existing Component | File | Overlap | Decision | Justification |
|---|---|---|---|---|
| designer agent | `.claude/agents/designer.md` | design flow | EXTEND | adding a lesson-consult step (~8 lines) IS the feature — a separate "lessons" agent couldn't shape the design it isn't writing |
| design template | `templates/design.md` | schema | EXTEND | add `lessons_applied` fm + section |
| lessons store | `lessons-learned/*.md` | read | REUSE | schema already loop-ready (ADR-005); no change |

Zero CREATE NEW — this feature is pure extension/reuse, exactly as the schema was designed for.

## Wave: DESIGN / [REF] Outcome Collision Check
Skipped (correct): document/agent feature, no typed code-contract surface.

## Wave: DESIGN / [REF] Open questions
- **Relevance precision at scale** — pure tag-intersection may surface too much once there are many lessons; revisit a relevance threshold / recency weighting if noise appears (KPI "signal, not noise" watches this).
- **Dormancy** — the loop only demonstrably fires once real lessons exist (after running + debriefing sessions). Built now; validated when data accrues.

## Wave: DESIGN / [REF] Wave decisions
- **[D1] How lessons surface (the one real UX choice):** the designer *applies* relevant lessons to the design **and** transparently *cites* them (`lessons_applied` + a Lessons-applied section) — visible, trusted, not silent. Default chosen and built.
- **[D2] Relevance is tag-intersection + judgement**, not ranking/ML — right-sized for a single user.
- **[D3] No new agent** — the loop lives inside the designer (DD1).

## Wave: DESIGN / [REF] Build note
Built in-wave by extending the designer + design template + closing the SSOT loop. Dormant until real
lessons accrue (run a session → debrief with `feedback` → next design applies the lesson).
