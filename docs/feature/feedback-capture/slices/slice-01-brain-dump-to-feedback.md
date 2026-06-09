# Slice 01 — Brain-dump → feedback.md

**Goal (one sentence):** After a session, turn a free-form brain-dump into a structured
`workshops/<slug>/feedback.md` with an overall rating, asking only for the gaps.

## IN scope
- A `feedback` agent (`.claude/agents/`) that: reads `design.md` for context, takes a free-form
  brain-dump, organizes it into `feedback.md` sections, asks only high-value gap questions, captures an
  overall rating, and advances the brief status `designed → run`.
- A `feedback.md` template + schema: frontmatter (`slug`, `status: run`, `ran`, `rating`) + skippable
  body sections (what worked, what didn't, timing planned-vs-actual, energy/surprises, what I'd change).
- Error path: no `design.md` → capture from the dump alone; ask which structures were used.
- README/CLAUDE.md note on the debrief flow.

## OUT scope
- Lesson extraction / `lessons-learned/` (slice 02).
- Designer reading lessons (`lessons-loop` feature).
- Participant-sourced feedback; analytics.

## Learning hypothesis
**Disproves** "I'll actually debrief when tired *and* the brain-dump→structure friction is low enough
to be worth it" **if** I skip the debrief, or it feels like filling a form. **Confirms** the feature
direction **if** I debrief a real session in <10 min and the structured `feedback.md` feels worth having.

## Production data (not synthetic)
Use a **real session I actually ran** (e.g. the cross-team-collab session once it happens) — not a toy.

## Dogfood moment (same day)
Debrief that real session with the agent the same day slice 01 lands; note the wall-clock + rating.

## Acceptance criteria
- A free-form dump produces a `feedback.md` with the sections populated from my input; empty sections omitted (no busywork).
- The agent asks only targeted gaps (e.g. rating, "anything you'd change?") — not a full interview.
- Overall rating lands in frontmatter; brief status becomes `run`.
- No `design.md` present → feedback still captured; agent asks which structures were used.

## Dependencies
- `workshop-designer` folder contract + status lifecycle (shipped).
- DESIGN must fix the `feedback.md` schema/template + agent contract.

## Effort estimate & reference class
**≤ 1 day.** Reference class: one subagent prompt + one markdown template + a README note. Low code.

## Pre-slice SPIKE (recommended)
The risk here is **adoption**, not mechanism. Consider `/nw-spike` slice 01: after the next real
session, actually try a brain-dump debrief once. If you do it and it's <10 min and useful → PROMOTE.
If you avoid it or it feels like a chore → the friction/format needs rethinking before building.
