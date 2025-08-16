#!/usr/bin/env bash
set -euo pipefail

# Usage: scripts/make-improvement-bundle.sh <project> <version> <snapshot-md>
# project: rme | eden | harmony
# version: e.g., v1.5.5
# snapshot-md: path to aggregated snapshot Markdown (consensus, partners, bottlenecks)

proj="${1:-}"; ver="${2:-}"; snap="${3:-}"

if [[ -z "$proj" || -z "$ver" || -z "$snap" ]]; then
  echo "Usage: $0 <project> <version> <snapshot-md>" >&2
  exit 1
fi
case "$proj" in
  rme)      scroll="review/${ver}/01-rme.md" ;;
  eden)     scroll="review/${ver}/02-eden.md" ;;
  harmony)  scroll="review/${ver}/03-harmony.md" ;;
  *) echo "Unknown project: $proj (use: rme | eden | harmony)"; exit 1 ;;
esac

[[ -f "$scroll" ]] || { echo "Missing scroll: $scroll" >&2; exit 1; }
[[ -f "$snap"   ]] || { echo "Missing snapshot: $snap" >&2; exit 1; }

out="review/${ver}/improve/IMPROVEMENT_BUNDLE_${proj}_${ver}.md"

{
  echo "<!-- ===== PROMPT ===== -->"
  cat review/IMPROVEMENT_PROMPT.md
  echo
  echo "<!-- ===== ORIGINAL SCROLL ===== -->"
  cat "$scroll"
  echo
  echo "<!-- ===== AGGREGATION SNAPSHOT ===== -->"
  cat "$snap"
} > "$out"

echo "Wrote: $out"
echo "Tip: pbcopy < \"$out\"   # copy full bundle to clipboard"
