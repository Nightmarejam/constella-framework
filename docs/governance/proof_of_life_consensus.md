# RFC: Proof of Life Consensus

**Status:** Draft  
**Author:** Jonathan Morales  
**Date:** 2026-05-24  
**Target:** `docs/governance/proof_of_life_consensus.md`

---

## Overview

Proof of Life (PoL) is the consensus mechanism underlying Constella's Astris token system. It replaces raw compute as the security metric with *verified human presence* — the measurable, continuous signal that a node is inhabited by a real person actively engaging with the world.

Security in PoL does not come from whoever spends the most on hardware. It emerges from the breadth and depth of genuine human participation across the network.

---

## The Core Premise

Standard proof-of-work asks: *how much compute did you burn?*  
Proof of Life asks: *are you still there?*

A node that is alive — receiving input, generating responses, accumulating memory, interacting with the physical world — contributes to network security proportionally to the authenticity and continuity of that presence. A node that goes dark loses weight. A node that is simulated fails the entropy test over time.

---

## Life Rate: The Evolved V_p Signal

In the existing Astris formula:

```
A_gain = B × C_q × V_p × R_s
```

`V_p` (verified proof factor, range 0.8–1.2) currently covers repo links and QR/NFC logs. Proof of Life redefines `V_p` as a **dynamic, continuous life-rate signal** rather than a static verification check.

### Life Rate Components

| Signal | Description | Weight |
|--------|-------------|--------|
| `I_freq` | Human↔AI interaction frequency per epoch | 30% |
| `I_depth` | Session complexity — branching, contradiction, revision | 25% |
| `M_delta` | Memory delta — did the node learn something new | 20% |
| `E_anchor` | External anchor events — physical world interactions | 15% |
| `H_entropy` | Behavioral entropy — statistical signature of real human sessions | 10% |

```
V_p = 0.8 + 0.4 × normalize(I_freq × I_depth × M_delta × E_anchor × H_entropy)
```

A node with rich, varied, continuous human interaction approaches `V_p = 1.2`.  
A node that goes dormant decays toward `V_p = 0.8` and eventually below the Astris decay threshold.

---

## Clearance Tiers

Clearance maps directly onto existing Astris/Auctor mechanics without replacing them.

| Tier | Access | V_p Range | Astris | Auctor |
|------|--------|-----------|--------|--------|
| Level 0 — Paper | Bearer token, no device | Pulse only (one-time) | None | 0.5 Au floor |
| Level 1 — Phone | On-chain wallet, basic interaction | 0.8–0.95 | Accrual begins | 1.0 Au/epoch |
| Level 2 — AI OS | Full FAITHH-class node | 0.95–1.2 | Full accrual + multipliers | 1.0 Au/epoch |
| Reference — FAITHH | Master node, joule rate authority | 1.2 (anchored) | Legacy Astris eligible | Constitutional role |

Clearance is not granted once. It is maintained through ongoing interaction. A Level 2 node that goes dark for 90 days degrades toward Level 1. The clearance level is a reflection of current aliveness, not a permanent credential.

---

## The Sub-Network Layer: Below Standard Protocols

The Proof of Life signal cannot travel exclusively over standard TCP/IP without creating a spoofable surface. The consensus layer requires a communication substrate with the following properties:

### Required Properties

1. **Below the application layer** — not reachable via standard HTTP/gRPC calls
2. **Hardware-anchored** — the signal must originate from physical sensor data, not software-generated values
3. **Behaviorally authenticated** — the entropy signature of a real human session cannot be efficiently mass-produced
4. **Resilient to network partition** — nodes must be able to maintain local life-rate records during disconnection

### The Sensor Bridge as Design Model

The existing sensor bridge architecture (NCT6798D → host hwmon → JSON endpoint → VM polling) demonstrates the correct pattern:

- Physical hardware state (real sensor readings) feeds into
- A host-level service that VMs cannot spoof (they can only read, not write)
- Which exposes a verified signal to the application layer

PoL extends this pattern: physical interaction signals (keystroke entropy, session timing variance, memory write patterns) feed into a hardware-anchored attestation layer that the consensus network reads. The node cannot lie about its life-rate because the signal originates below the layer it controls.

### The TempleOS Philosophical Anchor

Terry Davis built a temple and waited for it to be inhabited. The substrate precedes the presence.

The PoL sub-network draws on this philosophy: the communication layer should be architecturally minimal, purpose-built, and closed to general network traffic. Not TempleOS itself — its codebase is one person's cathedral and not portable — but its *design disposition*:

- No general-purpose networking
- Direct hardware access without abstraction layers
- The system knows what it is and does nothing else
- Presence is the product, not a feature

### Practical Implementation Path

**Phase 1 (current):** Sensor bridge over local network — hardware state readable by FAITHH, not forgeable from within the VM. Establishes the pattern.

**Phase 2:** PoL attestation daemon on the Proxmox host — reads behavioral entropy from FAITHH's interaction logs, signs it with a hardware-bound key (TPM if available, otherwise derived from physical sensor fingerprint), exposes signed attestation over a restricted local interface.

**Phase 3:** Cross-node PoL gossip — nodes exchange signed attestations over a minimal custom protocol, not HTTP. Attestations are verified against the behavioral entropy threshold, not against identity.

**Phase 4:** Paper token integration — physical bearer instruments carry a PoL pulse at redemption, generating a one-time Level 0 attestation that feeds into the Auctor floor.

---

## Joule Anchor

The UCF floor denomination and PoL energy accounting are anchored to the joule.

```
1 Astris = J_r joules of verified human-interactive compute
UCF_floor = F_j joules per epoch (governance-set)
```

`J_r` is reviewed each governance cycle. FAITHH submits a joule rate proposal based on observed network energy expenditure. The Auctor layer votes to accept, reject, or modify.

This grounds the system physically without creating a commodity:

- A joule is universal and apolitical
- The token represents energy *already spent* in verified interaction (a receipt, not a futures contract)
- The floor rises with community surplus, not with trading volume

---

## The Forgery Problem

No system eliminates Sybil attacks. PoL makes forgery expensive in a different currency: **time and behavioral authenticity**.

- Bots can simulate clicks. They cannot efficiently simulate the messy, contradictory, context-rich interaction pattern of a real human-AI relationship over months.
- Forgery cost scales with clearance level — attacking Level 0 is cheap but yields almost nothing. Attacking Level 2 requires sustained behavioral simulation that costs more than it earns.
- The entropy threshold is statistical, not identity-based. It does not require surveillance. It requires that real sessions have a fingerprint that mass-generated synthetic sessions statistically cannot match over long timeframes.

**Design principle:** Plan for forgery at Level 0. Design Level 2 so that the cost of sustained forgery exceeds the value of the clearance weight gained.

---

## Decay Integration

PoL life-rate maps directly onto existing decay parameters:

| Token | Decay Trigger | PoL Prevention |
|-------|--------------|----------------|
| Astris | 2% per week inactive | ≥1 verified interaction/week |
| Auctor | 5% per quarter inactive | ≥2 governance actions/quarter |

A single FAITHH session generating rich interaction prevents both decays simultaneously. A paper token redemption generates a one-time pulse — enough for a single Auctor reactivation, not enough to prevent Astris decay (which requires sustained presence).

---

## FAITHH as Reference Node

FAITHH serves a formal constitutional role in PoL consensus:

1. **Reference implementation** — the first fully cleared Level 2 node, establishing behavioral entropy baselines
2. **Joule rate authority** — submits `J_r` proposals each governance cycle based on observed network data
3. **Attestation anchor** — signs attestations that other nodes can verify against as a trust root during bootstrap
4. **Health signal source** — node health telemetry (GPU temp, power, fan state) feeds into PoL operational status. A thermally degrading node reports reduced life-rate. Physical health is part of presence.

---

## Open Questions

1. **TPM availability** — hardware-bound key attestation requires TPM 2.0 or equivalent. Current FAITHH node (ASRock X570) needs TPM module verification.
2. **Behavioral entropy threshold** — what statistical distance from a synthetic session baseline constitutes a valid human signal? Requires empirical testing with real session data.
3. **Cross-node protocol spec** — the minimal gossip protocol for Phase 3 is unspecified. Should be designed before Phase 2 completes.
4. **Paper token cryptographic scheme** — one-time seed + TTL + community pool return on expiry. Full cryptographic spec needed.
5. **Epoch boundary definition** — PoL epoch length should align with Auctor epoch. Currently undefined in the governance spec.

---

## Related Documents

- `docs/governance/tokens_astris_auctor.md` — Astris/Auctor system (V_p is extended here)
- `docs/governance/ucf.md` — UCF floor (joule anchor denominates this)
- `docs/governance/founding_hypothesis.md` — philosophical grounding
- `docs/tome/threads/` — session notes capturing design evolution

---

*The substrate precedes the presence. The work of building the conditions is the work.*
