#!/usr/bin/env bash
# Compute the next semantic version from the latest git tag (v<MAJOR>.<MINOR>.<PATCH>).
# First release (no tags yet) -> 1.0.0. Otherwise bump per the argument (default: patch).
# Usage: scripts/next-version.sh [patch|minor|major]   -> prints e.g. 1.2.0
set -euo pipefail

bump="${1:-patch}"
latest="$(git describe --tags --match 'v*' --abbrev=0 2>/dev/null || true)"

if [ -z "$latest" ]; then
  echo "1.0.0"; exit 0
fi

v="${latest#v}"
IFS=. read -r MA MI PA <<<"$v"
: "${MA:=0}" "${MI:=0}" "${PA:=0}"
case "$bump" in
  major) echo "$((MA + 1)).0.0" ;;
  minor) echo "$MA.$((MI + 1)).0" ;;
  patch | *) echo "$MA.$MI.$((PA + 1))" ;;
esac
