# Slice 01 — In-person setup pack

**Goal (one sentence):** Turn an agreed in-person `design.md` into a `workshops/<slug>/setup.md` with a
tickable materials checklist + concrete per-structure setup steps, derived from the practice files.

## IN scope
- An `executor` agent (`.claude/agents/`) that reads `design.md` (+ its practices by slug) and writes
  `setup.md` for **in-person** prep mode.
- `setup.md` = (a) aggregated **materials checklist** (`- [ ]` items across all structures),
  (b) **per-structure setup steps** sourced from each practice's `Steps` / `Group config` /
  `Medium fit (in-person)` notes.
- Error path: structure with no obvious materials → sensible default + flag.
- README/CLAUDE.md note on the prep flow.

## OUT scope
- Digital (Miro+video) prep (slice 02).
- Room-layout diagrams; minute-by-minute run-sheet; print/PDF; hybrid.

## Learning hypothesis
**Disproves** "a generated per-structure checklist actually saves prep time and catches things I'd
forget" **if** I ignore it on the day or it's too generic to trust. **Confirms** the executor direction
**if** I prep my next real in-person session from it and walk in with nothing forgotten.

## Production data (not synthetic)
Use the real **cross-team-collab-s1** design (in-person) — already in hand.

## Dogfood moment (same day)
Generate the pack for the cross-team session and actually prep from it; note any miss on the day.

## Acceptance criteria
- An in-person `design.md` produces `setup.md` with a tickable materials checklist aggregated across structures.
- Every structure in the design has concrete setup steps grounded in its practice file.
- A no-materials structure gets a flagged default, not invented specifics.

## Dependencies
- `workshop-designer` (design.md + grounded structures + brief medium).
- DESIGN must fix the `setup.md` schema/template + executor contract + medium→mode mapping.

## Effort estimate & reference class
**≤ 1 day.** Reference class: one subagent prompt + one markdown template. Low code; derives from existing practice notes.

## Pre-slice SPIKE
Not needed — mechanism is low-risk (read design + practice notes → checklist). The real question is
value, best answered by the same-day dogfood on the cross-team session.
