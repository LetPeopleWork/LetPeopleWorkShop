# Lessons learned (private)

Your reusable lessons from running real workshops live here. **This folder's contents are gitignored**
— only this README is committed, so a fresh clone has the folder but none of your private notes.

## Convention — one file per lesson
Each lesson is its own file: `lessons-learned/<date>-<short-kebab>.md`, written by the `feedback` agent
(see `templates/lesson.md`). Frontmatter tags it so it's resurfaceable later:

```yaml
---
date: 2026-06-12
workshop: cross-team-collab-s1     # source session
practices: [triz]                  # structures this is about (slugs); [] if theme-only
themes: [power-dynamics, senior-room]
---
TRIZ landed flat with senior execs who wanted to look constructive — they resisted
the "make it worse" framing. Next time try wicked-questions instead.
```

- `practices` ties a lesson to structures by **slug** (must resolve to a real `practices/<slug>.md`).
- `themes` are free-form, for retrieval by context.
- The future **lessons-loop** feature has the `designer` glob + filter these frontmatter tags to surface
  relevant lessons while designing — same pattern as the practices library.
