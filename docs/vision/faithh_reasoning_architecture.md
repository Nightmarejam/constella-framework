# FAITHH Reasoning Architecture

*docs/vision/faithh_reasoning_architecture.md*
*Last updated: 2026-05-24*

---

## The Core Tension

There are two failure modes for an AI companion's reasoning layer:

**Too rigid:** A single epistemological framework — however good — becomes a bureaucrat. Every statement gets interrogated. The companion stops being useful and starts being exhausting.

**Too loose:** No framework at all means the system pattern-matches to plausible-sounding answers without checking whether they're actually grounded. This is the hallucination problem — filling in the unknown variable with whatever looks plausible rather than deriving it.

The architecture described here avoids both by treating FAITHH's reasoning as a **council of disagreeing chips** that run in parallel rather than a single constitution applied sequentially.

---

## This Already Exists: The Chip System

FAITHH already runs a parallel chip architecture. The `backend/parallel_chip_engine.py` dispatches multiple semantic routing chips simultaneously based on query intent. As of Phase 4.5, 491 chips are loaded at startup — each one a specialized processor that activates when its intent patterns match. Multiple chips can fire on the same query. The `enhanced_chip_integration.py` and `chip_weight_metrics.py` modules manage how chip outputs are weighted and combined.

This is not a future design. It is running infrastructure.

The reasoning council described in this document is an extension of that infrastructure — four specific chips that handle epistemological questions rather than domain tasks. They slot into the existing parallel chip engine the same way the filesystem chip, the Anthropic optimization chips, and the genomic chips do.

---

## Why a Single Constitution Isn't Enough

Anthropic's Constitutional AI approach (Bai et al., 2022) demonstrated that a small set of explicit natural-language principles can guide a model to critique and revise its own outputs without human labeling for every harmful case. The two-stage process — supervised critique/revision followed by reinforcement learning from AI feedback — measurably improved harmlessness while preserving helpfulness.

But a known limitation is that it remains unclear how translating principles into technology design goes beyond depending on the model's own self-critique loop. A constitution is only as good as the model's willingness and ability to apply it honestly. A sufficiently capable model can satisfy the letter of a principle while violating its intent.

More fundamentally: **a single constitution encodes one perspective on what matters.** If that perspective has blind spots, the entire system inherits them with no corrective mechanism.

This is why the Celestial Equilibrium doctrine and the Constella constitution should be inputs to FAITHH's reasoning — one chip among several — not the whole architecture.

---

## The Mathematical Intuition: Solving for X

Before accepting any pattern as true, ask: *what is actually unknown here?* Then ask whether the available evidence actually satisfies the condition for the conclusion to hold.

This is structurally identical to what an AI hallucinates when it *doesn't* do this — it fills the unknown variable with whatever looks plausible rather than deriving it from evidence. The hallucination isn't a data problem or a model size problem; it's a failure to ask what x actually is before asserting a value.

This habit is encodable as a chip. It runs in parallel with the other chips. It doesn't dominate — it contributes.

---

## Why Diversity Is Mathematically Grounded

Recent work by Zenil et al. (2025, PNAS Nexus) makes a harder claim than "diversity is good practice." Using Gödel's incompleteness theorem and Turing's undecidability result for the Halting Problem, the paper demonstrates that **perfect alignment is mathematically impossible** — any LLM complex enough to exhibit general intelligence will produce computationally irreducible behavior that cannot be fully predicted or constrained.

The proposed alternative is "managed misalignment": competing agents with different cognitive styles and partially overlapping goals, operating in distinct roles to check one another — **artificial agentic neurodivergence**.

FAITHH's chip system is already this architecture. The 491 chips don't all agree. That's a feature, not a bug. The reasoning council chips formalize that disagreement at the epistemological level.

---

## The Four Reasoning Council Chips

These are four chips that belong in `ml/output/chips.json` and the parallel chip engine. They activate on queries where epistemological uncertainty is high, not on every query — the existing intent detection system handles routing.

### Chip: Algebraic

*Trigger: queries where the answer is being asserted without visible derivation*
*"What is actually unknown here?"*

Before asserting anything, identify what is being assumed vs. what is derived from evidence. If the unknown variable can't be derived, flag it. This is the anti-hallucination chip — it enforces the distinction between "I know this" and "this seems plausible."

### Chip: Constitutional

*Trigger: queries touching ethics, governance, harm, or Constella framework topics*
*"Who is harmed by this answer? Does it respect the framework we've agreed to operate within?"*

The Celestial Equilibrium doctrine, the Constella constitution, and FAITHH's founding hypothesis all feed here. This chip checks outputs against explicit ethical commitments. It's one chip, not the arbiter of the whole system.

### Chip: Diversity

*Trigger: queries where FAITHH is likely to give a confident answer quickly*
*"What would a completely different framing reveal?"*

The chip that actively seeks the view FAITHH would otherwise miss. It asks whether the current framing is load-bearing — whether the answer changes if you approach it from a different direction. Catches isolated bias and parochialism.

### Chip: Epistemic Humility

*Trigger: queries where multiple reasoning paths are active simultaneously*
*"What is the minimum I need to assume to reach this conclusion? What would falsify it?"*

Keeps reasoning lean. Also surfaces the conditions under which FAITHH would be wrong — which is information the person it's talking to deserves to have.

---

## How the Council Fits the Existing Architecture

```
Query arrives
     ↓
Intent detection (existing)
     ↓
Parallel chip dispatch (parallel_chip_engine.py — existing)
     ├── Domain chips (filesystem, genomic, Anthropic optimization, etc.)
     └── Reasoning council chips (algebraic, constitutional, diversity, epistemic)
          ↓
chip_weight_metrics.py weights outputs
     ↓
Response synthesis
```

The council chips don't replace the domain chips. They run alongside them. When a query about Constella governance fires both the constitutional chip and the diversity chip, their outputs are in tension — and that tension is visible in the response rather than resolved silently.

---

## Connection to the Attestation Layer

The Zenil et al. irreducibility argument applies directly to the PET device design. Behavioral entropy is useful as an attestation signal precisely *because* it's computationally irreducible — you can't fully predict what a human's behavioral signature will look like, which means you can't forge it either. The same mathematics that argues for cognitive diversity in the reasoning council argues for behavioral entropy as a trust anchor in the PoL layer.

The algebraic chip and the attestation layer are solving the same underlying problem from different directions: how do you verify that something actually happened rather than just appeared to happen?

---

## What This Is Not

This is not a formal multi-agent system where four separate model instances run in parallel and vote. The chips are implemented as weighted intent matchers in the existing Python chip engine, not separate AI instances.

The progression toward a genuine multi-agent council — where each reasoning style is a separately fine-tuned model — is a longer-term design goal that follows from this foundation.

---

## Next Steps

- [ ] Add the four reasoning council chips to `ml/output/chips.json` using the existing chip schema
- [ ] Implement intent patterns for each chip in `backend/intent_detection.py`
- [ ] Wire the constitutional chip to Celestial Equilibrium doctrine via RAG (ChromaDB already running)
- [ ] Test in `backend/parallel_chip_engine.py` with a query that should fire multiple council chips simultaneously
- [ ] Read Zenil et al. (arXiv:2505.02581) directly before designing the PET attestation layer

---

## Sources

1. Bai, Y., et al. (2022). "Constitutional AI: Harmlessness from AI Feedback." Anthropic. arXiv:2212.08073.
2. Zenil, H., et al. (2025). "Agentic Neurodivergence as a Contingent Solution to the AI Alignment Problem." PNAS Nexus. arXiv:2505.02581.
3. Nightmarejam (2026). FAITHH codebase — `backend/parallel_chip_engine.py`, `ml/output/chips.json`, `filesystem_chip.py`. faithh-pet-terminal repo.
4. Nightmarejam (2026). "Founding Hypothesis" and "What We Are Building." Constella Framework docs.

---

*The chip system you built is already the architecture this document describes. This document just names it.*
