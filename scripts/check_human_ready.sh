#!/usr/bin/env bash
set -e
fail=0

check() { test -f "$1" && echo "✓ $1" || { echo "✗ $1"; fail=1; }; }

echo "== Artifacts =="
check review/v1.5.6/improve/consensus/rme.md
check review/v1.5.6/improve/consensus/eden.md
check review/v1.5.6/improve/consensus/harmony.md
check review/README.md
check docs/Constella_v1.5.6_Committee_Review_Packet.pdf

echo "== Governance docs =="
test -f docs/Privacy_DataHygiene_OnePager_v1.5.6.pdf || echo "• Suggest adding docs/Privacy_DataHygiene_OnePager_v1.5.6.pdf"
test -f docs/MoU_Stub_v1.5.6.pdf || echo "• Suggest adding docs/MoU_Stub_v1.5.6.pdf"

echo
if [ $fail -eq 0 ]; then
  echo "✅ Human-review ready: All required artifacts present."
  exit 0
else
  echo "⚠️ Missing required artifacts. See ✗ items above."
  exit 1
fi
