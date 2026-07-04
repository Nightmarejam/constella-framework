# PET — Personal attestation device (design capture)

tier: speculative/design — captured 2026-07-02 from a deep-dive session. Nothing here
is built or verified; it's the concept + the honest gaps. Feeds [[attestation-concept]]
and rfcs/001. Records design decisions so they don't evaporate (the concept_lineage
lesson: chat design that never lands in the repo is design lost).

## What the PET is

A pocket device that attests identity — the personal-scale version of Proof-of-Life
(one human, not a coalition node). It houses a NetNavi (personal AI) but the identity
attestation must NOT depend on the AI running. Battle Network aesthetic; the "PET
housing" is a real hardware idea, not just flavor.

## The load-bearing correction (why the design is tiered)

Identity attestation and the NetNavi are **separate** — different hardware, resilience,
and cost. Bundling them is the mistake to avoid.

| Tier | What | Runs when | Cost/replace |
|---|---|---|---|
| **Tier 0 — attestation** | PUF-backed secure element, NFC direct-access (reader-powered, no battery needed), challenge-response only | ALWAYS — network-down, grid-down, AI absent | cheap, standardized, disposable; loss = replace chip + re-enroll, NOT loss of identity |
| **Tier 1 — NetNavi** | the AI: reasons, remembers, advocates; personality as an encrypted blob synced via FAITHH/Constella | when powered + available | expensive/irreplaceable → must NEVER live only on Tier 0 |

Tier 0 gates access to government/social services and MUST work with no network and no
AI — that's precisely the scenario (outage, emergency) where it's needed most. Model:
ISO 18013-5 mobile-DL NFC direct-access (secure element draws power from the reader).

## Hardware leg — solved technology

- **PUF (Physical Unclonable Function)**: chip-level manufacturing variation → an
  instance fingerprint that can't be cloned by rebuilding from the same blueprint. This
  is SensorBridge's "VMs can't spoof physical hardware" principle, formalized; already
  ships in Trezor-class secure elements.
- **Fuzzy extractor**: PUF output is noisy (temp/voltage/aging); error-correction +
  public helper data reconstructs the SAME stable key every time without storing it.
  This is what turns "unclonable but noisy" into "usable cryptographic secret."

## Human leg — the hard, unsolved part

Behavioral imprinting (voice, tone, cadence, movement, conversation) = continuous
behavioral biometric auth, same fuzzy-extractor math but MUCH worse noise (a cold, a
bad night, aging blow past the ~10-15% bit-error tolerance).

- **Behavior is a factor, never THE factor.** 2026 voice cloning defeats "sounds like
  Jon." The PUF (something you have) stays the load-bearing cryptographic gate;
  behavior (something you are) raises/lowers scrutiny. If behavior alone ever unlocks
  state, that's the spoofable version — don't build it.
- **Drift needs a design answer**: continuous re-enrollment / slowly-adapting window,
  NOT a frozen template (= FAITHH's adaptive-layer "online resonance tuning", pointed
  at identity). Graceful degradation to passphrase/device-factor, never hard lockout.

## Passive self-imprinting (Jonathan's idea, reframed)

The NetNavi passively models its owner, checks its own predictions on week/month
cadence, and treats tightening prediction-variance over time as a trust signal.
Legitimate — but keep it a **soft, accruing confidence score, not a key** (it's the
confirmability tiers again: asserted → confirmed as observations corroborate). Two
reasons it must stay soft: (1) cold-start is the attack window — a 3-day-old model has
no discriminating power; (2) a very-confident-but-wrong model locks you out during
illness/grief exactly when you need the device. It can raise scrutiny / request
re-enrollment; it can never be the sole lock.

## TempleOS-on-Proxmox phase — what it can and can't do

- CAN'T run the passive-learning experiment: TempleOS has no network, no A/V capture,
  no multitasking, 640×480/16-color by design. That work lives on FAITHH's real stack.
- CAN be the entropy-primitive sandbox: Terry's oracle read **keypress timing jitter**
  into a FIFO entropy pool (human input timing variance — NOT ambient/thermal noise).
  The right primitive category is a **timing-jitter TRNG**, and TempleOS/HolyC is a
  clean isolated env to get "physical timing → entropy → derived value" right before
  wiring it near real identity.

## Networking: active + passive layers

- **NFC** = initial secure pairing only (4cm inductive, point-to-point — short range is
  a security property). Cannot do group reads.
- **BLE mesh / Wi-Fi Direct** = ongoing group session once devices are mutually attested.
- **Passive layer is a ROLLUP, not a chain.** A room of PETs gossiping over BLE forms a
  temporary **permissioned quorum** — permissioned because every participant already
  carries Tier 0 attestation, so it's Byzantine agreement among known/attested devices,
  NOT open Sybil-resistant PoW among strangers. No hashrate, no energy budget — just
  signatures + a merge function. Settles up to Astris when back online (Lightning/rollup
  analogy). Avoid the word "chain" — it pulls toward mining, the wrong tool.
- **CRDTs, not vote-consensus**: devices are disconnected most of the time and meet
  opportunistically; CRDTs give order-independent deterministic merge, which is what
  makes "sometimes-connected, meets-random-nodes" tractable.
- **Co-location is itself strong PoL evidence, nearly free**: being BLE-gossip-connected
  to N attested devices in one room is far harder to fake remotely than a voice clone —
  it requires real physical presence. Constella coalition meetings become self-attesting.

## Honest gaps (state before building, not after)

- **Conflicting quorums**: two honest physically-real quorums touching overlapping state
  before either syncs = a CAP-theorem partition. CRDTs guarantee deterministic merge,
  not the outcome a human wants. "What's right when two real quorums disagree" is a
  **Constella governance decision**, not a crypto one.
- **Sybil at enrollment**: still rests on the hardware attester enrolling
  one-device-per-human — the trust assumption to state plainly.
- **Recovery/backup ceremony** for a lost Tier 0 (seed-phrase-style, independent of the
  lost device) has NO good answer yet and most determines whether anyone but Jonathan
  can use this.

## EMP/solar note (corrects the "harden the housing" instinct)

A small unpowered device with no long conductors is inherently EMP-resistant (E1/E2
couple through long wires; E3 hits grid/transmission lines). What actually dies in a
solar/EMP event is the grid + network the NetNavi backend needs. So the load-bearing
hardening is **Tier 0 needing no grid/network to function** — a metal PET housing
(incidental Faraday cage) is free insurance, not the real decision.

## Open next steps

- Tier 0 challenge-response protocol end-to-end (enroll / tap / verify)
- Recovery ceremony for lost Tier 0 (the highest-leverage gap)
- Fuzzy-vault math for combining voice+motion channels into one derived key
- Decide: is the PET the same PoL protocol at a smaller tier, or a separate leaf that
  reports up to Astris? (shapes whether Astris/Actor must know about it)
