# Slice 02 — Tagged lessons → lessons-learned/

**Goal (one sentence):** From a `feedback.md`, extract durable lessons tagged by practice slug + theme
and write them to `lessons-learned/`, so they're resurfaceable later (loop-ready).

## IN scope
- Extend the `feedback` agent to propose candidate lessons from a `feedback.md`; on confirm, write each
  to `lessons-learned/` with frontmatter `practices: [slugs]` + `themes: [free-form tags]` + source
  `workshop` slug + date, and a one-line lesson + optional detail.
- The agent **infers** which practice(s) a "what worked/didn't" note applies to (maps to slugs); does
  not force per-structure entry.
- Theme-only lessons allowed when no slug applies; slug, if present, must resolve to a real practice.
- Lesson extraction is **offered, never mandatory**.

## OUT scope
- Designer **reading** these lessons during design (`lessons-loop` feature — this slice only makes the data).
- A fixed theme taxonomy (themes are free-form for now).

## Learning hypothesis
**Disproves** "tagging lessons by slug+theme is low-effort enough that I'll keep doing it, and the tags
are the right axes for later retrieval" **if** tagging feels tedious or the tags don't match how I'd
later search. **Confirms** the loop design **if** I accept the agent's proposed tags with light edits.

## Production data (not synthetic)
Extract lessons from a **real** `feedback.md` produced in slice 01.

## Dogfood moment (same day)
After a real debrief, accept/trim the proposed lessons; eyeball whether the tags are how you'd search later.

## Acceptance criteria
- From a real `feedback.md`, the agent proposes lessons; accepted ones are written to `lessons-learned/`
  with `practices` + `themes` frontmatter.
- A "what worked/didn't" note is mapped to slug(s) by inference, not by forced per-structure input.
- A no-clear-practice lesson is stored with theme(s) only.
- Any cited slug resolves to a real `practices/<slug>.md`.

## Dependencies
- Slice 01 (`feedback.md` exists).
- DESIGN must fix the lesson-entry schema (one file per lesson vs. appended log) + tag format.

## Effort estimate & reference class
**≤ 1 day.** Reference class: extend the agent prompt + define the lesson entry format. Low code.

## Reference forward
The `lessons-loop` feature (designer reads these) depends entirely on this slice's tag schema — get the
`practices`/`themes` axes right here and #3 becomes a thin read-and-filter slice.
