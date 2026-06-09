# Feature: workshop-designer

> DISCUSS wave output (lean). This feature is the **walking skeleton** for the whole Facilitation Hub:
> the thinnest end-to-end path that delivers real value — a workshop brief becomes a grounded, timed agenda.

---

## Wave: DISCUSS / [REF] Persona ID
`facilitator` — a practicing workshop facilitator (the single primary user). See `docs/product/personas/facilitator.yaml`.

## Wave: DISCUSS / [REF] JTBD one-liner
**`design-grounded-agenda`** — *When I'm asked to facilitate a workshop with a rough goal, audience, time box, and medium, I want a well-structured timed agenda grounded in proven facilitation practices, so I can walk in confident it will achieve its outcome and keep people engaged.* (Opportunity score 8 — high importance, low current satisfaction.)

## Wave: DISCUSS / [REF] Pre-requisites
- Greenfield repo. SSOT bootstrapped this wave: `vision.md`, `jobs.yaml`, `personas/facilitator.yaml`, `journeys/design-workshop.yaml`.
- **Architecture constraint (user decision):** agents are **Claude Code subagents**; the repo *is* the tool. Storage is markdown. Facilitation practices are added as files/skills, no code change.
- A small seeded **practices library** is required for the designer to be grounded — it ships *inside* this feature (see Slice 01), not as a separate releasable slice.

## Wave: DISCUSS / [REF] Driving ports (inbound surfaces)
- **Designer subagent** invoked inside Claude Code (e.g. "design this workshop" pointed at a `brief.md`). This is the only user-invocable entry point for this feature.

## Wave: DISCUSS / [REF] User stories

### Story 1 — Design a workshop from a brief
**As** the facilitator, **I want** to hand the designer a brief and get back a timed agenda of named structures with rationale, **so that** I have a runnable draft grounded in proven practice instead of a blank page.
`job_id: design-grounded-agenda`

#### Elevator Pitch
Before: I design every workshop from a blank page, improvising structures from memory.
After: run the **designer agent** on `workshops/<slug>/brief.md` → sees `workshops/<slug>/design.md` containing a timed agenda of named structures, each with timing, group config, and a one-line rationale citing a practice in `practices/`.
Decision enabled: I decide whether to run this design as-is, tweak it, or ask for an alternative structure.

**Acceptance criteria**
- AC1: Given a `brief.md` with goal, audience, group size, duration, and medium, when I invoke the designer, then a `design.md` is written containing a timed agenda whose structures each name a practice that exists as a file under `practices/`.
- AC2: The sum of structure timings is shown and reconciled against the brief's time box; if it overflows, the design flags it and offers a trimmed option (journey error-path).
- AC3: Every suggested structure includes a one-line rationale tying it to the brief's goal/medium (grounded, not generic).
- AC4: If a required brief field is missing, the designer asks for it OR states the assumption it made — it does not silently invent the goal/duration.

### Story 2 — Capture a brief from a template
**As** the facilitator, **I want** a brief template I fill in quickly, **so that** the designer has consistent, complete inputs.
`job_id: design-grounded-agenda`

#### Elevator Pitch
Before: my session inputs live in my head or an ad-hoc note; the assistant can't act on them reliably.
After: run the **designer agent** with no brief → sees it scaffold `workshops/<slug>/brief.md` from a template with prompted fields (goal, audience, size, duration, medium, constraints).
Decision enabled: I decide my session parameters explicitly before any design happens.

**Acceptance criteria**
- AC1: A reusable brief template exists; a new workshop folder can be created from it.
- AC2: The template captures at minimum: goal, audience, group size, duration, medium, constraints.

### Story 3 — Seed a grounding practices library `@infrastructure`
**As** the facilitator, **I want** a handful of Liberating Structures and Training-from-the-BACK-of-the-Room practices stored as markdown in a consistent shape, **so that** the designer has something real to ground in.
`job_id: design-grounded-agenda`
> `@infrastructure` — no standalone user decision. **Lands as a precursor within Slice 01**, not a separately shipped slice (slice-composition gate). Slice 01 also contains value-bearing Stories 1 & 2.

**Acceptance criteria**
- AC1: ≥3 LS practices and ≥1 TBR practice exist as markdown, each with: name, purpose, when-to-use, group config, timing guidance, medium fit (in-person/Miro/video), source link.
- AC2: A documented practice file *shape* (template) exists so new practices are added by copying it — no code change (supports future `grow-practice-library` job).

## Wave: DISCUSS / [REF] WS strategy
**Strategy A — thinnest vertical slice.** Slice 01 ships brief → design end-to-end, including a minimal seeded library. Not env-configurable; one path. Demo-able same day on a real upcoming workshop.

## Wave: DISCUSS / [REF] Out of scope (this feature)
- Executor / room / Miro / video prep packs (job `prep-the-room` — later feature).
- Post-session feedback capture and lessons files (job `learn-from-sessions` — later feature).
- Designer reading past lessons (job `reuse-lessons-in-design`) — the *loop* is later; Slice 01 only leaves room for it.
- A comprehensive practices library — only a thin grounding seed now.
- Any non-markdown storage, web UI, or external API integrations.

## Wave: DISCUSS / [REF] Outcome KPIs
- **Design reuse rate** — % of generated designs I run with only minor edits. Target ≥ 60% within first 5 real workshops. Measure: self-rating logged in each `design.md` footer (`reuse: as-is | minor | major | discarded`).
- **Time-to-draft** — wall-clock from brief to a design I'd consider running. Target ≤ 15 min (vs. self-estimated baseline). Measure: timestamp note in brief/design.
- **Grounding** — % of suggested structures citing a real library practice. Target 100% (hard, via AC1).

## Wave: DISCUSS / [REF] Definition of Done (9-item)
1. Stories 1–3 implemented; AC1–AC4 of Story 1 pass on a real brief. 2. Brief template exists and produces a complete brief. 3. Seeded library: ≥3 LS + ≥1 TBR practices in the documented shape. 4. Designer subagent defined in `.claude/agents/`. 5. `design.md` output format documented and stable. 6. Workshop folder convention documented. 7. Grounding enforced (no structure without a library citation). 8. Dogfooded on one real upcoming workshop. 9. README explains the repo-as-tool model and how to add a practice.

## Wave: DISCUSS / [REF] DoR validation (handoff to DESIGN)
| # | DoR item | Status | Evidence |
|---|---|---|---|
| 1 | User value clear | ✓ | JTBD `design-grounded-agenda`, opportunity 8 |
| 2 | Persona identified | ✓ | `personas/facilitator.yaml` |
| 3 | Job traceability | ✓ | every story has `job_id` |
| 4 | Acceptance criteria testable | ✓ | Story 1 AC1–AC4 observable on a real brief |
| 5 | Journey mapped | ✓ | `journeys/design-workshop.yaml` (happy + 3 error paths) |
| 6 | Scope bounded | ✓ | Out-of-scope section; later jobs deferred |
| 7 | Walking skeleton defined | ✓ | Slice 01 (Strategy A) |
| 8 | KPIs measurable | ✓ | reuse rate / time-to-draft / grounding, numeric targets |
| 9 | Dependencies known | ✓ | architecture constraint + seeded library precursor noted |

## Wave: DISCUSS / [REF] Scope Assessment
**PASS (right-sized).** 3 stories, 1 bounded context (workshop design), 1 medium-relevant abstraction (practices library, shipped thin inside the slice). No oversize signal triggered.

## Wave: DISCUSS / [REF] Story map & prioritization (backbone)
Backbone activity: **Design a workshop.** Future activities (separate features): Prep → Run → Learn → Grow library.

| Order | Slice / future feature | Job | Why this order |
|---|---|---|---|
| **1** | **Slice 01 — brief → grounded agenda** | `design-grounded-agenda` | Highest opportunity (8); highest-uncertainty assumption (can a thin library ground useful designs?) — learn cheapest, first. Walking skeleton. |
| 2 | feedback-capture | `learn-from-sessions` | Generates the data the lessons-loop needs. |
| 3 | lessons-loop | `reuse-lessons-in-design` | Closes the learning flywheel; depends on 1 + 2. |
| 4 | executor | `prep-the-room` | High value but only after a design exists worth prepping; 3 mediums = its own complexity. |
| 5 | library-extensibility | `grow-practice-library` | Formalize what Slice 01 seeds informally. |

## Wave: DISCUSS / [REF] Slice briefs (machine artifacts)
- `docs/feature/workshop-designer/slices/slice-01-brief-to-agenda.md`

---

## Wave: DISCUSS / [REF] Wave decisions
- **[D1] First slice = Design support** (user choice). Rationale: most painful job today; highest opportunity score.
- **[D2] Architecture = Claude Code subagents, repo-as-tool** (user choice). Constrains DESIGN to `.claude/agents` + `.claude/skills` + markdown storage; no app/API.
- **[D3] Discovery depth = lightweight.** Single user; iterate by dogfooding. JTBD four-forces captured but no multi-persona deep-dive.
- **[D4] Seeded library ships inside Slice 01**, not as a standalone slice. Rationale: a library-only slice has no user decision (`@infrastructure` slice-composition gate).
- **[D5] Mediums (in-person/Miro/video) captured as a brief field now**, but medium-specific prep deferred to the `executor` feature. Slice 01 only requires the designer to note medium fit per structure.
- **[D6] Public toolkit / private content split (user decision, added during SPIKE).** Repo is pushed publicly for reuse; real workshop designs, feedback, and lessons are **gitignored**. Private = real `workshops/<slug>/` + `lessons-learned/`. Walking skeleton ships a self-documenting `.gitignore`. **Implication for DESIGN:** the designer writes `design.md` into a gitignored path; toolkit and templates live in committed paths — keep these directory roles explicit.
- **[D7] Toolkit consolidated under `.claude/` for plugin-readiness (user decision, post-SPIKE).** The reusable tool is a single self-contained subtree — `.claude/agents/designer.md` + the `facilitation-practices` **skill** (`.claude/skills/facilitation-practices/`, holding the practice library). This mirrors a Claude Code plugin layout, so future distribution is *either* fork-the-repo (today) *or* wrap `.claude/` in `.claude-plugin/plugin.json` → publish to a marketplace (a lift, not a rewrite). Practices are cited by **slug** (not path), so designs survive the library moving into a packaged plugin. **Implication for DESIGN:** treat `.claude/` as the portable payload with zero dependency on user content; keep the toolkit↔content boundary clean. Packaging the plugin is deferred — a later feature once executor/feedback exist and the library shape has settled.

### ask-intelligent trigger evaluation
No trigger fired (single persona; 1 bounded context; no compliance terms; WS strategy = A, not D; no shared ambiguous AC). → strict lean output, no expansion menu. (Telemetry infra `src/des/...` belongs to the nWave framework repo, not this target project — no event written here.)

## Wave: DISCUSS / [REF] Upstream changes
None — greenfield. No DISCOVER/DIVERGE assumptions to reconcile.

## Wave: DISCUSS / [REF] Next wave
Handoff to **DESIGN** (`/nw-design`) to settle: practices-library file schema, designer agent prompt/contract, `design.md` format, workshop folder convention. Alternatively run **`/nw-spike`** to PROBE the riskiest assumption (does a thin LS+TBR library ground a design I'd actually run?) and PROMOTE it into the walking skeleton. DEVOPS gets `outcome-kpis` only (lightweight here).
