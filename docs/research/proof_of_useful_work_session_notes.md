# Proof of Useful Work / ASIC incentives — session notes (2026-05-22)
Tier: asserted — conversation-extracted concepts, not committed design.
Source: "Proof of useful work and ASIC incentives" thread (182 msgs), extracted 2026-07-02
by the conversation pipeline. Related: [rfcs/001-proof-of-life-consensus.md](../../rfcs/001-proof-of-life-consensus.md).

## Concepts that emerged
- **Energy-already-spent token framing**: the token doesn't claim reserves ("oil in the
  ground worth X") — it represents energy *already expended* in useful work. Distinct
  from commodity-backed coins; the receipt is the work itself.
- **Joule as the UCF denomination unit** — with a paper-token layer for
  zero-technology-interaction access (an explicit requirement: participation must not
  demand a device; EMP-resilient methods were part of the same concern).
- **Clearance-tied hashrate**: hashrate/participation credentials could follow a
  personalized AI OS ("digital citizen representation"), analogous to government
  clearance levels. The reference/master node (FAITHH) anchors identity for on-chain
  voting participation.
- **UCF as fiat→civic-floor integration**: building on the ALife experiments, UCF is
  the bridge from fiat/government services toward a standard-of-living civic floor.
  Data reality-check acknowledged in-thread: government data is transactional (what
  people do within systems), and a per-person pipeline varies across hundreds of
  millions of individuals — the honest blocker.
- **TempleOS parallel** (self-observed): building the temple first and waiting for it
  to be inhabited — FAITHH work displaced Constella work for months; the OS-from-a-
  constitution idea reconnects them.

## Operational spillover from the same session
GPU telemetry (nvidia-smi → CSV cron) was built on the faithh VM and framed as a
**Proof-of-Life input**: the reference node's physical health as part of its liveness
signal. Implementation notes live in the SensorBridge repo (health-telemetry pivot).
