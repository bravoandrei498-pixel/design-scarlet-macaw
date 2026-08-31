# History — how Design Scarlet Macaw was built
### Provenance record (consolidated Aug 14, 2026; background only — not needed to use the system)

This is a consolidation of this design system, built after discovering the system had
split into two divergent lineages that needed reconciling:

- **The "V3" folder** (an earlier "V3" working folder) — dated June 14,
  2026. Cleaner file organization (00–05 + Dev Handoff + Prompt Synthesizer + industries),
  but only Rules 1–20 in the Master Playbook, a flatter Motion Contract, and a real bug:
  the Dev Handoff Template and Prompt Synthesizer both referenced a Brief "Section 10"
  that didn't exist in the Brief Template itself.
- **Master Playbook v11** (uploaded as `.docx`, matching an earlier
  `Design Playbook v11.md`, dated June 13, 2026 — one day before V3) — Rules 1–23, a
  Motion Tier/Character/Package system, an Operating Log, and much more field-tested
  detail (bug fixes, layering gotchas, a "1% moments" checklist), all absent from V3.

The V1 system's own `00 — SYSTEM MAP & How To Load.md` explicitly warns that **pasting**
the Master Playbook (instead of uploading it as a file) silently truncates it around
line 1055 — dropping exactly Rules 21–23. That's the most likely explanation for why V3
ended up thinner than v11: it was probably built from a truncated paste, not a
deliberate simplification. This folder assumes that's what happened and restores the
missing depth rather than treating V3's simplicity as intentional — flag it if that
assumption turns out to be wrong.

## What's in this folder

| File | Where it came from |
|---|---|
| `00-HOW-THIS-WORKS.md` | V3, updated with the paste-truncation warning from V1's System Map |
| `01-DESIGN-BRIEF-TEMPLATE.md` | V3's 9 sections + a real Section 10 (Integrations, Compliance & Migration — restores the broken cross-reference) + the Motion Tier/Character/Mindset-on-arrival fields from `PROJECT_DESIGN_BRIEF_Template_v2` |
| `02-MASTER-PLAYBOOK.md` | Master Playbook **v11, in full** (Rules 1–23) — carried forward verbatim, not V3's Rules 1–20 |
| `03-COMPONENT-LIBRARY.md` | V3, unchanged — no v11 equivalent exists, this is a genuine V3-era addition |
| `04-CONVERSION-PLAYBOOK.md` | V3, unchanged — **not yet reconciled against v11's Rule 21 (Conversion Engineering), which covers similar ground. Worth a side-by-side pass before this is final.** |
| `05-PROMPT-SYNTHESIZER.md` | V3, unchanged in concept (this Synthesizer step doesn't exist in v11 at all — genuine V3 addition), updated for Rules 1–23 and the real Section 10 |
| `DEV-HANDOFF-TEMPLATE.md` | V3, with the Section 10 references fixed (now point at a real section) and four accessibility items added: visible focus indicator, tap target size, heading hierarchy, HTTP security headers |
| `industries/06-HEALTHCARE.md` ... `10-GENERAL.md` | V3, unchanged — these supersede V1's single `Vertical Style Packs.md` with more developed, per-industry content |
| `SECTION-LAYOUT-LIBRARY.md` | V1 BUILD KIT — v11's Master Playbook depends on this ("load every build") and V3 has no equivalent |
| `OPERATING-LOG.md` | V1 BUILD KIT — v11's Rule 22d requires this; V3 dropped it along with Rules 21–23 |
| `tokens.css` | V1 BUILD KIT — referenced by name in the v10/v11 changelog for shadow/radius reconciliation |
| `brand-style-guide-template.html` | V1 BUILD KIT (the current one, not the deprecated copy sitting in `V1/OLD — do not upload/`) |
| `PROJECT-INSTRUCTIONS.md` | V3, file list and rules updated to match this folder |

## What was NOT carried forward, and why

- **`Vertical Style Packs.md`** (V1) — superseded by V3's `industries/*.md`, which cover the same ground in more depth (5 dedicated files vs. one compact multi-vertical file).
- **`Claude Design Brief + Workflow Rules (Combined).md`** and its relatives in `V1/OLD — do not upload/` — confirmed deprecated, explicitly marked not to use.
- **an older brief template** (uploaded docx) — claimed to be "the latest" with an impossible creation date (June 2023); doesn't match v11's fields. Not trustworthy, not used.
- **V2's split files** (`claude-design-workflow/00-MASTER-PLAYBOOK.md` etc.) — an intermediate restructuring step between v11 and V3, superseded by both.

## Reconciliation check — done Aug 14, 2026

`03-COMPONENT-LIBRARY.md` and `04-CONVERSION-PLAYBOOK.md` (both carried forward from V3
unchanged) were checked line-by-line against `02-MASTER-PLAYBOOK.md`'s Rule 10 (Required
page sections), Rule 11 (Design Language), and Rule 21 (Conversion Engineering).

**Result: one real inconsistency found and fixed, nothing else.** Rule 10's mobile
sticky footer bar described a single "Contact Us" button; the Component Library's G5
spec (and the prior V3 Master Playbook) independently described two half-buttons — Call
+ Book/Contact. Fixed in `02-MASTER-PLAYBOOK.md` in favor of the two-button version,
since it had more independent support. The fix is noted inline in that file.

Everything else checked out as consistent or complementary, not conflicting:
- Nav layout (logo left, centered links, CTA right, no "Home" link) matches exactly
  between Rule 10 and Component Library G2.
- Contact-form-on-every-page-except-Contact rule matches exactly (Rule 10 vs. Component
  Library's Page Outro block).
- Rule 21a (one conversion goal per page) matches the Conversion Playbook's core
  principle and per-page goal table.
- Rule 21d's tap target requirement (≥44×44px) matches the Conversion Playbook's mobile
  section and doesn't conflict with the stricter WCAG 2.2 floor (24×24) added to
  `DEV-HANDOFF-TEMPLATE.md` — 24×24 is the legal minimum, 44×44 is what this system
  actually targets, both true at once.
- Rule 21e's form standards (minimal fields, honeypot spam protection, success states,
  compliance notices) match the Conversion Playbook's Form Standards section point for
  point — Conversion Playbook is the more detailed field-level implementation of the
  same rule.
- Rule 21b/21c (SEO, schema, performance) have no Component Library / Conversion
  Playbook equivalent, but that's an intentional division of scope, not a gap — those
  live in `02-MASTER-PLAYBOOK.md` and `DEV-HANDOFF-TEMPLATE.md`.
- The Hero, Signature Element (motif count), and Icon-sourcing detail in Rule 10/11 are
  more specific than the Component Library's versions, but not contradictory — the
  Component Library is a lighter summary of the same intent. `02-MASTER-PLAYBOOK.md`
  wins if the two ever seem to disagree on a hero/motif detail.

No blocking problems found. This folder is ready to send.

## External review pass — done Aug 14, 2026

A second LLM reviewed this folder  and returned findings C1–C4, H1–H6,
M1–M6, L1–L4. Before implementing anything, each finding was checked against the actual
files rather than accepted at face value:

- **C2 (tablet breakpoint)** — the review's justification ("~15–20% of traffic is
  tablet") was checked against current data and found off by roughly 8x (real 2026
  tablet share is ~1.8–2%). Downgraded from "critical" to essentially optional; not
  implemented in this pass.
- **C1 (Design Prompt pastes everything)** — the underlying finding was real, but the
  review's proposed fix (a new condensed rules file) would have recreated the exact
  duplication problem flagged in its own C4. Implemented a corrected version instead
  (see below).
- **H3 (CUBE CSS + file-based component architecture)** — contradicts Rule 9's actual
  output format (single-file React JSX, no build step, no `components/` directory). Not
  implemented — flagged as a contradiction with the system's real constraints.

**Six findings were implemented, all independent edits:**

1. **C4 — Deduplicated Component Library vs. Master Playbook Rule 10.** Rule 10's
   "Universal baseline" no longer restates G1–G5's structural specs; it now
   cross-references them and keeps only the behavior rules Component Library doesn't
   cover (sticky/scroll interaction, z-index, 82px height cap, no-dead-links). The one
   literal duplicate (the "no Home link" rule) was removed entirely — it now lives only
   in Component Library G2/G4. Added a reverse-pointer note at the top of
   `03-COMPONENT-LIBRARY.md` stating which file wins if the two ever disagree
   (Component Library wins on structure, Master Playbook Rule 10 wins on behavior).
2. **Corrected C1 — `05-PROMPT-SYNTHESIZER.md` no longer instructs pasting the Master
   Playbook, Component Library, Conversion Playbook, or industry playbook into the
   Design Prompt.** The Design Prompt now stays slim (client-specific content only) and
   the four source files are uploaded alongside it as their own files — never pasted,
   never duplicated. Updated to match in `00-HOW-THIS-WORKS.md` (Stage 2, Stage 3, File
   Reference table) and `PROJECT-INSTRUCTIONS.md`.
3. **H6 — Restored the "Host platform" field**, dropped during the merge into Design
   August's 9-section Brief structure. Back in the Brief's OUTPUT section (it affects
   build format per Rule 9, so it travels to Claude Design rather than being withheld
   like the rest of Section 10). Added a Platform Adaptation table (WordPress / Webflow
   / Framer / Squarespace / Custom code) as a new "0. HOST PLATFORM & DEPLOYMENT" section
   in `DEV-HANDOFF-TEMPLATE.md`.
4. **H4 — Added a Mix & Match Reconciliation Protocol + conflict matrix** to Rule 1c in
   `02-MASTER-PLAYBOOK.md`, covering what to do when a client's requested mix creates a
   conflict between two of the 7 Design Language decisions (motion tier, signature
   motif, palette contrast, surface treatment).
5. **M3 — Added a sub-archetype decision tree** to `industries/10-GENERAL.md` (SaaS,
   e-commerce, nonprofit, education, hospitality, professional services) as a starting
   point, on top of — not instead of — the existing brief-driven derivation process.
6. **M6 — Added a Content Migration table** to Section 10 of
   `01-DESIGN-BRIEF-TEMPLATE.md`, covering what happens to each content type (blog
   posts, case studies, team bios, testimonials, downloads, images, campaign landing
   pages) when replacing an existing site — the redirect table alone only covered
   URL-to-URL mapping, not content disposition. Referenced from
   `DEV-HANDOFF-TEMPLATE.md`'s SEO section.

All six changes are marked inline in their files with `*(Design August fix, Aug 14
2026 — ...)*` notes, same convention as the Reconciliation check fix above.

## External review pass — round 2, done Aug 14, 2026

Seven more findings implemented: **C3, H1, H2, H5, M1, M4, L1.** (H3 and L4 remain
not implemented — both downstream of the tablet-breakpoint premise rejected as C2
above. H6/H4/M3/M6 were round 1. M2, M5, L2, L3 not requested this round.)

1. **C3 — Compliance Report checkbox format.** The system already had a compact
   shorthand Compliance Report template in `02-MASTER-PLAYBOOK.md`'s "⛔ BUILD
   COMPLIANCE AUDIT" section — added a second, more scannable one-checkbox-per-rule
   version alongside it (not a new file — the review's proposed
   `COMPLIANCE-AUDIT-CHECKLIST.md` would have needed pasting into the Design Prompt
   or a 6th upload, both of which the corrected-C1 fix was built to avoid).
2. **H1 — Brief Completeness Gate.** Added to `05-PROMPT-SYNTHESIZER.md` Step 1: a
   green/yellow/red score before synthesis. Red halts and asks for the 5 minimum
   fields; yellow proceeds but prepends a "Missing Data" section to the Design
   Prompt so a placeholder-heavy first draft isn't mistaken for a finished one.
3. **H2 — Post-launch feedback loop.** New `POST-LAUNCH-PLAYBOOK.md`: standard
   analytics review template, a Design Hypothesis Log (state the bet behind
   non-obvious design decisions), and a Validation → Rule Pipeline (a hypothesis
   validated across 3+ independent projects becomes a proposed Master Playbook rule
   change). Linked from `00-HOW-THIS-WORKS.md` (new Stage 7) and
   `DEV-HANDOFF-TEMPLATE.md` Section 10.
4. **H5 — Token direction from brief.** Added a step to `05-PROMPT-SYNTHESIZER.md`
   Step 1 that names a starting palette direction (in words, not invented hex
   values) from Section 6's existing brand colors or Section 9's tone words +
   the industry playbook's own Palette Guidance — flows into the Design Prompt's
   ASSET STATUS block as `Token direction:`. Deliberately lighter than the review's
   proposed color-mix-formula generator (`TOKENS-GENERATOR.md`) — a synthesized
   prompt file isn't the right place for precise color math, and the industry
   playbooks already carry qualitative palette guidance this builds on rather than
   duplicates.
5. **M1 — Operating Log restructured.** `OPERATING-LOG.md`'s §2 (recurring root
   causes) converted from a plain table to YAML-frontmatter + markdown entries
   (id/severity/recurrences/status/graduated_rule), per the review's suggested
   schema. Found and fixed a real staleness bug while restructuring: R5 and R6 were
   still marked "candidate to graduate" even though `02-MASTER-PLAYBOOK.md`'s own
   v11 changelog says they already graduated into Rule 13 — the log just never got
   updated when that happened.
6. **M4 — Bespoke Exception Protocol.** Added as Rule 1c/1d in
   `02-MASTER-PLAYBOOK.md`: flag as bespoke, state a business justification,
   estimate complexity cost, get explicit sign-off on the trade-off, document it in
   the Style Guide as a one-off variant — for client requests that don't map to
   anything in the Component Library or industry playbook.
7. **L1 — Client Presentation template.** New `CLIENT-PRESENTATION.md` — plain-
   English talking points per direction, a recommendation, and Mix & Match
   guidance, filled out between Stage 3 (directions built) and Stage 4
   (personalization). Linked from `00-HOW-THIS-WORKS.md` as an unnumbered step
   between Stages 3 and 4.

## External review pass — round 3, done Aug 14, 2026

Three more findings implemented: **M2, L2, L3.** (M5 explained but not implemented this
round — see conversation; C2, H3, L4 remain rejected, see round 1 above.)

1. **M2 — Design Rationale deliverable.** New `DESIGN-RATIONALE.md` — the internal
   counterpart to `CLIENT-PRESENTATION.md` (L1). Differentiation angle, benchmark
   insights, conversion strategy, risk assessment, and A/B test hypotheses, for
   whoever needs to understand and defend *why* the recommended direction is the
   recommendation — a boss, a stakeholder, not just the client. Its A/B Test
   Hypotheses section is explicitly the pre-launch draft stage that feeds into
   `POST-LAUNCH-PLAYBOOK.md`'s Design Hypothesis Log once the site is live — noted
   inline so the two don't end up maintaining duplicate hypothesis lists.
2. **L2 — Competitive Analysis table.** Added directly into Rule 1a's existing
   benchmark step in `02-MASTER-PLAYBOOK.md` (not a new file) — Site URL / What They
   Do Well / What We Do Differently / Risk of Looking Similar, one row per
   best-in-class site studied.
3. **L3 — Image Optimization standard.** Concrete size/format/dimension/loading
   table (Hero, Card, Portrait, Background) plus a stock-sourcing priority order,
   added to Rule 21c (Performance / Core Web Vitals) in `02-MASTER-PLAYBOOK.md`.

## External review pass — round 4, done Aug 15, 2026

Not from the external review — from studying the inspiration sites the user had parked
earlier (styles.refero.design, motionsites.ai, ui.aceternity.com, mobbin.com,
Pinterest). Live-browsed all five, wrote up findings in
`notes/INSPIRATION-SITES-STUDY.md`, then added a **Reference Kit** to Rule 1a in
`02-MASTER-PLAYBOOK.md`: a 15-minute, internal-only pre-Canvas step using 3 of the 5
sources — Refero (quality-bar DESIGN.md), Mobbin (industry-default scan), Aceternity
(named signature-moment vocabulary). Pinterest and MotionSites were deliberately left
out — Pinterest because client-facing homework adds friction the brief exists to avoid
(doctors/lawyers/CEOs don't have time for it), MotionSites because its useful prompts
are paywalled. Nothing pasted or copied wholesale — the kit informs the Canvas, Rule 9's
output format still governs what ships.

This folder is ready to send to the other LLM / a new computer as-is.

## New-computer / new-account portability — Aug 19, 2026
User asked for this workflow to be deployable on other computers/Claude accounts with
fast pickup — no re-explaining the system each time. Added:
- **`CLAUDE.md`** — auto-context primer at the folder root, so any AI opening this
  folder (any Claude session) has an immediate pointer to the right files
  instead of guessing.
- **`NEW-COMPUTER-SETUP.md`** — concrete step-by-step for standing up a claude.ai
  Project on a new computer/account (paste `PROJECT-INSTRUCTIONS.md`, upload the
  exact 17-file Project Knowledge list, test with a sample brief), plus a faster
  lower-durability fallback for a one-off look via a Claude session with folder access.

`PROJECT-INSTRUCTIONS.md` and `HANDOFF-SUMMARY.md` cross-reference the new file.
Nothing about the workflow itself changed — this is pure onboarding/portability, no
rule or template content was touched.

## Client-kit workflow automation — Aug 22, 2026

User asked for a per-client duplication workflow so the master files never get edited
per client. Added:

- **`New Client Kit.command`** — double-click script at the folder root. Prompts for
  client name + industry, then creates `clients/[client-name]-UPLOAD-KIT/` containing
  the five always-needed system files + the ONE matching industry playbook, copied
  **fresh from the MASTERS** (not from `_UPLOAD-KIT-TEMPLATE/`) and verified
  byte-identical, plus a `KIT-INFO.txt` with the finish-the-kit steps (drop in the
  Design Prompt → upload 7 files → copy the updated Operating Log back after the
  build). It refuses to overwrite an existing kit and never modifies the masters.
  Because kits copy from the masters directly, the template's manual "Last refreshed"
  staleness rule doesn't apply to script-built kits — the template stays as the
  manual fallback.
- `clients/` was already gitignored (initial commit), so client kits and client data
  never enter the repo.
- Same day: the claude.ai Project's knowledge copies of `02-MASTER-PLAYBOOK.md`,
  `05-PROMPT-SYNTHESIZER.md`, and `OPERATING-LOG.md` were refreshed to match the
  masters.
- `_UPLOAD-KIT-TEMPLATE/UPLOAD-THESE.md` updated: refresh date corrected to Aug 22
  (its copies were already byte-identical to the masters; only the date label had
  gone stale) + a pointer to the script added.
- **Upload-set honesty reword (same day):** `00-HOW-THIS-WORKS.md`'s File Reference
  listed `tokens.css` and `brand-style-guide-template.html` as "used by Claude
  Design," but neither is in the 7-file upload set — Claude Design never receives
  them and builds the Style Guide/token file from Rule 7/9's in-playbook specs.
  Reworded the table rows (and added a note in Rule 7) to say so; added a File
  Reference row for `New Client Kit.command`. No behavior change. Script mentions
  added to the routing docs (`CLAUDE.md`, Stage 3, `PROJECT-INSTRUCTIONS.md` step 9,
  `NEW-COMPUTER-SETUP.md`) and a §11 appended to `HANDOFF-SUMMARY.md` — so a fresh
  Claude on any computer picks all of this up with zero re-explaining.

## The v12 upgrade pass — the Scarlet Macaw fork, Aug 31, 2026

This folder was created by duplicating `Claude Design August` in full (August remains
untouched, frozen as the working baseline) and running a research-driven upgrade pass
on the copy. Three parallel research passes fed it — the open-design/refero craft
layer, a GitHub design-system sweep (Anthropic frontend-design skill, Radix/USWDS/
Carbon color methods, Utopia/Open Props, hyperui, DTCG 2025.10), and 2025-26 CRO +
WCAG 2.2 evidence (Unbounce, Baymard, NN/g, Google/Deloitte, W3C). Full synthesis
with sources: `notes/SEPTEMBER-UPGRADE-PLAN.md`. Full change list:
`HANDOFF-SUMMARY.md` section 12 and `UPDATE-LOG.md` (2026-08-31 entry).

The one-line thesis all three passes converged on: **AI design quality comes from
explicit constraint, not more generation** — so v12 makes the bans explicit
(`CRAFT-RULES.md`, now file 8 of the upload set), the tokens mechanical (4-layer
`tokens.css` with fluid scales and accessibility tokens), and the quality gates
greppable (Rule 8b anti-slop scan, Rule 8c critique pass). Licensing was checked:
adapted material is Apache-2.0/MIT/CC0 or evidence-cited; AGPL sources contributed
ideas only, in our own words.

---

---
*Design Scarlet Macaw · consolidated Aug 14, 2026*
