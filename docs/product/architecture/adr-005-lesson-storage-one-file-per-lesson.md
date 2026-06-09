# ADR-005 — Lessons = one file per lesson, frontmatter-tagged

**Status:** Accepted (2026-06-09) · **Feature:** feedback-capture

## Context
The `feedback` agent extracts durable lessons from a debrief. The future `lessons-loop` feature has the
`designer` resurface relevant lessons while designing — by practice and by context. We need a storage
shape that makes that retrieval clean, stays low-ceremony (the agent writes them), and is consistent
with the rest of the toolkit.

## Decision
Store **one markdown file per lesson** at `lessons-learned/<date>-<short-kebab>.md`, each with YAML
frontmatter: `date`, `workshop` (source slug), `practices` (slugs; `[]` if none apply), `themes`
(free-form tags) + a one-line takeaway and optional detail. This mirrors the **practice-file pattern**
(frontmatter index + prose) exactly, so the lessons-loop reader is the *same* glob-and-filter-frontmatter
mechanism already used for the library.

## Alternatives considered
- **One file per workshop** (`lessons-learned/<slug>.md`) — fewer files, grouped by session, but
  cross-session retrieval ("all `triz` lessons") means reading every file and a practice's lessons are
  scattered. Rejected: weakens the loop's primary query.
- **One appended log** (`lessons-learned/lessons.md`) — simplest to skim chronologically, but no
  per-entry frontmatter, so the loop reader must parse prose to filter. Rejected: weakest machine
  retrieval, the loop is the whole point.

## Consequences
- The lessons-loop becomes a thin read: glob `lessons-learned/*.md`, filter `practices`/`themes`.
- Each lesson is independently editable/deletable with clean git diffs (though gitignored — private).
- Many small files accumulate over time; acceptable because the agent writes/names them (low ceremony)
  and they are exactly the retrieval unit.
- Any `practices` slug MUST resolve to a real `practices/<slug>.md` (consistency with grounding, ADR-004);
  theme-only lessons set `practices: []`.
