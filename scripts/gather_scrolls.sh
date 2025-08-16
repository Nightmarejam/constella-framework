#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <version> <project-slug> [grep-pattern]"
  echo "Example: $0 v1.5.6 eden '(^|\\b)(Project Eden|Eden)\\b'"
  exit 1
fi

VER="$1"
SLUG="$2"
PATTERN="${3:-}"

RAW_DIR="review/${VER}/improve/raw/${SLUG}"
CONS_DIR="review/${VER}/improve/consensus"
mkdir -p "$RAW_DIR" "$CONS_DIR"

# If no pattern passed, try to read from config/projects.txt
if [[ -z "$PATTERN" && -f config/projects.txt ]]; then
  PATTERN="$(awk -F'\t' -v s="$SLUG" '$1==s{print $2}' config/projects.txt | head -n1)"
fi
if [[ -z "$PATTERN" ]]; then
  echo "Missing grep pattern. Add it to config/projects.txt or pass as arg."
  exit 2
fi

TMP_LIST="$(mktemp)"
# Find candidate markdowns outside the target raw dir
find review -type f -name '*.md' ! -path "review/${VER}/improve/raw/${SLUG}/*" -print0 \
  | xargs -0 grep -Il -E "$PATTERN" | tee "$TMP_LIST" >/dev/null

# Move with git (preserves history)
if [[ -s "$TMP_LIST" ]]; then
  # macOS/BSD xargs: read via input redirection (no -a)
  xargs -I{} git mv "{}" "$RAW_DIR"/ < "$TMP_LIST"
  echo "Moved files into: $RAW_DIR"
else
  echo "No matching files found for pattern: $PATTERN"
fi

# Consolidate
python3 scripts/consolidate_ai_reviews.py "$RAW_DIR" "${CONS_DIR}/${SLUG}.md"
