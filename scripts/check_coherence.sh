#!/usr/bin/env bash
# check_coherence.sh — content-coherence checks for the Constella framework.
#
# Complements the CI (docs-ci.yml: markdownlint + codespell + lychee link-check) with the
# *content* checks a reviewer cares about but a linter can't see:
#   1. every governance spec is listed in the canonical INDEX (nothing orphaned)
#   2. every file the README links to actually exists
#   3. tier honesty — flag any doc that carries both a `stable` claim and an unresolved `[verify]`
#
# Run from anywhere:  ./scripts/check_coherence.sh   (exit 0 = coherent)
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0

echo "== 1. INDEX coverage: every governance spec listed in docs/governance/INDEX.md =="
for f in docs/governance/*.md; do
  b=$(basename "$f")
  [[ "$b" == "INDEX.md" || "$b" == "README.md" ]] && continue
  if ! grep -qi "$b" docs/governance/INDEX.md; then   # case-insensitive: git tracks lowercase
    echo "  ✗ not listed in INDEX: $b"; fail=1
  fi
done
[[ $fail -eq 0 ]] && echo "  ✓ all governance specs indexed"

echo "== 2. README link integrity: every relative .md link resolves =="
rfail=0
while IFS= read -r link; do
  [[ "$link" == http* ]] && continue
  [[ -f "$link" ]] || { echo "  ✗ broken README link: $link"; rfail=1; fail=1; }
done < <(grep -oE '\]\([^)]+\.md' README.md | sed -E 's/^\]\(//')
[[ $rfail -eq 0 ]] && echo "  ✓ all README .md links resolve"

echo "== 3. tier honesty: docs carrying both 'stable' and an unresolved [verify] =="
hits=$(grep -rlE '\[verify\]' docs/ 2>/dev/null | xargs grep -lw 'stable' 2>/dev/null || true)
if [[ -n "$hits" ]]; then
  echo "  ⚠ review by hand (a stable claim should not sit next to an unverified figure):"
  echo "$hits" | sed 's/^/    - /'
else
  echo "  ✓ no stable-tier doc has an unresolved [verify]"
fi

echo
if [[ $fail -eq 0 ]]; then echo "✅ COHERENCE OK"; else echo "⚠️ COHERENCE ISSUES (see above)"; fi
exit $fail
