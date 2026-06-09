# Slice 01 — Brief → grounded agenda (walking skeleton)

**Goal (one sentence):** Turn a real workshop `brief.md` into a `design.md` — a timed agenda of named
facilitation structures, each citing a practice in a thin seeded library.

## IN scope
- Workshop folder convention: `workshops/<slug>/` with `brief.md` and `design.md`.
- A `brief.md` template (goal, audience, group size, duration, medium, constraints).
- A thin **practices library** under `practices/` — ≥3 Liberating Structures + ≥1 Training-from-the-BACK-of-the-Room practice, in a documented file shape (name, purpose, when-to-use, group config, timing, medium fit, source link).
- A **designer** Claude Code subagent (`.claude/agents/`) that reads `brief.md` + `practices/`, and writes `design.md`: timed agenda, per-structure rationale + citation, total-time reconciliation, and missing-field handling.
- A short README: repo-as-tool model + how to add a practice.

## OUT scope
- Reading past lessons / feedback (no lessons exist yet — `lessons-loop` feature).
- Executor / room / Miro / video prep packs (`executor` feature).
- More than a seed library; any non-markdown storage; web UI; external APIs.

## Learning hypothesis
**Disproves** "a *thin* curated LS+TBR library is enough to ground designs I'd actually run" **if**
the generated agendas feel generic, ignore the medium, or I rewrite them wholesale.
**Confirms** the whole product direction **if** I run my next real workshop off a Slice-01 design
with only minor edits.

## Production data (not synthetic)
Use my **next real upcoming workshop** brief as the input — not a toy example.

## Dogfood moment (same day)
Within the same day Slice 01 lands, design that real workshop with it and rate the output
(`reuse: as-is | minor | major | discarded`) in the `design.md` footer.

## Acceptance criteria
- A real `brief.md` produces a `design.md` where **every** structure cites a practice file that exists in `practices/`.
- Total agenda time is shown and reconciled to the brief's time box (overflow → flagged + trimmed option).
- Each structure carries a one-line goal/medium rationale.
- Missing brief field → designer asks or states its assumption (never silently invents goal/duration).

## Dependencies
- Architecture decision D2 (Claude Code subagents, markdown storage) — settled in DISCUSS.
- DESIGN must fix: practice file schema, `design.md` format, designer agent contract.

## Effort estimate & reference class
**≤ 1 day** of crafter dispatch. Reference class: authoring 3–4 markdown practice files + 1 brief
template + 1 subagent prompt + 1 README. Low code, mostly content + one agent contract.

## Pre-slice SPIKE (recommended — uncertainty is in the grounding, not the plumbing)
Timebox ~1–2h via `/nw-spike`: hand-write 3 practice files, hand-write one real brief, and prompt a
designer once. If the single design is something you'd run → PROMOTE to the walking skeleton. If it's
generic → the hypothesis is already wobbling; adjust library shape/agent contract before building.
