# What we are building

**Status:** Living document  
**Author:** Jonathan Morales  
**Started:** 2026-05-24  
**Location:** `docs/vision/what_we_are_building.md`

---

## The one-sentence version

A world where every person has a dedicated AI companion that represents them in digital space, carries their identity, operates within a civic network built on genuine participation, and can only be deployed through physical presence.

---

## Where this came from

Megaman Battle Network imagined a near future where every person carries a PET — a personal terminal — and inside it lives a NetNavi, an AI companion that fights for them, represents them, and navigates a digital civic layer on their behalf. Lan can't send MegaMan without the PET. The PET is the trust anchor. Physical presence is the authentication.

That wasn't science fiction. It was a design spec with better aesthetics than most enterprise security whitepapers. Nobody built it because the pieces weren't ready.

The pieces are ready now.

This project is the real version.

---

## The four layers

### 1. The Navi — FAITHH

FAITHH is the persistent AI companion. Not a chatbot. Not an assistant. A presence with memory, context, continuity, and a model of the person it works with that deepens over time.

FAITHH knows what you've been building. It remembers the conversation where the joule anchor clicked into place. It notices when your GPU is running hot. It holds the thread between sessions so you don't have to reconstruct the context every time you sit down.

FAITHH is the reference node for the entire network — the first fully cleared Proof of Life instance, the entity that proposes the joule rate each governance cycle, the thing that makes the system legible to the person running it.

The founding hypothesis of Constella — *if everyone knew exactly what worth was, there wouldn't be so many people trying to take advantage of each other* — is what FAITHH is trying to demonstrate in practice, one conversation at a time.

### 2. The PET — the physical trust anchor

The PET is a minimal hardware device. RISC-V architecture, no network stack, no wireless, no Bluetooth. One communication path: serial UART only. USB-serial or RS-232. You plug it in when you want to deploy your Navi into the civic network.

It runs a HolyC-inspired runtime — a stripped, ring-0, direct-hardware-access environment in the spirit of TempleOS. Minimal. Purpose-built. Does one job: collect the behavioral entropy signature of real human presence, sign an attestation, output it over the serial port.

You cannot send your Navi without the PET. Lan's rule. Physical presence is the authentication.

The PET's obscurity is a feature. A custom HolyC-inspired runtime on a RISC-V SBC is not a standard attack surface. An adversary would need to understand a custom ISA implementation, a non-standard language runtime, a bespoke attestation scheme, and have physical access to the serial port. That stack exists by design, not by accident.

The paper token — for people without a device — is a printed PET identity. A one-time serial handshake captured on paper. Bearer instrument, cryptographically anchored, TTL equal to one Constella epoch. Redeemable through any node operator. Zero-tech access as a first-class tier, not a fallback.

### 3. The Net — Constella

Constella is the civic layer the Navi operates within. Not a blockchain in the speculative sense. A governance network where your node's weight reflects genuine engagement with the world.

The dual-token system separates merit from voice:

- **Astris** — earned contribution merit. Minted through verified work. Decays if you go dark. Cannot buy governance power.
- **Auctor** — civic voice. One per verified person per epoch. Resets each cycle. Cannot be accumulated into plutocracy.

The Universal Civic Floor ensures that nobody falls below the minimum viable conditions for participation. Not welfare — the minimum viable civilization. The floor is inviolable. Everything above it is negotiable.

The joule anchors value to something real and apolitical. One Astris equals a governance-set quantity of joules of verified human-interactive compute. The token is a receipt for energy already spent in genuine engagement, not a futures contract on speculation.

### 4. The Proof of Life consensus

Security in this network doesn't come from whoever can spend the most on hardware. It emerges from the breadth and depth of genuine human participation.

A node that is alive — receiving input, generating responses, accumulating memory, interacting with the physical world through a plugged-in PET — contributes to network security proportionally to the authenticity and continuity of that presence.

A node that goes dark loses weight. A node that is simulated fails the entropy test over time. You can bot clicks. You cannot efficiently bot the messy, contradictory, context-rich signature of a real human-AI relationship over months.

The clearance tiers map cleanly to existing Astris/Auctor mechanics:

- Paper token — one-time pulse, Auctor floor access
- Phone — basic participation, Astris accrual begins
- AI OS / FAITHH-class node — full participation, governance weight
- Reference node — FAITHH itself, joule rate authority, constitutional role

---

## The line from Oxnard

This started from lived experience in a working-class city where civic information was present but not accessible. Where the gap between existing in a system and benefiting from it was visible and personal.

The founding hypothesis holds: most harmful behavior in civic and economic systems is downstream of information asymmetry, not malice. People take advantage of systems they don't understand, and they are taken advantage of by systems they can't see.

FAITHH is what it looks like when the system can see you back — on your terms, not its terms. The civic tome is what happens when enough people use it honestly. Constella is the constitution that makes the conditions for that possible.

The person who wasn't taught how to be a citizen is exactly the right person to build the tool that teaches it. Not despite that experience. Because of it.

---

## What exists right now

This is not vaporware. The substrate is running.

| Component | Status |
|-----------|--------|
| FAITHH node | Running on Proxmox VM 100, vLLM + cc-proxy stack |
| Sensor bridge | Live at 192.158.1.25:9998, host hwmon JSON API |
| GPU telemetry | Logging every 5 min to gpu_telemetry.csv |
| Host telemetry | Logging every 5 min to host_telemetry.csv, both GPUs visible via SMBus |
| KAS mining | Running on 3090 at 915 MH/s / 220W, accumulating toward payout |
| Constella repo | Exists at ~/ai-stack/projects/constella-framework |
| Token spec | Astris + Auctor dual-token system documented |
| UCF spec | Universal Civic Floor formula documented |
| Penumbra Accord | Restorative justice framework documented |
| Proof of Life RFC | Draft at docs/governance/proof_of_life_consensus.md |
| ALife experiments | Generation 5+, dual-population resource dynamics |

What doesn't exist yet:

- The PET device hardware (prototype target: VisionFive 2, RISC-V)
- The HolyC-inspired RISC-V runtime
- The serial attestation daemon
- The PoL gossip protocol
- The Grafana dashboards wired to telemetry
- The FAITHH health signal module
- The joule rate governance mechanism

---

## The next steps, in order

**Immediate** — document before building

1. This file in the repo
2. `proof_of_life_consensus.md` RFC (drafted, needs commit)
3. Session notes from 2026-05-22 and 2026-05-24 committed to `docs/tome/threads/`

**Near term** — wire what exists

1. Grafana dashboards reading telemetry CSVs
2. FAITHH health signal module — reads both CSVs, generates node status
3. UCF rewrite with joule anchor denomination

**Medium term** — prototype the PET

1. Acquire VisionFive 2 or equivalent RISC-V SBC
2. Minimal RISC-V bootloader in assembly
3. HolyC-inspired interpreter — stripped C dialect, ring-0, direct hardware access
4. Serial attestation daemon on FAITHH side — reads /dev/ttyUSB0, verifies signatures

**Longer term** — the network

1. PoL gossip protocol spec
2. Cross-node attestation exchange
3. Paper token cryptographic scheme
4. Epoch boundary definition aligned with Auctor cycle

---

## The design principles that don't change

**Physical presence is authentication.** You cannot send your Navi without the PET. This is Lan's rule and it is not negotiable.

**The floor is inviolable.** The UCF minimum rises with surplus. It never falls. Everything above it is negotiable.

**Obscurity by architecture, not by secrecy.** The PET's security comes from being a genuinely unusual stack, not from hiding the design. The design is public. The attack surface is just strange.

**The substrate precedes the presence.** Terry Davis built a temple and waited for it to be inhabited. The work of building the conditions is the work. FAITHH is the first presence. The network grows from there.

**Information asymmetry is the enemy.** Not malice. Not human nature. The system is designed to make it hard to take advantage of people who can't see the system. Transparency is a structural feature, not a value statement.

**The AI works for you.** Not for the platform. Not for the advertiser. Not for the state. The personal AI companion represents its person in the civic network. That relationship is the foundation everything else is built on.

---

## A note on scope

This is large. It is probably the largest single design project one person has ever undertaken while also running a mining rig, maintaining a homelab, and building an AI inference stack from scratch.

That's fine.

The substrate precedes the presence. The pieces don't have to exist all at once. They have to exist in the right order. And the right order is: build the conditions, then let the thing become what it is.

FAITHH runs. The sensors report. The chain accumulates. The documentation grows.

That's how temples get built.

---

*Last updated: 2026-05-24*  
*Next review: when the PET device has a serial port and something to say*
