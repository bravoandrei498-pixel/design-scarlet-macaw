# Design Scarlet Macaw — How This Works
> Read this first. Every time. For every project.

---

## ⛔ The Golden Rule: upload files, never paste them

Pasting `02-MASTER-PLAYBOOK.md` as text has silently truncated it before — an
earlier version cut off partway through, dropping the entire tail of the rulebook
(Asset & Data Ingestion, Conversion Engineering, Revision & Verification
Discipline) without any error, and the thinned-out system that resulted went
unnoticed for weeks. **Always upload the `.md` files directly — a file is read in
full, a paste is not.**

---

## The Goal
Build beautiful, high-quality websites that convert — and that clients are proud to pay for.
Beautiful without converting is a portfolio piece. Converting without beauty builds no brand. Every decision must serve both.

---

## The 7-Stage Workflow
*(plus one unnumbered step — Client Presentation — between Stages 3 and 4; see below)*

### Stage 1 — Intake
The client fills out `01-DESIGN-BRIEF-TEMPLATE.md`. (Building for yourself?
You're the client — fill it out about your own business.)
Nothing moves until this is complete. The brief is the single source of truth for every decision downstream — pages, tone, conversion goal, assets, existing brand elements, and (Section 10) integrations/compliance for the dev team.

**Who does this:** You (send brief to client, collect it back)
**Output:** Completed Design Brief (all 10 sections)

---

### Stage 2 — Synthesis
You upload the completed brief into your Claude Project (set up per `SETUP.md`). The Project runs the Synthesizer (`05-PROMPT-SYNTHESIZER.md`), loads the matching industry playbook from `/industries/`, and produces two files:

1. **`[CLIENT-NAME]-DESIGN-PROMPT.md`** — goes to claude.ai/design, uploaded **together with the 7 system files** (`02-MASTER-PLAYBOOK.md`, `03-COMPONENT-LIBRARY.md`, `04-CONVERSION-PLAYBOOK.md`, the matching industry playbook, `SECTION-LAYOUT-LIBRARY.md`, `OPERATING-LOG.md`, `CRAFT-RULES.md`) — **8 uploads total, never pasted, and system-file content is never duplicated into the prompt.** The Design Prompt itself contains only the brief's Sections 1–9 plus synthesis notes and quality-gate references — one clean, slim file. Section 10 is deliberately excluded — Claude Design doesn't need integrations/compliance info to make visual decisions.
2. **`[CLIENT-NAME]-DEV-HANDOFF.md`** — pre-populated handoff spec for developers, including Section 10. Covers analytics, forms, SEO, performance targets, accessibility, legal, integrations, and browser QA.

**What the Synthesizer decides during Synthesis:**
- Industry classification → loads the correct industry playbook
- Exact page list from the brief (hard-coded into the prompt — Claude Design builds only these)
- Which assets exist vs. are missing (logo, photos, copy, reviews)
- Any existing brand assets the client is bringing (colors or fonts already in use)
- The motion dials (Tier / Character / Package) from Sections 3 and 9

**What Claude Design decides during Build:**
- Everything visual: palette, typography, section layout, composition, motion tier, brand personality, signature moment — all derived from the brief and the uploaded system files

**Who does this:** Your Claude Project, running `05-PROMPT-SYNTHESIZER.md`
**Input:** Completed brief + industry playbook
**Output:** Design Prompt + Dev Handoff doc

---

### Stage 3 — Build
Upload `[CLIENT-NAME]-DESIGN-PROMPT.md` **together with** the 7 system files — 8 files total, all as attachments — to claude.ai/design.

**One-time per Claude Design project:** put `claude-design-project/CLAUDE.md` at that project's **root**. Claude Design applies a root `CLAUDE.md` to every chat in the project automatically — it carries the floor, the bans, and the conventions, so they hold even if an upload is forgotten. The kit scripts include it in every kit. See `SETUP.md`.

**Easiest way to gather them:** on a Mac, double-click `New Client Kit.command`; on any OS, run `python3 new-client-kit.py`. Either builds `clients/[client-name]-UPLOAD-KIT/` copied fresh from the masters (byte-verified, so it can never be stale). Drop the Design Prompt in and upload that folder's contents. Manual fallback: copy the 7 files listed in `README.md` yourself.

Claude Design:
1. Produces **3 distinct directions** — different layout, palette, typography, and motion approach
2. You select one direction (or Mix & Match elements across directions)
3. Claude Design builds **only the pages listed in the brief** — no more, no less
4. Beautiful, fully functional **dropdown menus** are built for every nav item with sub-pages — mandatory after direction selection
5. The **Compliance Audit runs per page** before anything is shown — governed by the uploaded `02-MASTER-PLAYBOOK.md` (Rules 1–23)

**Who does this:** Claude Design (claude.ai/design)
**Gate:** No page is shown with a failing Compliance Audit
**Output:** Full page builds (sample content where real assets don't exist yet)

---

### Between Stage 3 and Stage 4 — Design Rationale + Client Presentation
Two documents get filled out from the 3 directions Claude Design just produced, before anyone outside the build sees them:

1. **`DESIGN-RATIONALE.md`** — the internal strategic write-up: differentiation angle, benchmark insights, conversion strategy, risk assessment, A/B test hypotheses. For you or a stakeholder who needs to understand and defend *why* the recommended direction is the recommendation, not just what it looks like.
2. **`CLIENT-PRESENTATION.md`** — the client-facing translation: plain-English talking points per direction, the recommendation, and the Mix & Match option.

Neither adds new design decisions — both collect and translate reasoning that already exists across Rule 1a's grounding pass and Rule 1b's recommendation. (Solo builders can skip both.)

**Who does this:** You, right after Stage 3
**Output:** Filled-out `DESIGN-RATIONALE.md` and `CLIENT-PRESENTATION.md`

---

### Stage 4 — Personalization
Inside claude.ai/design, you swap in the real client details that weren't in the brief:
- Real logo
- Real photos
- Real copy (verbatim from live site or client-supplied)
- Real reviews / testimonials
- Real addresses, phone numbers, hours

**Who does this:** You, inside claude.ai/design
**Output:** Personalized, client-ready pages

---

### Stage 5 — Client Review
Client sees the personalized version. Because the design was already locked and beautiful before personalization, changes at this stage are minimal — copy tweaks, image swaps, preference adjustments.

**Who does this:** Client reviews, you action feedback
**Output:** Approved design

---

### Stage 6 — Developer Handoff
Deliver `[CLIENT-NAME]-DEV-HANDOFF.md` to your development team. Every conversion-critical item is pre-documented — no ambiguity about analytics setup, form destinations, schema type, redirects, integrations, or performance targets. If the build runs through Claude Design's native handoff (`/design-sync` or a handoff bundle), the document narrows to what the bundle doesn't carry — see `docs/CLAUDE-DESIGN-NATIVE.md`. (Solo builders shipping their own site: this stage is just "export and deploy.")

**Who does this:** You hand off to devs
**Output:** Production-ready build

---

### Stage 7 — Post-Launch Review
2–4 weeks after launch, run `POST-LAUNCH-PLAYBOOK.md`: pull the standard analytics review, check it against the Design Hypothesis Log for anything non-obvious this build tried, and log the outcome in the cross-project hypothesis tracker. This is what feeds real performance data back into the system — the Operating Log captures build-time lessons, this captures performance-time lessons.

**Who does this:** You (ongoing service, not a one-time step)
**Output:** Updated `POST-LAUNCH-PLAYBOOK.md`, and — if a hypothesis has now validated across 3+ projects — a proposed rule change to `02-MASTER-PLAYBOOK.md`

---

## File Reference

| File | Purpose | Used by |
|---|---|---|
| `README.md` | Public quick start — the 3-step story | You |
| `SETUP.md` | One-time deployment (Claude Project setup) | You |
| `00-HOW-THIS-WORKS.md` | This file — the full workflow | You |
| `01-DESIGN-BRIEF-TEMPLATE.md` | Client intake (10 sections) | Client fills, you collect |
| `02-MASTER-PLAYBOOK.md` | The constitution — Rules 1–23, Motion Contract, Build Compliance Audit, Build Lifecycle | Claude Design (uploaded alongside Design Prompt, never pasted) |
| `03-COMPONENT-LIBRARY.md` | All sections, Tier 1 (universal) and Tier 2 (industry-specific), page architecture | Claude Design (uploaded, never pasted) |
| `04-CONVERSION-PLAYBOOK.md` | CRO rules baked into every layout decision | Claude Design (uploaded, never pasted) |
| `05-PROMPT-SYNTHESIZER.md` | Turns brief + industry playbook into the Design Prompt + Dev Handoff | The Synthesizer (your Claude Project) |
| `SECTION-LAYOUT-LIBRARY.md` | Section-composition vocabulary (two-part splits, scroll galleries, bento, etc.) — load every build | Claude Design |
| `OPERATING-LOG.md` | Standing cross-project lessons-learned (Rule 22d) — consult at the start of every build, update after | You / Claude Design |
| `CRAFT-RULES.md` | Universal, brand-agnostic craft layer — banned AI-default list, typography/color craft, 80/20 soul doctrine, WCAG 2.2 floors | Claude Design (uploaded, never pasted) |
| `tokens.css` | Builder-side SAMPLE token file showing the Rule 9 shared-token pattern | You — reference only; never uploaded. Claude Design builds each project's token file fresh from Rules 7/9 + the Synthesizer's token direction |
| `brand-style-guide-template.html` | Reference implementation of the 16-section Live Brand Style Guide (also the specimen to feed Claude Design's native design-system extractor — see `docs/CLAUDE-DESIGN-NATIVE.md`) | You — reference only; never uploaded |
| `claude-design-project/CLAUDE.md` | Persistent build layer — goes at the **Claude Design project root**, applies to every chat there | Claude Design (project config, not an upload) |
| `New Client Kit.command` / `new-client-kit.py` | Kit scripts (Mac double-click / any OS) — build `clients/[name]-UPLOAD-KIT/` copied fresh from the masters | You |
| `industries/06-HEALTHCARE.md` ... `10-GENERAL.md` | Per-industry playbooks | Synthesizer + Claude Design (the one matching file) |
| `DEV-HANDOFF-TEMPLATE.md` | Base template for the dev handoff spec | Synthesizer populates this |
| `POST-LAUNCH-PLAYBOOK.md` | Analytics review template + Design Hypothesis Log + Validation → Rule Pipeline | You, starting 2–4 weeks post-launch |
| `DESIGN-RATIONALE.md` | Internal strategic write-up behind the recommended direction | You / stakeholders, between Stage 3 and 4 |
| `CLIENT-PRESENTATION.md` | Plain-English talking points per direction, for presenting to the client | You, between Stage 3 and 4 |
| `docs/` | System history, provenance, and Claude Design native-features guide | You — background only |

---

## Page Scope Rule
**Build only the pages checked in the brief. No standard set is assumed.**

A client may need 2 pages or 12 — both are valid. Claude Design builds exactly what is checked in Section 2 of the brief and nothing else. No page is inferred, assumed, or added because it "seems standard." If it's not checked, it doesn't get built.

---

## Two Outputs From Every Synthesis
Every project produces exactly two files from Stage 2:
1. The Design Prompt (for claude.ai/design)
2. The Dev Handoff (for developers)

Both are generated in one pass from the same brief. Neither is optional.

---

*Design Scarlet Macaw*
