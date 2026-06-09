#!/usr/bin/env bash
# Trunk-based release: materialize the built plugin into the tracked ./plugin directory ON MAIN,
# commit it, and tag the release. No release branch. CI use (the gated `publish` job).
# Requires: GITHUB_REPOSITORY, GITHUB_TOKEN (contents:write), VERSION.
#
# The marketplace catalog (.claude-plugin/marketplace.json on main) points the plugin at "./plugin",
# so the released snapshot lives on trunk alongside the .claude/ dev source.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
: "${GITHUB_REPOSITORY:?set by Actions}"
: "${GITHUB_TOKEN:?needs contents:write}"
: "${VERSION:?release version}"
[ -d "$ROOT/build/plugin" ] || { echo "✗ no built plugin — run build-plugin.sh first"; exit 1; }

cd "$ROOT"
rm -rf plugin
cp -R build/plugin plugin

git config user.name  "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add plugin
if git diff --cached --quiet; then
  echo "→ ./plugin unchanged; tagging v$VERSION on current main"
else
  git commit -q -m "chore(release): v$VERSION — publish plugin to ./plugin"
fi
git tag -a "v$VERSION" -m "Release v$VERSION"
git push "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" HEAD:main "refs/tags/v$VERSION"
echo "✓ released v$VERSION on main (./plugin) + tag — trunk-based, no branch"
