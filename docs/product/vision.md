# Product Vision — LetPeopleWorkShop

## One-liner
A personal, markdown-native **library + archive + planning hub** for facilitation: I bring a
workshop brief, and grounded assistants help me **design** it, **prep** it (room / Miro / video),
and **learn** from it afterwards — getting better every session.

## Who it's for
A practicing facilitator (me) — **and anyone who forks the public repo.** The reusable parts ship
publicly; my actual workshop content stays private and local.

Single primary user (me). Secondary humans I serve: workshop participants and the clients/teams who
commission the sessions. Tertiary: other facilitators who adopt the toolkit.

## Public toolkit vs. private content (key constraint)
The repository is pushed **publicly** so others can use it, but **my designs, feedback, and lessons
must never be committed.**
- **Public (committed):** the toolkit under `.claude/` (the `designer` agent + the
  `facilitation-practices` skill/library), `templates/` (brief + design formats), `README`, `docs/`,
  and one sanitized `workshops/EXAMPLE-*/` sample showing the shape. `.claude/` mirrors a Claude Code
  plugin layout, so it can later be packaged and published to a marketplace without a rewrite.
- **Private (gitignored):** every real `workshops/<slug>/` (brief → design → feedback) and the
  aggregated `lessons-learned/`. A self-documenting `.gitignore` keeps a fork from accidentally
  committing private sessions.

## The shape of the thing
The repository *is* the product. There is no separate app to run.
- **Practices library** — facilitation methods stored as markdown, added via skills. Seeded with
  [Liberating Structures](https://www.liberatingstructures.com/) and
  [Training from the BACK of the Room](https://bowperson.com/resources/index.html); extensible to more.
- **Agents** (Claude Code subagents) — a **designer**, an **executor**, and a **feedback** agent.
- **Workshop archive** — every workshop I run is a folder of markdown (brief → design → execution → feedback → lessons).
- **Lessons loop** — designer reads my past lessons-learned + personal feedback so designs improve over time.

## Why now
Designing each workshop from scratch is slow, my hard-won structures live in my head and scattered
docs, and I rarely capture what worked. A grounded, learning assistant turns facilitation into a
compounding asset instead of repeated improvisation.

## Guardrails (taste)
- **Assistant, not autopilot.** It proposes; I decide. Designs must read like *I* could run them.
- **Grounded, not generic.** Every suggested structure cites a practice in the library.
- **Markdown all the way down.** Everything is plain files I own, diff, and take to GitHub.
- **Extensible by adding files.** New practices = new markdown, no code change.

## Scope sequence (not commitments — direction)
1. **Designer** — brief → grounded, timed agenda. *(first feature; walking skeleton)*
2. **Feedback** — debrief a session → reusable lessons.
3. **Lessons loop** — designer consumes past lessons.
4. **Executor** — design → room / Miro / video prep pack.
5. **Library growth** — clean way to add new practice packs.
