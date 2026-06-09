# ADR-007 — Ship as a plugin-first repo; distribute via the community marketplace

**Status:** Accepted (2026-06-09) · **Supersedes:** ADR-001 (and the self-hosted generator/release machinery)

## Context
We want LetPeopleWorkShop installable as a Claude Code plugin with: **no build artifacts committed to the
repo**, **automated publishing** ("push = publish"), and ideally trunk-based (no release branch). We tried
several self-hosted mechanisms — a `release` branch, a committed `./plugin` dir, npm publish — each with a
cost (artifacts, branch, or an npm dependency).

The official **community marketplace** path resolves it: per the docs, approved plugins are *"pinned to a
specific commit SHA in `anthropics/claude-plugins-community`, and CI bumps the pin automatically as you push
new commits to your repository."* The plugin's files just live in your repo — which must be **plugin-first**
(root-level `agents/`, `skills/`, `.claude-plugin/plugin.json`).

## Decision
1. **The repo root *is* the plugin.** `agents/`, `skills/`, `templates/` at root; `.claude-plugin/plugin.json`
   manifest. `.claude/` is gone.
2. **No `version` field** in `plugin.json` → Claude uses the commit SHA, so **every push auto-versions** (zero
   manual bumps).
3. **Two path worlds:** toolkit files are read via **`${CLAUDE_PLUGIN_ROOT}/...`** (resolves both when installed
   and under `--plugin-dir`); **user content** (`workshops/`, `lessons-learned/`) is **project-relative** (the
   user's own workspace).
4. **Distribution:** (a) a `.claude-plugin/marketplace.json` (source `"."`) so anyone can
   `/plugin marketplace add LetPeopleWork/LetPeopleWorkShop` directly; (b) a one-time submission to
   `anthropics/claude-plugins-community` (form: claude.ai/settings/plugins/submit), after which pushes
   auto-update the pin.
5. **No build step, no release branch, no committed artifacts, no self-hosted release pipeline.** A lean
   `validate.yml` workflow structurally checks the plugin on push/PR; `claude plugin validate` is run before
   submission.

## Alternatives considered
- **Committed `./plugin` on main / `release` branch** — build artifacts in the repo (and a branch). Rejected.
- **npm publish from CI** — clean repo, but adds an npm account/token dependency and isn't the official path. Rejected.
- **Keep `.claude/` for zero-config clone-use + a generator** — reintroduces a parallel layout/transform. Rejected.

## Consequences
- **Lose zero-config clone-and-use** (`.claude/` auto-load). Replaced by **`claude --plugin-dir .`** for local
  dev/use (one flag; `${CLAUDE_PLUGIN_ROOT}` resolves) and `/plugin install` for users. (User-confirmed trade-off.)
- The generator scripts, the gated release workflow, and the approval environment were removed.
- Versioning is automatic (commit SHA). Publishing is automatic after the one-time review.
- ADR-001's "consolidate under `.claude/` to wrap as a plugin later" is realized directly as plugin-first; that
  consolidation no longer applies.
