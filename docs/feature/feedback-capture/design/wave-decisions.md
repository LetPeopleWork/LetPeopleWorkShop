# DESIGN Decisions — feedback-capture

## Key Decisions
- [DD1] `feedback` is a new, separate agent (not an extension of `designer`) — debrief is a distinct job; agents compose via the workshop folder. (see: ADR-003, `docs/product/architecture/brief.md`)
- [DD2] Lessons = one file per lesson, frontmatter-tagged (`practices` slugs + `themes`) — mirrors the practice-file pattern; the lessons-loop reuses the same glob+filter reader. (see: ADR-005)
- [DD3] The feedback agent advances the brief `designed → run` (facilitator owns `archived`).
- [DD4] Brain-dump first; agent asks only high-value gap questions; overall rating in frontmatter.
- [DD5] Lesson extraction is offered, never forced; practice slugs are inferred from notes; theme-only lessons allowed; any cited slug must resolve to a real practice (ADR-004).

## Architecture Summary
- Pattern: ports-and-adapters, document-oriented (extends the established folder contract)
- Paradigm: N/A (no code)
- Key components: `feedback` agent · `feedback.md` + `lesson.md` templates · `lessons-learned/` (one file per lesson) · designer's status lifecycle (extended)

## Reuse Analysis
| Existing Component | File | Overlap | Decision | Justification |
|-------------------|------|---------|----------|---------------|
| designer agent | `.claude/agents/designer.md` | folder-operating agent | CREATE NEW | debrief ≠ design; ADR-003 requires separate stateless agents |
| brief/design templates | `templates/*.md` | frontmatter+body pattern | EXTEND (pattern) | feedback/lesson reuse the convention, new files |
| status lifecycle | brief frontmatter | shared field | EXTEND | add `designed→run` driven by feedback |
| lessons-learned/ | `lessons-learned/` | placeholder | FORMALIZE | real convention + README |
| ADR-005 | `docs/product/architecture/adr-005-*.md` | — | CREATE NEW | new decision record |

## Technology Stack
- Markdown + YAML frontmatter · Claude Code subagent · filesystem adapters · git. No runtime/build.

## Constraints Established
- Lessons are loop-ready: `practices`/`themes` frontmatter are the retrieval axes for `lessons-loop`.
- The `feedback` agent never calls the `designer`; it composes through the workshop folder (ADR-003).
- Any practice slug cited in a lesson must resolve to a real `practices/<slug>.md` (ADR-004).

## Upstream Changes
- Status lifecycle refined: the feedback agent advances `designed → run` (was attributed to the
  facilitator). SSOT `architecture/brief.md` updated; recorded under "Changed Assumptions" in the
  feature-delta. No DISCUSS requirement contradicted.

## Build note
For this document/agent toolkit, the agent's design *is* its prompt file, so the concrete artifacts were
built in-wave (`.claude/agents/feedback.md`, `templates/feedback.md`, `templates/lesson.md`,
`lessons-learned/README.md`). True validation (slice-01 adoption hypothesis) awaits a real run session.
