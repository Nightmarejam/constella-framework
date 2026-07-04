# ALife Experiment: Frequency Cascade Lineage

**Status:** Concept — not yet implemented  
**Origin:** Audio engineering analogy — serial compression + multiband + sidechaining  
**Date:** 2026-04-01  
**Author:** Jonathan Morales

---

## Core Hypothesis

A lineage of agents exposed to the same subtle environmental frequency pressure,
where each generation's output shapes the next generation's input conditions,
will develop emergent character that no single generation could produce alone.

The character is not in any agent. It is in the interaction between agents
across the chain — the same way serial compression produces coherence that
no single compressor stage could achieve.

---

## Audio Analogy

**Serial compression:** Multiple compressors in series, each doing light work.
No single stage introduces artifacts. Cumulative gain reduction is substantial.
Each stage's release/attack characteristics interact with the previous stage's
output. The signal develops pumping coherence that sounds organic.

**Multiband:** Each frequency band compressed independently but simultaneously.
Low end and high end shaped in parallel, not competing. Result: resonant clarity.

**Sidechaining:** A trigger signal (sidechain input) controls compression of
a different signal. The gate condition and the affected signal are decoupled.
Analogy: an allow-list that determines when a population responds to pressure.

---

## ALife Design

### Population Structure

Three parallel populations (bands), each optimizing a different fitness dimension:

- **Band A — Low:** Long-term survival / resource efficiency
- **Band B — Mid:** Social / cooperative behavior  
- **Band C — High:** Exploration / novelty generation

### Serial Pressure Chain

Each generation's fitness output becomes a weighted input to the next
generation's environmental conditions. Light pressure only — no single
generation should show dramatic change.

### Sidechain Gates

Band C (exploration) output sidechains into Band A's selection pressure.
When Band C discovers high-novelty states, Band A's survival pressure
temporarily relaxes — allowing low-frequency behaviors to drift and explore.

Band A's stability output sidechains into Band B — cooperative behavior
only gets selected for when the population is stable enough to support it.

### Measurement

Track a "lineage coherence" metric across generations:

- Do agents in generation N "sound like" agents in generation 1?
- At what generation does recognizable character first emerge?
- Does the character persist under perturbation?

---

## Connection to Existing Stack

- `alife_lineage` collection on Gen8 ChromaDB: 50,450 documents
- ALife governance seeding pipeline already live
- PULSE reflection loop could track lineage coherence as a pattern

---

## Next Steps

- [ ] Define fitness functions for each band
- [ ] Implement sidechain gate logic between populations
- [ ] Choose agent substrate (simple neural nets, rule-based, or cellular automata)
- [ ] Define "lineage coherence" metric formally
- [ ] Run pilot with 10 generations, 3 bands, 50 agents each
- [ ] Visualize frequency response of lineage over time

---

## Open Questions

- What is the minimum chain length before emergent character appears?
- Can the sidechain gates be learned rather than designed?
- Is there an equivalent to "overcompression" — too much cascade pressure
  collapsing diversity rather than building character?
