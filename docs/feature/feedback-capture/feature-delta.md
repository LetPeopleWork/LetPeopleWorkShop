# Feature: feedback-capture

> DISCUSS wave output (lean). Second feature of the Facilitation Hub — the first half of the learning
> loop. Builds on the established `workshops/<slug>/` folder contract (ADR-003). Brownfield: no walking
> skeleton; the folder + agent infrastructure already exist.

---

## Wave: DISCUSS / [REF] Persona ID
`facilitator` — the single primary user, now in *reflective* mode after running a session. See `docs/product/personas/facilitator.yaml`.

## Wave: DISCUSS / [REF] JTBD one-liner
**`learn-from-sessions`** — *When a session ends, I want to debrief what worked and what didn't into reusable lessons, so my next design starts smarter than the last.* (Opportunity 7 — high importance, near-zero current satisfaction.)

## Wave: DISCUSS / [REF] Pre-requisites
- `workshop-designer` shipped: the `workshops/<slug>/` folder, `design.md`, and status lifecycle exist.
- **Architecture pre-decided (ADR-003):** the `feedback` agent reads `design.md`, writes `feedback.md`, and creates/appends `lessons-learned/` entries — all via the shared workshop folder. Stateless; composes by files, not calls.
- **Loop-readiness constraint:** lessons must be tagged so the future `lessons-loop` feature (designer reads lessons) is trivial — design the lesson schema now, build the reader later.

## Wave: DISCUSS / [REF] Driving ports (inbound surfaces)
- **`feedback` subagent** invoked inside Claude Code, pointed at a `workshops/<slug>/` folder, after a session has run. Only user-invocable entry point for this feature.

## Wave: DISCUSS / [REF] User stories

### Story 1 — Debrief a session from a brain-dump
**As** the facilitator (tired, post-session), **I want** to dump my impressions and have them organized into a structured feedback record with an overall rating, **so that** I capture what happened without filling a form.
`job_id: learn-from-sessions`

#### Elevator Pitch
Before: after a session I move straight on; my impressions evaporate within a day.
After: run the **feedback agent** on `workshops/<slug>/` → brain-dump (talk/type) → sees `workshops/<slug>/feedback.md` with my dump organized into sections (what worked, what didn't, timing planned-vs-actual, energy/surprises, what I'd change) + an overall rating, with the agent asking only the gaps it needs.
Decision enabled: I see clearly what to repeat and what to avoid next time.

**Acceptance criteria**
- AC1: Given a `workshops/<slug>/` with a `design.md`, when I invoke the feedback agent and provide a free-form brain-dump, then a `feedback.md` is written organizing my input into the defined sections — **all sections skippable** (no empty-section busywork).
- AC2: The agent reads `design.md` for context (planned structures, time band) and asks **only** targeted gap questions for high-value missing items (e.g. "overall rating?", "anything you'd change?") — it does not interrogate.
- AC3: An **overall session rating** is captured in `feedback.md` frontmatter.
- AC4: The agent advances the brief's status `designed → run`.
- AC5 (error path): If there is no `design.md` (ad-hoc session), the agent still captures feedback from the dump and asks which structures were used so lessons can be slug-tagged later.

### Story 2 — Extract reusable, tagged lessons
**As** the facilitator, **I want** the agent to distill durable lessons tagged by practice slug + theme, **so that** future-me and the designer can resurface the right lesson at the right time.
`job_id: learn-from-sessions`

#### Elevator Pitch
Before: even when I reflect, the insight isn't reusable — it's prose in one session's notes.
After: from the feedback, the **feedback agent** proposes lessons and writes `lessons-learned/` entries each tagged with `practices: [slugs]` + `themes: [tags]`; I confirm or trim.
Decision enabled: the lesson is now findable later — by structure ("how `triz` lands with execs") or by theme ("spicy power-dynamics rooms").

**Acceptance criteria**
- AC1: From a `feedback.md`, the agent proposes candidate lessons; each accepted lesson is stored in `lessons-learned/` with frontmatter tagging `practices` (slugs, where applicable) and `themes`.
- AC2: Per the user's input model — the agent **infers** which practice(s) a "what worked/didn't" note applies to (mapping to slugs) rather than forcing per-structure entry.
- AC3: A lesson with no clear practice is tagged by **theme only** (slug optional) — never force a slug.
- AC4: Lesson extraction is **offered, never mandatory** — a `feedback.md` can stand alone.
- AC5: A cited practice slug, if present, resolves to a real `practices/<slug>.md` (consistency with grounding, ADR-004).

## Wave: DISCUSS / [REF] WS strategy
**Strategy B — extend an existing thin slice.** No new walking skeleton; this adds a `feedback` agent + two output contracts (`feedback.md`, lesson entries) onto the existing folder. Two thin slices (feedback record, then tagged lessons).

## Wave: DISCUSS / [REF] Out of scope (this feature)
- Designer **reading** lessons during design (job `reuse-lessons-in-design` → `lessons-loop` feature). We make lessons loop-ready; we don't build the reader.
- Executor / room prep (`executor` feature).
- Cross-session analytics / trend dashboards.
- Collecting feedback directly from participants (this is the facilitator's own debrief).
- A comprehensive lessons taxonomy — themes are free-form tags for now.

## Wave: DISCUSS / [REF] Outcome KPIs
- **Debrief rate** — % of run sessions that get a `feedback.md` within 48h. Target ≥ 70% (this is the adoption risk — see slice 01 hypothesis). Measure: count `feedback.md` vs `status: run` briefs.
- **Lesson yield** — avg tagged lessons captured per debriefed session. Target ≥ 1. Measure: `lessons-learned/` entries per session.
- **Friction** — wall-clock to debrief. Target ≤ 10 min. Measure: self-noted timestamp.

## Wave: DISCUSS / [REF] Definition of Done (9-item)
1. `feedback` agent defined in `.claude/agents/`. 2. `feedback.md` schema + template exist (sections skippable, rating in frontmatter). 3. Brain-dump → structured feedback works on a real session. 4. Overall rating captured. 5. Brief status advances to `run`. 6. Lesson schema (slug + theme tags) defined; entries written to `lessons-learned/`. 7. Lessons are loop-ready (a future reader can filter by slug/theme). 8. Error paths handled (no design.md; theme-only lesson; sparse dump). 9. Dogfooded on a real run session; CLAUDE.md / README updated with the debrief flow.

## Wave: DISCUSS / [REF] DoR validation (handoff to DESIGN)
| # | DoR item | Status | Evidence |
|---|---|---|---|
| 1 | User value clear | ✓ | JTBD `learn-from-sessions`, opportunity 7 |
| 2 | Persona identified | ✓ | `personas/facilitator.yaml` (reflective mode) |
| 3 | Job traceability | ✓ | both stories → `learn-from-sessions` |
| 4 | Acceptance criteria testable | ✓ | observable `feedback.md` + tagged lesson entries on a real session |
| 5 | Journey mapped | ✓ | `journeys/debrief-session.yaml` (happy + 4 error paths) |
| 6 | Scope bounded | ✓ | loop reader deferred to `lessons-loop`; out-of-scope explicit |
| 7 | Walking skeleton | ✓ (N/A) | brownfield; Strategy B extends existing folder contract |
| 8 | KPIs measurable | ✓ | debrief rate / lesson yield / friction, numeric targets |
| 9 | Dependencies known | ✓ | ADR-003 folder contract; loop-readiness constraint |

## Wave: DISCUSS / [REF] Scope Assessment
**PASS (right-sized).** 2 stories, 1 bounded context (post-session reflection), reuses existing folder contract. No oversize signal.

## Wave: DISCUSS / [REF] Story map & prioritization
Backbone activity: **Learn from a session.** Slice order by learning leverage:

| Order | Slice | Why this order |
|---|---|---|
| **1** | Slice 01 — brain-dump → `feedback.md` (+ rating, status→run) | Highest-uncertainty assumption is **adoption/friction**, not mechanism: *will I actually debrief when tired?* Learn that first and cheapest. Delivers reflection + archive value alone. |
| 2 | Slice 02 — tagged lessons → `lessons-learned/` | Depends on a feedback record existing; delivers the loop fuel. Lower uncertainty once slice 01 proves the debrief happens. |

## Wave: DISCUSS / [REF] Slice briefs (machine artifacts)
- `docs/feature/feedback-capture/slices/slice-01-brain-dump-to-feedback.md`
- `docs/feature/feedback-capture/slices/slice-02-tagged-lessons.md`

---

## Wave: DISCUSS / [REF] Wave decisions
- **[D1] Input = brain-dump first, agent fills gaps + overall rating** (user choice). The agent structures the dump and asks only high-value gap questions; it does not run a full interview.
- **[D2] Sections are skippable; no forced per-structure entry** (user choice). The agent infers which practice slugs a "what worked/didn't" note applies to, rather than making the facilitator fill a row per structure.
- **[D3] Lessons tagged by practice slug + theme** (user choice). Loop-ready: the future `lessons-loop` reader filters on these tags. Theme-only allowed when no slug applies.
- **[D4] Feature stops at capture + write; the designer reading lessons is `lessons-loop`** (scope boundary). Lesson schema is designed now so #3 is trivial.
- **[D5] Adoption/friction is the primary risk**, not mechanism → slice 01 carries the learning hypothesis and is a strong `/nw-spike` candidate.

### ask-intelligent trigger evaluation
No trigger fired (single persona; 1 bounded context; no compliance terms; WS strategy = B; no shared ambiguous AC). → strict lean output, no expansion menu.

## Wave: DISCUSS / [REF] Upstream changes
None contradicted. Enriched the existing `learn-from-sessions` job in `jobs.yaml` with dimensions + four forces (was a stub). Created `journeys/debrief-session.yaml`.

## Wave: DISCUSS / [REF] Next wave
Handoff to **DESIGN** (`/nw-design feedback-capture`) to settle: `feedback.md` schema + template, the lesson-entry schema (one-file-per-lesson vs. appended log; tag format), the `feedback` agent contract, and the `lessons-learned/` directory convention. Strong alternative: **`/nw-spike`** slice 01 to test the real risk — *will I actually debrief when tired, and is the brain-dump→structure friction low enough?*
