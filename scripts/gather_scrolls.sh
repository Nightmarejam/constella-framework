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

# If no pattern passed, try to read from config/projects.txt (tab-separated: slug<TAB>regex)
if [[ -z "$PATTERN" && -f config/projects.txt ]]; then
  PATTERN="$(awk -F'\t' -v s="$SLUG" '$1==s{print $2}' config/projects.txt | head -n1)"
fi
if [[ -z "$PATTERN" ]]; then
  echo "Missing grep pattern. Add it to config/projects.txt or pass as arg."
  exit 2
fi

TMP_LIST="$(mktemp)"
# Find candidate markdowns outside the target raw dir (avoid self-moves)
find review -type f -name '*.md' ! -path "review/${VER}/improve/raw/${SLUG}/*" -print0 \
  | xargs -0 grep -Il -E "$PATTERN" | tee "$TMP_LIST" >/dev/null

if [[ -s "$TMP_LIST" ]]; then
  while IFS= read -r -u 9 src; do
    base="$(basename "$src")"
    # Prefer git mv if tracked, otherwise plain mv + git add
    if git ls-files --error-unmatch "$src" >/dev/null 2>&1; then
      git mv -f "$src" "$RAW_DIR/$base"
    else
      mv -f "$src" "$RAW_DIR/$base"
      git add "$RAW_DIR/$base"
    fi
    echo "Moved: $src -> $RAW_DIR/$base"
  done 9<"$TMP_LIST"
  echo "Moved files into: $RAW_DIR"
else
  echo "No matching files found for pattern: $PATTERN"
fi

# --- Normalize raw filenames (safer logic: handles tracked/untracked) ---
shopt -s nullglob
for f in "$RAW_DIR"/*.md; do
  base="$(basename "$f")"
  stem="${base%.md}"
  # Normalize: collapse spaces to underscores, remove duplicate underscores
  new_stem="$(echo "$stem" | tr ' ' '_' | sed -E 's/_+/_/g')"
  new_name="${new_stem}.md"

  if [[ "$base" != "$new_name" ]]; then
    if git ls-files --error-unmatch "$RAW_DIR/$base" >/dev/null 2>&1; then
      git mv -f "$RAW_DIR/$base" "$RAW_DIR/$new_name"
    else
      mv -f "$RAW_DIR/$base" "$RAW_DIR/$new_name"
      git add "$RAW_DIR/$new_name"
    fi
    echo "Renamed: $base -> $new_name"
  fi
done
shopt -u nullglob

# Consolidate into consensus
python3 scripts/consolidate_ai_reviews.py "$RAW_DIR" "${CONS_DIR}/${SLUG}.md"
echo "Wrote consensus: ${CONS_DIR}/${SLUG}.md"
