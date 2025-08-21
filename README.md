# Constella Framework

![Docs CI](https://github.com/Nightmarejam/constella-framework/actions/workflows/docs-ci.yml/badge.svg)

Constella is a civic governance framework oriented around resonance, dignity, and renewal. This README gives you the essentials and points to the full docs.

## Quick start

- **Core Framework:** `docs/governance/core_framework.md`
- **Map of Intent:** `docs/governance/map_of_intent.md`
- **Tokens (Astris/Auctor):** `docs/governance/tokens_astris_auctor.md`
- **UCF:** `docs/governance/ucf.md`
- **Civic Tome (spec):** `docs/governance/civic_tome.md`
- **Penumbra Accord:** `docs/governance/penumbra_accord.md`
- **Governance index:** `docs/governance/`
- **Tome index:** `docs/tome/index.md`

## Development

- **Contributing guide:** `CONTRIBUTING.md`
- **Templates:** `templates/`
- **Pilots:** `docs/pilots/`

---

© Constella — v1.6.0

---

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

---

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam
---

.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi
---

# !/usr/bin/env bash
set -euo pipefail

printf "\n=== Repo hygiene sweep ===\n"

printf "\n1) Placeholder link targets (files containing only '@'):\n"
grep -Rxl "^@$" docs || echo "(none)"

printf "\n2) README placeholder links ('](@)'):\n"
grep -R "\]\(@\)" -n || echo "(none)"

printf "\n3) Empty directories:\n"
find . -type d -empty -not -path "*/.git*" || true

printf "\n4) Markdown heading sanity (files missing H1):\n"
awk 'FNR==1 {if ($0 !~ /^# /) print FILENAME}' $(git ls-files "**/*.md") || true

printf "\n5) Codespell quick scan:\n"
if which codespell >/dev/null; then
  codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" . || true
else
  echo "(codespell not installed)"
fi

printf "\n6) Markdownlint quick scan:\n"
if which markdownlint >/dev/null; then
  markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true
else
  echo "(markdownlint-cli not installed)"
fi

printf "\n7) Lychee link check (may take a moment):\n"
if which lychee >/dev/null; then
  lychee --config .github/lychee/lychee.toml . || true
else
  echo "(lychee not installed; try Docker: docker run --rm -v \"$PWD\":/input lycheeverse/lychee --config .github/lychee/lychee.toml .)"
fi

printf "\n=== Sweep complete ===\n"
---

# macOS

.DS_Store

# Node / build artifacts

node_modules/
dist/

# Editor

.vscode/
*.code-workspace

# Python
**pycache**/
*.pyc

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam
.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi
# !/usr/bin/env bash
set -euo pipefail

printf "\n=== Repo hygiene sweep ===\n"

printf "\n1) Placeholder link targets (files containing only '@'):\n"
grep -Rxl "^@$" docs || echo "(none)"

printf "\n2) README placeholder links ('](@)'):\n"
grep -R "\]\(@\)" -n || echo "(none)"

printf "\n3) Empty directories:\n"
find . -type d -empty -not -path "*/.git*" || true

printf "\n4) Markdown heading sanity (files missing H1):\n"
awk 'FNR==1 {if ($0 !~ /^# /) print FILENAME}' $(git ls-files "**/*.md") || true

printf "\n5) Codespell quick scan:\n"
if which codespell >/dev/null; then
  codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" . || true
else
  echo "(codespell not installed)"
fi

printf "\n6) Markdownlint quick scan:\n"
if which markdownlint >/dev/null; then
  markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true
else
  echo "(markdownlint-cli not installed)"
fi

printf "\n7) Lychee link check (may take a moment):\n"
if which lychee >/dev/null; then
  lychee --config .github/lychee/lychee.toml . || true
else
  echo "(lychee not installed; try Docker: docker run --rm -v \"$PWD\":/input lycheeverse/lychee --config .github/lychee/lychee.toml .)"
fi

printf "\n=== Sweep complete ===\n"

# .gitignore appended content

# macOS

.DS_Store

# Node / build artifacts

node_modules/
dist/

# Editor

.vscode/
*.code-workspace

# Python
**pycache**/
*.pyc

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam
.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi
# !/usr/bin/env bash
set -euo pipefail

printf "\n=== Repo hygiene sweep ===\n"

printf "\n1) Placeholder link targets (files containing only '@'):\n"
grep -Rxl "^@$" docs || echo "(none)"

printf "\n2) README placeholder links ('](@)'):\n"
grep -R "\]\(@\)" -n || echo "(none)"

printf "\n3) Empty directories:\n"
find . -type d -empty -not -path "*/.git*" || true

printf "\n4) Markdown heading sanity (files missing H1):\n"
awk 'FNR==1 {if ($0 !~ /^# /) print FILENAME}' $(git ls-files "**/*.md") || true

printf "\n5) Codespell quick scan:\n"
if which codespell >/dev/null; then
  codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" . || true
else
  echo "(codespell not installed)"
fi

printf "\n6) Markdownlint quick scan:\n"
if which markdownlint >/dev/null; then
  markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true
else
  echo "(markdownlint-cli not installed)"
fi

printf "\n7) Lychee link check (may take a moment):\n"
if which lychee >/dev/null; then
  lychee --config .github/lychee/lychee.toml . || true
else
  echo "(lychee not installed; try Docker: docker run --rm -v \"$PWD\":/input lycheeverse/lychee --config .github/lychee/lychee.toml .)"
fi

printf "\n=== Sweep complete ===\n"

# .gitignore appended content

# macOS

.DS_Store

# Node / build artifacts

node_modules/
dist/

# Editor

.vscode/
*.code-workspace

# Python
**pycache**/
*.pyc
---

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam
.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi
# !/usr/bin/env bash
set -euo pipefail

printf "\n=== Repo hygiene sweep ===\n"

printf "\n1) Placeholder link targets (files containing only '@'):\n"
grep -Rxl "^@$" docs || echo "(none)"

printf "\n2) README placeholder links ('](@)'):\n"
grep -R "\]\(@\)" -n || echo "(none)"

printf "\n3) Empty directories:\n"
find . -type d -empty -not -path "*/.git*" || true

printf "\n4) Markdown heading sanity (files missing H1):\n"
awk 'FNR==1 {if ($0 !~ /^# /) print FILENAME}' $(git ls-files "**/*.md") || true

printf "\n5) Codespell quick scan:\n"
if which codespell >/dev/null; then
  codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" . || true
else
  echo "(codespell not installed)"
fi

printf "\n6) Markdownlint quick scan:\n"
if which markdownlint >/dev/null; then
  markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true
else
  echo "(markdownlint-cli not installed)"
fi

printf "\n7) Lychee link check (may take a moment):\n"
if which lychee >/dev/null; then
  lychee --config .github/lychee/lychee.toml . || true
else
  echo "(lychee not installed; try Docker: docker run --rm -v \"$PWD\":/input lycheeverse/lychee --config .github/lychee/lychee.toml .)"
fi

printf "\n=== Sweep complete ===\n"
---

# macOS

.DS_Store

# Node / build artifacts

node_modules/
dist/

# Editor

.vscode/
*.code-workspace

# Python
**pycache**/
*.pyc
---

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam
.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi
# !/usr/bin/env bash
set -euo pipefail

printf "\n=== Repo hygiene sweep ===\n"

printf "\n1) Placeholder link targets (files containing only '@'):\n"
grep -Rxl "^@$" docs || echo "(none)"

printf "\n2) README placeholder links ('](@)'):\n"
grep -R "\]\(@\)" -n || echo "(none)"

printf "\n3) Empty directories:\n"
find . -type d -empty -not -path "*/.git*" || true

printf "\n4) Markdown heading sanity (files missing H1):\n"
awk 'FNR==1 {if ($0 !~ /^# /) print FILENAME}' $(git ls-files "**/*.md") || true

printf "\n5) Codespell quick scan:\n"
if which codespell >/dev/null; then
  codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" . || true
else
  echo "(codespell not installed)"
fi

printf "\n6) Markdownlint quick scan:\n"
if which markdownlint >/dev/null; then
  markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true
else
  echo "(markdownlint-cli not installed)"
fi

printf "\n7) Lychee link check (may take a moment):\n"
if which lychee >/dev/null; then
  lychee --config .github/lychee/lychee.toml . || true
else
  echo "(lychee not installed; try Docker: docker run --rm -v \"$PWD\":/input lycheeverse/lychee --config .github/lychee/lychee.toml .)"
fi

printf "\n=== Sweep complete ===\n"
---

# macOS

.DS_Store

# Node / build artifacts

node_modules/
dist/

# Editor

.vscode/
*.code-workspace

# Python
**pycache**/
*.pyc

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam
.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi
# !/usr/bin/env bash
set -euo pipefail

printf "\n=== Repo hygiene sweep ===\n"

printf "\n1) Placeholder link targets (files containing only '@'):\n"
grep -Rxl "^@$" docs || echo "(none)"

printf "\n2) README placeholder links ('](@)'):\n"
grep -R "\]\(@\)" -n || echo "(none)"

printf "\n3) Empty directories:\n"
find . -type d -empty -not -path "*/.git*" || true

printf "\n4) Markdown heading sanity (files missing H1):\n"
awk 'FNR==1 {if ($0 !~ /^# /) print FILENAME}' $(git ls-files "**/*.md") || true

printf "\n5) Codespell quick scan:\n"
if which codespell >/dev/null; then
  codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" . || true
else
  echo "(codespell not installed)"
fi

printf "\n6) Markdownlint quick scan:\n"
if which markdownlint >/dev/null; then
  markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true
else
  echo "(markdownlint-cli not installed)"
fi

printf "\n7) Lychee link check (may take a moment):\n"
if which lychee >/dev/null; then
  lychee --config .github/lychee/lychee.toml . || true
else
  echo "(lychee not installed; try Docker: docker run --rm -v \"$PWD\":/input lycheeverse/lychee --config .github/lychee/lychee.toml .)"
fi

printf "\n=== Sweep complete ===\n"

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam
.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi

# File: CONTRIBUTING.md

# --------------------------------

# (new file contents below)

# --------------------------------

# Contributing to Constella

Thanks for improving the framework. This guide keeps PRs smooth and CI green.

## Branches & PRs

- Branch naming: `type/short-topic` (e.g., `docs/tome-index`, `pilot/gaia-p1`).
- One focused change per PR. Link to related issues/entries.
- Use the PR template and fill **Intent**, **Measures**, **Review Cadence**.

## Local checks (match CI)

Run all docs checks locally before pushing:

```bash
# spell check
codespell --ignore-words .codespellignore .

# markdown lint
markdownlint "**/*.md" -c .markdownlint.json

# link check (requires lychee: `brew install lychee` or use Docker)
lychee --config .github/lychee/lychee.toml .
# or via Docker
# docker run --rm -v "$PWD":/input lycheeverse/lychee --config .github/lychee/lychee.toml .
```

## Adding to the Civic Tome

1. Pick a template from `docs/tome/templates/`.
2. Create a dated file in the correct folder, e.g. `docs/tome/threads/YYYY-MM-DD_<slug>.md`.
3. Update `docs/tome/index.md` (add link under **Latest**).
4. Submit a PR labeled `docs` + `tome`.

## Style

- Markdown: use sentence case for headings; wrap naturally; lists separated by blank lines.
- Links: prefer repository‑relative paths (e.g., `docs/governance/ucf.md`).
- Privacy: redact personal data in Tome entries; keep summaries minimal.

## Release flow

- PRs merged to `main` update the Draft Release (Release Drafter).
- Tagging a release publishes notes. Version bump: update `README` and cut tag.

# File: CODEOWNERS

# --------------------------------

# (new file contents below)

# --------------------------------

# Codeowners for docs and governance

# Format: <pattern>  <github-username>

-                                   @Nightmarejam

# Strong ownership of governance and Tome

/docs/governance/**@Nightmarejam
/docs/tome/**                        @Nightmarejam
/templates/**                        @Nightmarejam

# File: Makefile

# --------------------------------

# (new file contents below)

# --------------------------------

.PHONY: check spell lint links

check: spell lint links
 @echo "\nAll checks passed."

spell:
 @which codespell >/dev/null || (echo "Install codespell (pipx/pip)" && exit 1)
 codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" .

lint:
 @which markdownlint >/dev/null || (echo "Install markdownlint-cli (npm i -g markdownlint-cli)" && exit 1)
 markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true

links:
 @if which lychee >/dev/null; then \
   lychee --config .github/lychee/lychee.toml . ; \
 else \
   echo "Lychee not found; attempting Docker..."; \
   docker run --rm -v "$(PWD)":/input lycheeverse/lychee --config .github/lychee/lychee.toml . ; \
 fi

# File: tools/scan.sh

# --------------------------------

# (new file contents below)

# !/usr/bin/env bash
set -euo pipefail

printf "\n=== Repo hygiene sweep ===\n"

printf "\n1) Placeholder link targets (files containing only '@'):\n"
grep -Rxl "^@$" docs || echo "(none)"

printf "\n2) README placeholder links ('](@)'):\n"
grep -R "\]\(@\)" -n || echo "(none)"

printf "\n3) Empty directories:\n"
find . -type d -empty -not -path "*/.git*" || true

printf "\n4) Markdown heading sanity (files missing H1):\n"
awk 'FNR==1 {if ($0 !~ /^# /) print FILENAME}' $(git ls-files "**/*.md") || true

printf "\n5) Codespell quick scan:\n"
if which codespell >/dev/null; then
  codespell --ignore-words .codespellignore --skip "*.min.js,*.svg,*.png,*.jpg,*.jpeg,*.gif,.git,dist,node_modules" . || true
else
  echo "(codespell not installed)"
fi

printf "\n6) Markdownlint quick scan:\n"
if which markdownlint >/dev/null; then
  markdownlint "**/*.md" -c .markdownlint.json --ignore-path .markdownlintignore || true
else
  echo "(markdownlint-cli not installed)"
fi

printf "\n7) Lychee link check (may take a moment):\n"
if which lychee >/dev/null; then
  lychee --config .github/lychee/lychee.toml . || true
else
  echo "(lychee not installed; try Docker: docker run --rm -v \"$PWD\":/input lycheeverse/lychee --config .github/lychee/lychee.toml .)"
fi

printf "\n=== Sweep complete ===\n"

# File: .gitignore

# --------------------------------

# (new or appended content below)

# macOS

.DS_Store

# Node / build artifacts

node_modules/
dist/

# Editor

.vscode/
*.code-workspace

# Python
**pycache**/
*.pyc
