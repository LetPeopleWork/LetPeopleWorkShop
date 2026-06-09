# DESIGN Decisions — executor

## Key Decisions
- [DD1] `executor` is a third, separate agent completing the triad (designer → executor → feedback), composing only via the workshop folder. (see: ADR-003, `docs/product/architecture/brief.md`)
- [DD2] `setup.md` = tickable checklist + per-structure setup; two prep modes (in-person | digital = Miro+video). No layout diagram, no run-sheet. (see: ADR-006)
- [DD3] Markdown recipes only — no Miro API / live board generation. (see: ADR-006)
- [DD4] Per-structure setup is grounded in each practice's `Steps`/`Group config`/`Medium fit` notes; a no-materials structure gets a flagged default. (extends ADR-004)
- [DD5] The executor does not change the brief `status` — prep is pre-session; `feedback` owns `run`.

## Architecture Summary
- Pattern: ports-and-adapters, document-oriented (extends the established folder contract)
- Paradigm: N/A (no code)
- Key components: `executor` agent · `setup.md` template · (reuses) practice `Medium fit` notes · workshop folder

## Reuse Analysis
| Existing Component | File | Overlap | Decision | Justification |
|-------------------|------|---------|----------|---------------|
| designer agent | `.claude/agents/designer.md` | folder-operating agent | CREATE NEW | prep ≠ design; ADR-003 separate agents |
| feedback agent | `.claude/agents/feedback.md` | folder-operating agent | CREATE NEW | prep (pre) ≠ debrief (post) |
| facilitation-practices skill | `.claude/skills/.../practices/*.md` | per-structure setup source | REUSE | consumes existing notes — no change |
| templates | `templates/*.md` | frontmatter+body pattern | EXTEND (pattern) | `setup.md` reuses convention, new file |
| ADR-006 | `docs/product/architecture/adr-006-*.md` | — | CREATE NEW | new decision record |

## Technology Stack
- Markdown + YAML frontmatter · Claude Code subagent · filesystem adapters · git. No runtime/build.

## Constraints Established
- Prep is a pure read→write transform over the workshop folder; no status side-effects (DD5).
- Per-structure setup must trace to a real practice (grounding extends to prep, ADR-004).
- Digital packs are markdown recipes — no vendor/API coupling.

## Upstream Changes
- None contradicted. The agent triad (designer/executor/feedback) is now fully realized in the SSOT
  brief; `setup.md` contract + prep-flow C4 diagram added. The `medium → prep-mode` mapping
  (in-person | digital) is the one new modeling decision, recorded in ADR-006.

## Build note
Concrete artifacts built in-wave (`.claude/agents/executor.md`, `templates/setup.md`). Slice 01
(in-person) is dogfoodable now on the real `cross-team-collab-s1` design.
