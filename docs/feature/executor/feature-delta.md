# Feature: executor

> DISCUSS wave output (lean). Turns an agreed `design.md` into a `setup.md` prep pack. Builds on the
> `workshops/<slug>/` folder contract (ADR-003). Brownfield — no walking skeleton. **Sliced by prep mode:**
> in-person first, digital (Miro+video) second.

---

## Wave: DISCUSS / [REF] Persona ID
`facilitator` — same primary user, now in *prep* mode between an agreed design and the session. See `docs/product/personas/facilitator.yaml`.

## Wave: DISCUSS / [REF] JTBD one-liner
**`prep-the-room`** — *When a design is agreed, I want a materials/setup checklist plus the per-structure prep steps for the medium, so I can prep fast and walk in with nothing forgotten.* (Opportunity 6.)

## Wave: DISCUSS / [REF] Pre-requisites
- `workshop-designer` shipped: `design.md` exists with grounded structures + a brief `medium`.
- **Architecture pre-decided (ADR-003):** the `executor` agent reads `design.md` → writes `setup.md`, composing via the workshop folder. Per-structure setup derives from the practice files' `Steps` / `Group config` / `Medium fit` notes (grounding extends to prep).
- **Medium model (DISCUSS D2):** executor maps brief `medium` → prep mode = **in-person** | **digital** (Miro + video, which go together for a remote session).

## Wave: DISCUSS / [REF] Driving ports (inbound surfaces)
- **`executor` subagent** invoked in Claude Code, pointed at a `workshops/<slug>/` folder with an agreed `design.md`.

## Wave: DISCUSS / [REF] User stories

### Story 1 — In-person setup pack
**As** the facilitator, **I want** an in-person materials checklist + per-structure setup steps generated from my design, **so that** I prep fast and forget nothing.
`job_id: prep-the-room`

#### Elevator Pitch
Before: I prep from the agenda by hand and sometimes forget materials or a structure's fiddly setup.
After: run the **executor agent** on `workshops/<slug>/` (in-person design) → sees `workshops/<slug>/setup.md` with a tickable materials checklist + concrete per-structure setup steps, derived from the practice files.
Decision enabled: I prep with confidence the room and materials are complete.

**Acceptance criteria**
- AC1: Given a `design.md` whose brief `medium` is in-person, when I invoke the executor, then `setup.md` contains a **tickable materials checklist** aggregated across all structures in the design.
- AC2: For **each structure** in the design, `setup.md` lists concrete in-person setup steps sourced from that practice's `Steps` / `Group config` / `Medium fit (in-person)` notes — grounded, not invented.
- AC3: The checklist uses markdown checkboxes (`- [ ]`).
- AC4 (error): A structure with no obvious materials → executor lists a sensible default and flags it for review, rather than fabricating specifics.

### Story 2 — Digital (Miro + video) setup pack
**As** the facilitator, **I want** a digital prep pack — a Miro board recipe per structure + video-call setup — generated from my design, **so that** I can pre-build a remote session fast.
`job_id: prep-the-room`

#### Elevator Pitch
Before: prepping a remote workshop means manually translating each structure into Miro frames + breakout plans.
After: run the **executor agent** on `workshops/<slug>/` (digital design) → sees `setup.md` with a per-structure **Miro frame recipe** + **video breakout/timer notes** + a digital pre-build checklist.
Decision enabled: I pre-build the board and set up the call knowing each structure is covered.

**Acceptance criteria**
- AC1: Given a `design.md` whose brief `medium` includes miro/video, when I invoke the executor, then `setup.md` contains per-structure **digital** setup (Miro frame layout + video breakout/timer notes) sourced from each practice's `Medium fit (Miro/Video)` notes.
- AC2: A **digital pre-build checklist** (frames to create, sticky areas, breakout config) is included, tickable.
- AC3: Output is **markdown instructions / a board recipe** — NOT a live Miro board (no API; consistent with the no-runtime constraint). This is stated explicitly in `setup.md`.
- AC4 (error): hybrid medium (in-person + remote) → executor asks which to prep for, or emits both sections clearly separated.

## Wave: DISCUSS / [REF] WS strategy
**Strategy B — extend an existing thin slice.** No new walking skeleton; adds an `executor` agent + the `setup.md` contract onto the folder. Two slices by prep mode (in-person, then digital).

## Wave: DISCUSS / [REF] Out of scope (this feature)
- **Live Miro board generation via API** — markdown board recipe only (no runtime/external API).
- **Spatial room-layout diagrams** — not prioritized; the pack is checklist + per-structure setup. Possible future.
- **Minute-by-minute run-sheet / facilitator script** — timing already lives in `design.md`'s agenda table; future if wanted.
- **Hybrid (simultaneous in-person + remote)** prep — handled later; slice 1/2 are single-mode.
- Print/PDF export.

## Wave: DISCUSS / [REF] Outcome KPIs
- **Nothing-forgotten rate** — % of prepped sessions with no missing-material/setup surprise on the day. Target: zero misses. Measure: self-note post-session (ties to the feedback loop).
- **Prep time** — wall-clock from agreed design to "ready". Target ≤ 10 min. Measure: self-noted.
- **Coverage** — % of design structures with explicit setup steps in `setup.md`. Target 100% (hard, via AC2).

## Wave: DISCUSS / [REF] Definition of Done (9-item)
1. `executor` agent in `.claude/agents/`. 2. `setup.md` schema + template exist. 3. In-person pack works on a real design (checklist + per-structure). 4. Per-structure setup is grounded in the practice files. 5. Materials checklist is tickable + aggregated. 6. Digital (Miro+video) pack works (board recipe + video notes + pre-build checklist). 7. Markdown-only (no Miro API) explicit. 8. Error paths handled (no-materials default; hybrid). 9. Dogfooded on a real design; README/CLAUDE.md updated with the prep flow.

## Wave: DISCUSS / [REF] DoR validation (handoff to DESIGN)
| # | DoR item | Status | Evidence |
|---|---|---|---|
| 1 | User value clear | ✓ | JTBD `prep-the-room`, opportunity 6 |
| 2 | Persona identified | ✓ | `personas/facilitator.yaml` (prep mode) |
| 3 | Job traceability | ✓ | both stories → `prep-the-room` |
| 4 | Acceptance criteria testable | ✓ | observable `setup.md` on a real design |
| 5 | Journey mapped | ✓ | `journeys/prep-session.yaml` (happy + 3 error paths) |
| 6 | Scope bounded | ✓ | sliced by prep mode; Miro-API/layout/run-sheet explicitly out |
| 7 | Walking skeleton | ✓ (N/A) | brownfield; Strategy B extends folder contract |
| 8 | KPIs measurable | ✓ | nothing-forgotten / prep-time / coverage, numeric targets |
| 9 | Dependencies known | ✓ | design.md + practice medium-fit notes; ADR-003 |

## Wave: DISCUSS / [REF] Scope Assessment
**SPLIT confirmed (user-approved).** Original executor (all 3 mediums) tripped the oversized heuristic (multiple independent outcomes that ship separately). Split into prep modes: **in-person** (slice 01) and **digital = Miro+video** (slice 02). Right-sized after split.

## Wave: DISCUSS / [REF] Story map & prioritization
Backbone activity: **Prep a session.** Slice order:

| Order | Slice | Why this order |
|---|---|---|
| **1** | Slice 01 — in-person setup pack | Real data available now (the cross-team session is in-person); highest-uncertainty assumption is *does a generated per-structure checklist actually save prep + catch misses?* Learn it on a real prep. |
| 2 | Slice 02 — digital (Miro+video) setup pack | Same mechanism, different medium notes. Lower uncertainty once slice 01 proves the value. |

## Wave: DISCUSS / [REF] Slice briefs (machine artifacts)
- `docs/feature/executor/slices/slice-01-inperson-prep.md`
- `docs/feature/executor/slices/slice-02-digital-prep.md`

---

## Wave: DISCUSS / [REF] Wave decisions
- **[D1] Pack = materials/setup checklist + per-structure setup steps** (user choice). NOT a room-layout diagram, NOT a minute-by-minute run-sheet (timing lives in `design.md`).
- **[D2] Two prep modes: in-person and digital (Miro+video together)** (user choice). Executor maps brief `medium` → prep mode. Sliced accordingly; in-person first.
- **[D3] Markdown recipes only — no Miro API / live board generation** (constraint). Consistent with the no-runtime, markdown-all-the-way-down architecture. Live generation is an explicit non-goal (revisit as a separate feature if ever wanted).
- **[D4] Per-structure setup is grounded** — derived from each practice's `Steps`/`Group config`/`Medium fit` notes; the executor never invents setup for an un-backed structure (extends ADR-004 grounding into prep).

### ask-intelligent trigger evaluation
No trigger fired (single persona; 1 bounded context; no compliance terms; WS strategy = B; no shared ambiguous AC after the medium split). → strict lean output, no expansion menu.

## Wave: DISCUSS / [REF] Upstream changes
None contradicted. Enriched the existing `prep-the-room` job in `jobs.yaml` with dimensions + four forces and the prep-mode note. Created `journeys/prep-session.yaml`.

## Wave: DISCUSS / [REF] Next wave
Handoff to **DESIGN** (`/nw-design executor`) to settle: the `setup.md` schema + template, the `executor` agent contract, how brief `medium` maps to prep mode, and how per-structure setup is derived from practice frontmatter/body. Strong alternative: build slice 01 directly (the mechanism is low-risk; the value question is best answered by a real in-person prep).

---

## Wave: DESIGN / [REF] DDD list (design decisions)
- **[DD1] `executor` is a third, separate agent** completing the triad (designer → executor → feedback), composing via the workshop folder. (ADR-003)
- **[DD2] `setup.md` = checklist + per-structure setup; two prep modes (in-person | digital).** No layout diagram, no run-sheet. (ADR-006)
- **[DD3] Markdown recipes only — no Miro API.** Digital pack is a build-it-yourself board recipe. (ADR-006)
- **[DD4] Per-structure setup is grounded** in each practice's `Steps`/`Group config`/`Medium fit` notes; no-materials structure → flagged default. (extends ADR-004)
- **[DD5] Executor does not change brief `status`.** Prep is pre-session; `feedback` owns `run`.

## Wave: DESIGN / [REF] Component decomposition
| Component | Path | Change |
|---|---|---|
| `executor` agent | `.claude/agents/executor.md` | CREATE NEW |
| setup template | `templates/setup.md` | CREATE NEW |
| `facilitation-practices` skill | `.claude/skills/facilitation-practices/` | REUSE (read Medium-fit notes; no change) |
| architecture SSOT + ADR-006 | `docs/product/architecture/*` | EXTEND / CREATE NEW |

## Wave: DESIGN / [REF] Driving ports
- Invoke the `executor` subagent in Claude Code, pointed at a `workshops/<slug>/` folder with an agreed `design.md`.

## Wave: DESIGN / [REF] Driven ports + adapters
| Driven port | Adapter | Direction |
|---|---|---|
| Design (structures + medium) | filesystem read `workshops/<slug>/design.md` | read |
| Practices (per-structure setup) | `Glob`/`Read` `.claude/skills/facilitation-practices/practices/*.md` | read |
| Setup pack | filesystem write `workshops/<slug>/setup.md` | write |

No status write (DD5). No network.

## Wave: DESIGN / [REF] Technology choices
- Same as the other agents: Markdown + YAML frontmatter, Claude Code subagent, filesystem adapters, git. No runtime/build. Paradigm N/A.

## Wave: DESIGN / [REF] Decisions table
| ID | Decision |
|---|---|
| DD1 | `executor` = third separate agent (compose via folder) |
| DD2 | `setup.md` = checklist + per-structure; modes in-person/digital (ADR-006) |
| DD3 | Markdown recipes only, no Miro API (ADR-006) |
| DD4 | Per-structure setup grounded in practice notes |
| DD5 | Executor does not change brief status |

## Wave: DESIGN / [REF] Reuse Analysis
| Existing Component | File | Overlap | Decision | Justification |
|---|---|---|---|---|
| designer agent | `.claude/agents/designer.md` | folder-operating agent | CREATE NEW | prep ≠ design — different inputs/outputs/job; ADR-003 requires separate stateless agents |
| feedback agent | `.claude/agents/feedback.md` | folder-operating agent | CREATE NEW | prep (pre-session) ≠ debrief (post-session); distinct trigger + outputs |
| facilitation-practices skill | `.claude/skills/.../practices/*.md` | source of per-structure setup | REUSE | executor consumes existing `Medium fit`/`Steps` notes — no change needed |
| brief/design/feedback templates | `templates/*.md` | frontmatter+body pattern | EXTEND (pattern) | `setup.md` reuses the convention, new file |
| ADR-006 | `docs/product/architecture/adr-006-*.md` | — | CREATE NEW | new decision (setup scope/modes) |

Zero unjustified CREATE NEW: the `executor` is a genuinely distinct responsibility in the triad (ADR-003); ADR-006 is a new decision record.

## Wave: DESIGN / [REF] Open questions (deferred)
- **Practice `Medium fit` richness** — digital packs are only as good as the practices' Miro/Video notes; enrich as the library grows.
- **Live Miro generation** — explicitly a possible *separate future feature* (own runtime/integration decision), not this one (ADR-006).
- **Room-layout / run-sheet** — out now; revisit if prep feels incomplete in practice.
- **Real-session validation** — slice-01 value (does the checklist save prep + catch misses?) tested by dogfooding on the cross-team in-person design.

## Wave: DESIGN / [REF] Outcome Collision Check
Skipped (correct): document/agent feature, no typed code-contract surface; registry/CLI belong to the framework repo.

## Wave: DESIGN / [REF] Build note
For this toolkit the agent's design *is* its prompt file, so the concrete artifacts were built in-wave
(`.claude/agents/executor.md`, `templates/setup.md`). Slice 01 (in-person) can be dogfooded immediately on
the real `cross-team-collab-s1` design.
