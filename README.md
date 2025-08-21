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
