# Slice 02 — Digital (Miro + video) setup pack

**Goal (one sentence):** Turn an agreed digital `design.md` into a `setup.md` with a per-structure Miro
board recipe + video-call setup + a tickable pre-build checklist — markdown instructions, no Miro API.

## IN scope
- Extend the `executor` agent to handle **digital** prep mode (brief `medium` includes miro/video).
- `setup.md` (digital) = (a) per-structure **Miro frame recipe** (frames, sticky areas) + **video**
  breakout/timer notes, sourced from each practice's `Medium fit (Miro)` / `Medium fit (Video)` notes;
  (b) a tickable **pre-build checklist** (frames to create, breakout config).
- Explicit statement in `setup.md` that this is a recipe to build yourself, not a generated board.
- Error path: hybrid medium → ask which to prep, or emit both sections separated.

## OUT scope
- Live Miro board generation via API (markdown recipe only — D3).
- In-person prep (slice 01); layout diagrams; run-sheet; print/PDF.

## Learning hypothesis
**Disproves** "the per-structure Miro+video recipe is concrete enough to pre-build a session fast" **if**
I still have to redo most of it by hand. **Confirms** the digital mode **if** I pre-build a remote
session from it with only light edits.

## Production data (not synthetic)
Use a real **digital** design (a remote session I actually plan to run) — not a toy.

## Dogfood moment (same day)
Pre-build the board/call from the pack for a real remote session; note what you had to add by hand.

## Acceptance criteria
- A digital `design.md` produces `setup.md` with per-structure Miro frame recipe + video notes, grounded in practice medium-fit notes.
- A tickable digital pre-build checklist is included.
- `setup.md` explicitly says it's a markdown recipe (no live board).
- Hybrid medium handled (ask or split sections).

## Dependencies
- Slice 01 (`executor` agent + `setup.md` schema exist).
- Practice files' `Medium fit (Miro/Video)` notes (already present for the seeded 6).

## Effort estimate & reference class
**≤ 1 day.** Reference class: extend the agent prompt with the digital branch + checklist. Low code.

## Reference forward
Same agent, different medium notes. If slice 01's `setup.md` schema is medium-parameterized cleanly,
this slice is mostly prompt + template additions.
