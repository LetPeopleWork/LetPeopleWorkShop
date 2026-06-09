# ADR-006 — Setup pack = checklist + per-structure, two prep modes, markdown only

**Status:** Accepted (2026-06-09) · **Feature:** executor

## Context
The `executor` turns an agreed `design.md` into a prep pack. We had to decide what the pack contains,
how to handle the three mediums, and whether to integrate with Miro.

## Decision
1. **Content = a tickable materials/pre-build checklist + per-structure setup steps.** No spatial room
   diagram and no minute-by-minute run-sheet (timing already lives in `design.md`'s agenda).
2. **Two prep modes, derived from the brief `medium`: `in-person` and `digital` (Miro + video together)**
   — a remote session uses both, so they're one mode. Hybrid → ask or split sections.
3. **Markdown recipes only — no Miro API / live board generation.** Consistent with the no-runtime,
   markdown-all-the-way-down architecture. The digital pack is a board recipe the facilitator builds.
4. **Per-structure setup is grounded** in each practice's `Steps` / `Group config` / `Medium fit` notes
   (extends ADR-004 grounding from design into prep). A no-materials structure gets a flagged default.
5. The executor **does not change the brief status** — prep is pre-session; `feedback` owns `run`.

## Alternatives considered
- **Include room-layout diagrams + a full run-sheet** — richer, but the facilitator explicitly wanted a
  checklist + per-structure prep, and timing already exists in the design. Rejected (scope/duplication).
- **One slice covering all 3 mediums** — tripped the oversized heuristic; sliced by prep mode instead.
- **Live Miro board generation via API** — real automation, but needs a runtime + external integration
  the architecture deliberately avoids, and couples the toolkit to a vendor. Rejected; possible future
  feature, not this one.

## Consequences
- `setup.md` is small, tickable, and derives entirely from existing design + practice notes.
- Digital mode leans on the practice files' `Medium fit (Miro/Video)` notes — keep those rich.
- A future "live Miro" capability would be a separate feature with its own runtime decision.
- Prep stays a pure read→write transform over the workshop folder (ADR-003); no status side-effects.
