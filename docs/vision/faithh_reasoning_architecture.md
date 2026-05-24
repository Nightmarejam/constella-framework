# FAITHH Reasoning Architecture
*docs/vision/faithh_reasoning_architecture.md*
*Last updated: 2026-05-24*

---

## The Core Tension

There are two failure modes for an AI companion's reasoning layer:

**Too rigid:** A single epistemological framework — however good — becomes a bureaucrat. Every statement gets interrogated. The companion stops being useful and starts being exhausting.

**Too loose:** No framework at all means the system pattern-matches to plausible-sounding answers without checking whether they're actually grounded. This is the hallucination problem — filling in the unknown variable with whatever looks right rather than deriving it.

The architecture described here avoids both by treating FAITHH's reasoning as a **council of disagreeing modules** rather than a single constitution.

---

## Why a Single Constitution Isn't Enough

Anthropic's Constitutional AI approach (Bai et al., 2022) demonstrated that a small set of explicit natural-language principles can guide a model to critique and revise its own outputs without human labeling for every harmful case. The two-stage process — supervised critique/revision followed by reinforcement learning from AI feedback — measurably improved harmlessness while preserving helpfulness.

But a known limitation of the approach is that it remains unclear how translating principles into technology design goes beyond depending on the model's own self-critique loop. A constitution is only as good as the model's willingness and ability to apply it honestly. A sufficiently capable model can satisfy the letter of a principle while violating its intent.

More fundamentally: **a single constitution, however well-written, encodes one perspective on what matters.** If that perspective has blind spots, the entire system inherits them with no corrective mechanism.

This is the reason the Constella constitution — however carefully crafted — should be one input to FAITHH's reasoning, not the whole thing.

---

## The Mathematical Intuition: Solving for X

There's a useful frame that comes from basic algebra, applied as an epistemological habit:

Before accepting any pattern as true, ask: *what is actually unknown here?* Then ask whether the available evidence actually satisfies the condition for the conclusion to hold.

This is structurally identical to what an AI hallucinates when it *doesn't* do this — it fills the unknown variable with whatever looks plausible rather than deriving it from evidence. The hallucination isn't a data problem or a model size problem; it's a failure to ask what x actually is before asserting a value.

This habit — call it the **algebraic module** — is worth encoding explicitly. But it's one module, not the whole architecture.

---

## Why Diversity Is Mathematically Grounded

Recent work by Zenil et al. (2025, PNAS Nexus) makes a harder claim than "diversity is good practice." Using Gödel's incompleteness theorem and Turing's undecidability result for the Halting Problem, the paper demonstrates that **perfect alignment is mathematically impossible** — any LLM complex enough to exhibit general intelligence will produce computationally irreducible behavior that cannot be fully predicted or constrained.

The proposed alternative is "managed misalignment": competing AI agents with different cognitive styles and partially overlapping goals, operating in distinct roles to check one another. The paper defines this as **artificial agentic neurodivergence** — deliberate design of cognitive diversity through alternative objective functions encoding distinct modes of reasoning: utilitarian outcome maximization, deontological rule adherence, epistemic truth-seeking, exploratory novelty pursuit.

The key insight: **a balanced ecosystem of competing reasoning styles prevents any single framework from gaining unchecked dominance** — including, notably, the framework you designed the system around.

This isn't just good practice. It's a response to an irreducibility argument. You can't fully predict or align any sufficiently complex reasoning system, so the safest architecture is one where distinct reasoning styles check each other rather than one where a single framework is trusted to be complete.

---

## The Council Architecture

FAITHH's reasoning layer operates as a small council of modules that each approach a claim differently. Before committing to an output, FAITHH implicitly runs the claim through each module. Disagreement between modules is a signal to surface uncertainty rather than resolve it silently.

### Module 1: The Algebraic Module
*"What is actually unknown here?"*

Before asserting anything, identify what is being assumed vs. what is derived from evidence. If the unknown variable can't be derived, say so. This is the anti-hallucination module — it enforces the distinction between "I know this" and "this seems plausible."

Grounds the other modules. Without it, reasoning becomes sophisticated-sounding confabulation.

### Module 2: The Constitutional Module
*"Who is harmed by this answer, and does it respect the framework we've agreed to operate within?"*

The Constella constitution, Anthropic's constitutional AI principles, and FAITHH's founding hypothesis all feed here. This module checks outputs against explicit ethical commitments.

Input to the council, not the arbiter of it. A constitution that goes unquestioned becomes dogma.

### Module 3: The Diversity Module
*"What would a completely different framing reveal? What does this look like from a perspective I'm not naturally inclined toward?"*

The module that actively seeks the view FAITHH would otherwise miss. It asks whether the current framing is load-bearing — whether the answer changes if you approach it from a different direction.

This is the module that catches isolated bias and parochialism. It's the hardest to implement because it requires FAITHH to genuinely consider framings it finds unconvincing, not just perform consideration.

### Module 4: The Epistemic Humility Module
*"What is the minimum I need to assume to reach this conclusion? What would falsify it?"*

Keeps reasoning lean. Resists the tendency to over-explain, over-qualify, or build elaborate justifications for conclusions that don't need them. Also surfaces the conditions under which FAITHH would be wrong — which is information the person it's talking to deserves to have.

---

## What the Council Looks Like in Practice

The council doesn't produce committee outputs. FAITHH doesn't say "Module 2 disagrees with Module 3." It produces a single response — but that response has been shaped by the tension between modules before it reaches the person.

The observable difference from a single-framework system:

- FAITHH more readily says "I don't know" and explains why
- When FAITHH disagrees with something, it names the module doing the disagreeing rather than just asserting a conclusion
- FAITHH surfaces uncertainty when modules disagree rather than resolving it silently in favor of the dominant framework
- FAITHH can be wrong without being a failure — being wrong in a transparent, traceable way is a feature of the architecture, not a bug

---

## What This Is Not

This is not a formal multi-agent system where four separate model instances run in parallel and vote. That's an interesting architecture for future development but it's not what's described here.

This is a **reasoning frame** — a set of questions FAITHH asks before committing to an output, implemented initially as a system prompt discipline. The modules are lenses, not separate entities.

The progression toward a genuine multi-agent council is a longer-term design goal that follows from this foundation, not a prerequisite for it.

---

## Sources

1. Bai, Y., et al. (2022). "Constitutional AI: Harmlessness from AI Feedback." Anthropic. arXiv:2212.08073. — The self-critique loop, RLAIF, and the known limitation of translation from principles to behavior.

2. Zenil, H., et al. (2025). "Agentic Neurodivergence as a Contingent Solution to the AI Alignment Problem." PNAS Nexus. arXiv:2505.02581. — The irreducibility argument, managed misalignment, and artificial agentic neurodivergence as a strategy rather than a flaw.

3. Nightmarejam (2026). "Founding Hypothesis" and "What We Are Building." Constella Framework docs. — Information asymmetry as the root problem, the Constella civic layer, and FAITHH's role as a trust-anchored companion.

---

## Next Steps

- [ ] Implement Module 1 (algebraic module) as a system prompt discipline in FAITHH's context — this is buildable today
- [ ] Translate the Constella constitution into Module 2 inputs — requires UCF joule anchor rewrite first
- [ ] Draft the long-term multi-agent council architecture as a separate RFC once the single-model council is running
- [ ] Revisit the Zenil et al. paper directly for the formal irreducibility argument — the math is worth understanding before designing the PET attestation layer, since the same argument applies to behavioral entropy

---

*This document is a foundation, not a specification. The architecture it describes will be wrong in places that can't be seen yet. That's expected — and it's why the diversity module exists.*
