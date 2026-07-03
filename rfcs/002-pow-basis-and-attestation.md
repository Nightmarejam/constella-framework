# RFC 002 — PoW basis selection & the attestation layer
Status: DRAFT / speculative. Captured 2026-07-02. Companion to
[001](001-proof-of-life-consensus.md) and [[attestation-concept]]. This RFC records the
*consensus-basis evaluation* and the *hardware attestation* half; RFC 001 owns the
life-rate signal. See also docs/vision/pet_attestation_device.md (the personal-scale
device) — this RFC is the network/token side.

## The reframe: two decisions, not one
"What PoW do we fork?" bundles two independent choices:
1. **Privacy/architecture pattern** — how a chain separates public accounting from
   private state. *This* is what Astris/Auctor need.
2. **PoW consensus algorithm** — what secures block production.
Best answers differ; don't marry both to one codebase.

## Candidate evaluation (as of mid-2026)
| Chain | Strength for us | The catch |
|---|---|---|
| **Zcash (ZEC)** | Turnstile = public/private ledger with a verifiable bridge = the exact Astris/Auctor pattern; Halo2 removed trusted setup | Orchard soundness bug (2022–2026, ~4yr undetectable-counterfeit window) patched mid-2026; **"Ironwood" upgrade (~late July 2026) rebuilds independently-verifiable supply** — study it, it's solving our exact "prove a private chain didn't break its own invariants" problem live |
| **Ethereum Classic (ETC)** | EVM-compatible, simple, hard cap | 51%-attacked 2019 & 2020 via *rentable* hashpower — the cautionary tale: a fork inherits ZERO parent security regardless of algorithm |
| **Kaspa (KAS)** | blockDAG/GhostDAG → ~1s first confirm, ~10s finality = right shape for a PoL *liveness heartbeat*; no premine, clean to fork; **Jonathan already mines it (RTX 3090, operational familiarity)** | no privacy/shielded architecture — transparent UTXO; we'd build the public/private split ourselves |
| **Monero (XMR)** | RandomX CPU-first = closest to the commodity/RISC-V (VisionFive2) trust-anchor philosophy | Bitmain X5 RandomX ASIC (2023) broke "ASIC-resistant"; everything-private-by-default = opposite of the dual-ledger we want |

## Recommendation: compose, don't fork wholesale
| Need | Model to study (not necessarily fork) |
|---|---|
| Public/private ledger + verifiable bridge (Astris/Auctor) | Zcash turnstile → **watch Ironwood** |
| Fast liveness confirmation for a PoL heartbeat | Kaspa GhostDAG (sub-10s) |
| Commodity-hardware-as-trust-anchor | RandomX's *intent* (not the algo, given the ASIC) |
| What NOT to do | ETC's 51% history — real security comes from participation, not algorithm choice |

**The algorithm is a solved, secondary decision.** The hard problem is the attestation
layer (identity), which no PoW does — by design. Don't ask the consensus algorithm to
do identity work it was never built for.

## The attestation layer (the actual novelty)
Borrow proven mechanisms, put novelty only in composition:
- **Liveness ≈ work already spent** (joules — matches the UCF energy-anchor). Proven
  PoW; no new consensus math to defend.
- **Uniqueness/humanity = hardware attestation**, NOT the PoW: a Trezor-class secure
  element / PUF signs "genuine device + one human." (Full device design:
  docs/vision/pet_attestation_device.md.)
- **Three parties**: node (proves work) + hardware attester (unique human-held device) +
  Constella ledger (records attested liveness as a joule-denominated PoL credit). No
  single party can forge a live human.
- **Why achievable where PoL-from-scratch isn't**: every hard part (consensus, device
  attestation) delegated to a battle-tested standard; Constella defines only the
  composition and what a valid attestation buys (UCF access, voting weight).

### Physical co-location as bonus attestation (from the PET design)
A quorum of PET devices gossiping over BLE in one room is itself a strong liveness+
location proof — physical presence is far harder to fake remotely than a voice clone.
Coalition meetings become self-attesting nearly for free. See pet_attestation_device.md.

## Open questions (honest)
- Sybil resistance rests on the attester enrolling one-device-per-human — state plainly.
- Conflicting offline quorums touching shared state = CAP partition; "what's right when
  two honest quorums disagree" is a **governance** decision (Penumbra-adjacent), not crypto.
- Recovery ceremony for a lost attester device — no good answer yet.

## Astris/Auctor mapping (Jonathan's ZEC intuition)
The public/private separation (transparent Auctor accountability ledger vs. shielded
Astris participation) maps onto the turnstile pattern. Whether we fork ZEC's code or
rebuild the pattern on a faster base (Kaspa-style) is open — but the *pattern* is the
requirement, and Ironwood is the reference implementation to watch.
