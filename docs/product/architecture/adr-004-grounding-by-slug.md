# ADR-004 — Grounding by slug, enforced by the agent (validator deferred)

**Status:** Accepted (2026-06-09) · **Feature:** workshop-designer

## Context
"Grounded, not generic" is the core value: every structure in a design must trace to a real practice.
We also want designs to survive the library moving (e.g. into a packaged plugin), and we have no test
runner in this markdown/agent repo.

## Decision
Designs cite practices by **slug** (filename without `.md`, e.g. `triz`) — never by file path. A design is
grounded only if every cited slug resolves to a `practices/<slug>.md`. Enforcement is the **designer
agent's responsibility**: it globs the library before writing, refuses to invent un-backed structures,
flags a "library gap" when nothing fits, and emits a `grounding: N/N` check in the design frontmatter.

## Alternatives considered
- **Path citations** (`practices/triz.md`) — break when the library relocates into a plugin. Rejected
  (couples designs to physical layout).
- **A build-time validator script now** — real enforcement, but premature for a single-user tool with no
  CI; adds a language/runtime we deliberately avoid. Deferred to an open question, not rejected.

## Consequences
- Designs are portable across fork-repo and future-plugin layouts.
- Enforcement is "soft" (agent-driven) until/unless a lint script is added — acceptable for a personal
  tool; revisit if grounding drifts in practice.
- `grounding: N/N` in design frontmatter makes the check auditable at a glance.
