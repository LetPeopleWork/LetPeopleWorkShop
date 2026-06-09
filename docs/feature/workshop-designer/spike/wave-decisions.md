# SPIKE Decisions — workshop-designer

## Assumption Tested
Can a *thin* curated library of Liberating Structures + Training-from-the-BACK-of-the-Room practices
ground a complete, time-reconciled, **runnable** workshop design from a real brief — for a
politically sensitive session — without leaking the convener's pre-baked solution?

## Probe Verdict
**WORKS.** A 6-practice hand-authored library produced a runnable ~110-min design for a real,
spicy 4-5-PO cross-team-collaboration session: grounded (5/5 structures cited), time-reconciled
(90/110/120 band), and politically aware (lead-with-problems, silent-write-first, depersonalize via
TRIZ, convener-as-peer, no premature commitment). See `findings.md`.

## Promotion Decision
**PROMOTE.** The facilitator judged the design runnable. Probe refactored into a committed walking
skeleton with the public-toolkit / private-content split (D6).

## Walking Skeleton
- **Driving adapter (entry point):** `designer` Claude Code subagent (`.claude/agents/designer.md`),
  invoked on a `workshops/<slug>/brief.md`.
- **Domain/library:** `practices/*.md` (6 seeded) + `templates/{brief,design}.md`.
- **Driven adapter:** filesystem — writes `design.md` into `workshops/<slug>/` (gitignored).
- **Acceptance spec:** `tests/acceptance/workshop-designer/walking-skeleton.feature`
  (`@walking_skeleton @driving_port`) — executable specification, manually verified.
- **Demo (real, private):** `workshops/cross-team-collab-s1/{brief,design}.md` — rated runnable.
- **Demo (public, sanitized):** `workshops/EXAMPLE-team-retro/{brief,design}.md`.
- **Commit:** see `feat(workshop-designer): walking skeleton` in git log.

## Design Implications (for DESIGN)
1. Grounding must be enforceable — designer cites `practices/*` per structure or flags a library gap.
2. Time reconciliation needs a band (floor/target/ceiling), not a single total.
3. Support "swap X for Y if the room is…" alternatives, not one rigid path.
4. Brief sensitivities are first-class design input — keep them prominent in the template.
5. Public/private directory split (D6) is structural: library/templates/agents committed; real
   `workshops/*` + `lessons-learned/*` gitignored, EXAMPLE-* committed.

## Constraints Discovered
- A "facilitator stance / convener-neutrality" checklist recurs across sessions → candidate future practice.
- No automated test runner in this markdown/agent repo → acceptance spec is verified manually for now.
