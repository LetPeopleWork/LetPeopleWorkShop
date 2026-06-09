#!/usr/bin/env bash
# Publish ./build/plugin as the `release` branch — the git ref the marketplace catalog points at.
# CI use (the gated `publish` job). Requires GITHUB_TOKEN + GITHUB_REPOSITORY in the environment.
#
# The marketplace catalog lives on main (.claude-plugin/marketplace.json) and references the plugin via
# { source: github, repo: <this>, ref: release }. This script force-pushes the freshly built plugin tree
# as the root of the `release` branch.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGIN="$ROOT/build/plugin"
: "${GITHUB_REPOSITORY:?set by Actions}"
: "${GITHUB_TOKEN:?needs contents:write}"
LABEL="${VERSION:+v$VERSION}"; LABEL="${LABEL:-${GITHUB_REF_NAME:-manual}}"

[ -f "$PLUGIN/.claude-plugin/plugin.json" ] || { echo "✗ no built plugin — run build-plugin.sh first"; exit 1; }

cd "$PLUGIN"
git init -q
git checkout -q -b release
git config user.name  "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add -A
git commit -q -m "release: ${LABEL}"
git push -q --force "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" release
echo "✓ Published plugin to ${GITHUB_REPOSITORY} branch 'release' (from ${REF_NAME})."
