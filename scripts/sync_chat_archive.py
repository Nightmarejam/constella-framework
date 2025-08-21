#!/usr/bin/env python3

import os, sys, pathlib, re

ARCHIVE_DIR = pathlib.Path(__file__).resolve().parents[1] / "docs" / "archive"
INDEX = ARCHIVE_DIR / "index.md"

def main():
    ARCHIVE_DIR.mkdir(parents=True, exist_ok=True)
    files = sorted([p for p in ARCHIVE_DIR.glob("**/*") if p.is_file() and p.suffix.lower() in (".md",".txt") and p.name != "index.md"])
    # Start the index with a proper header line; no extra backslash needed
    lines = ["# Archive Index"]
    for p in files:
        rel = p.relative_to(ARCHIVE_DIR)
        # extract top-level header if present
        title = None
        try:
            for line in p.read_text(encoding="utf-8", errors="ignore").splitlines():
                if line.strip().startswith("# "):
                    title = line.strip().lstrip("# ").strip()
                    break
        except Exception:
            pass
        display = title or rel.as_posix()
        lines.append(f"- [{display}]({rel.as_posix()})")
    # Join lines with actual newlines and write out the index file
    INDEX.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"[OK] Indexed {len(files)} items to {INDEX}")

if __name__ == "__main__":
    main()
