# DESIGN Decisions — workshop-designer

## Key Decisions
- [DD1] Ports-and-adapters, document-oriented: agents are stateless transformers over the library (read) and the workshop folder (read/write); no runtime/compiled code. (see: `docs/product/architecture/brief.md`)
- [DD2] The `workshops/<slug>/` folder is the agent integration contract — agents compose via files, never direct calls. (see: ADR-003)
- [DD3] Practice files = YAML frontmatter index + prose body. (see: ADR-002)
- [DD4] Grounding by slug, enforced by the designer agent; build-time validator deferred. (see: ADR-004)
- [DD5] Toolkit consolidated under `.claude/` as the plugin payload. (see: ADR-001)
- [DD6] Status lifecycle (`draft→designed→run→archived`) on the brief makes the archive/hub queryable.

## Architecture Summary
- Pattern: ports-and-adapters, document-oriented (markdown + frontmatter; no runtime)
- Paradigm: N/A (no code; OOP default if a future linter is added)
- Key components: `designer` agent · `facilitation-practices` skill (library) · templates · workshop store (filesystem) · future executor/feedback agents over the same folder

## Reuse Analysis
| Existing Component | File | Overlap | Decision | Justification |
|-------------------|------|---------|----------|---------------|
| designer agent | `.claude/agents/designer.md` | brief→design | EXTEND | +frontmatter/status (~12 LOC) vs new agent |
| facilitation-practices skill | `.claude/skills/.../SKILL.md` | library index/recommend | EXTEND | add schema + recommend section |
| practice files | `.claude/skills/.../practices/*.md` | structured metadata | EXTEND | prepend frontmatter; body unchanged |
| brief/design templates | `templates/*.md` | schema | EXTEND | add frontmatter |
| workshop store | `workshops/<slug>/` | storage convention | EXTEND | add status + file-name convention |
| architecture SSOT | `docs/product/architecture/brief.md` | — | CREATE NEW | greenfield, no prior doc |
| ADRs 001–004 | `docs/product/architecture/adr-*.md` | — | CREATE NEW | first decisions recorded |

## Technology Stack
- Markdown + YAML frontmatter: human-ownable, diffable, GitHub-native; frontmatter = machine index without a DB
- Claude Code subagents + skills: the repo *is* the tool (D2/D7); plugin-portable
- git: versioning + public distribution; private content gitignored (D6)
- No runtime/language/build

## Constraints Established
- Toolkit (`.claude/`) must have zero dependency on user content (`workshops/`) — preserves the plugin seam.
- Designs cite practices by slug, never path.
- Agents stay stateless and compose only through the workshop folder + library.

## Upstream Changes
- None. DESIGN formalized the contracts the SPIKE flagged; no DISCUSS assumption was contradicted.
- Note: practice/brief/design files gained frontmatter (schema formalization), and the 6 seeded
  practices + EXAMPLE + private session were migrated in-wave. No behavioral change to the walking skeleton.
