# Facilitation Hub

A markdown-native, Claude-Code-native toolkit for designing, running, and learning from workshops.
Bring a brief; grounded assistants help you **design** the session (and, soon, **prep** and **learn**
from it). The repository *is* the tool — there's no app to install.

> **Status:** walking skeleton. The **designer** works end-to-end. Executor & feedback agents are next.

## What's here
```
practices/        Facilitation structures, one markdown file each (the grounding library). PUBLIC.
templates/        brief.md + design.md formats to copy. PUBLIC.
.claude/agents/   The `designer` subagent. PUBLIC.
workshops/        Your sessions: brief → design (→ feedback → lessons). PRIVATE (gitignored, except EXAMPLE-*).
lessons-learned/  Aggregated reusable lessons. PRIVATE (gitignored).
docs/             Product vision, jobs, journeys, feature specs. PUBLIC.
```

## Public toolkit vs. your private content
This repo is meant to be pushed **publicly** so other facilitators can use it — but **your real
workshop designs, feedback, and lessons never get committed.** The `.gitignore` excludes everything
under `workshops/` (except the sanitized `EXAMPLE-*`) and `lessons-learned/`. Fork it, and your
sessions stay yours.

## Quick start
1. Copy `templates/brief.md` to `workshops/<your-slug>/brief.md` and fill it in.
2. In Claude Code, run the **designer** agent on that brief.
3. Read the generated `workshops/<your-slug>/design.md` — a timed agenda where every structure cites a
   practice, reconciled to your time box. Edit freely; it's yours.
4. See `workshops/EXAMPLE-team-retro/` for a worked example.

## Add a facilitation practice
Copy `practices/_TEMPLATE.md` to a new kebab-case file, fill it in. The designer picks it up
automatically — no code change. Seeded with [Liberating Structures](https://www.liberatingstructures.com/)
and [Training from the BACK of the Room](https://bowperson.com/resources/index.html); add more anytime.

## Roadmap
Designer → Feedback capture → Lessons loop (designer learns from past sessions) → Executor (room / Miro /
video prep) → Library growth. See `docs/product/vision.md`.
