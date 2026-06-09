#!/usr/bin/env bash
# Generate the Claude Code plugin form of LetPeopleWorkShop from the clone-friendly .claude/ source.
#
# Single source of truth stays main/.claude/ (clone-and-use, relative paths). This script *derives*
# the installable plugin into ./build/plugin/ (gitignored) by mirroring the toolkit into the
# plugin-root layout and rewriting ONLY toolkit paths to ${CLAUDE_PLUGIN_ROOT}. User-content paths
# (workshops/, lessons-learned/) are project-relative in both modes and are left untouched.
#
# Usage: scripts/build-plugin.sh [version]   (version also via $VERSION env, else latest git tag)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/build/plugin"
VERSION="${1:-${VERSION:-$(git -C "$ROOT" describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo '0.0.0-dev')}}"

echo "→ Building plugin v$VERSION into build/plugin/"
rm -rf "$OUT"
mkdir -p "$OUT/.claude-plugin"

# 1) Mirror the toolkit into the plugin-root layout (agents/, skills/, templates/ at root)
cp -R "$ROOT/.claude/agents" "$OUT/agents"
cp -R "$ROOT/.claude/skills" "$OUT/skills"
cp -R "$ROOT/templates"      "$OUT/templates"

# 2) Rewrite TOOLKIT paths -> ${CLAUDE_PLUGIN_ROOT} in the copied agents + skill markdown.
#    (single-quoted sed so ${CLAUDE_PLUGIN_ROOT} stays literal in the output)
while IFS= read -r -d '' f; do
  sed -i \
    -e 's#\.claude/skills#${CLAUDE_PLUGIN_ROOT}/skills#g' \
    -e 's#\.claude/agents#${CLAUDE_PLUGIN_ROOT}/agents#g' \
    -e 's#\([`( ]\)templates/\([a-z][a-z-]*\.md\)#\1${CLAUDE_PLUGIN_ROOT}/templates/\2#g' \
    "$f"
done < <(find "$OUT/agents" "$OUT/skills" -name '*.md' -print0)

# 3) Emit the plugin manifest
cat > "$OUT/.claude-plugin/plugin.json" <<JSON
{
  "name": "let-people-workshop",
  "version": "$VERSION",
  "description": "Design, prep & learn from workshops — facilitation agents grounded in Liberating Structures and Training from the BACK of the Room.",
  "author": { "name": "LetPeopleWork", "url": "https://letpeople.work" },
  "homepage": "https://github.com/LetPeopleWork/LetPeopleWorkShop",
  "repository": "https://github.com/LetPeopleWork/LetPeopleWorkShop",
  "license": "MIT",
  "keywords": ["facilitation", "workshops", "liberating-structures", "training-from-the-back-of-the-room", "claude-code"]
}
JSON

# 4) Validate the built plugin (this is the "test" the CI build job runs)
echo "→ Validating…"
fail=0
check() { if eval "$2"; then echo "  ✓ $1"; else echo "  ✗ $1"; fail=1; fi; }
check "plugin.json present"            "[ -f '$OUT/.claude-plugin/plugin.json' ]"
check "plugin.json is valid JSON"      "python3 -c \"import json;json.load(open('$OUT/.claude-plugin/plugin.json'))\" 2>/dev/null"
check "agents present (3)"             "[ -f '$OUT/agents/designer.md' ] && [ -f '$OUT/agents/executor.md' ] && [ -f '$OUT/agents/feedback.md' ]"
check "facilitation-practices skill"   "[ -f '$OUT/skills/facilitation-practices/SKILL.md' ]"
check "templates present"              "ls '$OUT'/templates/*.md >/dev/null 2>&1"
check "no .claude/ paths leaked"       "! grep -rqs '\.claude/' '$OUT/agents' '$OUT/skills'"
check "every templates/ ref rewritten" "! { grep -rns 'templates/' '$OUT/agents' '$OUT/skills' | grep -qv 'CLAUDE_PLUGIN_ROOT'; }"
check "CLAUDE_PLUGIN_ROOT injected"    "grep -rqs 'CLAUDE_PLUGIN_ROOT' '$OUT/agents'"
if [ "$fail" -eq 0 ]; then
  echo "✓ PLUGIN BUILD OK (v$VERSION) → $OUT"
else
  echo "✗ PLUGIN BUILD FAILED"; exit 1
fi
