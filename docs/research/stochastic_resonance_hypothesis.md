# Stochastic Resonance Hypothesis (2026-04-02)

**Status:** Observed in Band 2 experiments, not yet confirmed
**Source:** Band 2 generations 4-5, 10-run oracle randomness aggregate

## Observation

Population B (asymmetric information, noisy signal interpretation)
consistently outperformed Population A (symmetric, accurate signals)
across all quality metrics in the gen 5 10-run aggregate:

- Higher mutual benefit rate
- Lower false cooperation rate
- Higher trust network stability
- Better net resource from cooperation
- More Band 3 candidates

This is the opposite of the founding hypothesis prediction.

## Candidate explanation: stochastic resonance

Stochastic resonance is a well-documented phenomenon in biological
sensory systems where a certain amount of noise improves signal
detection above a threshold — rather than degrading it.

In the ALife experiment, Population B agents receive their neighbors'
true signals plus oracle-sourced hardware noise (±0.2 uniform).
Population A agents receive only the true signal.

If the noise level is near the stochastic resonance threshold
for the cooperation decision boundary (0.65), B agents may be
using the noise to detect weak cooperative signals that A agents
miss — effectively giving B access to more environmental information
despite having less accurate signal reading.

## Connection to original conversation

This experiment began with a discussion of insect mechanosensory
hairs as potential frequency detectors. Stochastic resonance is
documented in exactly those systems — biological sensors that use
noise to improve detection. The experiment may have independently
rediscovered this phenomenon in a governance context.

## What this means for the founding hypothesis

If confirmed, this does not refute the founding hypothesis.
It refines it:

"Perfect information symmetry is not the goal.
The goal is the right information environment —
one where the noise floor carries genuine signal
rather than distortion."

A civic system with no noise (pure symmetric information)
may be less adaptive than one with calibrated noise —
uncertainty that reflects genuine environmental complexity
rather than manufactured information asymmetry.

The distinction is between:

- Manufactured asymmetry (some agents deliberately denied information)
- Calibrated uncertainty (all agents operating in genuine complexity)

Constella's goal may not be zero information asymmetry.
It may be the elimination of *manufactured* asymmetry while
preserving *genuine* uncertainty as a feature.

## Next steps

1. Vary noise level systematically (0.0, 0.1, 0.2, 0.3, 0.4)
   and measure Band 3 candidate count and trust stability
   to find the stochastic resonance peak
2. Test whether B's advantage disappears at noise = 0.0
   (true symmetric condition, no noise) vs noise = 0.2
3. If confirmed, update Population A definition:
   A = zero noise (currently)
   A_calibrated = noise level at SR peak
   B = manufactured asymmetry (directional bias, not just noise)
