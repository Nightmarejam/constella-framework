#!/usr/bin/env python3
"""Check constella's vendored copy of the shared attestation schema (stdlib only; runs in Docs CI).

  1. tools/attestation_schema/__init__.py's fingerprint() == VENDORED.json == PIN.json  (the copy did not drift)
  2. docs/reference/attestation_schema.generated.md == describe()                       (the table is not hand-edited)

Source of truth: Nightmarejam/homelab attestation_schema/. Refresh from a homelab checkout with
  python scripts/vendor_attestation_schema.py <this dir>
  python -m attestation_schema describe > docs/reference/attestation_schema.generated.md
"""
import importlib.util
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent.parent
GENERATED = ROOT / "docs" / "reference" / "attestation_schema.generated.md"


def main() -> int:
    spec = importlib.util.spec_from_file_location("attestation_schema", HERE / "__init__.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    fp = mod.fingerprint()
    if "--write" in sys.argv:          # regenerate the table (one trailing newline, markdownlint-clean)
        GENERATED.write_text(mod.describe().rstrip() + "\n", encoding="utf-8", newline="\n")
        print(f"wrote {GENERATED.relative_to(ROOT)}")
    problems = []
    vend = json.loads((HERE / "VENDORED.json").read_text(encoding="utf-8"))
    pin = json.loads((HERE / "PIN.json").read_text(encoding="utf-8"))
    if vend["fingerprint"] != fp:
        problems.append(f"VENDORED.json fingerprint {vend['fingerprint'][:12]} != copy {fp[:12]} (the copy was edited; re-vendor from homelab)")
    if pin["fingerprint"] != fp:
        problems.append(f"PIN.json fingerprint {pin['fingerprint'][:12]} != copy {fp[:12]}")
    if vend["version"] != mod.SCHEMA_VERSION:
        problems.append("VENDORED.json version != SCHEMA_VERSION")
    want = mod.describe().replace("\r\n", "\n")
    have = GENERATED.read_text(encoding="utf-8").replace("\r\n", "\n") if GENERATED.exists() else ""
    if have.strip() != want.strip():
        problems.append(f"{GENERATED.relative_to(ROOT)} is not describe()'s output; regenerate it (never hand-edit)")
    if problems:
        print("ATTESTATION SCHEMA CHECK FAILED:\n  - " + "\n  - ".join(problems))
        return 1
    print(f"attestation schema OK: {mod.SCHEMA_VERSION} {fp[:16]} (copy, pin and generated table agree)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
