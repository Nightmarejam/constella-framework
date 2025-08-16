#!/usr/bin/env bash
# Cleanup and normalize docs tree for constella-framework
# - Flattens docs/docs/* -> docs/*
# - Fixes README links
# - Ensures docs/doctrine/README.md exists
# Dry-run by default. Use --write to apply changes.

set -euo pipefail

DRY_RUN=1
if [[ "${1:-}" == "--write" ]]; then
  DRY_RUN=0
  shift || true
fi

say() { printf "%s\n" "$*"; }
doit() {
  if [[ $DRY_RUN -eq 1 ]]; then
    printf "[dry-run] %s\n" "$*"
  else
    eval "$@"
  fi
}

# Ensure we're in repo root
if [[ ! -d .git ]]; then
  say "❌ Please run from the repository root (where .git exists)."
  exit 1
fi

ROOT="$(pwd)"
DOCS_DIR="$ROOT/docs"
NESTED="$DOCS_DIR/docs"

say "🔧 Repo: $ROOT"
say "🔧 Dry-run: $([[ $DRY_RUN -eq 1 ]] && echo yes || echo no)"

# Helper: git-aware move
git_tracked() { git ls-files --error-unmatch -- "$1" >/dev/null 2>&1; }

git_move_or_mv() {
  local src="$1" dst="$2"
  local dstdir
  dstdir="$(dirname "$dst")"
  [[ -d "$dstdir" ]] || doit "mkdir -p \"$dstdir\""
  if git_tracked "$src"; then
    doit "git mv \"$src\" \"$dst\""
  else
    doit "mv \"$src\" \"$dst\""
    # If destination is new, add it so commit picks it up later
    if [[ $DRY_RUN -eq 0 ]]; then
      git add -N "$dst" >/dev/null 2>&1 || true
    fi
  fi
}

# 1) Flatten docs/docs/* -> docs/*
if [[ -d "$NESTED" ]]; then
  say "📂 Found nested docs at $NESTED — flattening into $DOCS_DIR ..."
  # Move files first (depth-first so dirs come last)
  while IFS= read -r -d '' path; do
    rel="${path#$NESTED/}"
    target="$DOCS_DIR/$rel"
    if [[ -f "$path" ]]; then
      say "→ move file: docs/docs/$rel → docs/$rel"
      git_move_or_mv "$path" "$target"
    fi
  done < <(find "$NESTED" -type f -print0)

  # Remove now-empty directories
  while IFS= read -r -d '' d; do
    # Skip the parent $NESTED until the end
    if [[ "$d" != "$NESTED" ]]; then
      say "🧹 rmdir empty: $d"
      doit "rmdir \"$d\" 2>/dev/null || true"
    fi
  done < <(find "$NESTED" -depth -type d -print0)

  say "🧹 remove parent nested dir if empty: $NESTED"
  doit "rmdir \"$NESTED\" 2>/dev/null || true"
else
  say "✅ No nested docs/ found (good)."
fi

# 2) Ensure docs/doctrine/README.md exists (landing page)
DOCTRINE_DIR="$DOCS_DIR/doctrine"
DOCTRINE_MD="$DOCTRINE_DIR/README.md"
if [[ ! -f "$DOCTRINE_MD" ]]; then
  say "🪪 Adding doctrine landing page at docs/doctrine/README.md"
  doit "mkdir -p \"$DOCTRINE_DIR\""
  doit "cat > \"$DOCTRINE_MD\" <<'EOF'
# 🌌 The Celestial Equilibrium
*A Starborne Compass for Human Resonance*

This is a local landing page. For the canonical, versioned doctrine, see:
- **DOCTRINE.md (v1.0.0)**  
  https://github.com/Nightmarejam/celestial-equilibrium/blob/v1.0.0/DOCTRINE.md
- **The_Celestial_Equilibrium.pdf (v1.0.0)**  
  https://github.com/Nightmarejam/celestial-equilibrium/blob/v1.0.0/The_Celestial_Equilibrium.pdf
EOF"
  if [[ $DRY_RUN -eq 0 ]]; then git add "$DOCTRINE_MD"; fi
else
  say "✅ Doctrine landing page already exists."
fi

# 3) Fix README links
README="$ROOT/README.md"
if [[ -f "$README" ]]; then
  say "✏️  Normalizing links in README.md"
  TMP="$README.__tmp__"

  # portable in-place sed (BSD/GNU)
  sed 's#(docs/docs/#(docs/#g' "$README" > "$TMP"
  mv_cmd="mv \"$TMP\" \"$README\""
  doit "$mv_cmd"

  # Replace doctrine submodule deep-links with canonical tag URLs
  # (Two common patterns: DOCTRINE.md and The_Celestial_Equilibrium.pdf)
  fix1='s#(docs/celestial-equilibrium/DOCTRINE\.md)#(https://github.com/Nightmarejam/celestial-equilibrium/blob/v1.0.0/DOCTRINE.md)#g'
  fix2='s#(docs/celestial-equilibrium/The_Celestial_Equilibrium\.pdf)#(https://github.com/Nightmarejam/celestial-equilibrium/blob/v1.0.0/The_Celestial_Equilibrium.pdf)#g'
  TMP2="$README.__tmp2__"
  sed -e "$fix1" -e "$fix2" "$README" > "$TMP2"
  doit "mv \"$TMP2\" \"$README\""

  # Optional badge if missing
  if ! grep -q 'Celestial%20Equilibrium-v1.0.0' "$README"; then
    say "🏷️  Inserting doctrine badge near top"
    BADGE='[![Doctrine](https://img.shields.io/badge/Celestial%20Equilibrium-v1.0.0-blueviolet)](docs/doctrine/README.md)'
    TMP3="$README.__tmp3__"
    # Insert after first heading or at top
    awk -v badge="$BADGE" '
      NR==1{
        print $0
        print ""
        print badge
        print ""
        next
      }1
    ' "$README" > "$TMP3"
    doit "mv \"$TMP3\" \"$README\""
  else
    say "✅ Badge already present."
  fi

  if [[ $DRY_RUN -eq 0 ]]; then git add "$README"; fi
else
  say "ℹ️ README.md not found — skipping link fixes."
fi

# 4) Remove any now-empty directories under docs/
say "🧹 Removing empty directories under docs/"
while IFS= read -r -d '' d; do
  doit "rmdir \"$d\" 2>/dev/null || true"
done < <(find "$DOCS_DIR" -depth -type d -empty -print0)

# 5) Show what would be committed
if [[ $DRY_RUN -eq 1 ]]; then
  say "👀 Dry-run complete. To apply, run:  scripts/cleanup_docs.sh --write"
else
  # Create a single commit
  if ! git diff --cached --quiet; then
    say "🧾 Creating cleanup commit…"
    doit "git commit -m \"chore(cleanup): normalize docs tree, fix doctrine links and landing page\""
  else
    say "✅ No staged changes to commit."
  fi
fi

say "✨ Done."
