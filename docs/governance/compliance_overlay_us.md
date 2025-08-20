# Constella v1.5.6 — U.S. Compliance Overlay (Draft v0.1)

> **Purpose.** Provide a bridge between U.S. operations and Constella protocols without replacing U.S. law. Constella remains **guidance-first**; U.S. agencies retain **enforcement**.  
> **Anti-weaponization.** “Constella protocols are a civic commons. They may not be used to coerce, punish, or disenfranchise. Outputs are recommendations unless incorporated by U.S. authority.”  
> **Privacy.** Follow minimal-PII intake, retention limits, and de-identification per RME policy.

## A. Side-by-Side Mapping

| U.S. Category / Agency | Existing Mechanism / Metric | Constella Component | Primary Integration Hook | Data Needed (min) | Policy Levers | Risks & Safeguards |
|---|---|---|---|---|---|---|
| **Income Floor (HHS/HUD/USDA/BLS)** | Poverty thresholds; HUD FMR; SNAP/USDA food plans; living wage calculators | **UCF** (Absolute Floor + Flourish band) | Peg UCF inputs to published metrics; recompute quarterly via **RME** | Region, household size, rent/utilities bands | Admin guidance: “reference UCF calc for pilots”; municipal MoUs | Avoid underestimation: require Auctor check; publish methodology in **Civic Tome** |
| **Tax & Incentives (Treasury/IRS)** | Credits/deductions; payroll withholding | **Astris** mint + **decay**; Genesis Pool | Optional “civic credit” mapped to deductions/grants; **Open Palm Protocol** for voluntary contributions | Contribution amount, verified outputs | Pilot via state credits/grants before federal; cap mint; faster decay on surplus | Prevent pay-to-win: Auctor gate; cap Astris influence; transparency logs |
| **Voting Rights (DOJ/FEC/States)** | One person, one vote; VRA | **Auctor** (equal civic voice) | Clarify Auctor applies **inside Constella** processes; never substitutes public elections | Participant registry (minimal) | Agency memo: “Auctor is advisory layer for civic programs” | Don’t mix with elections: hard boundary language in all scrolls |
| **Restorative Justice (DOJ/States)** | Diversion/mediation programs | **Penumbra Accord** | Joint pilot MoUs with courts/DA for voluntary restorative tracks | Case type, consent status, outcomes | Model MOU clauses; harm → mediation → repair → reintegration | Anti-coercion: opt-in only; no criminal penalties; publish anonymized results |
| **Housing/Energy (DOE/HUD)** | Weatherization, EE grants | **Eden** pilot | Use **RME** ranking for site selection; DOE/HUD fund installs; data to **Civic Tome** | Site baseline, install logs, kWh/therms | Standardized PSL-1 SKU list; contractor vetting | Safety/permits: municipal POC; insurance; QA inspections |
| **Public Health (HHS/NIH/CDC)** | Community health grants | **Harmony** pilot | Adopt protocol + outcomes schema; publish before/after to **Civic Tome** | Enrollment, attendance, RPE/HRV (optional) | IRB-lite templates for low-risk wellness; venue MoUs | Liability: waivers; accessibility; adverse event logging |
| **Labor/Workforce (DOL)** | Wage/hour, volunteer rules | **Astris** for contributions | Classify contributions as **civic**, not employment; no wage promises | Hours, task type, non-employment attestation | Guidance note referencing volunteer regs; stipend firewall | Misclassification risk: bright-line tests; no implied wages |
| **Grants/Procurement (OMB/GAO/CBO)** | Evidence tiers, scoring | **RME** outputs; **Civic Tome** | Accept RME summaries as evidence exhibits in applications | Pilot outcomes, cost/benefit | Circular updates or agency memos to accept RME format | Data integrity: versioned packets; third-party audits |
| **Privacy/Consumer (FTC/States)** | UDAP; data privacy acts | **RME** data policy | Adopt minimal fields, retention caps, role-based access; audit logs | PII class, retention date | Publish Data Protection Impact Note per pilot | Re-ID risk: publish k-anonymity thresholds; suppression rules |
| **Education (ED/States)** | CE/CPD, school wellness | **Harmony** coaches & cohorts | CPD alignment; after-school wellness pilots | Coach cert, schedule, attendance | State PD credit mapping | Child safety: background checks; mandated reporter clarity |

## B. Model “Compliance Overlay” Language (drop-in snippets)

**Advisory Status Clause (put in every scroll):**  
> “This protocol is advisory within the Constella civic commons and does not create enforceable rights or obligations under U.S. law unless expressly incorporated by a competent authority.”

**Agency Reference Clause (for RFPs/grants/MOUs):**  
> “The Department shall **consider** Constella **RME** review summaries and **Civic Tome** pilot reports as supplementary evidence when evaluating programs substantially similar to the attached protocol.”

**Auctor Boundary Clause:**  
> “Auctor voting is confined to Constella processes and shall not be construed as a substitute for public elections or statutory decision-making.”

**Anti-Weaponization Clause:**  
> “No individual or organization may use Constella outputs to coerce participation, restrict rights, or impose penalties. Remediation follows the **Penumbra Accord** (mediation → repair → reintegration).”

## C. Minimal Data Schemas (RME Intake, TSV)

**rme_pilot_summary.tsv**  
`pilot_id\tts\tv\tversion\tagency_ref\tcomponent\toutcome_metric\tpre\tpre_unit\tpost\tpost_unit\tconfidence\tprivacy_class\tcivic_tome_link`  
Example:  
`eden_psl1_0001\t2025-08-16T00:00Z\t1.5.6\tDOE\tDOE-WAP\tEden\tkWh_savings\t420\tkWh/mo\t290\tkWh/mo\t0.8\tde-id\tCT:eden/2025Q3#0001`

**ucf_calc.tsv**  
`region\thousehold\tsize\tA0\tms\tA\tT\tfloor_gap\tsurplus_band\tnotes`  
`OR-Lane\t2\t2\t2800\t1.20\t3360\t0.15\t0\t504\tQuarterly recompute via HUD/USDA`

## D. Phased Adoption Plan

**Phase 0 — Ratify Overlay (1–2 weeks)**  
• Approve the four boilerplate clauses above and add them to all scrolls.  
• Publish this file as `docs/governance/compliance_overlay_us.md`.

**Phase 1 — Pilot-Ready Evidence (2–6 weeks)**  
• Implement the two TSV schemas in **RME**.  
• Run one **Eden** site and one **Harmony** cohort; publish packets to **Civic Tome**.

**Phase 2 — Government Bridge (6–12 weeks)**  
• Draft 2–3 **MOUs**: (a) City energy office ↔ Eden; (b) County health dept ↔ Harmony; (c) University policy lab ↔ RME.  
• Add “Agency Reference Clause” to each MOU.

**Phase 3 — Reference in Public Programs (Quarter 2)**  
• Submit RME/Tome packets as **evidence attachments** in DOE/HUD/CDC grant applications.  
• Seek agency memos that “accept Constella evidence format.”

**Phase 4 — Statutory Touchpoints (as traction grows)**  
• Request language in authorizing bills: “The Secretary **may consider** Constella Civic Tome evidence when evaluating [program].”  
• Explore state-level restorative pilots referencing **Penumbra Accord**.

## E. What’s “heavy” vs. “doable” today

• **Doable now (lightweight):** overlay clauses, TSV schemas, RME packet templates, two pilots (Eden/Harmony), city/university MOUs.  
• **Heavier lift (needs partners/funding):** IRS-aligned civic credits, DOJ restorative pilot integration, OMB/GAO recognition of RME outputs.  
• **Path to heavy items:** start with state/municipal pilots + universities (policy labs). Use published **Civic Tome** evidence to request federal consideration.

## F. Repo TODOs

1) Add overlay clauses to all governance scrolls (autogen preface).  
2) Commit TSV schemas under `review/schemas/` and wire into **RME** intake.  
3) Create MOU templates: Eden–City Energy; Harmony–County Health; RME–University Lab.  
4) Publish Eden & Harmony pilot packets to **Civic Tome** with IDs and dashboards.  
5) Draft “Agency Reference” one-pager for grant appendices.
