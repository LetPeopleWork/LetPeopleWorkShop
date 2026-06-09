# ADR-001 — Consolidate the toolkit under `.claude/` for plugin-readiness

**Status:** Accepted (2026-06-09) · **Feature:** workshop-designer · **Decision ref:** D7

## Context
The repo is pushed publicly so other facilitators can reuse it. We want the option to later distribute
as an installable Claude Code **plugin** (via a marketplace) without a rewrite, while shipping today as a
fork-the-repo template. A Claude Code plugin's layout (`agents/`, `skills/`, `.claude-plugin/plugin.json`)
closely mirrors a project's `.claude/` directory.

## Decision
Place the entire reusable toolkit under **`.claude/`** — the `designer` agent in `.claude/agents/` and the
practices library as the `facilitation-practices` **skill** in `.claude/skills/`. Keep user content
(`workshops/`, `lessons-learned/`) at the repo root, gitignored (ADR per D6). The toolkit has **zero
dependency** on user content.

## Alternatives considered
- **Top-level `practices/` + `templates/` browsable library** — nicer to browse, but extraction to a
  plugin gathers from 2-3 roots and the practices aren't a real skill. Rejected: weaker "use skills" fit.
- **Build the plugin now** — premature; the library shape and the executor/feedback agents aren't settled.

## Consequences
- Future distribution = add `.claude-plugin/plugin.json` + publish `.claude/` → a lift, not a rewrite.
- Practices are nested deeper; mitigated by the skill (`list/explain/recommend`) and README pointers.
- `.claude/` is the portable payload; the toolkit↔content boundary must stay clean (no agent reads a
  specific user's workshop as a dependency).
