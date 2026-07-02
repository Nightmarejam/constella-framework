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

## Status (2026-07-02)
Core pass 5/6 complete: confirmability schema (docs/reference/confirmability.md),
concept lineage map (docs/reference/concept_lineage.md), UCF joule anchor,
Constella–Harmony Bridge (harmony/docs/constella_harmony_bridge_v1.0.0.md), doc-tree
labels. Remaining: RFC 001 advance (gated on live telemetry). See STATUS.md.

## The ecosystem (how this repo fits)

| Repo | Role |
|---|---|
| [constella-framework](https://github.com/Nightmarejam/constella-framework) | Civic governance framework — also the **logic basis** for everything here (confirmability tiers, concept lineage, Harmony bridge) |
| [faithh-pet-terminal](https://github.com/Nightmarejam/faithh-pet-terminal) | FAITHH — personal AI companion: Flask + ChromaDB RAG + vLLM on a Proxmox homelab |
| [SensorBridge](https://github.com/Nightmarejam/SensorBridge) | Host→VM hardware telemetry (gRPC/WMI); pivoted to node-health monitoring feeding FAITHH |
| [celestial-equilibrium](https://github.com/Nightmarejam/celestial-equilibrium) | Doctrine text (CC BY 4.0), consumed by constella as a submodule |
| [runbook-to-rule-them-all](https://github.com/Nightmarejam/runbook-to-rule-them-all) | Ops runbooks for the homelab systems |
| homelab / research-notes / tomcat-sound | Private: hardware+pipeline knowledge, theory notes, business records |

Work is human-directed and AI-assisted — see [PROVENANCE.md](PROVENANCE.md).
