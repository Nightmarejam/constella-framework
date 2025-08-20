![Docs CI](https://github.com/Nightmarejam/constella-framework/actions/workflows/docs-ci.yml/badge.svg?branch=compliance-overlay-and-preface)
# Constella Framework

[![Doctrine](https://img.shields.io/badge/Celestial%20Equilibrium-v1.0.0-blueviolet)](docs/doctrine/README.md)


**Constella** is a civic operating system — an open, merit-based framework for organizing, governing, and regenerating communities.  
It blends **practical governance**, **ethical doctrine**, and **pilot projects** into one adaptive ecosystem.

---

## 🌌 Overview

Constella is built around three pillars:

1. **Civic Orchestration** – Lightweight, rotating governance threads with clear decision cadences.  
2. **Civic Tome** – The public ledger of decisions, precedents, and pilot outcomes.  
3. **Penumbra Accord** – The compassionate edge-case ethics and risk playbook.  

The framework integrates a living doctrine to guide long-term vision, ensure ethical resilience, and seed regenerative civic economies.

---

## 📂 Directory Map

| Path | Purpose |
|------|---------|
| [`/docs/`](docs/) | Main documentation hub |
| [`/docs/doctrine/`](docs/doctrine/) | Doctrine & philosophy ([WIP]) |
| [`/docs/pilots/`](docs/pilots/) | Example pilot projects (Gaia, Sky, etc.) |
| [`/docs/governance/`](docs/governance/) | Governance, Civic Orchestration, and Civic Tome |
| [`/docs/assets/`](docs/assets/) | Images, diagrams, infographics |

---

## 🚀 Quick Start

| Area | Link |
|------|------|
| **Core Framework** | [View core framework](docs/governance/core_framework.md) |
| **Map of Intent (Civic Tome)** | [View Map of Intent](docs/governance/map_of_intent.md) |
| **Tokens: Astris & Auctor** | [View token docs](docs/governance/tokens_astris_auctor.md) |
| **Universal Civic Floor (UCF)** | [View UCF](docs/governance/ucf.md) |
| **U.S. Compliance Overlay** | [View overlay](docs/governance/compliance_overlay_us.md) |
| **Civic Orchestration** | [View governance docs](docs/governance/) |
| **Civic Tome** | [View Tome](docs/governance/civic_tome.md) |
| **Penumbra Accord** | [View Accord](docs/governance/penumbra_accord.md) |
| **Doctrine** | [View doctrine overview](docs/doctrine/) [WIP] |
| **Pilot Projects** | [Gaia Pilot](docs/pilots/gaia.md) [Sky Pilot – WIP](docs/pilots/sky.md) |

---

## 🛠 Contributing

We welcome contributions from civic innovators, governance researchers, designers, and builders.

**Steps:**
1. Fork this repo.
2. Create a branch for your changes.
3. Submit a Pull Request with a clear description.

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for details.

---

## 📅 Roadmap

- [ ] Finalize Doctrine section
- [ ] Add full Gaia/Sky pilot data stubs
- [ ] Create integrated visual diagrams for framework overview
- [ ] Implement measurable outcomes & economic modeling
- [ ] Launch first community pilot

---

## 📜 License

- **Code:** MIT (see [`LICENSE`](LICENSE))  
- **Docs/Diagrams:** CC BY 4.0 (see [`LICENSE-docs.txt`](LICENSE-docs.txt))  
- **Data/CSVs/Templates:** CC0 1.0 (see [`LICENSE-data.txt`](LICENSE-data.txt))  

“Constella” usage is covered under [`TRADEMARKS.md`](TRADEMARKS.md).

---

## Chat Export Processing (internal)
We keep chat exports private, but provide a local filter for organization (Constella, Harmony, Resonant, AI Infra, Ops/Docs, Personal).
- Script: `tools/chat-filter/filter_chats.py`
- Config: `tools/chat-filter/filters.config.json`
_Outputs are local until review; personal content is always excluded._

### Reproduce locally
```bash
python3 tools/chat-filter/filter_chats.py conversations.json tools/chat-filter/filters.config.json
```

