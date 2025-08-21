#!/usr/bin/env python3

import json, pathlib, sys

ROOT = pathlib.Path(__file__).resolve().parents[1]

def main():
    manifest = json.loads((ROOT / "MANIFEST.json").read_text(encoding="utf-8"))
    missing = []
    for req in manifest.get("required_files", []):
        if not (ROOT / req).exists():
            missing.append(req)
    if missing:
        print("[WARN] Missing required files:")
        for m in missing:
            print(" -", m)
        sys.exit(1)
    print("[OK] All required files present.")

if __name__ == "__main__":
    main()
