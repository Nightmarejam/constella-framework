#!/usr/bin/env bash
# Prints Constella top-priority projects by scanning review/README.md first,
# and falls back to crawling review/**/*.md and reading their first H1.

set -euo pipefail

VERSION_FILTER="${1-}"            # optional: pass "v1.5.5" to filter paths containing that
SHOW_PATHS="${SHOW_PATHS:-0}"     # env flag: SHOW_PATHS=1 ./scripts/list-priorities.sh

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
review_idx="$repo_root/review/README.md"

normalize() {
  sed -E 's/^[[:space:]]+|[[:space:]]+$//g'
}

print_list() {
  nl=1
  while IFS=$'\t' read -r title path; do
    [[ -z "${title:-}" ]] && continue
    if [[ -n "$VERSION_FILTER" && "$path" != *"$VERSION_FILTER"* ]]; then
      continue
    fi
    if [[ "$SHOW_PATHS" == "1" ]]; then
      printf "%d. %s\t(%s)\n" "$nl" "$title" "$path"
    else
      printf "%d. %s\n" "$nl" "$title"
    fi
    nl=$((nl+1))
  done
}

extract_from_index() {
  # Portable: grab [Title](path) fragments with grep, then split in shell
  # Works on BSD grep (macOS) and GNU grep alike.
  if [[ ! -f "$review_idx" ]]; then
    return 1
  fi
  LC_ALL=C grep -Eo '\[[^]]+\]\([^)]+\)' "$review_idx" | while IFS= read -r m; do
    title="${m%%]*}"        # everything up to first ]
    title="${title#\[}"     # strip leading [
    path="${m#*\(}"         # after first (
    path="${path%\)}"       # strip trailing )
    printf "%s\t%s\n" "$title" "$path"
  done | normalize
}

crawl_scrolls() {
  # Fallback: look for review/**.md and grab the first H1 as the title.
  find "$repo_root/review" -type f -name "*.md" 2>/dev/null | sort | while read -r f; do
    base="$(basename "$f")"
    [[ "$base" == "README.md" || "$base" == "AI_REVIEW_PROMPT.md" ]] && continue
    h1="$(grep -m1 -E '^# ' "$f" | sed -E 's/^# +//')"
    [[ -z "$h1" ]] && h1="$base"
    rel="${f#$repo_root/}"
    printf "%s\t%s\n" "$h1" "$rel"
  done
}

main() {
  list="$(extract_from_index || true)"
  if [[ -z "${list:-}" ]]; then
    list="$(crawl_scrolls || true)"
  fi

  echo "=== Constella Top Priorities ${VERSION_FILTER:+($VERSION_FILTER)} ==="
  if [[ -z "$list" ]]; then
    echo "No review scrolls found yet."
    exit 0
  fi

  print_list <<< "$list"
}

main "$@"
