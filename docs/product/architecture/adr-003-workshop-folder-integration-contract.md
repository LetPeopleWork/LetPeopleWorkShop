# ADR-003 — The workshop folder is the agent integration contract

**Status:** Accepted (2026-06-09) · **Feature:** workshop-designer

## Context
The product roadmap has multiple agents — `designer` now, `executor` and `feedback` later, plus a
`lessons-loop`. They must compose without becoming a tangle of agent-to-agent calls, and each must be
independently runnable and replaceable.

## Decision
Agents **do not call each other**. They compose by reading and writing markdown files in a shared
**`workshops/<slug>/` folder** (and the read-only library / `lessons-learned/`). The folder is the
contract:
- `designer`: reads `brief.md` → writes `design.md`
- `executor` (future): reads `design.md` → writes `setup.md`
- `feedback` (future): reads `design.md` (+ notes) → writes `feedback.md`, appends `lessons-learned/`
- `lessons-loop` (future): `designer` also reads `lessons-learned/`

## Alternatives considered
- **Agent orchestration / direct invocation chains** — tighter coupling, harder to run one step alone,
  and contradicts the stateless-transformer model. Rejected.
- **A single mega-agent doing design+prep+feedback** — violates single responsibility; the spicy design
  judgment and the room-prep mechanics are different jobs. Rejected.

## Consequences
- New agents land without touching existing ones — only the folder convention is shared.
- The folder doubles as the **archive** (the vision's "archive of workshops I ran").
- A documented file-name convention per stage is required (`brief`/`design`/`setup`/`feedback`).
- Statelessness means re-running an agent regenerates its output file deterministically from inputs.
