# practices/

One markdown file per facilitation **structure** — the grounding library for the `designer` agent and
the `facilitation-practices` skill. See `../SKILL.md` for the overview and the current practice index.

## Add a practice
1. Copy `_TEMPLATE.md` to `<kebab-slug>.md` (e.g. `min-specs.md`).
2. Fill every field — `Medium fit` and `Facilitator notes` matter most.
3. Done. No code change; the designer globs `*.md` and the skill picks it up.

Practices are cited elsewhere by **slug** (filename without `.md`, e.g. `triz`), never by path.
