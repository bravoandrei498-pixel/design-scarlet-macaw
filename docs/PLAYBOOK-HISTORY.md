# Design Scarlet Macaw — Master Playbook: Version History

This file holds the Master Playbook's stacked version changelogs and provenance notes, moved out of `02-MASTER-PLAYBOOK.md` to keep the working document lean. It is **builder-side reference only — not part of the client upload set.** The playbook itself carries only a one-line pointer here.

---

## Provenance note (carried from the v12 header)

The v12 playbook is Master Playbook v11's full rule set (Rules 1–23, Motion Contract, Build Compliance Audit, Build Lifecycle), carried forward verbatim. The prior "V3" system's `02-MASTER-PLAYBOOK.md` only had Rules 1–20 and was missing Rules 21–23 (Conversion Engineering, Revision & Verification Discipline, Asset & Data Ingestion) plus the Motion Tier/Character/Package system. The V1 system's own system-map file explicitly warns that **pasting** (rather than uploading) this playbook as text truncates around line 1055 and silently drops exactly that tail — Rules 21–23. That's the most likely explanation for why V3 was thinner: a past session probably built V3 from a truncated paste of v11, not a deliberate simplification. Nothing was rewritten or paraphrased from v11 in the v12 fork — only the provenance block and the title were new.

The system was consolidated Aug 14 2026 (a previous version of this system), then forked and upgraded to v12 on Aug 31 2026 as **Design Scarlet Macaw**.

---

## v12 changelog (Design Scarlet Macaw upgrades, Aug 31 2026)

*Source: three research passes (open-design/refero craft layer, GitHub design-system sweep, 2025–26 CRO + WCAG 2.2 evidence) synthesized in an internal upgrade plan. Rule count stays 1–23 on purpose — the Compliance Audit's "1→23" walk is unchanged; new material lands inside existing rules, in Rule 8's new sub-gates, and in the new companion file.*

- **`CRAFT-RULES.md` (new file, ⑧ in the upload set):** the universal, brand-agnostic craft layer — banned AI-default list (exact hexes), typography tracking table, three-weight system, color pixel-share budget + OKLCH authoring, the 80/20 soul doctrine + screenshot test, copy register (5th–7th grade, headlines <14 words), WCAG 2.2 floors, five content states, performance-as-design. The playbook keeps workflow/client rules; craft law lives there.
- **Rule 8b — Anti-slop P0 scan (new sub-gate):** greppable, binary checks (banned hexes, raw hex outside `:root`, emoji icons, invented metrics, filler copy, uniform-card monotony) run before every delivery. P1 judgment checks (one decisive flourish, headline length, CTA verb specificity) follow.
- **Rule 8c — Design Critique pass (new):** post-build 5-dimension scored critique (Philosophy / Hierarchy / Detail / Function / Innovation) with evidence-required scoring, worst-sustained-band discipline, and a **Keep / Fix / Quick-wins** output — the Keep list protects working elements across client revision rounds.
- **Rule 3f — copy register tightened:** short copy the system writes targets 5th–7th grade reading level (Unbounce 57M-conversion evidence); headlines <14 words; CTA labels say what happens.
- **Rule 7 — Style Guide gains section 16 · Agent Prompt Guide:** named colors with hex + role, 5 copy-pasteable component prompts with values inlined, and an iteration guide ("name the color, never say 'make it gray'") — turns the guide into ammunition Claude Design can quote.
- **Rule 21d — WCAG 2.2 made explicit:** target size ≥24px (§2.5.8), focus-not-obscured under sticky elements (§2.4.11), consistent help placement (§3.2.6), no redundant entry in multi-step forms (§3.3.7). WCAG 2.x ratios stay the hard gate (3.0/APCA is draft-only — verified Aug 2026).
- **`tokens.css` rebuilt on a 4-layer contract** (identity / structure / default / alias) with the declaration rule ("a pasted `:root` has no cascade — declare every token"), fluid `clamp()` type + section rhythm (endpoints unchanged, so Rule 13's numbers still hold), layered shadows, motion/easing tokens, and accessibility tokens (`--focus-ring`, `--target-min`). Role names unchanged.
- **Synthesizer + Brief upgrades** (see those files' own changelogs): GV personality sliders, the 8-dimension resolution vocabulary (mood/density/exclude), mandatory "dimensions resolved from defaults" footer, hex/font provenance rule, existing-site brand-extraction checklist, required Do/Don't list (≥8 each) in every Design Prompt.

## v11 changelog (new / changed rules)

- **⛔ MOTION CONTRACT (new, top of file):** an **enforcement layer** — hard motion minimums + a required output **Motion Manifest** + a numeric self-check. Added because v11's expression floor was being *ignored at generation* (a real build shipped flat with v11 loaded). Rules describe; the Contract enforces.
- **Rule 11 D4 / Rule 13 — motif vs texture (clarified):** **one *distinct* signature motif site-wide** (never multiple), deployed in **3–5 varied appearances on the homepage, 1–2 on internal pages**; "boring white space" is solved by **per-section background texture (Rule 13), not by adding motifs.** Motif = recognition; texture = richness.
- **Rule 10 — Hero Impact Standard (new):** the hero must clear a *quality bar* (≥3-layer composed depth, signature motif, motion, a stated ~3s attention hook) — a flat single-image hero is a fail — while the *arrangement* must vary per project. Raises the floor without templating. Mirrored in the Compliance Audit.
- **Rule 13 — Layering & stacking gotchas (new; graduated from Operating Log R5 + R6):** an `overflow:hidden`/`auto` ancestor silently breaks `position:sticky` (use `overflow:visible`, or `overflow-x:clip` for horizontal containment); overlay badges/labels need an explicit `z-index` + positioning context.
- **Rule 12 — packages reworked:** the **Tier-2 motion floor + the Compliance Audit ship in *every* package** (motion presence is never the upsell); budget scales signature ambition, bespoke/custom work, Tier-3 access, and page-suite breadth.
- **Rule 22d — Operating-Log loop closed:** every build now **ends by emitting the updated `Operating Log.md` + a "what changed" note** for re-upload, so lessons actually carry between sessions.
- **Best-in-class benchmark + vertical-excellence menu:** Rule 1a now requires benchmarking **3–5 best-in-class** sites in the vertical and picking **one signature** (raise the *ceiling*, not just the floor). Added **odometer count-up** + **video hero (mandatory pause control)** to the Motion Menu, a **hero proof-cluster** for trust verticals, and a restraint-first **vertical-excellence menu** (organic blobs + per-section accent · empathy-first copy · cohesive art direction · segmentation chooser · card hover-reveal + avatar cluster · editorial display flex · alt-channel CTAs + newsletter). *Source: teardown of 15 best-in-class mental-health / recovery sites.*
- **Rule 4 — Locked Preview Shell settings (copy-exact):** pinned the shell's exact values (default Split, 1280 desktop / 375×812 mobile frames, localStorage keys + defaults, top-bar toggle specs, `#E7E5E0` workspace, scroll-frame reset, scrollbar-hide) so Claude Design stops regenerating a different shell each build. Only label / page list / slug / brand-skin vary. *Extracted from a working reference preview shell.*
- **Field-dissection standards (from reviewing a live build):** **nav dropdowns/mega-menus mandatory** (no flat navs); **two-part / duotone headlines** on key headings; **hero capped at 2 stacked layers** (+ optional muted square; frame shape follows image shape — *reconciles the earlier ≥3 wording*); **single-line trust bar**; **services** = photo-forward + bullets + short copy, no icons-on-image, no decorative pills (button to Services page); **paired CTAs**; **team/services show 3–4 + a button**; **footer** always has social + address/phone/email icons; **batch-comment reconciliation** (Rule 22c). Most are now Compliance-Audit items.
- **⛔ BUILD COMPLIANCE AUDIT (new, top of file):** a mandatory **post-build, rule-by-rule self-scan** (Rules 1→23) that emits a **Compliance Report** flagging any unapplied rule; a page isn't deliverable while anything is flagged. Added because a real build deferred ingestion (Rule 23) and skipped the Pre-Export Gate (Rule 8) — shipping Lorem, placeholder images, icon-card services, a text logo, missing hovers/phone/Title-Case/Google-pill. Targets *deferral* directly: "done" now requires a clean audit, not just a page.
- **Rule 12 (motion model reworked):** motion now has **two dials** — **Tier** (amount) and **Character** (tone: Calm / Balanced / Expressive). A site can be motion-*rich* and still *calm*.
- **Rule 12 / Rule 11 (default flip):** **Tier 2 is the baseline for every build, every industry.** Tier 1 only when a brief explicitly asks; Tier 3 still needs sign-off. **Audience (Mindset-on-arrival in the Brief) can shift either dial** from the archetype's starting point.
- **Rule 12 (Motion Menu expanded):** added **breathing gradient field, kinetic headline, blur-to-focus reveal, pulse indicator, before/after slider**; added a **Tier-3 Signature shelf** (cursor-reactive glow, magnetic buttons, 3D pointer-tilt, WebGL/shader hero — opt-in, sign-off).
- **Rule 12 (packages):** **Essential / Professional / Signature** column maps budget → signature/custom motion scope (safety floor ships in all).
- **Rule 13 (relaxed):** the **2-stop gradient cap is removed** — taste governs; multi-color *animated* mesh reserved for ambient fields, text legibility still required. Added the **image `onerror` → gradient fallback** mechanism.
- **Rule 12 (new):** **Sensitive-vertical crisis resources** (988 + footer crisis box) — recommended default for recovery / mental-health / crisis builds; Character = Calm for those audiences.

## v10 changelog (new / changed rules)

- **Rule 12 (reworked):** the blanket motion ban becomes a **Motion Budget** — 3 hard floors (reduced-motion, no-CLS, never block hero→CTA) + a **3-tier budget** (1 conversion-first / 2 brand-forward / 3 experiential), an "earns-its-place" test, and choreography-over-ambient. Capped sibling-card **stagger** allowed on Tier 2+.
- **Rule 12 (added — expression floor + Motion Menu):** a per-tier **expression floor** (the *minimum* motion a build must ship — Tier 1: count-ups + full hover coverage + one ambient/parallax accent; Tier 2: + one signature motion) with a **ship-then-trim** bias, plus a named **Motion Menu** (count-up, marquee, ambient badge, scroll-progress, parallax band, lighting-up timeline, floating chips). Fixes the "passes every rule but ships flat" failure. New **Pre-Export Gate** check: *Motion presence*.
- **Rule 11 (new Decision 7):** Motion tier + signature moment is now an explicit per-direction decision; motion column added to the archetype table.
- **Rule 13 (changed):** **tiered shadow scale** (deep/cinematic allowed on dark Tier 2+ heroes; reconciles with `tokens.css`); **radius is goal-driven** (8–16px default, ~4px editorial for premium — consistency is the hard rule, not the number); **declared signature image frames/masks** allowed (ad-hoc frames still banned).
- **Rule 1 (changed):** Design Canvas directions hold **IA, section order, and copy identical** — vary only the skin (fair comparison).
- **Rule 21c (changed):** **self-host brand fonts** (woff2 + unicode-range) by default over hot-linking.
- **Rule 4 / 9 (clarified):** **Preview Shell for review → standalone single-file HTML for the approved/"graduated" final** (hybrid).
- **Rule 8b gate:** motion-budget checks added.
- **Top:** added the "How to read these rules" flexibility principle.

## v9 changelog (new / changed rules)

- **Rule 1 (changed):** added a 4th Design Canvas option — **Mix & Match** — letting the client combine elements across the three directions.
- **Rule 4 · Mobile dialog (changed):** full dialog spec (logo + × → accordion menu → faded motif → CTA → divider → address → phone → socials); **mobile must render at mobile width** (no desktop bleed/cutoff); **backdrop-filter corner-clip fix** so the scrolled nav never pokes past the phone's rounded corners.
- **Rule 10 · Nav (changed):** nav menu **centered by default** on all designs; **never include "Home"** in nav or footer — the logo links home.
- **Rule 12 (changed):** desktop dropdowns use **hover-intent** — they stay open while hovered and don't snap shut (invisible bridge between trigger and panel).
- **Rule 13 (changed):** **soft, muted palettes by default**; **Google-reviews pill** required whenever the business has Google reviews; **no custom icons beside meta/eyebrow text** (not dev-realistic); **background image on internal-page heros** sourced proactively from Unsplash/Pexels; **no orphan words** (breakpoint so 1–2 words never wrap alone); **no compounding spacing** (don't stack a margin on top of a grid/flex gap).
- **Rule 10 · Services (changed):** default to a **single Services/Treatments page**; build individual child service pages only when the client has substantial per-service content.
- **Rule 8 gate (changed):** added checks for button-title consistency, mobile-not-cutoff, orphan words, and mobile-dialog contents.
- **Rule 22 · Revision & verification discipline (new):** explain-then-fix protocol, a running change log, and the `/check` verification cadence (auto every 5 requests + manual).
- **Rule 7 (changed):** added a **Motif Gallery** Style-Guide section, built fresh per project from the design rules.
- **Rule 7 (redesigned):** full Brand Style Guide spec — fixed dark sidebar + numbered anchor nav, 15 sections (now includes the Motif Gallery), click-to-copy color scales, per-text-style typography specimens, and a **token-truth** rule (the guide imports the real CSS tokens so specimens are production styles, not copies). Resolves the long-standing "Style Guide needs a redesign" pending item. A built `brand-style-guide-template.html` ships alongside.
- **Rule 9 (changed):** projects now use **one shared CSS design-token file** imported by both the site and the Style Guide (no longer strictly single-file).
- **Rule 22d · Persistent Operating Log (new):** a standing cross-project lessons-learned log (`Operating Log.md`, in project knowledge) — consulted at grounding, distilled from per-build change logs, and the staging area from which universal lessons graduate into rules. Closes the loop: per-build log → Operating Log → playbook rules.
- **QA shift-left (new, from the launch QA sheet):** mobile nav ≤82px; **no dead `#` leaf links**; **variable-length dynamic content must not break layout** (the oversized-testimonial bug, Rule 18); **entrance animations must not cause CLS** (Rule 12). Handoff Spec now points to the launch-QA sheet as canonical rather than duplicating it.
- **Rule 4 (clarified):** the mobile-dialog spec is a **layout/order pattern only** — colors, type, and styling always come from the project's brand, never a reference site's theme.
- **Rule 13 (changed):** mobile section spacing scaled down (default **64px**, not 80) so mobile doesn't waste vertical space; long-form text capped to **~60–75ch** for readability; **body links use a theme accent + underline-on-hover, never default blue** (esp. child/service/post pages).
- **Rule 12 (changed):** **touch-friendly** rule — hover is an enhancement, never a requirement; no hover-only critical content.
- **Rule 23 · Asset & Data Ingestion (new):** resolves the "don't fetch" question — fetch **once, up front** in an explicit ingestion pass (logo, favicon, copy, business data/NAP, reviews, photography, stock candidates), then build only from that frozen asset set; **no ad-hoc fetching mid-build**. Centralizes the *what-to-gather* rules (3, 3e, 13, 15, 21b) under one *when/how* policy.

## v8 changelog (new / changed rules)

- **Rule 10 · Hero (new):** every hero must be eye-catching and high-impact (clear headline + primary CTA above the fold, strong focal visual; mobile leads with the visual) — but the *treatment* is a per-project Design Canvas decision, never a fixed shape. Principle, not a single look.
- **Rule 10 · Trust / Social Proof Bar (new):** *if used*, keep its items grouped and readable — a flexible readability guideline, not a fixed measurement.
- **Rule 12 (changed):** section-level CTAs ("View all…", "All locations") render as **buttons**, not inline text links. Inline `Link` is reserved for CTAs inside prose.
- **Rule 13 · Color (changed):** CTA banners may use a **background image with a theme-color overlay** (dark anchor *or* another on-theme color), not only a flat dark fill — overlay must preserve text legibility.
- **Rule 13 · Photography (new):** portrait/team photos are face-safe — portrait aspect ratio + `object-position: center top`, never a short landscape crop that clips the face.
- **Rule 8 · Pre-Export Gate (new):** the mid-build audit is now a two-stage gate with a blocking pre-export checklist that verifies playbook compliance before every delivery.
- **Rule 20 · Section intent & conversion psychology (new):** a reference layer giving every section its job, the fear it removes / desire it builds, the done-wrong failure, and how it's perceived — so sections are built with intent, not just placed. Pricing and How-it-works flagged conditional for service-business clients.
- **Rule 21 · Conversion Engineering (new):** the layer that makes a page arrive, load, work for everyone, and convert — goal-per-page (21a), SEO/local/schema (21b), performance/Core Web Vitals (21c), accessibility/WCAG AA (21d), and conversion-grade forms (21e). Verified in the Rule 8b gate.
- **Folds (changed):** Rule 3 adds conversion-copywriting principles (3f); Rule 12 adds the "one primary action per page" CTA strategy; Rule 20 adds risk-reversal & urgency levers.
- **Companion (new file):** *Design-to-Dev Handoff Spec* covers deploy-time conversion items (analytics, form backend, perf/SEO verification, legal, QA) that live outside the design previews — including the post-launch optimization loop (operations, not design).
- **Rule 1 (changed):** added a grounding step before the canvas (asset readiness, live-site audit, competitor/reference scan, differentiation angle — 1a) and a direction-evaluation rubric so Claude recommends the strongest direction, not just presents three (1b).

> *Pending improvements: (resolved in v9) Brand Style Guide page redesigned — see Rule 7 + `brand-style-guide-template.html`.*

---

*Design Scarlet Macaw · Master Playbook version history*
