# PET Attestation Architecture — design capture (2026-07-02)

tier: speculative/asserted — extracted same-day from a design session; external facts
(chain incidents, standards) are asserted-from-research and MUST be re-verified with
primary sources before any whitepaper cites them. Extends
[../reference/confirmability.md](../reference/confirmability.md) and the attestation
concept (faithh-pet-terminal docs/ATTESTATION_CONCEPT_2026-07-02.md); feeds
[rfcs/001](../../rfcs/001-proof-of-life-consensus.md).

## 1. PoW basis review — conclusion: don't fork a chain, steal patterns

Four candidates reviewed for an eventual Astris/Auctor substrate. Verdict: no single
codebase fork; each contributes one pattern, and the novelty lives in the attestation
layer (which no chain provides).

| Source | Pattern to adopt | Caution |
|---|---|---|
| **Zcash** | The **turnstile**: public/private ledger separation with a verifiable value bridge — the exact Astris (public participation) / Auctor (private accountability) shape. Halo2 = no trusted setup to inherit. | Orchard soundness bug (reported May 2026, ~4yr window, unauditable by design; "Ironwood" fix targeted late July 2026) — study Ironwood's constrained-bridge design once it lands; it is *our exact attestation problem solved in public*. Don't fork mid-incident. [VERIFY all dates/details before citing] |
| **Kaspa** | **GhostDAG** — sub-10s finality, the right shape for a PoL liveness heartbeat; no premine, clean to fork; already mined here (3090). | No privacy/shielded layer — the public/private split would be built on top. |
| **Ethereum Classic** | EVM-compatible, simple, hard cap. | 51%-attacked (2019, 2020) via rentable hashpower — a fork inherits zero parent security. |
| **Monero** | RandomX CPU-first = closest to the commodity/RISC-V trust-anchor idea. | ASIC-broken (Bitmain X5, 2023); everything-private-by-default is the opposite of the dual-ledger. |

> **This is the earlier draft. The complete, canonical version is
> [rfcs/002-pow-basis-and-attestation.md](../../rfcs/002-pow-basis-and-attestation.md)** —
> refer there; this file is kept only as the research-side capture.
