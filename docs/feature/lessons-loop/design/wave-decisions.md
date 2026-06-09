# DESIGN Decisions — lessons-loop

## Key Decisions
- [DD1] Extend the `designer` (no new agent) — the loop is a consultation step inside the existing design flow; a separate agent couldn't shape a design it doesn't write. (see: ADR-003, `docs/product/architecture/brief.md`)
- [DD2] Relevance = tag intersection + judgement — `practices` (slugs) ∩ candidate structures, OR `themes` ∩ brief context; then judge transfer. No ranking/ML (right-sized for one user).
- [DD3] Lessons both shape AND are cited — `lessons_applied` frontmatter + a "Lessons applied" section, so the loop is visible and trusted, never silent.
- [DD4] Silent when empty/irrelevant — no nagging, no invented lessons.

## Architecture Summary
- Pattern: ports-and-adapters, document-oriented — adds one driven read port (`lessons-learned/`) to the designer.
- Paradigm: N/A (no code)
- Key components: extended `designer` agent · extended `design.md` template · reused lesson schema (ADR-005)

## Reuse Analysis
| Existing Component | File | Overlap | Decision | Justification |
|-------------------|------|---------|----------|---------------|
| designer agent | `.claude/agents/designer.md` | design flow | EXTEND | the lesson-consult step IS the feature; separate agent can't shape the design |
| design template | `templates/design.md` | schema | EXTEND | add `lessons_applied` fm + section |
| lessons store | `lessons-learned/*.md` | read | REUSE | loop-ready schema (ADR-005), no change |

Zero CREATE NEW — pure extension/reuse, as the ADR-005 schema intended.

## Technology Stack
- Markdown + YAML frontmatter · Claude Code subagent · filesystem. No runtime/build.

## Constraints Established
- The loop is tag-driven (`practices`/`themes`) — keep lessons well-tagged at capture (feedback agent).
- Lessons must be cited when applied (transparency); never silently force-fit a non-transferring lesson.

## Upstream Changes
- The SSOT loop is now closed: `designer` reads `lessons-learned/`; the C4 "future" edge is solid; the
  agent-triad summary reflects a compounding cycle. No prior requirement contradicted. The `design.md`
  contract gained `lessons_applied` + a Lessons-applied section.

## Build note
Built in-wave (designer + template + SSOT). Dormant until real lessons accrue from run + debriefed
sessions — then each new design demonstrably applies prior lessons.
