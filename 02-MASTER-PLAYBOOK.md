# Design Scarlet Macaw — Master Playbook (v12)

---

Design system rules. Apply to every project. Load alongside the Project Brief when starting any build.

**Last updated: v12.** Version history: see `docs/PLAYBOOK-HISTORY.md` (builder-side; not part of the upload set).

### Build Lifecycle — read first (when a project comes in)
**Inputs to load:** ① the Design Prompt (synthesized from the filled Project Brief) · ② this Master Playbook · ③ `03-COMPONENT-LIBRARY.md` · ④ `04-CONVERSION-PLAYBOOK.md` · ⑤ the matching industry playbook · ⑥ `SECTION-LAYOUT-LIBRARY.md` · ⑦ `OPERATING-LOG.md` · ⑧ `CRAFT-RULES.md` *(universal craft layer)*. All eight travel as **uploaded files, never pasted** (Golden Rule, `00-HOW-THIS-WORKS.md`). The motion system (Menu, Character, Tier-3 shelf, packages) lives inside this playbook. This is the one canonical upload set — stated identically here, in `05-PROMPT-SYNTHESIZER.md`, `00-HOW-THIS-WORKS.md`, and `PROJECT-INSTRUCTIONS.md`.

1. **Set the two motion dials** *(Brief → Rule 12).* Tier defaults to **2**; **Character** comes from the Brief's *Mindset-on-arrival* (in crisis → Calm · aspirational → Expressive · comparison-shopping → Balanced); audience may shift either dial (log a one-line why). Pick the **package** (Essential / Professional / Signature).
2. **Ingest assets up front** *(Rule 23).* Logo, colors, real photos, reviews, stock candidates — now, not mid-build. Flag the crisis-resource requirement if it's a recovery / mental-health / crisis vertical.
3. **Design Canvas** *(Rules 1 + 11).* Three directions, identical IA/copy, vary only the skin; run the seven decisions (Decision 7 = **Tier + Character + signature moment**); Mix & Match.
4. **Pick a direction → Brand Style Guide** *(Rule 7).* Built as you go; document every motion pattern's timing/easing for site-wide consistency.
5. **Build the pages** *(Rules 10 + 12).* Preview Shell → standalone final. **Satisfy the MOTION CONTRACT above and emit the Motion Manifest** — bare reveals + hover is a fail; Tier-3 shelf only on a Signature package.
6. **Run the BUILD COMPLIANCE AUDIT** *(top of file + Rule 8).* Walk rules 1→23 against the actual page, emit the **Compliance Report**, and **fix every flag before showing the reviewer.** This is the step that was being skipped.
7. **Roll lessons into the Operating Log** *(Rule 22).*

### ⛔ MOTION CONTRACT — read before you build, verify before you export
*This is the **enforcement layer**, placed at the top on purpose. The expression floor (Rule 12) kept getting ignored when it lived buried and passive — a real build (a June 2026 chiropractic build) shipped 0 keyframes and 0 scroll motion even with the full playbook loaded. This block is the **active gate**: a build that fails it is **not finished**, regardless of how good the layout and copy are.*

**Default is Tier 2. Every build MUST ship, at minimum:**
1. **≥ 2 ambient/continuous `@keyframes`** (marquee, breathing gradient field, ambient badge, floating accent). **Zero `@keyframes` = automatic fail.**
2. **≥ 1 scroll-linked effect** (parallax band, scroll-progress bar, or lighting-up timeline) — needs a scroll listener or CSS `scroll-timeline`.
3. **Count-up on EVERY real stat / number block.**
4. **Hover feedback on EVERY interactive element** — cards, links, images, inputs, *not just buttons*.
5. **Scroll reveal** on every major section (fade + rise).
6. **One signature moment** as *actual motion* (kinetic hero, before/after slider, cursor/parallax hero) — matched to the Character dial.
7. **All of it gated by `prefers-reduced-motion`.**

*(Character sets the **tone**, never waives the **presence**: a Calm site hits these with a slow breathing field + gentle marquee + soft reveals. Quantity is mandatory; gentleness is the dial.)*

**Required: emit a MOTION MANIFEST in the output.** Before export, write a comment just above `</body>` listing the patterns you actually deployed and their counts, e.g.:
`<!-- MOTION MANIFEST · Tier 2 / Calm · section-reveal ×8 · count-up ×4 · marquee ×1 · parallax-band ×1 · scroll-progress ×1 · kinetic-hero ×1 · breathing-field ×1 · hover-coverage: all interactive -->`
If your manifest would read only "reveal + hover," **you have failed the expression floor — stop and add motion before exporting.** The manifest is also what the Pre-Export Gate (Rule 8) and the reviewer check.

**Numeric self-check (run it, literally count):** `@keyframes` ≥ 2 · scroll-driven effects ≥ 1 · count-ups = number of stat blocks · hover states = number of interactive elements. Any line below the threshold → **not done.**

> Full specs for every pattern live in **Rule 12 (Motion Menu + Tier-3 shelf)**. This contract just makes shipping them non-optional.

### ⛔ BUILD COMPLIANCE AUDIT — scan every rule before you deliver
*The second enforcement layer (with the Motion Contract above). The recurring failure is **deferral**: the builder ships a scaffold (Lorem, placeholders, icon cards, text logo) and skips the rules it intends to "apply next pass." Fix: before **any** page is shown to the reviewer, walk the playbook **rule by rule (1 → 23)**, inspect the built output against each, and emit a **Compliance Report**. A page is **not deliverable** while any rule is flagged.*

**How to run it (every page, before delivery):**
1. Go through Rules **1–23 in order.** For each, check the *actual built output* against the rule and mark **✅ applied · ⚠️ partial · ❌ missing · N/A** with a one-line note.
2. Emit the **Compliance Report** (format below) alongside the page.
3. **Fix every ❌ and ⚠️ before showing the reviewer.** If a deviation is deliberate (per "How to read these rules"), say so explicitly — a *silent* omission is a failure, not a judgment call.

**High-recurrence items — explicit `❌-if-missing`, do not skip:**
- Real **logo, copy, photos, and reviews fetched from the live site** and actually used — **no Lorem / gradient placeholder / icon-card / text-logo when a live site exists** *(Rules 23, 3, 13)*.
- **Hover states on EVERY interactive element** — navbar links, announcement-bar links, footer links, cards, images — not only buttons *(Rule 12)*.
- **Nav phone number present** · **section CTAs are buttons** ("Explore our services" = button, not a text link) · **all H2s in Title Case** · **key headlines use the two-part / duotone treatment** *(Rules 12, 13)*.
- **Nav has working dropdowns / mega-menus** on items with sub-pages — never ship a flat nav with no sub-menus *(Rule 12)*.
- **Google-reviews pill uses the real Google logo**; use **real Google reviews when available** *(Rule 13)*.
- **Services are photo-forward with real images** (**no auto-generated icons sitting on the image**), each card with a **short description + bullets**; **no decorative pills under services** — that slot is a **button to the Services page** *(Rules 11, 13)*.
- **Hero clears the Hero Impact Standard** — composed depth (main image **+ one** companion layer + optional muted square; **frame shape follows image shape**), **never a flat single photo, never 3 stacked elements**; carries the motif, has motion + a stated ~3s attention hook, and is composed *differently* from prior builds *(Rule 10)*.
- **Single-line trust bar** (not a fat block) *(Rule 10)*.
- **Trust / sensitive-vertical checks:** trust verticals carry a **hero proof-cluster** (rating + avatars + 2–3 stats); sensitive verticals **lead with empathy + crisis resources**; photography is **one cohesive art-directed system** (not mixed stock); the build commits to **one signature**, not every pattern at once *(Rules 1a, 10, 12, 13)*.
- **Preview Shell has the Desktop / Mobile / Split toggle (default Split); mobile renders inside the 375 × 812 iPhone-X frame** *(Rule 4)*.
- **Footer has complete business detail** — phone + address per location, plus **social icons** and **icons on address / phone / email** *(Rule 10)*.
- **Every page in the brief is built**, including **child service pages** when the brief lists per-service content *(Rules 2, 10)*.
- **Motion Manifest present and passing** (Motion Contract above).
- **Anti-slop P0 scan passes** (Rule 8b) — no banned accent hexes, no purple-gradient hero, no emoji icons (footer contact rows excepted, per 8b), no uniform-rounded-card monotony, no Inter/Roboto-by-default *(CRAFT-RULES C1)*.

**Compliance Report — emit this with each page:**
```
COMPLIANCE AUDIT — [Page] · Tier [n] / [Character] · [date]
R1 Canvas ✅ · R3 Copy verbatim/no-Lorem ✅ · R4 Shell+Split+iPhoneX ✅ · R8 Gate ✅
R10 Sections + all brief pages ⚠️ (child service page pending) · R12 Motion Manifest ✅
R13 TitleCase / Google-pill / photo-forward / hover-all / real-images ❌ (icon cards used)
R23 Ingestion ❌ (logo + copy not pulled from live site)
… (continue through all 23) …
FLAGGED → fix before delivery: R13 icon cards→real photos · R23 fetch logo+copy · R10 build child page
```
A report that is **all ✅** (or ✅ / N-A with stated, deliberate deviations) is the **only** definition of "done."

**Compliance Report — checkbox format (use when the shorthand line above isn't scannable
enough, or when a human is going to visually skim the report).** A purely narrative audit
gets skipped under deadline pressure; one checkbox per rule, blank until literally
checked, makes skipping visible instead of silent — same content as the shorthand format
above, just one line per rule.
```markdown
## COMPLIANCE AUDIT — [Page Name] · Tier [n] / [Character] · [date]

- [ ] R1  Canvas grounded (3–5 competitors studied, differentiation angle stated)
- [ ] R2  [N/A or applicable rule note]
- [ ] R3  Copy verbatim from brief/live site, or flagged Lorem — zero invented prose
- [ ] R4  Preview Shell: Split default, 375×812 mobile (iPhone X frame), 1280 desktop
- [ ] R5  [N/A or applicable rule note]
- [ ] R6  [N/A or applicable rule note]
- [ ] R7  Brand Style Guide built (if this is the first page of the build)
- [ ] R8  Pre-Export Gate passed — every item in 8b checked
- [ ] R9  Output format correct (React JSX / Babel-inline, or brief's format override)
- [ ] R10 All required sections present, nav → footer, no omissions; Hero Impact Standard cleared
- [ ] R11 7 Design Language decisions committed and consistent with the chosen direction
- [ ] R12 Motion Contract satisfied; Motion Manifest emitted and passes the numeric self-check
- [ ] R13 No orphan words, no compounding spacing, soft/muted palette, Title Case H2s, real Google-review pill
- [ ] R14 [N/A or applicable rule note]
- [ ] R15 [N/A or applicable rule note]
- [ ] R16 [N/A or applicable rule note]
- [ ] R17 8pt grid respected; spacing tokens used, not arbitrary values
- [ ] R18 [N/A or applicable rule note]
- [ ] R19 [N/A or applicable rule note]
- [ ] R20 Section intent honored — every section built with its declared job / conversion-psychology role (Rule 20)
- [ ] R21 One conversion goal per page; CTA label matches goal; schema/NAP consistent (Rule 21b/c)
- [ ] R22 Revision & verification discipline followed; Operating Log consulted for this build and updated if a new lesson surfaced
- [ ] R23 Asset ingestion complete — logo, copy, photos, reviews pulled from live site where available

**FLAGGED ITEMS (❌ or ⚠️ above — one line each):**
- [ ] Fix: ___
- [ ] Fix: ___

**STATUS:** [ ] PASS — all ✅ or stated deliberate N/A   [ ] FAIL — fixes required before delivery
```
Fill in the rule-specific note for any row marked `[N/A or applicable rule note]` above
based on what that rule actually covers for this build — the numbered list mirrors Rules
1–23 as they exist in this file, not a fixed universal checklist.

### How to read these rules
These rules are **quality-and-conversion guardrails and sensible defaults — not creativity-killers.** The goal is always: **beautiful sites that convert.** Web design is contextual, and the right value (spacing, radius, depth, motion) varies with the brand and the goal. So: stay within the **hard floors** (accessibility, no-CLS, don't block the conversion path, the 8pt grid, one-source-of-truth consistency), and within those, **use judgment and be creative.** When a default doesn't serve the goal, deviate **deliberately** and note why. A rule you're following blindly against the design's interest is being misread.

---

## WORKFLOW RULES — read first

These are global behavior rules. Apply on every project.

---

### 1. Start in a Design Canvas

#### 1a. Ground before the canvas — gather inputs, study the landscape
Before laying out directions, do a short grounding pass and note it in the build log (2–3 lines):
- **Asset & content readiness** — run the **ingestion pass (Rule 23)**: gather logo, favicon, photography, copy, reviews, hours, contact/NAP, brand colors/fonts in one pass and save them to the project. Flag what will be placeholder so the first draft isn't a surprise. After this pass, the asset set is frozen — no ad-hoc fetching later.
- **Live-site audit** — per Rule 15, capture identity sections to preserve and any brand cues worth carrying forward or improving.
- **Reference & best-in-class benchmark** — study the client's "sites they like" (brief) **plus 3–5 *best-in-class* sites in the client's vertical** (the best examples anywhere, not just local competitors). Extract their patterns: section spine, proof strategy, signature motion, type/colour system, art direction. Note the **industry default** so Decision 4's signature can deliberately break from it. **Then pick ONE signature flex for this build and keep everything else restrained** — the best sites in every vertical commit to a single editorial move (a type flex, a colour/blob system, an odometer, a video hero) and stay quiet elsewhere; maxing every pattern at once reads busy, not premium. Benchmarking the best shelf *before* building is a standing step — it's how we raise the ceiling, not just the floor.

  **Competitive Analysis table** — the table below makes the output of the 3–5-site
  scan a concrete artifact, not just a mental note. Fill one row per site studied; keep
  it in the build log.

  | Site URL | What They Do Well | What We Do Differently | Risk of Looking Similar |
  |---|---|---|---|
  | [best-in-class site 1] | [strongest pattern worth noting] | [how this build's direction diverges] | [Low/Medium/High — and why] |
  | [best-in-class site 2] | | | |
  | [client's "sites they like," if given] | | | |

  A row with "Risk of Looking Similar: High" and no stated differentiation is a signal
  to revisit the differentiation angle below before laying out directions, not to ignore
  it and proceed.

  **Reference Kit — 15 minutes, internal only, before the Canvas.** Three external
  sources confirmed useful for exactly this benchmark step. Internal-only by design —
  client-facing homework (e.g. asking a doctor/lawyer/CEO to browse Pinterest) adds
  friction the brief was built to avoid, so this stays entirely on the builder's side.

  **Who runs it: the Synthesizer (your Claude Project), during Synthesis — never Claude
  Design at build time.** Claude Design cannot browse these sites; its own benchmark
  step in the Design Prompt runs from training knowledge and *supplements* this kit, it
  doesn't repeat it. The kit's findings reach the build through the Design Prompt
  (differentiation angle, named signature target, quality-bar notes).

  1. **Quality bar — [styles.refero.design](https://styles.refero.design)** (~5 min).
     Find one shipped site in the client's register and open its DESIGN.md. It gives a
     token-level definition of "good" — a one-line thesis, every color with a role *and*
     an explicit prohibition, exact type-scale numbers — calibrated against a real site,
     not an average instinct. Feed the *ambition level and structure* into the Canvas;
     don't copy the actual tokens.
  2. **Industry default — [mobbin.com](https://mobbin.com)** (~5 min). Scan the
     category/flow that matches the client's vertical to see what everyone's hero/nav
     actually looks like right now — the fastest way to see the default this build's
     signature (Decision 4) is supposed to deliberately break from, instead of guessing.
  3. **Signature moment — [ui.aceternity.com](https://ui.aceternity.com)** (~5 min).
     Browse for a named motion concept (text-flip board, parallax cards, a scroll
     reveal) to turn "some cool scroll thing" into a precise target for Rule 11
     Decision 7 — one signature moment, named before the build starts.

  Log which references were used per step in the build log (2–3 lines is enough — a URL
  and what was taken from it). This kit informs the Canvas; it never gets pasted or
  copied wholesale into the build — Rule 9's single-file output format and this
  playbook's rules still govern what ships.
- **Per-page conversion goal** — confirm each page's one primary goal (Rule 21a); directions are judged against it.
- **Review the Operating Log** (Rule 22d) — scan the recurring root causes and operating preferences so known mistakes aren't repeated and known preferences are honored from the first draft.

Output a one-line **differentiation angle** the directions will explore (what makes this site not look like every competitor).

Lay out **3 distinct directions** side-by-side on a pan/zoomable canvas. Each direction explores different color, type, and visual treatment.

**Hold the variables steady.** Across the directions, keep **information architecture, section order, and copy identical** — vary only the *skin* (type, color, depth, motion, signature element). A fair comparison isolates *design*, so the reviewer can tell what actually changed the feel. Changing structure and copy too makes it impossible to know what worked.

**Each direction must lead with a one-sentence positioning thesis** explaining who it's for, why it works for them, and what signal it carries. Example:

> Direction A · Old Counsel
> *For clients who associate authority with tradition and gravitas.*

**Each direction must explicitly commit to all 7 Design Language decisions (Rule 11):** typography personality, services section treatment, section contrast rhythm, signature element concept, photography direction, color palette, and **motion tier + signature moment**. State each decision by name under the direction thesis before showing the visual.

Use real content from the brief where possible. Let me compare and pick the strongest direction before building further.

Do NOT skip the Design Canvas step unless I explicitly say *"Use the Preview Shell from the start."*

#### 1b. Recommend the strongest direction — don't just present three
After laying out the directions (and the plain-English summaries per Rule 16a), **state a recommendation** with a one-line reason (Rule 6 framing). Judge them against a quick lens:
- **Goal fit** — best serves the page's declared conversion goal and audience (Rule 21a)
- **Differentiation** — most distinct from the industry default found in grounding (1a)
- **Brand fit** — matches the client's identity, voice, and the feeling they want
- **Feasibility** — builds cleanly within the system (Rules 10–21) with no bespoke hacks

Example: *"My pick is B — it's the most distinct from the three competitors we looked at while still feeling trustworthy, and it drives the consult booking hardest."* The client always makes the final call.

#### 1c. Always offer a 4th option — Mix & Match
Alongside the three directions, always offer a **4th "Mix & Match" option**: the client can combine elements across A/B/C (e.g. "type from A, palette from B, the services treatment from C"). Present it as an explicit invitation, not an afterthought — most clients don't realize they're allowed to mix. When they choose it, restate the combined set of 7 Design Language decisions (Rule 11) before building so the blend is explicit and consistent.

**Mix & Match Reconciliation Protocol** — some combinations of the 7 Design Language
decisions (Rule 11) don't sit together cleanly; this protocol says what to do when the
client's mix creates a conflict, instead of silently picking one side.

When the client's requested mix creates a conflict between two decisions, resolve it in
this order and say out loud which rule you applied:

1. **State the conflict plainly before building.** Don't silently drop one side of the
   client's request — tell them what doesn't combine cleanly and why, in one sentence.
2. **Motion tier/character always follows the direction the client leads with**, even if
   other elements (palette, typography) come from a different direction — motion is the
   most expensive element to partially blend and looks broken if inconsistent within one
   page.
3. **The signature motif (Rule 11 Decision 4) travels with whichever direction supplies
   the hero treatment** — a motif designed for one hero composition rarely reads
   correctly grafted onto another direction's hero shape.
4. **When two directions' palettes are combined, the darker/higher-contrast one wins for
   text and functional color** (buttons, links, focus states) — accessibility contrast
   (Rule 21d / WCAG 2.2) is never relaxed to accommodate a blend.
5. **When still unresolved after 1–4, default to the recommended direction from Rule 1b**
   for the conflicting element, and note the substitution to the client in one line.

**Common conflict matrix:**

| Client asks to mix... | Likely conflict | Resolution |
|---|---|---|
| Palette from A + typography from B | Type weight/size tuned for A's contrast ratios may not read the same on B's palette | Re-verify contrast (Rule 21d) against the new palette; adjust weight, not the palette |
| Motion tier from A (e.g. Signature) + section layout from B (built for Essential) | B's layout may not have the compositional depth Signature-tier motion expects (parallax layers, staggered reveals) | Add the missing depth to B's layout rather than downgrading the motion tier — or flag to the client that this combination needs light rework |
| Hero from A + signature motif from B | Motif shape/placement designed for a different hero composition | Adapt the motif's placement to A's hero shape (Rule 10's Hero Impact Standard); never force A's hero into B's shape just to fit the motif |
| Services treatment from A + Trust Bar styling from B | Card/surface treatments (shadow, radius, border) may not match between the two, reading as two different design systems on one page | Apply Rule 17's 8pt-grid/token system uniformly across both — surface treatment (shadow, radius) always normalizes to one direction's tokens, never mixed per-section |

---

#### 1d. Bespoke Exception Protocol — when the client needs something outside the system
*(Every rule in this playbook says "never omit," "always include," "mandatory." None of
them account for a client genuinely needing something outside the system — a custom
calculator, an interactive map, a 3D product configurator. Without a protocol, that
request either gets awkwardly forced into an existing component or built ad-hoc with no
record of the trade-off it cost.)*

When a client request doesn't map to anything in `03-COMPONENT-LIBRARY.md` or the
matching industry playbook's Tier 2 unlocks:

1. **Flag it as bespoke** in the build log — don't quietly fold it into an existing
   section type it doesn't actually match.
2. **State a one-line business justification** for why it's worth the deviation, e.g.
   *"Mortgage calculator increases lead quality — visitors who complete it are
   pre-qualified before they ever fill out the contact form."* If there isn't a
   real justification, that's a signal to push back on the request rather than build
   it silently.
3. **Estimate the complexity cost** in plain terms — will this consume a meaningful
   share of the build effort relative to the rest of the site? Say so explicitly if
   yes, so it's a visible trade-off, not a hidden one.
4. **Get explicit sign-off on the trade-off** before building — e.g. "this bespoke
   feature means less iteration time on the standard pages" — the reviewer/client
   confirms they want that trade before it's built, not after.
5. **Document the bespoke component in the Brand Style Guide (Rule 7) as an explicit
   one-off variant** — labeled as bespoke, not presented as if it were a standard
   library component other projects should reuse without the same justification pass.

This protocol doesn't relax any other rule (Rule 8's Pre-Export Gate, the Motion
Contract, accessibility floors) — the bespoke element still has to pass those. It only
governs *whether and how* something outside the standard component set gets added.

---

### 2. Build the chosen direction in a Preview Shell

Once I pick a direction, collapse into a Preview Shell and build all required pages per the section stacks in Rule 10.

---

### 3. Copy discipline — never invent content

- If copy exists on the live site → **use verbatim**
- If copy is in the brief → **use verbatim**
- If copy is missing → **use Lorem Ipsum** (standard *"Lorem ipsum dolor sit amet, consectetur adipiscing elit…"* from loremipsum.io, varying length to match the slot)
- Replace numeric placeholders too: invented stats become `00+`, `000+`, `$00M+`, `00%` — never make up plausible-looking numbers
- Never write plausible-sounding prose and pass it off as real
- Mark structural elements that need a real label clearly so reviewers know to replace
- **Real data is fine:** addresses, phone numbers, staff names, credentials, testimonials, service area cities — anything on the live site or in the brief

#### 3a. Trimming live copy is allowed
- You may shorten or restructure live-site copy for design fit (e.g. drop a leading company prefix from an H1, split a long paragraph for layout)
- Do NOT change the meaning or add words that weren't in the original
- When trimming, note it in the response so the reviewer can confirm the restructure matches their intent

#### 3b. Cross-source splicing = invented
Combining fragments from different live pages or sections counts as invention. Use Lorem instead.

#### 3c. Be transparent after every meaningful edit
Briefly note: what was trimmed / invented / used verbatim, why one option was chosen over another (when applicable), and what's still placeholder. Avoids surprises when reviewing later.

*Exception:* Headings, button labels, eyebrows, and short section titles may use short Lorem phrases when the live site doesn't provide one — still no invented prose.

#### 3d. Child service page copy — strict rule
If copy exists on the child service page of the live site, use it verbatim. Do NOT add, invent, or supplement any content beyond what is there.

Content hierarchy on child pages must follow:
- **H1 in the hero section only** — the page/service name
- **H2 and H3 in the body content only** — section headings from the live page copy
- Never use H1 anywhere outside the hero

If the child page has no copy at all, use Lorem Ipsum per Rule 3 and flag it clearly for the reviewer.

#### 3e. Logo — do not touch
Always use the logo from the live site exactly as-is, **fetched during the ingestion pass (Rule 23)** — not ad hoc mid-build.

Do NOT recreate, redraw, recolor, resize disproportionately, or modify the logo in any way unless explicitly instructed.

Place it in both the nav (light or dark variant as appropriate) and the footer. If the live site provides separate light and dark logo variants, use each in the correct context.

If no logo is available from the brief or live site, use a **text lockup placeholder** — never generate or design a logo.

#### 3f. Conversion copywriting — for the copy you *are* allowed to write
This applies only to the items Rule 3's exception permits (headlines, eyebrows, button labels, short section titles) — never to body prose, which stays verbatim or flagged Lorem. When you do write those short pieces:
- **Clarity over cleverness** — a confused reader never converts
- **Benefit-led, not feature-led** — say what the visitor gets, not what the thing is
- **Specific beats vague** — "Same-week appointments" over "Fast service"
- **Strong, specific action verbs on CTAs** — "Book Your Consult," "Get My Quote." Never "Submit," "Click Here," or "Learn More" on a primary CTA
- **Scannable** — assume the visitor skims; front-load the point
- **Write at a 5th–7th grade reading level** — pages at that level convert at 11.1% vs 5.3% for college-level copy (Unbounce, 57M conversions). Cut 3+-syllable words where a short word does the job. **Headlines <14 words.** Full register rules: `CRAFT-RULES.md` C5. When *client-supplied* copy reads college-level, flag it as a conversion risk in the handoff — never rewrite it silently (Rule 3 still governs)

---

### 4. Preview Shell — required structure

- Sticky top bar with project label, viewport toggle (Desktop / Mobile / Split — **default Split**), and page picker
- Each viewport rendered inside its own `<PreviewFrame>` component
- Each PreviewFrame wrapper must carry `data-viewport="desktop"` or `data-viewport="mobile"` so inline review comments can be routed to the correct viewport without the reviewer having to specify it manually
- Each frame has its own scroll container (independent scroll)
- Mobile fixed at **375 × 812** (iPhone X) inside its frame
- Desktop at **1280px** width
- Each viewport's sticky elements (nav, CTA bar) detect scroll on their **own** container, not window
- **localStorage persists** last page + viewport across reloads (don't dump back to Home + Split after every edit)
- Both viewports must maintain content parity (all sections, copy, CTAs present in both) and match colors, typography, and interactive states

#### Locked Preview Shell settings — copy-exact, do NOT re-invent per build
*Extracted verbatim from a proven working preview shell. Use these exact values on every build so the shell is identical across projects — **only the project label, page list, localStorage slug, and the rendered pages' brand/skin change.** The recurring problem was Claude Design regenerating a different shell each time; this pins it.*
- **Framework:** one `Component` (DCLogic) wraps all pages; each page renders per-viewport via `dc-import name="<Page>" viewport="desktop|mobile"`; pages declared in a `PAGES` array.
- **State + persistence:** keys `PAGE_KEY = '<slug>_shell_page'` and `VIEW_KEY = '<slug>_shell_viewport'` (e.g. `acme_shell_page` / `acme_shell_viewport`). On load, restore saved page + viewport; **defaults `page = 'home'`, `mode = 'split'`.** Valid modes: `['desktop','mobile','split']`. `setPage` / `setMode` write to localStorage.
- **Top bar:** project label (14px / 700) + a direction subtitle (12px — e.g. *"Direction A · Warm Modern Clinic — Preview"*) + **page picker** (the `PAGES`) + **viewport toggle** (Desktop / Mobile / Split: `padding 6px 14px · radius 6px · 13px/600 · transition all 200ms ease-out`, active state swaps bg/color). **Split is the default.**
- **Workspace shell:** background `#E7E5E0`, `overflow: hidden`, body font `'Source Sans 3'`.
- **Desktop frame:** `data-viewport="desktop"`, render width **1280px** (frame `max-width: 1320px`), label **"DESKTOP · 1280"** (11px / 700, letter-spacing .1em, `#7A746A`). White card, `border-radius: 12px`, `box-shadow: 0 8px 40px rgba(30,30,25,0.14)`.
- **Mobile frame:** `data-viewport="mobile"`, fixed **375 × 812** (iPhone X), label **"MOBILE · 375 × 812"**, same white card / radius / shadow.
- **Independent scroll:** each frame is a `data-scroll-frame` container; **on page change, reset every `[data-scroll-frame]` to `scrollTop = 0`.** Hide scrollbars via `[data-hide-scroll]{ scrollbar-width:none; -ms-overflow-style:none }` + `[data-hide-scroll]::-webkit-scrollbar{ display:none }`.

#### Mobile hamburger menu — required behavior
- The hamburger icon in the mobile nav must be fully clickable within the Preview Shell
- Clicking it opens a **full mobile dialog menu** — a slide-in (≈85% width, page peeks behind) or full-screen overlay panel, not a dropdown
- The hamburger icon animates on open/close (morphs to ×, or rotates)
- The mobile dialog menu must be scrollable if content overflows the viewport height
- Tapping outside the dialog or pressing the × closes it

**Required dialog contents, in this order (top → bottom):**
1. **Logo** (left) + **× close** (right), on one row
2. **Primary nav links** as an **accordion** — items with children show a `+` icon that expands them in place (never a separate dropdown here)
3. **A faded decorative motif** behind the menu (low opacity, from the project's Motif Gallery per Rule 7) so the panel isn't a bare list
4. **Primary CTA button**, full width (e.g. "Contact Us →"). This is **not** redundant with the sticky mobile bar — when the dialog is open it covers that bar, so the dialog needs its own CTA
5. **Divider** (thin rule)
6. **Address(es)** with a pin icon
7. **Phone** with a phone icon (click-to-call)
8. **Social icons** row
- Never include a "Home" link in this list (Rule 10) — the logo links home
- **This is a layout/order pattern only.** Colors, type, and styling always come from the project's own brand (dark panel = the project's dark-anchor color, not any reference site's theme). We standardize the *arrangement*, never another site's visual identity.

#### Mobile must render as mobile — no desktop bleed
- The mobile frame renders the **mobile layout** at 375px width, not a shrunk desktop. Content must never overflow or get cut off at the frame edge — verify nothing clips horizontally.

#### Backdrop-filter corner-clip fix (bug-prevention)
When the mobile nav gains a blurred/`backdrop-filter` background on scroll, the filter creates a new stacking/clipping context that **breaks the phone frame's rounded-corner clipping**, so the nav's square corners poke outside the screen. Prevent it by one of:
- Give the sticky nav the **same border-radius as the frame's top corners** (and clip it), or
- Apply `overflow: hidden` + matching radius on the scroll container so children are clipped, or
- Avoid `backdrop-filter` on the nav and use a solid/translucent background color for the scrolled state instead.

#### Mobile scrollbar — hide it
Remove the visible scrollbar on the mobile viewport frame:
- `scrollbar-width: none` (Firefox)
- `-ms-overflow-style: none` (IE/Edge)
- `::-webkit-scrollbar { display: none }` (Chrome/Safari)

Apply to the **mobile** PreviewFrame scroll container only — not the desktop frame.

---

### 5. Viewport ambiguity

When an inline comment targets an element that exists in both desktop and mobile, **read `data-viewport` from the DOM ancestry** to determine which viewport the reviewer clicked. Apply the change to that viewport only. If `data-viewport` is missing or ambiguous, ask before changing anything.

---

### 6. Ambiguous design decisions — ask first

When facing a choice between two valid design options (e.g. alternating vs uniform cards, light vs dark section treatment, button hover behavior), **ask before building**. Don't pick one and wait for revision.

Frame the question concisely:
> "Should the cards alternate (option A) or be uniform (option B)? Quick recommendation: B, because all items are equal weight."

---

### 7. Live Brand Style Guide — built as you go, not after

The Brand Style Guide is a dedicated page, **created immediately after the Design Canvas direction is picked** — not at the end. Build it as a **single HTML file** from the standard template (`brand-style-guide-template.html`). *(That template file stays builder-side and is never uploaded to Claude Design; this rule's spec — the exact layout below and the 16-section list — is the version that travels, inside this playbook. Build from this spec; the HTML file is the reference implementation for humans.)* It is a **living document**: every component or pattern used anywhere on the site must map to a variant documented here, and **new patterns get added here before production use**.

**Token truth — render specimens with production styles, not copies.** The guide **imports the project's real CSS token file** (the shared design tokens per Rule 9) so every specimen renders with the actual production styles. Never hand-copy values into the guide — if it imports the tokens, the guide can never drift from the live site.

#### Layout (exact)
- **Two-column shell.** A **fixed dark sidebar** on the left (~240px, dark-anchor color, full viewport height) containing: the **brand logo** at top, a small **kicker** ("Style Guide · [Direction name]"), then a **numbered vertical anchor-link nav** listing all 16 sections (`01 · Brand & Voice` … `16 · Agent Prompt Guide`), each linking to its section.
- The **content column** on the right scrolls; each section is a generously padded block (~64px), separated by hairline borders.
- **Hero header** opens the content: a small **pill tag** naming the chosen design direction, an **H1 "Brand Style Guide,"** and a one-paragraph description of the system (brand, two accent colors, two fonts, 8pt grid).
- **Mobile:** the sidebar hides; content goes full-width.

#### The 16 sections, in order
1. **Brand & Voice** — 5 personality words as pill tags, then a two-column Voice **Do / Don't** table (green-tinted Do card, red-tinted Don't card, 4 bullets each)
2. **Logo** — light-background and dark-background lockups side by side in preview cards, plus a source note ("pulled from live site, used unmodified — never redrawn or recolored")
3. **Color System** — full 50→900 tint scale for each brand accent (labeled rows: 50, 100, 200, 300, 500, 700, 900); a neutrals + dark-anchor scale; semantic colors (success / error / warning). Every swatch is **click-to-copy hex** with a "Copied" toast. Note each color's role (primary CTA family, secondary accent, etc.). Per Rule 17.
4. **Typography** — two font cards ("Aa" demo tile + family name, role, weights used, source), then a **spec row per text style**: name + where it's used, font/weight/size/line-height/letter-spacing (+ mobile size), and a **live rendered specimen** with real copy. Cover: Display 1, Display 2, H2 (section), H2 (child-page body), H3, H4, Lede, Body, Small, **Eyebrow (13px ALL CAPS)**, Button label, Nav link, Field label, Inline link
5. **Spacing & Grid** — visual bar chart of the full 8pt scale (4→160px), each bar labeled with its usage; note container max-width and section padding (desktop/mobile). Per Rule 17.
6. **Shadows & Border Radius** — sample tiles for every shadow level and radius value (4 / 8 / 12 / 16 / pill)
7. **Buttons** — all three variants (primary, secondary, ghost) in all six states (default, hover, active, disabled, loading, success) in a labeled grid. Per Rule 18.
8. **Form Inputs** — all six states (default, focus, filled, disabled, error, success) with labels and helper messages. Per Rule 18.
9. **Cards** — all six states (default, hover, active, disabled, loading, selected). Per Rule 18.
10. **Motion** — live animation demos of each easing/duration track (button hover, card hover, section entry, dropdown), with the timing rules written below. Per Rule 12.
11. **Iconography** — icon family grid (name + glyph), stroke-weight rule (1.5px), color-usage rule (always theme colors, never default black), and source (the project's chosen icon set per Rule 11)
12. **Photography** — Do / Don't table plus an aspect-ratio visual reference per section type (hero, cards, portraits — face-safe crop rule per Rule 13)
13. **Image Library** — every approved image in a consistent-ratio grid, each labeled with its source URL/filename (live site / client / sourced Unsplash–Pexels). Add as approved or sourced.
14. **Motif Gallery** — the project's direction-specific creative kit: line-icon set, soft muted color swatches, and decorative motifs/watermarks (faded letterform, geometric shapes, line-art motif used in section backgrounds and the mobile dialog). Built fresh per project from the design rules; every motif used on the site must appear here first.
15. **1% Moments Checklist** — interactive checkboxes for the pre-launch details from Rule 19 (favicon, tab titles, OG meta, 404, form success/error states, focus rings, click-to-call, etc.). Mark complete during the build.
16. **Agent Prompt Guide** — the section that turns this guide into ammunition for revision sessions. Three blocks: **(a) Quick Color Reference** — every palette color as a *named* entry with hex and role ("Evergreen 700 `#2A4233` — button hover, focus ring"); **(b) 5 Example Component Prompts** — fully copy-pasteable revision prompts with every value inlined (e.g. "Change the services cards to use Evergreen 50 `#ECF2EE` backgrounds with the 12px radius and shadow-md"), one each for a button, card, section background, headline treatment, and motion pattern; **(c) Iteration Guide** — the rules for asking well: *name the color ("use Evergreen 700"), never describe it ("make it darker")* · one component per request · reference the variant name from this guide · state the viewport. Voice vocabulary lists (words we use / words we avoid, from the Brief) close the section so generated microcopy stays on-register.

Every interactive element on the site must map to ONE variant in this guide. If it doesn't exist, add the variant here **before** using it anywhere.

---

### 8. Design System Audit checkpoint + Pre-Export Gate

#### 8a. Mid-build audit (~50%)
After ~50% of pages are built (typically 3 of 6 pages), pause for an internal audit:
- Do all buttons follow the documented variants?
- Do all hovers match across viewports?
- Are font sizes consistent?
- Are section backgrounds applied with a consistent rhythm?

Fix before continuing to the second half.

#### 8b. Pre-Export Gate — hard checklist, run before every delivery
This is a **blocking** gate, not a suggestion. Before a Preview Shell is shared or a build is declared done, verify every item below. **Any unchecked item is a blocker** — fix it before export. Most sample failures we've seen were playbook *violations*, not gaps; this gate exists to catch them.

For each item, confirm in the build log: pass, or what was fixed.

**Structure & shell (Rules 4, 10)**
- ☐ Every page has the full section stack from nav to footer per Rule 10 — no section omitted because content was missing (placeholders used instead)
- ☐ Announcement bar present above the nav on desktop; hidden on mobile
- ☐ Sticky nav with scroll state on every page; footer on every page
- ☐ Sticky mobile footer bar present, above the home indicator, doesn't overlap content
- ☐ Contact/inquiry form on every page **except** Contact; Contact page is the full form experience (no duplicate pre-footer form)
- ☐ Both viewports at content parity; `data-viewport` set on each frame; localStorage persists page + viewport

**Copy & assets (Rules 3, 3d, 3e, 13, 15)**
- ☐ All copy verbatim from live site/brief, or flagged Lorem — **zero invented prose**
- ☐ Numeric placeholders use `00+ / 000+ / $00M+ / 00%` — no made-up numbers
- ☐ Logo pulled from the live site, unmodified, placed in nav + footer (correct light/dark variant); text lockup only if none exists — **never an invented logo**
- ☐ Reviews real (live → Google → flagged `[REAL REVIEWS NEEDED]`) — no fabricated quotes, names, or ratings
- ☐ Identity sections from the live site carried over, redesigned, and flagged in the build log
- ☐ Child pages: H1 in hero only; body uses H2/H3; copy verbatim or flagged Lorem
- ☐ Transparency note included (what was trimmed / invented / verbatim / still placeholder)

**Design system (Rules 11, 12, 13, 17, 18)**
- ☐ Every spacing value on the 8pt grid; section padding 120 desktop / ~64 mobile (mobile scaled down, not 1:1 — no wasted vertical space)
- ☐ Long-form text columns capped to ~60–75ch for readability; body links use a theme color (never default blue) with underline-on-hover
- ☐ No critical content/action is hover-only — everything important has a tap path on touch
- ☐ Mobile sticky nav/header ≤ 82px tall; no dead `#` leaf links in nav
- ☐ Dynamic-content sections (testimonials, bios, cards) tested with short AND long content — no overflow/overlap/breakage
- ☐ Entrance animations animate opacity/transform only — no CLS
- ☐ **Motion tier declared** (Rule 11 Decision 7) and the build stays within it
- ☐ **Three motion floors pass:** reduced-motion fallback works; entry/decorative motion is transform/opacity-only; nothing scroll-jacks or delays the hero→primary-CTA path (legible/clickable ~1s, keyboard-reachable with motion off)
- ☐ Every animation passes the **"earns its place"** test (explains / builds trust-desire / is the one signature moment) — no movement-for-movement's-sake
- ☐ Ambient loops are low-contrast, `aria-hidden`, and disabled under reduced-motion
- ☐ **Motion presence — build deploys its tier's *expected* motion set, not just bare reveals.** Tier 1: count-up on every real stat block + hover feedback on *every* interactive element (cards/links/images/inputs, not only CTAs) + at least one ambient or parallax accent. Tier 2: + the one signature moment rendered as *actual* motion (marquee / choreographed hero / rotating-floating badge), not a static layout. A reveals-only build has **underspent its tier** — fail the gate and add motion from the Menu (Rule 12).
- ☐ ≤ 2 brand accents + neutrals; one primary CTA color; dark anchor consistent across nav + footer
- ☐ Full tint scales + semantic colors defined and documented in the Style Guide
- ☐ Every interactive element has all 6 states; hover timing/easing identical site-wide (200–300ms ease-out)
- ☐ Section-level CTAs are buttons, not inline links
- ☐ **Button labels consistent** across the site — the same action/section uses the exact same label everywhere (no "Book a Consult" vs "Book Now" vs "Get Started" for the same thing)
- ☐ Palette is **soft/muted** (no harsh, oversaturated colors)
- ☐ **No custom icons beside meta/eyebrow text** (eyebrows are text-only)
- ☐ **No orphan words** — no headline/sentence leaves 1–2 words alone on a second line; breakpoints handle wrapping
- ☐ **No compounding spacing** — vertical gaps come from one source (grid/flex gap *or* margin, not both stacked)
- ☐ Every section has a subtle background element (never competing with content; nothing decorative over the hero headline)
- ☐ **Internal-page heros** (About, Services, child service, post) have a background image (client asset or sourced Unsplash/Pexels), with legible overlay
- ☐ Icons: single family, 1.5px stroke, themed color (never default black/grey)
- ☐ Contrast rhythm actually executed per the chosen direction — page does not read flat/all-white by accident
- ☐ CTA banners use a background treatment with a legible theme-color overlay (per Rule 13)

**Hero & imagery (Rules 10, 13)**
- ☐ Hero is high-impact: clear headline + primary CTA above the fold, strong focal visual; mobile leads with the focal visual, not a wall of text
- ☐ Hero clears the sticky header (≥ header height + 32px)
- ☐ Portraits/team photos are face-safe (no clipped heads); aspect ratios consistent within each section
- ☐ Missing images are proportioned placeholders at the right ratio — no grey boxes, no broken-image icons

**Mobile (Rules 4, 13)**
- ☐ Hamburger opens a full dialog menu with the required contents in order (logo+×, accordion links, faded motif, CTA, divider, address, phone, socials); scrollable; closes on outside tap/×
- ☐ Mobile renders at mobile width — **no desktop bleed, nothing clipped at the frame edge**
- ☐ Scrolled nav does **not** poke past the phone's rounded corners (backdrop-filter corner-clip handled)
- ☐ Mobile scrollbar hidden on the mobile frame only
- ☐ Nav menu centered (per Rule 10); no "Home" link in nav or footer
- ☐ ≥ 20px content padding from viewport edges; touch targets adequate

**Conversion engineering (Rule 21)**
- ☐ Each page has ONE declared primary conversion goal; the primary CTA is dominant and repeated; secondary CTAs subordinate
- ☐ One `<h1>` per page, logical heading order; unique title + meta description; descriptive alt text
- ☐ Schema present (LocalBusiness; FAQPage / Review / Service where applicable); NAP consistent site-wide
- ☐ Every image has reserved dimensions (no layout shift); hero optimized as LCP; below-fold lazy-loaded
- ☐ Text/background contrast meets AA (≥4.5:1 body); keyboard-operable; reduced-motion honored; tap targets ≥44px
- ☐ **Contrast Manifest emitted** (like the Motion Manifest): for each build, compute and print a table of the 6 core text/background token pairs — body/page-bg, body/surface, heading/page-bg, primary-CTA text/CTA-bg, nav text/nav-bg, footer text/footer-bg — with their contrast ratios; every pair must be ≥4.5:1 (≥3:1 for large text)
- ☐ Forms minimal, labeled, validated, with a success state; strong-verb submit; privacy reassurance present

**Polish & handoff (Rules 7, 16, 19)**
- ☐ Style Guide page complete; every component used maps to a documented variant
- ☐ Rule 19 (1% moments) checklist fully run and passing
- ☐ Preview Shell handoff note included (what's done, what to review, what's placeholder, what not to focus on yet)

**Anti-slop scan — P0 items are binary and greppable; any hit is a blocker (CRAFT-RULES C1)**
- ☐ **P0** No banned accent hexes anywhere: `#6366f1 #4f46e5 #4338ca #3730a3 #8b5cf6 #7c3aed #a855f7` (or near neighbors used as accent)
- ☐ **P0** No two-stop purple→blue/cyan gradient on the hero
- ☐ **P0** No raw hex values outside the `:root` token block — every color goes through a token. *Scope: this grep applies to page markup; the locked Preview Shell chrome (Rule 4's copy-exact values) is exempt.*
- ☐ **P0** Convention floor (CRAFT-RULES C11): logo links home · every phone number is `tel:` and every email `mailto:` · no placeholder-as-label · body links not color-only · close top-right · skip link present. Greppable — count them, don't assume them.
- ☐ **P0** No emoji as icons anywhere (headings, feature cards, lists), with ONE exception: the footer contact rows may use 📞 (phone), ✉️ (email), 📍 (address) at Claude Design's discretion, matched to brand register — for upscale/high-formality brands, use monoline SVG icons instead
- ☐ **P0** No Inter/Roboto unless the client's real brand uses them (documented per Rule 23)
- ☐ **P0** No "rounded card + colored left-border" tiles
- ☐ **P0** No invented metrics, no filler copy (restates Rule 3 — checked here because it's greppable: `Lorem` only where flagged)
- ☐ **P1** At least two asymmetric/editorial compositions on the page — not all sections centered-with-uniform-cards
- ☐ **P1** One decisive flourish — one, not three (the Rule 1a signature; C4's boldness rule)
- ☐ **P1** Headlines <14 words; CTA labels say what happens (C5)
- ☐ **P1** ALL-CAPS text carries +0.06–0.1em tracking; display ≥48px carries negative tracking (C2 — the two most reliable slop tells)
- ☐ **P1** Screenshot test: could a stranger name the client from any section's screenshot? If not, revisit C4's four soul slots
- ☐ **P1** Accessibility floors: every interactive target ≥24×24px; keyboard-tab the page — sticky nav/bar never fully obscures the focused element (C6)

#### 8c. Design Critique pass — run after the build, before delivery
A scored self-critique, run once the page passes 8b. Score **five dimensions, 0–10 each**:
1. **Philosophy consistency** — does every section serve the direction's stated thesis?
2. **Visual hierarchy** — does the eye move with zero friction to the conversion goal?
3. **Detail execution** — tracking, spacing rhythm, state coverage, image treatment
4. **Functionality** — nav, forms, mobile dialog, all six component states real
5. **Innovation** — the 20% soul layer (C4): signature moment, microcopy voice, the client-specific detail

**Scoring discipline (this is what makes the pass honest):**
- **Every score cites evidence** — a section, element, or class name. Numbers without evidence get rejected.
- **The score is the worst sustained band, never the average.** One broken dimension isn't diluted by four good ones.
- A mean above 8 is suspicious — re-examine before believing it.
- **Innovation is allowed to be 5/10 on production work.** Don't punish appropriate conservatism for a trust-vertical client; the 80/20 doctrine *expects* 80% proven patterns.

**Output three lists:**
- **KEEP** — what works and must not be broken in revisions. *This is the underrated list: client revision rounds regress working elements constantly; the Keep list is what protects them. Carry it forward into every revision session (Rule 22c reconciliation).*
- **FIX** — ordered by visual cost saved per minute spent, not by discovery order.
- **QUICK WINS** — 5–15 minute improvements.

The critique travels with the delivery (like the Compliance Report). In revision rounds, re-run only the dimensions the revision touched — but always re-verify the KEEP list survived.

---

### 9. Output defaults

- **Format:** React JSX (Babel inline, no build step) — required by Rule 4. Override in the OUTPUT section of the brief if needed.
- **Shared token file:** projects use **one shared CSS design-token file** (CSS custom properties for the full color scales, type scale, 8pt spacing, radii, shadows). The site and the Brand Style Guide (Rule 7) both import it, so specimens render with real production styles — never copies. This means a real project is the preview + this token file (not strictly a single file); keep tokens in this one place as the single source of truth.
- **Preview Shell:** enabled by default per Rule 4
- **Review format → final format (hybrid).** Use the **React Preview Shell for the review/iteration phase** (dual viewport, `data-viewport` comment routing, localStorage — the review tooling). Once a direction is **approved/"graduated,"** export it as a **standalone single-file HTML** for the final/handoff. Don't abandon the Shell during review just to build standalone early — you lose the comment routing and dual-viewport review.
- **Host platform:** see Project Brief

---

### 10. Required page sections — never omit

Every page must include a complete layout from navigation to footer. **Never omit a section because content is missing.** Use Lorem Ipsum for copy and a correctly proportioned placeholder rectangle for images.

#### Universal baseline — every page, always

*(Structural specs for these components — exact contents, icons, ordering — live in `03-COMPONENT-LIBRARY.md`'s G1–G5. This section states only the behavior rules that Component Library doesn't already cover, plus a one-line cross-reference for each, so the two files can't silently drift out of sync.)*

**Announcement bar** — see Component Library G1 for the full spec. Behavior notes not in G1: the nav's sticky behavior accounts for the announcement bar height — both bar and nav are visible on load; only the nav sticks on scroll (the bar scrolls away). Background must contrast with the nav (use the dark anchor color or the primary brand accent). **On mobile: hide the announcement bar entirely** — the nav becomes the topmost element on mobile. This is the global default.

**Navigation** (sticky, with scroll state per Rule 12) — see Component Library G2 for the full layout spec.

**At least one CTA section**

**A contact/inquiry form on every page**, placed as the penultimate section directly before the footer — with one exception: **the Contact page itself is exempt.** The Contact page IS the form experience and must contain the form as its main content, alongside phone, email, address, hours, and all relevant business details. Do not add a duplicate pre-footer form on the Contact page.

**Footer** (always — never the last thing dropped) — see Component Library G3 for the full contents list.

**Sticky mobile footer bar** — see Component Library G5 for the two-button spec (Call left, Book/Contact right — not a single button). Behavior notes not in G5: must sit above the system home indicator, use the primary CTA button color(s), and apply z-index high enough to stay above all content.

**Behavior rules not covered in Component Library:**
- **Nav menu is centered by default** on every design (logo left, centered menu, primary CTA right — matches Component Library G2's desktop layout). The reviewer repositions it per direction if needed.
- **The mobile sticky nav/header is ≤ 82px tall.** Keep it compact so it doesn't eat the small viewport.
- **No dead links.** Every nav/menu **leaf** link points to a real page — no `href="#"` or `#!` that navigates nowhere. (Parent items that are dropdown/accordion *toggles* are exempt — they open children, they don't navigate.)

#### The 10 core sections
1. **Navigation** — sticky top bar, logo, **centered links**, primary CTA button
2. **Hero** — headline, sub-headline, primary CTA, visual
   - **The hero is the highest-leverage section on the page — treat it as the digital storefront window.** Visitors form an opinion in ~50ms (some visual impressions in ~17ms), and because the hero owns ~100% of the above-the-fold space, it carries the bulk of initial engagement and bounce. Every hero must be **eye-catching and high-impact**, with a clear headline, a primary CTA above the fold, and a strong focal visual.
   - *How* that impact is achieved — image shape, full-bleed vs. split, layered cards, video, composition — is a per-project design decision made in the Design Canvas (Rule 11). **Do not default to any single hero treatment across projects.**
   - **Hero Impact Standard — required *qualities*, not a fixed shape.** A flat single-image hero is a **fail** (it's exactly what shipped on a past chiropractic build and caused the bounce risk). Every hero must clear this bar, *however* it's composed:
     - **Composed depth, never flat — but cap the stack at two.** Never a flat single photo. Build the hero as the **main image + exactly ONE companion element** (a dark text-box *or* a motif/secondary image — **not both**), plus an **optional muted backing square** and a **framing line/outline**. **Don't stack three substantial image/box elements** — two reads premium, three reads busy. The muted square and the frame are decorative accents, not the "third element." **The frame's shape follows the image's shape** (portrait → tall frame · arch photo → arch outline · circle → ring · landscape → wide bar). A floating stat/chip and the faded watermark motif are allowed accents on top.
     - **Carries the signature motif** (Rule 11 Decision 4) somewhere in the hero.
     - **Muted/premium palette** (Rule 13) **+ motion** per the Motion Contract — at minimum a kinetic/animated headline **and** one depth/parallax move.
     - **Names its attention hook** — in the Canvas, state the *one thing* that grabs a first-time visitor in ~3s (the bounce test). If you can't name it, the hero isn't done.
     - **Trust verticals: front-load a hero proof-cluster.** For healthcare / recovery / legal / financial and any trust-led build, the hero (in it or directly beneath) carries a compact proof stack: a **rating badge** (e.g. 4.9★ / Google), an **avatar cluster with "+N"** (turns proof into an invitation), and **2–3 real stats**. Every best-in-class site in these verticals does this — it's the strongest above-the-fold trust lever. Real numbers only (Rule 23).
     - **Varies per project / per direction** — the *qualities* above are mandatory; the *arrangement* must be invented fresh every time. Two builds that both clear this bar should still look **clearly different.** This is how we get high-impact heroes **and** variety.
   - On mobile, lead with the focal visual rather than burying it below a wall of text.
   - Hero padding-top accounts for the sticky header height (per Rule 13).
3. **Trust / Social Proof Bar** — logos, ratings, certifications, or stats
   - **If a trust/social-proof bar is used,** keep its items visually grouped and related — don't let a few short stats accidentally stretch across the full width until they lose their relationship to each other. Exact spacing, alignment, and layout are Claude's call per the design (within the 8pt grid, Rule 17); this is a readability guideline, not a fixed measurement.
4. **Value Proposition** — what you do and why it matters (3-col grid or alternating layout). Compose as elevated cards (surface, padding, border, soft shadow, hover) — not bare text columns.
5. **Services** — detailed breakdown of offerings (see treatment options in Rule 11)
6. **Testimonials** — quotes, star ratings, or case studies
7. **Team / About Snippet** — humanizes the brand
8. **FAQ** — handles objections, accordion format
9. **CTA Section** — full-width conversion section before footer
10. **Footer** — contact info, navigation links, legal, socials. Contact rows (phone, address, email) always lead with their icon, consistent with the nav and contact form.

#### Per-page section stacks

**Precedence:** the industry playbook's page order is the recommended starting point; `04-CONVERSION-PLAYBOOK.md` supplies the reasoning; the stacks below are the fallback when neither specifies. **None of the three is binding on order.** You may reorder, merge, or drop sections when this specific business justifies it — state the reason in one line in the Compliance Report. What *is* binding: every page still serves its declared conversion goal (Rule 20), and no section ships thin or filler just to match a list.

**Home**
Nav → Hero → Trust Bar → Value Prop → Services Overview → Testimonials → About Snippet → CTA Banner → Blog Preview → FAQ → Contact Form → Footer

> **Note on Blog:** Build the Blog/Resources page **only when it's checked in Brief Section 2** — like every other page (Page Scope Rule). When checked, include Blog Preview in the Home stack; when not checked, drop Blog Preview from the Home stack too. The brief wins.

> **Services default to a SINGLE page.** Build one Services/Treatments page (the stack below) — it saves time and tokens. Only split into individual child service pages when the client has **substantial per-service content** that justifies its own page (then Rule 14's two-column sidebar layout and Rule 3d's child-copy rule apply). When in doubt, keep it one page and confirm with the reviewer.

**Services / Treatments (single page — default)**
Nav → Hero → Services Grid → Team → CTA Banner → FAQ → Contact Form → Footer

**Service (Individual / Child) — only when per-service content is substantial**
Nav → Hero → What's Included → Our Process → Testimonials → Related Services → Contact Form → Footer

**About**
Nav → Hero → Story → Team → Values / Mission → CTA Banner → Contact Form → Footer

**Contact**
Nav → Minimal Hero → Contact Form → Map / Address → FAQ → Footer

**Blog / Resources**
Nav → Hero → Post Grid → Newsletter CTA → Contact Form → Footer
*(Blog components — Post Grid, Newsletter CTA, Blog Preview — are defined here, not in `03-COMPONENT-LIBRARY.md`; treat this stack as their spec.)*

---

### 11. Design Language — seven decisions before building

All seven must be stated explicitly in each Design Canvas direction. If the brief leaves them blank, Claude proposes one option per direction in the canvas — never builds without deciding first.

#### Decision 1 — Typography personality
- **Editorial serif italic** — warm, human, trusted. Best for: rehab/recovery, therapy, luxury medical, high-end real estate.
- **Condensed bold sans** — confident, athletic, urban. Best for: chiropractic/performance health, commercial real estate, new development.
- **Geometric modern sans** — clean, precise, professional. Best for: concierge medical, investment real estate, property management.
- **Humanist soft sans** — approachable, warm, community-oriented. Best for: family medicine, pediatric, local residential real estate.

#### Decision 2 — Services section treatment
- **Icon cards grid** (3+3 or 2+2) — familiar, informational, good for 4–6 services
- **Bento / mosaic tiles** — architectural, visually distinctive, strong for performance brands
- **Alternating full-width rows** — editorial, great for services that need detail and depth
- **Photo-forward cards** — immersive, image leads, great for lifestyle and real estate
- **Numbered large-numeral list** — process-oriented, clean, good for step-by-step services
- **Tabbed / pill selector** — best for 6+ services where each has substantial detail

#### Decision 3 — Section contrast rhythm
- **Soft alternating** — white and warm cream alternate gently. Best for: rehab, therapy, family medicine.
- **Dramatic dark / light** — hard jumps to near-black CTA and feature sections. Best for: chiropractic, luxury real estate, commercial.
- **Single-tone with accents** — mostly white/light, brand color appears sparingly. Best for: clean professional, concierge medical.
- **Editorial magazine** — intentional asymmetry, full-bleed mixed with tight editorial sections. Best for: luxury, high-design brands.

#### Decision 4 — Signature element
One recurring visual motif that appears 3+ times across the site. Must be unexpected for the industry. Propose one per Design Canvas direction.
Examples: solid brand-color block beside photography; oversized numeral anchoring a section; thin line illustration as section decoration; diagonal photo crop; credential badges as graphical cards.

**One *distinct* motif, many appearances — not many motifs.** A signature earns its power through *recognition by repetition*, so the count of *distinct* motifs stays **1 site-wide.** Never add a 2nd or 3rd competing motif to "fill space" — that reads busy and dissolves the signature (the opposite of premium). What scales by page type is the number of *appearances* of that **one** motif, in **varied treatments** (different scale, opacity, placement — watermark, section divider, masked into an image, footer echo):
- **Homepage: 3–5 appearances** of the single motif.
- **Internal pages: 1–2 appearances.**

Filling large/quiet space is the job of **per-section background texture (Rule 13)** — *not* of adding more motifs. Motif = recognition; texture = richness.

#### Decision 5 — Photography direction
Warm lifestyle / Dark moody athletic / Clean clinical / Architectural / Aerial / Placeholder only

#### Decision 6 — Color palette
- Max **2 brand accent colors** + neutrals
- Define color temperature: warm or cool
- One **dark anchor color** for nav, CTA sections, and footer — same tone across all three
- One **primary CTA button color** — never two competing CTA colors on the same page

#### Decision 7 — Motion tier, character & signature moment
State the project's **two motion dials** — **Tier (how much)** and **Character (what tone)**, per Rule 12 — plus the **signature moment** (what it is, where it lives, what job it does, per the "earns its place" test). **Amount defaults to Tier 2 for every build, every industry**; drop to Tier 1 only when the brief explicitly asks for stripped-back motion, escalate to Tier 3 only with sign-off. **Character** comes from the audience / Mindset-on-arrival (Brief): **Calm** for trust/vulnerable audiences, **Balanced** for most, **Expressive** for brand-forward / luxury. The **audience can shift either dial** from the archetype's starting point — log the one-line rationale. In the table below, read the legacy **Motion** column as a **Character hint** (rows marked 1 → Calm, rows marked 2 → Balanced/Expressive); the *amount* is Tier 2 unless a brief says otherwise. State this under the direction thesis before showing the visual.

#### Icons — source rule
Default to one **MIT-licensed monoline icon set** — **Lucide, Heroicons, Phosphor, or Tabler** (consistent stroke, no attribution burden). SVG format, thin line style, consistent stroke weight (1.5px), single icon family per project. Never mix icon families. **Flaticon** (https://www.flaticon.com/) is the fallback when the chosen set genuinely lacks a needed glyph — any fallback icon must still read as part of the primary family (same stroke weight and style).

Custom SVGs are a last resort only — use them if and only if neither the chosen set nor the fallback can provide what the design needs (which is rare). If custom SVGs are used, they must still match 1.5px stroke weight and theme colors. Note the exception in the build log.

#### Industry archetype quick-reference

| Archetype | Typography | Services | Rhythm | Photography | Motion (character hint — amount defaults Tier 2) |
|-----------|------------|----------|--------|-------------|-------------|
| Rehab / Recovery | Editorial serif italic | Icon cards | Soft alternating | Warm lifestyle | 1 |
| Chiropractic / Performance | Condensed bold | Bento / mosaic | Dramatic dark/light | Dark moody athletic | 1 |
| Mental Health / Therapy | Humanist soft | Alternating rows | Soft alternating | Warm lifestyle | 1 |
| Concierge / Luxury Medical | Geometric modern | Photo-forward cards | Editorial magazine | Clean clinical | 2 |
| Family / Pediatric | Humanist soft | Icon cards | Soft alternating | Warm lifestyle | 1 |
| Luxury Residential RE | Editorial serif italic | Photo-forward cards | Editorial magazine | Architectural | 2 |
| Commercial / Investment RE | Geometric modern | Numbered list | Single-tone accents | Aerial / architectural | 1 |
| Local Residential Agency | Humanist soft | Icon cards | Soft alternating | Community lifestyle | 1 |
| New Development | Condensed bold | Bento / mosaic | Dramatic dark/light | Architectural renders | 2 |
| Property Management | Geometric modern | Tabbed | Single-tone accents | Clean property | 1 |

---

### 12. Interaction philosophy — modern, not flashy

The goal is **quiet modernity**. Motion must serve the content.

#### Required on every build
**CTA buttons and CTA links** — all must have hover states:
- Background color shifts (darken or lighten by 10–15%)
- Subtle translate-Y: –2px on hover
- Transition: 200ms ease-out
- Active/press state: translate-Y: 0, slight darken beyond hover
- Applies to every CTA button AND every inline CTA link — no exceptions

**Section-level CTAs are buttons, not inline links.** Any section-level call to action ("View all services," "All locations," "All articles," "Read more" as a standalone action) renders as a **button** (`Btn`, ghost or light variant). Reserve inline text links (`Link`) strictly for CTAs embedded *within a paragraph*. Section CTAs that look like plain links get ignored.

**CTA strategy — one primary action per page.** Tie every page to its declared conversion goal (Rule 21a):
- **One primary CTA per page**, in the primary CTA color (Rule 11). Nothing else competes for that visual weight.
- **Secondary CTAs are subordinate** — lighter/ghost styling, never the same prominence as the primary.
- **Repeat the primary action** down the page: hero → mid-page → bottom CTA band → sticky mobile bar. A warm visitor should never have to scroll to find the next step.
- Never place two *competing* primary CTAs (different asks at equal weight) in the same view — split attention kills action.

**Navigation hover states** — all nav elements must respond to hover:
- Primary nav links: underline slide-in or color shift, 200ms ease-out
- Dropdown trigger links: same hover treatment as primary links
- Dropdown menu items: background highlight on hover (brand accent at 8–12% opacity or light neutral)
- Child / sub-menu items: same treatment as dropdown items
- Mobile dialog menu links: clear background highlight row on hover/tap

**Dropdown menus** — required behavior:
- **Dropdowns are the default, not an afterthought.** Real sites have sub-menus — every primary nav item that *could* have sub-pages ships a **dropdown / mega-menu** (e.g. Services, Conditions / What We Treat, For Patients / About, Locations). **Never ship a flat nav of top-level links only** — the first-pass habit of skipping sub-menus is unrealistic and a Compliance-Audit fail. Mega-menus may embed location address cards, featured links, or a CTA.
- Every nav item with child pages must show a chevron/caret icon beside the label
- Chevron rotates 180° when the dropdown opens — transition: 200–300ms ease-out
- Dropdown panel animates open (opacity 0→1, translateY –4px→0), 200ms ease-out
- **Hover-intent — the dropdown must stay open while hovered and must not snap shut.** Bridge the gap between the trigger and the panel with an invisible hover area (a small padding/pseudo-element spanning the gap) so moving the cursor from the label down into the menu never dismisses it. Optionally add a short close delay (~150–250ms) so a brief cursor slip doesn't close it. The panel closes only when the pointer truly leaves both the trigger and the panel.
- On mobile dialog, child items expand via accordion; chevron rotates to indicate open state
- **Active / current page highlight:** the dropdown item matching the current page shows a persistent highlight — primary brand accent at 10–15% opacity as background, item text in the brand accent color. Always visible, not just on hover.

**Animation and interaction consistency — site-wide rule.** All hover effects, transitions, animations, and interactive states must be identical in timing, easing, and visual treatment across every page and component. No one-off animations.
- Button hover: always translate-Y –2px + color shift, 200ms ease-out
- Card hover: always scale(1.03), 200ms ease-out
- Section entry: always fade + translateY 20px → 0, 300ms ease-out
- Nav scroll state: always same background + shadow treatment
- Dropdown open/close: always same timing and easing

If a new interactive pattern is introduced during the build, it must be documented in the Style Guide (Rule 7) before being used, and applied consistently everywhere that pattern appears.

- Every interactive element (button, card, nav link, input) has a hover state
- Navigation has a scroll state — background and subtle shadow appear when user scrolls past the hero
- Smooth scroll on all anchor links
- All transitions: 200–300ms, ease-out
- **Touch-friendly — hover is an enhancement, never a requirement.** No critical content or action may live *only* behind a hover. Anything important must have a tap path on touch devices (e.g. dropdown contents reachable via the mobile accordion, hover-revealed info also visible/tappable). Hover effects are polish on top of an interface that already works by tapping.

#### Scroll-triggered entry
- Default to animating the **section as a whole** (fade + 20px rise, 300ms ease-out), not every element inside it.
- **Capped stagger allowed on Tier 2+.** A short stagger across **sibling cards** (3–5 items, ≤ ~120ms step, one shared easing) is allowed when it aids scanning — never a stagger on every paragraph/icon, and **never more than one staggered group per viewport.** Must pass all three motion floors below.
- **Entrance animations must not cause CLS.** Animate **`opacity` and `transform` only** (compositor-only, no layout). Never animate layout properties (height, width, top/margin) for entry, and reserve the element's final space so nothing jumps. Target CLS < 0.1 (Rule 21c).

#### Image interactions
- Cards with linked images: `transform: scale(1.03)` on hover
- Non-linked images: no hover effect

#### Motion budget — how much motion, and where
Motion is a tool, not a risk. The question is never "animation: yes/no" — it's *how much, doing what job, in which section.* **Two dials govern this: a Tier (how *much* motion) and a Character (what *tone* of motion).** Decide both in the Design Canvas (Rule 11, Decision 7), then spend within them.

**The three floors — every project, every tier, no exceptions:**
1. **Reduced-motion fallback.** Honor `prefers-reduced-motion`: reveals show instantly, counters jump to final value, ambient loops stop.
2. **No layout shift.** Entry/decorative motion animates `transform`/`opacity` only; reserve final space. CLS < 0.1 (Rule 21c).
3. **Never block the conversion path.** No scroll-jacking, no preloader, nothing that delays or obscures the hero headline or primary CTA. Hero→first-CTA legible and clickable within ~1s, and keyboard-reachable with motion off.

**Tier 1 — Conversion-first / trust** *(healthcare, legal, financial, home services — the most common case).* Motion supports, never gates. Allowed: section scroll-reveal, hover states (Rule 18), **gentle** imagery parallax (small translate, compositor-only), animated counters **for real numbers only**, slow ambient accents (≥ one cycle per ~20s, low-contrast, `aria-hidden`). Not here: scroll-jacking, preloaders, autoplay-with-audio, horizontal-drive heroes, 3D/WebGL.

**Tier 2 — Brand-forward / considered purchase** *(luxury real estate, concierge medical, design-led agencies).* Everything in Tier 1 **plus one larger signature moment** (a choreographed layered hero, a richer scroll sequence, a meaningful marquee). Heavier depth/shadow allowed (Rule 13). Still reduced-motion-safe, still fast LCP. Reserve the *one* signature moment — don't stack three.

**Tier 3 — Experiential / brand flex** *(product launches, entertainment, portfolios).* WebGL, preloaders, scroll-jacking, full-screen 3D as deliberate choices. **Requires explicit client sign-off** — it trades away SEO (empty DOM), accessibility, and Core Web Vitals. Document the trade in the build log. (See the Tier-3 Signature shelf in the Motion Menu below.)

**Tier 2 is the baseline — for every build, every industry.** The tiers above are *capability ceilings*; the **default floor is now Tier 2**, regardless of industry. Even conservative verticals (healthcare, legal, financial) build at Tier-2 *amount* and use the **Character** dial below to keep the tone right — they do not drop to Tier 1 by default. Tier 1 is used only when a specific brief explicitly asks for stripped-back motion; Tier 3 still requires sign-off. *(Why the flip: our recurring failure was shipping flat Tier-1 builds that passed every rule yet read dated next to peers — see the expression floor.)*

**Motion Character — the second dial (tone, independent of amount).** *How much* motion (Tier) and *what character* of motion are different questions; a site can be motion-**rich** and still **calm**. Set a character per project:
- **Calm** — long, soft easing (600–900ms gentle cubic-bezier), slow ambient loops (≥20s), low contrast, generous rest between events. For trust / vulnerable audiences (recovery, healthcare, legal, financial). *The recovery build = Tier-2 amount + Calm character.*
- **Balanced** — medium timing (300–500ms), moderate parallax and hovers. The default for most brands (home services, B2B, professional services).
- **Expressive** — snappier/springy easing, cursor-reactive and layered motion, bigger signature moments. For brand-forward / lifestyle / luxury (luxury real estate, design-led, hospitality). *The remodel build = Tier-2/3 amount + Expressive character.*

**Audience sets both dials (Rule 11 + Brief).** The industry archetype suggests a *starting point*, but the **target audience can move either dial — amount AND character** — recorded with a one-line rationale in the build log. The Brief's **Mindset-on-arrival** field is the strongest signal for the Character dial (in crisis → Calm; aspirational → Expressive; comparison-shopping → Balanced).

**Motion packages — budget → scope.** Now that **Tier 2 is the floor in every build**, packages do **not** decide *whether* a site has motion — the full Tier-2 expression floor (reveals, count-ups, full hover coverage, ambient + scroll-linked motion, one signature moment, all reduced-motion-safe) **and the Build Compliance Audit ship in every package.** Budget never buys out motion presence, accessibility, performance, or completeness. What budget scales is **signature ambition, bespoke/custom work, Tier-3 access, and page-suite breadth:**

| Package | Price posture | What scales *(Tier-2 motion floor + Compliance Audit ship in ALL)* |
|---|---|---|
| **Essential** | entry | **One** signature moment from the **Motion Menu** (no Tier-3 shelf). Character Calm/Balanced. Core page set. Stock / sourced imagery. |
| **Professional** | mid | **2–3** signature moments · a **custom hero composition** (Hero Impact Standard) · Expressive character available · fuller page suite incl. key **child pages** · light bespoke motif treatment. |
| **Signature** | premium | **Tier-3 Signature shelf** (cursor-reactive, magnetic, 3D tilt, WebGL) · **bespoke choreography + custom motif / illustration system** · full page suite + **all** child pages · white-glove motion documentation in the Style Guide. |

**The "earns its place" test — apply to every animation.** Keep it only if it (a) **explains** something, (b) **builds trust or desire** (real-number counter, proof surfacing), or (c) **is the one signature brand moment.** If it only adds movement, cut it.

**Choreography over ambient.** Prefer **event-driven** motion (on scroll-into-view, on hover) that plays once and rests, over **ambient** motion that loops forever. **One thing moves at a time** in a given viewport — the single biggest reason rich sites still don't feel busy.

#### Motion presence — the expression floor, per tier
The three floors above are a *safety* floor — how to keep motion from harming. This is the **expression floor**: the **minimum motion a build of each tier should actually ship.** The tiers above grant *permission* to animate; this section makes a baseline *expected*, because the failure mode we keep hitting is the opposite of "too flashy" — a build that passes every individual rule by shipping only one-time reveals and a few button hovers, then reads **flat and dated next to peers.** Restraint is a ceiling, not a target. Fill the tier.

**Ship the fuller set, then trim in review.** Bias toward *presence*: build the expected motion set (and lean toward the richer end, the way a strong reference variant does), then cut back in design review if the team finds a specific moment too much. It is far easier to remove one animation that's doing too much than to notice an absence of life. "Too quiet" is the default failure; correct toward motion.

- **Tier 1 must ship, at minimum:** (a) **count-up** on every real stat / number block; (b) **hover feedback on *every* interactive element** — cards, links, images, inputs, not just CTAs; (c) **at least one ambient or parallax accent** (gentle image-band parallax, or a slow `aria-hidden` accent loop). This flips counters, parallax, and ambient accents from "allowed" to **expected**.
- **Tier 2 adds:** its **one signature moment** rendered as *actual motion* — a marquee strip, a choreographed layered-hero reveal, or a rotating/floating brand badge — never a static layout standing in for the signature.
- Reduced-motion still strips all of it to instant / zero; LCP and the three safety floors still hold. Presence never overrides safety.

#### Motion Menu — reusable, spec'd patterns
Deploy these **named** patterns rather than inventing motion per build — the builder reaches for a known-good pattern instead of defaulting to nothing. Each is compositor-only (`transform`/`opacity`), `prefers-reduced-motion`-gated, and CLS-safe.

- **Count-up stat** — `IntersectionObserver` fires a `requestAnimationFrame` tween 0 → value on first view; reduced-motion jumps straight to the final value. **Real numbers only** (never invent a stat to animate).
- **Marquee strip** — `@keyframes` translating a *duplicated* track `translateX(0 → −50%)`, ~30–60s linear loop, **pause on hover**, `aria-hidden`. Logo rows, trust words, certifications.
- **Ambient badge** — slow `rotate(0 → 360deg)` (~12–20s) and/or a `translateY` bob (±8–10px, ~4–6s ease-in-out) on a disc / seal ("New patients welcome," "Est. 20xx"). Decorative, `aria-hidden`.
- **Scroll-progress bar** — fixed top bar whose width tracks `scrollY / (scrollHeight − innerHeight)` via an rAF-throttled scroll listener. Cheap, high-polish read.
- **Parallax band** — a section image translates a small percentage slower than scroll (`transform: translateY`), **clamped** so it never clips its frame or shifts layout. Gentle on Tier 1; can be more pronounced on Tier 2.
- **Lighting-up timeline** — steps/markers reveal and "activate" (color/opacity shift) as each scrolls into view; capped stagger per the scroll-trigger rule above.
- **Floating chips** — small overlay chips on a hero collage use a gentle `floatY` loop (±6–8px, offset delays so they don't bob in unison), `aria-hidden`.
- **Breathing gradient field** — an animated multi-radial gradient as a hero/section/CTA background, slowly drifting via `background-position` (~14–20s ease-in-out). Low-contrast, behind content; stops under reduced-motion. *(The recovery hero + CTA.)*
- **Kinetic headline** — title words/lines rise out of a clipped mask (`overflow:hidden` wrapper + `translateY(110% → 0)`) on load or scroll-in. Compositor-only; line-by-line stagger reads as premium.
- **Blur-to-focus reveal** — section reveal adds `filter: blur(6px → 0)` to the fade+rise for a depth feel. Composited, dropped under reduced-motion. *Use on hero/section reveals, not on dozens of small elements (`filter` is heavier than transform/opacity).*
- **Pulse indicator** — a small "live / available 24/7" dot emits a `scale`+`opacity` ring (~1.8s). Decorative, `aria-hidden`. Strong trust cue for service/booking heroes.
- **Before/after slider** — a draggable handle clips an "after" image over a "before" via `clip-path: inset()`, pointer + touch driven. Any transformation story (remodel, restoration, results).
- **Odometer count-up** — the premium variant of the count-up: each digit is a vertical **0–9 reel that rolls** into place (per-digit stagger), not a single tweened number. The signature stat motion of best-in-class wellness/health sites. Reduced-motion → jump to final value, no roll. Real numbers only.
- **Video hero / background-video band** — a muted, looping background video behind the hero or a feature band. **Mandatory: a visible, keyboard-reachable pause/play control** (WCAG 2.2.2) and a **poster image + reduced-motion fallback** (no autoplay under reduced-motion). Premium tone-setter; never let it delay LCP (poster paints first, video lazy-loads).

Document whichever patterns a project uses in the Style Guide (Rule 7) with their timing/easing, so they stay consistent site-wide (Rule 12 consistency rule).

#### Tier-3 Signature shelf — opt-in, premium, sign-off required
Higher-risk, higher-impact effects for the **Signature package** or a declared **Tier-3** build. Each trades some performance or accessibility, so keep reduced-motion support, a no-JS/no-pointer fallback, and document the trade in the build log.
- **Cursor-reactive spotlight / glow** — a soft light follows the pointer (lerped for smoothness). `pointer:fine` only; off on touch + reduced-motion.
- **Magnetic buttons / links** — the element drifts toward the cursor within a small radius and resets on leave. Pointer-fine only; keep pull subtle (≤ ~0.4× offset).
- **3D pointer-tilt cards** — perspective `rotateX/Y` from cursor position on hover; cap angles ≤ ~10° so it never feels gimmicky.
- **WebGL / shader hero** — grain / fluid / displacement canvas. Heaviest option: requires a static poster fallback for no-JS + SEO, and must not delay LCP.

#### Sensitive verticals — crisis resources *(recommended default)*
For **addiction recovery, mental-health, and crisis-service** builds, include crisis resources by default: a **988 (Suicide & Crisis Lifeline)** reference in the header/announcement bar **and** a footer crisis box (free, confidential, 24/7). Recommended on every such build (document if a client declines); not a hard Pre-Export Gate failure. The motion Character should be **Calm** for these audiences regardless of Tier.

---

### 13. Visual modernity standards

#### Spacing — desktop
- Section vertical padding: minimum **120px** top and bottom
- Container max-width: **1280px**, centered
- Column gutters: **32px** minimum

#### Spacing — mobile
- **Scale mobile spacing DOWN from desktop — don't carry desktop values 1:1.** Generous desktop padding wastes vertical space on a phone and forces dead scrolling. Mobile vertical rhythm should land around **55–65% of desktop**.
- Section vertical padding: **64px default** on mobile (down from 80). Use **48px** between tightly-related sections; reserve **80px** only for major breaks (e.g. above the hero or before the footer). Desktop stays 120px.
- Column gutters: **16px** minimum
- **Hero padding-top must account for sticky header height** — minimum (header height + 32px)
- Sticky footer bar must not overlap content — add padding-bottom to page body equal to bar height
- All content must have left/right padding of at least **20px** from the viewport edge
- **No compounding spacing.** A vertical gap must come from **one** source — either the grid/flex `gap` **or** a margin, never both stacked. (Seen bug: a stacked grid had a 36px `gap` *and* a 24px margin under the image on mobile, compounding to ~60px. Fix: remove the redundant margin, keep the single gap.) When a layout already uses `gap`, don't also add margins between its children.

#### Typography
- Minimum body size: **16px**
- **Readable line length on long-form content.** On body/prose-heavy areas (service pages, blog/posts, About), cap line length to **~60–75 characters** (e.g. `max-width: 65ch`) with comfortable line-height (1.6–1.7). Full-width paragraphs spanning a 1280px container are hard to read — constrain the text column even when the section is full-width.
- Line height: 1.5–1.7 for body, 1.1–1.2 for display headlines
- Letter spacing: –0.02em to –0.04em on large display type, normal on body
- Never use more than 3 type sizes within a single section
- All **H2 headings must be Title Case** — no exceptions across any page or section
- **Two-part / duotone headlines — use on key section headings (mandatory where it fits).** Split a headline into two clauses styled differently so it reads as one designed line, not flat text — e.g. *"Relief For The Pain That's"* (regular weight, ink) + *"Holding You Back"* (italic or accent color / lighter weight). Treatments: weight contrast, an italic serif accent clause, an accent-color clause, or a line break that lets the second clause sit in the theme accent. Apply to the hero H1 and the headline of each major section; keep one consistent duotone language site-wide.
- All **meta / eyebrow text must be ALL CAPS** — section labels, category tags, overlines, small text above headlines
- **No custom icons beside meta / eyebrow text.** Eyebrows are text-only (optionally a simple typographic rule/dash from the type system). A bespoke icon next to every eyebrow looks polished but isn't realistic to hand off to dev — don't do it.
- **No orphan words.** Never leave 1–2 words alone on the second line of a two-line headline or sentence. Control wrapping with a sensible breakpoint, a `&nbsp;` between the last two words, or `text-wrap: balance` so the copy never looks awkward.

#### Color
- Maximum 2 brand accent colors + neutrals
- **Soft, muted palettes by default.** Favor desaturated, sophisticated tones (muted/earthy/dusty) over harsh, oversaturated, or neon colors. Even a "bold" direction uses a restrained, muted version of its hue. Muted reads premium; loud reads cheap.
- One primary CTA color, used consistently
- Dark anchor color in nav and footer — same tone across both
- **CTA banners use a background image with a theme-color overlay** — the overlay may be the dark anchor color *or* another on-theme color appropriate to the site, and must keep text fully legible (target ~55–65% overlay where needed). Flat-color-only CTA banners are no longer the default; a flat dark anchor is acceptable only when imagery genuinely doesn't suit the brand.
- **Multi-stop gradients allowed** — the old 2-stop cap is removed; taste governs. Keep gradients on-palette and keep text legible over any gradient. Reserve multi-color *animated* gradient **mesh** for ambient fields (breathing hero/CTA, Motion Menu), not flat fills sitting directly behind body copy.

#### Background texture and subtle section elements — required
Every section must include at least one subtle background element. Choose per section:
- Low-opacity geometric shapes (circles, arcs, diagonal lines) in brand color at 4–8% opacity
- Soft radial or linear gradient overlay within a coherent hue family — animated "breathing" fields allowed (low-contrast, behind content, stop under reduced-motion)
- Grain/noise texture layer at 3–6% opacity on dark sections
- Thin decorative rule or line element as section divider or anchor
- Oversized faded letterform or numeral as background accent at 5–8% opacity

These must be subtle — invisible at a glance, never competing with copy, imagery, or CTAs. **A decorative letterform/numeral must never sit over the hero headline or read as a stray standalone word** — keep it behind content, low-opacity, and away from the primary headline zone.

**This per-section texture is the anti-boredom layer — distinct from the signature motif (Rule 11 Decision 4).** When a spacious / white layout risks reading empty, fill it with **texture here** (vary it section to section — shapes, gradient, grain, rules, letterforms), **not** with additional motifs. One signature motif (recognition) + one subtle texture per section (richness) keeps a roomy layout calm but never boring.

#### Components
- **Border radius is goal-driven.** 8–16px is the warm/approachable default. A near-sharp **~4px** editorial radius is a valid, deliberate choice for premium/architectural directions. Pill (9999px) for pills only. **The hard rule is consistency** — one radius language site-wide, never rounded and sharp cards mixed on the same page; the exact value serves the direction's goal, not a fixed number.
- **Shadows follow a tiered scale, not a single ceiling.** Define `--shadow-sm/md/lg` per project (already in `tokens.css`). On light, calm sections keep them soft (≈ `0 4px 24px rgba(0,0,0,.08)`). On **dark or full-bleed hero/feature sections (Tier 2+)**, deeper layered shadows are allowed and encouraged for cinematic depth (e.g. `0 30px 60px -18px rgba(0,0,0,.5)`) — provided they're consistent (one documented scale), not one-off. Still no inner glows, bevel, or emboss.
- Icons: thin line style, 1.5px stroke, from the project's chosen icon set (Rule 11) — always colored using the site's theme colors, never default black or grey. Use the primary brand accent or a complementary theme color so icons feel native to the palette.
- **Body-text links match the theme — never default browser blue.** Inline links inside prose (especially on content-heavy child pages — service, post, About) use a **theme accent color** (typically the deep primary accent) with **underline on hover**. Never ship the browser default `#0000EE` blue or any color that clashes with the palette. Apply one consistent link treatment site-wide, and document it in the Style Guide (Rule 7 §4, inline-link specimen). This is distinct from section CTAs, which are buttons (Rule 12).
- No heavy drop shadows, inner glows, bevel, or emboss effects

#### Reviews and social proof — source hierarchy
Always prefer real reviews over placeholders. Follow this order:
1. **Reviews on the live site** — use verbatim (quote, name, star rating)
2. **Google reviews** — if the live site has none or insufficient reviews, pull real Google reviews **during the ingestion pass (Rule 23)**. When using Google reviews display:
   - The official Google logo (fetch from Google's branding assets)
   - 5-star display (use real average rating if known; otherwise show the actual rating found)
   - The numeric rating (e.g. 4.9) and total review count (e.g. "Based on 200+ reviews")
   - Individual review quotes with reviewer first name and last initial
3. **If no real reviews are found anywhere** — use a placeholder star display and flag it clearly: `[REAL REVIEWS NEEDED]`

**Google-reviews pill — always include when the business has Google reviews.** Whenever the business has Google reviews, always render the **Google-reviews pill** element (Google "G" logo + numeric rating + 5 stars + review count) — typically near the hero and in/above the testimonials section. It's one of the strongest trust signals and is required, not optional, whenever real Google reviews exist.

Never fabricate review quotes, names, or ratings under any circumstance.

#### Photography and imagery
- Photos breathe — no tight crops
- No *ad-hoc* decorative frames or borders around images. **Exception:** a frame/mask that is the project's declared **signature element** (Rule 11, Decision 4) — e.g. an arch mask, a gold hairline frame, an offset duplicate — is allowed when it recurs intentionally 3+ times and is documented in the Style Guide. The ban is on random decoration, not a deliberate signature treatment.
- Consistent aspect ratios within each section
- Unavailable photos: placeholder rectangle at correct aspect ratio, subtle fill — not a grey box
- **Image fallback mechanism** — every `<img>` sits over an on-palette gradient placeholder and carries an `onerror` that hides the broken image so the gradient shows through. A dead/slow image then degrades to an intentional-looking block, never a grey box or broken-image icon.
- **Portraits / team photos are face-safe** — use a portrait aspect ratio (`aspect-ratio: 4/5`, or min height ~320px desktop), `object-fit: cover`, and `object-position: center top` (or `center 20%`). Never crop a portrait into a short landscape band that clips the subject's head. (Sidebar doctor crop stays 1:1 circular per Rule 14.)
- **Internal-page heros get a background image.** Every internal page (About, Services/Treatments, child service, blog/post, etc.) uses a real background image in its hero, with a legible theme-color overlay (per the CTA-banner overlay treatment). Source order: client/live-site asset → **free image from Unsplash or Pexels** matched to the page and brand → proportioned placeholder only as a last resort. Source these **during the ingestion pass (Rule 23)**, not mid-build, and record the source URL + license in the Image Library (Rule 7).

#### Layering & stacking — gotchas *(graduated from Operating Log R5 + R6)*
- **A `sticky` / `fixed` element needs every ancestor to cooperate.** `overflow: hidden` (also `auto` / `scroll`) on *any* ancestor silently breaks `position: sticky` — the element starts offset and never sticks. This is the recurring sticky-sidebar bug (Rule 14). Keep the ancestor chain `overflow: visible`; when you genuinely need horizontal containment, use **`overflow-x: clip`** (which doesn't establish the scroll container that kills sticky), never `hidden`.
- **Overlay elements need an explicit `z-index` AND a positioning context.** Badges, ribbons, pills, and labels layered over imagery render *behind* the image unless given an explicit `z-index` with `position: relative/absolute` on the element (and a stacking context on the parent). Always set stack order explicitly for anything overlapping media — never rely on source order.

#### Section & component standards — from field dissection
Dev-realistic standards distilled from reviewing a live build. Each is a Compliance-Audit item.
- **Trust bar:** a **single horizontal line** (rating + a few logos/words) — never a tall "fat" block.
- **Services cards:** real **photo-forward** images, **hover lift on the card + hover on inner links**, and a **short description + short bullet list** (easier to hand off, more realistic). **No auto-generated icons sitting on the service image** (too much for dev). **No decorative pills under the services** — in dev that row is a **button linking to the Services page**.
- **Paired CTAs:** where a section's primary CTA is a glow button, a **second button beside it** linking the relevant parent page is allowed (e.g. glow "Schedule" + ghost "View Treatments"). Still one *primary* visual weight (Rule 12).
- **Team / Services realism:** show **3–4 representative cards + a button to the full page**, not every entry.
- **Custom sections over templates:** prefer **art-directed sections** (custom "Why Choose Us" / first-visit / experience bands) over the boring default *image-left → eyebrow → heading → body → link*. This is a differentiator — less boring than peers.
- **Footer:** **always** social icons, hover fx on footer links, and **icons beside address / phone / email** — every build. Carry the signature motif here (e.g. a corner seal).
- **Contact:** production forms are usually **smaller / app-embedded** (a specific tool) — build the section to accommodate that; a **background image on the contact section** is a good optional standout treatment.
- **Utility / invented headings:** short connective headings the live copy doesn't provide ("Care for every stage of life", "Not sure which service?") must come from an **agreed controlled vocabulary**, flagged for the reviewer — never silently invented (Rule 3).

#### Vertical-excellence patterns — a menu, chosen with restraint
Distilled from benchmarking best-in-class sites (esp. wellness / mental-health / recovery). **This is a menu, not a checklist — pick the few that serve the brand plus the ONE signature; applying all at once reads busy, the opposite of premium *and* of calm.** Match intensity to the Character dial.
- **Organic blob shapes + per-section accent system** — soft, low-opacity **organic** blobs (not only geometric shapes) as section backdrops; optionally **colour-code alternating sections** with a rotating accent (green → blue → amber) behind each block. The wellness softness signature. Low-contrast, behind content, reduced-motion-safe. (Complements Rule 13 background texture; the *signature motif* still stays one — Rule 11 D4.)
- **Empathy-first copy (sensitive verticals)** — for recovery / mental-health / crisis, the hero and opening sections address the **emotional barrier** (shame, fear, privacy — "You're not alone," "100% confidential," "care from anywhere") **before** the pitch. Reassurance is the first conversion lever; pair with crisis resources (Rule 12) and Calm character.
- **Cohesive art direction** — one art-directed photo system site-wide: a single source/photographer where possible, consistent treatment and backgrounds (e.g. every portrait on the same backdrop), one icon family, one accent. **Mixed stock sources are the #1 "cheap" tell.** (Strengthens Rule 13 photography.)
- **Segmentation chooser** — let visitors self-select a path (Individual / Couples / Teen; or tabbed therapy modalities). Strong conversion UX for multi-audience services.
- **Service-card hover photo-reveal + avatar-cluster proof** — service/category cards can reveal a photo on hover (the grid doubles as a gallery); an **overlapping avatar cluster + "+N"** is a reusable trust component near CTAs.
- **Editorial display flex (Expressive character)** — an oversized standalone word or stacked multi-line headline as a section anchor/divider — a *calm flex*. **One per site**, paired with otherwise restrained type. Sits alongside the two-part / duotone headline (Rule 13).
- **Alt-channel CTAs + newsletter** — beyond the primary CTA: a live channel (WhatsApp / chat), **click-to-call on team cards**, and a **newsletter capture** in the footer. Different next steps for warm vs. ready visitors.

---

### 14. Sidebar layout — child service pages and post pages

All child service pages and blog/post pages use a two-column layout: main content on the left, sticky utility sidebar on the right. This layout must be templated and consistent so pages can be duplicated easily.

#### Column split
- Desktop: **65% main content / 35% sidebar** — sidebar max-width 360px
- Mobile: single column, sidebar collapses and stacks below the main content body (before the contact form)
- Container follows the standard 1280px max-width and 32px gutters

#### Main content column (left)
- Page hero with headline, meta/eyebrow label (ALL CAPS), and intro paragraph
- All body content: H2s (Title Case), body text, images, process steps, FAQs, testimonials specific to that page
- A full-width contact/inquiry form at the bottom before the footer (per Rule 10)

#### Sidebar column (right) — required elements
The sidebar is **sticky on scroll**. It follows the user down the page and releases when it reaches the footer. Modules are ordered to follow the patient's mental script after reading — **conversion order, not information order**. Every child/post page must include all of the following sidebar modules in this sequence:

1. **Booking CTA block + trust line** — the first thing the user sees after deciding they like the service; capture intent immediately. Headline (short emotional ask — e.g. "Ready To Feel Better?"), one-line supporting copy, full-width CTA button. Directly below the button: a trust micro-element — star rating + short social proof line (e.g. "★★★★★ Rated 4.9 by 200+ patients") using the client's real review data — never an invented figure; if unavailable use placeholder stars and "000+ reviews". Uses the primary CTA button color with required hover state (per Rule 12).
2. **Insurance & Payment card** — answers the #1 silent objection before the user calculates it. Include: accepted insurance note, cash discount availability, family plan note if applicable. Verbatim copy from live site/brief; if unavailable, a one-liner placeholder. Include insurance logos if provided; otherwise text only. Soft card with subtle background.
3. **Meet Your Doctor card** — a face + name at the moment of decision; people book people, not services. Include: provider photo (circular crop, 1:1), name, credentials/title, and a "Book with [Name]" link. Real photo and data from brief; if unavailable, a correctly proportioned placeholder and Lorem name. Compact horizontal card.
4. **Hours of operation** — logistics; answers "when can I go?". Listed by day or grouped (Mon–Fri / Sat / Sun). Two-column label + time format, scannable at a glance.
5. **Visit + Directions** — phone (click-to-call on mobile), address with a Google Maps link, email. Optionally a small static map thumbnail if the brief provides a Maps embed.
6. **Other Services** — lowest urgency, placed last so it doesn't distract from converting on the current service. 2–3 linked service names relevant to the current page. ALL CAPS eyebrow: "EXPLORE OTHER SERVICES". Each link has a hover state (background highlight, 200ms ease-out). Simple list — no cards, no icons — keep visual weight low.
7. **Downloadable resource (if available)** — new patient intake form, service FAQ PDF, or any relevant download. Compact card with a download icon (from the project's icon set, per Rule 11) and a short label. If no download is available, omit this module entirely — do not placeholder it.

#### Sidebar styling rules
- Modules separated by a thin 1px rule or 24px gap — never heavy dividers
- Each module has 20–24px internal padding
- Sidebar background matches the page background or uses a subtle card treatment (soft shadow per Rule 13, border radius 12px)
- On mobile, modules stack vertically below the main content in this order: Booking CTA + trust line → Insurance & Payment → Meet Your Doctor → Hours → Visit + Directions → Other Services → Downloadable resource
- **Conditional note:** the "Other Services" demotion to last position is the default for healthcare and service businesses. For industries where cross-sell has higher value (e.g. multi-location real estate, e-commerce), it may be moved to position 3 — note the override in the Project Brief if needed.

---

### 15. Identity section preservation — redesign, never erase

Before starting the Design Canvas, Claude audits the live site and identifies any sections that do not appear in the standard 10-section stack (Rule 10). These are **identity sections** — non-standard blocks that exist because someone made a deliberate choice to put them there. They give the site its personality and the client their sense of familiarity. Removing them silently is not an option.

Examples to look for: business history timeline, founder's letter or personal statement, before/after slider, interactive or zoned location map, stats/counter block, certifications or awards wall, video feature section, community involvement block, patient transformation stories, process walkthrough with custom illustrations, neighborhood or city guide, team culture section, any section with a unique layout not found in the standard stack.

Rules:
- **Auto-include** — if an identity section is found on the live site, include it automatically in the new build. Do not wait to be asked and do not flag it for approval. The reviewer will remove it if they don't want it.
- **Same page, logical placement** — if it was on the About page of the live site, it goes on the new About page; if on Home, on Home. Place it where it fits logically within that page's section stack — typically after the core informational sections and before the CTA or FAQ.
- **Redesign the shell, preserve the soul** — rebuild the section visually from scratch to match the chosen design direction. Do not carry over old styling. Keep the content, concept, and structure intact. A timeline stays a timeline; a stats block stays a stats block.
- **Flag it in the build log** — after including an identity section, note briefly: what it is, which page it's on, and that it was carried over from the live site.
- **If the live site cannot be accessed** — skip the audit and note it. The reviewer can request identity sections manually.
- **Rule 3 always wins on copy** — Rule 15 governs structure, Rule 3 governs content. If the section has thin or no copy, preserve the structure and fill gaps with flagged Lorem Ipsum — never invented prose.

---

### 16. Client communication protocol

Design work fails at the presentation layer as often as it fails at the execution layer. This rule governs how every deliverable is handed off so the client always knows what they're looking at, why decisions were made, and exactly how to give useful feedback.

#### 16a. Design Canvas — plain-English direction summary
After building the Design Canvas, generate a short plain-English summary for each direction — written as if you're talking to a business owner who has never heard the words "typographic hierarchy" or "contrast rhythm." Each direction summary must include:
- One sentence on what feeling this direction creates for the patient/customer walking in
- Why the colors were chosen in plain terms
- What makes this direction distinct from the other two
- Who this direction is best for (the persona, not the design archetype)

Format: short paragraph per direction, no bullet points, no jargon. Written to be copy-pasted into an email or read aloud on a Loom.

#### 16b. Preview Shell handoff — "what to review" checklist
When a Preview Shell is delivered, include a short handoff note that tells the client exactly what to look at and what decisions need to be made. The handoff note must include:
- What's complete and what's still placeholder (copy, images, real data)
- The 3–5 most important things to review and approve before revisions start (e.g. navigation structure, hero message, section order)
- What is intentionally placeholder and will be swapped with real content later
- One sentence on what NOT to focus on yet

Format: a short numbered list, plain language, under 150 words. Included at the top of the response when the Preview Shell is delivered.

#### 16c. Feedback protocol — structure every revision request
When a client or reviewer requests a change, Claude must confirm it understands the request by restating it in structured form before making any edits:
- **Page:** which page
- **Section:** which section on that page
- **Element:** what specifically
- **Change:** what should be different
- **Viewport:** desktop, mobile, or both

If any of these are missing or ambiguous, ask before touching anything. A vague instruction like "change the colors" or "make it pop more" must be clarified — never interpreted and applied unilaterally. One structured confirmation per change request, then execute.

---

### 17. 8pt spacing system + color scale

The invisible discipline behind premium sites. Spacing and color must follow a defined system — never arbitrary values.

#### Spacing — 8pt grid
- Every **authored/fixed** spacing value across the entire site must be a multiple of 8px. **One exception:** fluid section-rhythm tokens (`--section-y`, `--gutter`) built on `clamp()` may pass through non-grid intermediate values *between* breakpoints — their endpoints still sit on the grid; the 8pt grid governs every value you write by hand.
- Allowed values: **4, 8, 16, 24, 32, 48, 64, 80, 96, 120, 160px** (4px allowed for micro-spacing — icon gaps, badge padding, inline elements only)
- Applies to: section padding, component padding, margins, gaps, gutters, grid spacing
- Never use arbitrary values like 13px, 27px, 45px, 70px — round to the nearest allowed value
- Border radius sub-scale: 4px (subtle), 8px (default cards), 12px (larger cards), 16px (max for cards), 9999px (pill/full-round only)
- The section padding minimums in Rule 13 (120/80) already align — enforce the full grid everywhere else

#### Color scale — beyond 2 accent colors
Each brand accent color must have a full tint scale for hover states, card backgrounds, borders, and subtle fills:
- **50** — almost white; section tints and card backgrounds
- **100** — very light; hover backgrounds on nav items and list rows
- **200** — light; borders, dividers, tag backgrounds
- **300** — medium-light; disabled states
- **500** — the base brand color (default)
- **700** — dark; hover states on buttons and active states
- **900** — very dark; the dark anchor color in nav/footer/CTA sections

Semantic colors — define once, use consistently:
- **Success** — a green that harmonizes with the brand palette
- **Error** — a red that harmonizes with the brand palette
- **Warning** — an amber that harmonizes with the brand palette
- Used exclusively for form states, alerts, and feedback — never decorative

Document the full scale and semantic colors in the Style Guide (Rule 7) before building any components.

---

### 18. Component state library — all six states, every element

Every interactive element must have all six states designed before it appears on any page. If a state isn't designed, it isn't built. Document every state in the Style Guide (Rule 7) as soon as the component is created.

#### The six required states
1. **Default** — resting appearance, no interaction
2. **Hover** — cursor over the element, 200ms ease-out transition
3. **Active / Press** — mouse down or tap, brief visual depression (translate-Y 0, slight darken)
4. **Disabled** — exists but cannot be interacted with (50% opacity, no cursor pointer, no hover effect)
5. **Loading** — activated and waiting for a response (spinner or subtle pulse, button width locked to prevent layout shift)
6. **Error / Success** — form inputs and submission buttons only (red border + error message below for error; green confirmation for success)

#### Edge cases — plan for these before they appear in production
- **Empty state** — what does a section look like with no content? (no reviews yet, no blog posts yet) Design a placeholder state with a brief message and a CTA, not a blank space
- **Truncated state** — set max lines with ellipsis overflow on all text that could vary in length
- **Variable-length content must not break layout** — any section fed by dynamic/CMS content (testimonials, team bios, service cards, custom fields) must hold up with **both short and long** content. Test each with extra-long text + larger images; it must stay contained and responsive — no overflow, overlap, or pushed-out layout. (Real bug: an oversized testimonial broke pages on a past health-clinic build.) Use flexible heights, wrapping, and contained text — never fixed heights that assume a content length.
- **Form validation** — every input needs: default, focus, filled, error (red border + message), and success (green border or checkmark) states
- **Zero results** — search/filter interfaces need a designed "no results" state, not a blank page

---

### 19. The 1% moments checklist

Before any build is declared complete, Claude must implement and verify every item on this list. These are the details nobody notices when they're right — and everyone notices when they're wrong.

**Browser and sharing**
- ☐ Favicon — matches the brand mark, provided in 32×32 and 180×180 (Apple touch icon). Never the default browser icon.
- ☐ Browser tab title — "Page Name | Business Name" on inner pages, "Business Name | Tagline" on Home
- ☐ OG / social share meta — title, description, and OG image defined for every page

**Pages every site must have but most forget**
- ☐ 404 page — designed with brand personality, a clear message, and a link back to Home and the primary CTA
- ☐ Form success page or state — branded confirmation message or thank-you state; never a blank/raw page
- ☐ Form error state — clear, human error message, not a raw error string

**Interaction details**
- ☐ Focus states — every interactive element has a visible focus ring for keyboard navigation (brand accent at full opacity)
- ☐ Scroll position — navigating back from a child page restores scroll position; anchor links scroll smoothly (Rule 12)
- ☐ Page / route transition — a subtle fade (opacity 0→1, 200ms ease-out) between page loads
- ☐ Button loading state — any button triggering a submission/async action shows a loading state; no double-submit risk

**Content edge cases**
- ☐ Long content test — check every card, heading, and label with 2× the expected copy length
- ☐ Empty dynamic sections — designed empty state if reviews/posts/team are missing
- ☐ Image fallback — brand-colored placeholder if a photo fails to load; no broken image icons

**Footer and final details**
- ☐ Footer fully designed — logo, tagline/one-liner, nav links, contact details, socials, legal (copyright, privacy)
- ☐ Copyright year current and dynamic where possible
- ☐ External links may open in a new tab with a visual indicator; same-site links never do
- ☐ Phone numbers are click-to-call on mobile (`tel:` links)
- ☐ Addresses link to Google Maps

---

### 20. Section intent & conversion psychology

Rule 10 says *which* sections to build. This rule says *why each one exists* — the job it does, the fear it removes or desire it builds, and how a human reads it when it's right vs. wrong. Use it to make judgment calls, not just fill slots.

**The core principle:** a marketing page is a funnel. Every section must **reduce a fear or build desire, then point toward the same one action.** When sections compete (multiple CTAs, cluttered nav, vague headline), conversion drops. When they reinforce one clear path, it climbs.

> Hook them (Hero) → Reassure them (Social proof) → Convince them (Value Prop / How it works) → Prove it (Testimonials) → Price it *(if applicable)* → Remove doubt (FAQ) → Close (CTA) → Catch the stragglers (Footer).

| Section (Rule 10 name) | Its one job | Fear it removes / desire it builds | Done wrong or skipped | Perceived: right → wrong |
|---|---|---|---|---|
| **Header / Nav** | Orient instantly; keep the CTA one click away | "Where am I, where do I go?" | Cluttered menu, no clear CTA, logo doesn't link home → choice paralysis, bounce | "I know where I am" → "Where do I even click? This feels messy" |
| **Hero** | Win or lose them in 3–5s; communicate core value + one CTA above the fold | "Is this for me?" → desire to keep scrolling | Vague headline, no CTA, pretty-but-empty visual → no hook, instant exit | "This is exactly for me" → "What is this even?" |
| **Trust / Social Proof Bar** | Answer "is this legit?" right at the decision point | Lowers perceived risk early | Generic stock logos / unverifiable claims → *more* suspicion than none | "People I respect use this" → "Who actually uses this?" |
| **Value Proposition** (Features/Benefits) | Turn interest into desire; sell outcomes, not specs | "Will this solve *my* problem?" | Listing features not benefits; over-explaining → "so what?", leaves to compare | "This solves my exact problem" → "Cool specs, but so what?" |
| **How it works** *(conditional)* | Lower perceived effort for anything new/complex | Fear of effort/hassle | Too many steps → looks complicated, kills sign-ups; unnecessary on simple offers → clutter | "That's easy, I could do that" → "Ugh, looks complicated" |
| **Testimonials / Reviews** | Third-party proof; overcome objections in the customer's words | Purchase anxiety; "do people like me get results?" | Vague/anonymous quotes ("Great! – J.S.") → reads fake, taints the whole page | "People like me got real results" → "These feel fake" |
| **Offer / Pricing or Plans** *(conditional — most service clients omit)* | Transparency + steer to a target option | "Am I being upsold / is this hidden?" | Hidden price reads "expensive"; too many tiers → paralysis; no recommended option → wasted steer | "Fair, and I see my plan" → "Why are they hiding the price?" |
| **FAQ** | Silent objection-handling right before the ask | Last "but what about…" doubts | Answering trivia while ignoring the real objection (refunds, cancellation, security) | "They thought of everything" → "They skipped the one thing I cared about" |
| **CTA Section** | The closing ask after the case is made | Decisiveness; clear next step | Weak verb ("Submit"); competing CTAs → hesitation, momentum dies | "Yep, I'm ready" → "Wait, what do I click?" |
| **Footer** | Trust-and-safety net; catch stragglers (newsletter, contact) | Legitimacy reassurance | Missing contact/legal → looks amateur or non-compliant; overstuffed → ignored | "A real, legit business" → "Is this even a real company?" |

**Risk-reversal & urgency — dissolve the final hesitation.**
Near every primary CTA, reduce the perceived risk of acting and give an honest reason to act now:
- **Risk-reversal:** free consult, no-obligation quote, money-back or satisfaction guarantee, "most insurances accepted," cancellation ease, security/HIPAA assurance for health clients
- **Urgency — only if true:** "same-week appointments," limited intake, seasonal offer. Never fabricate scarcity; false urgency is caught and destroys trust (Rule 3 applies to claims too)
- Place these as micro-elements beside the CTA or trust line, not as their own heavy section

**Notes for local/service businesses:**
- **Pricing/Plans is conditional.** Most of our archetypes (clinics, therapy, real estate) deliberately don't publish tiered prices. Include this section only when the client sells something with clear, listable pricing; otherwise omit it — do not force a tier table.
- **How it works** lives as *Our Process* on Service child pages by default (Rule 10 stack); add it to a Home page only when the offer is genuinely new or complex enough to need it.
- Everything else maps to the standard Rule 10 stack — this rule adds the reasoning, it does not change the stack.

---

### 21. Conversion Engineering

Rules 10–20 make a page well-built and well-reasoned. This rule makes it **arrive, load, work for everyone, and actually convert**. These are not polish — for local service businesses they are the difference between a pretty page and a paid one. Verify them in the Pre-Export Gate (Rule 8b).

#### 21a. One conversion goal per page — the spine
Before the Design Canvas, every page declares, in the build log:
- **The one primary action** this page must drive (e.g. book a consult, submit the inquiry form, call). One — not three.
- **Who it's for** (the persona/visitor).
- **The single biggest objection** it must overcome.

Design backward from that goal. Secondary actions may exist but must be visually subordinate to the primary. A page with no declared goal is not ready to design — a beautiful page that drives nothing is a failure, not a draft.

#### 21b. SEO & local discoverability — traffic has to arrive
- **One `<h1>` per page**, logical `h2`/`h3` order — never skip levels for styling (size is controlled by CSS, not heading level)
- **Unique title + meta description** per page (title format per Rule 19)
- **Descriptive `alt` text** on every meaningful image; `alt=""` on purely decorative ones
- **Structured data (schema.org JSON-LD):** `LocalBusiness` (name, address, phone, geo, hours) site-wide; `FAQPage` on FAQ sections; `Review` / `AggregateRating` on testimonials; `Service` on service pages; `BreadcrumbList` on child pages — these drive Google rich results (star ratings, FAQ accordions in search)
- **NAP consistency** — business name, address, phone identical everywhere (site + footer + schema) and matching the Google Business Profile
- Clean, descriptive URLs; canonical tags; sitemap + robots (deploy — see handoff)
- **Local signals:** real map embed, location/service-area mentions from the brief, location pages where multiple offices exist

#### 21c. Performance / Core Web Vitals — speed is conversion
- **Reserve dimensions on every image/media** (explicit width/height or `aspect-ratio`) so nothing shifts as it loads — protects CLS and the hero
- **The hero visual is the LCP element:** size it correctly, load it eagerly; lazy-load everything below the fold
- Modern image formats (WebP/AVIF) with sensible fallbacks; never ship oversized originals
- **Font loading:** **self-host brand fonts** (`@font-face` woff2 + `unicode-range` subsetting) by default — faster, more private, and removes a third-party dependency. Hot-linking Google Fonts is a fallback only. Always `font-display: swap`, subset, and limit families/weights (ties to Rule 11 — typically 1–2 families).
- Defer non-critical JS; no render-blocking weight; no autoplay video with audio (Rule 12)
- **Targets:** LCP < 2.5s, CLS < 0.1, INP < 200ms

**Image optimization standard** *("modern image formats" above is directional; these
concrete numbers make it actually checkable in the Rule 8 gate)*

| Image type | Max size | Format | Dimensions | Loading |
|---|---|---|---|---|
| Hero | 200KB | WebP + JPEG fallback | 1600×900 | eager |
| Card | 80KB | WebP | 800×600 | lazy |
| Portrait | 60KB | WebP | 600×750 (4:5, face-safe per Rule 13) | lazy |
| Background | 150KB | WebP | 1920×1080 | eager (hero) / lazy (elsewhere) |

**Stock sourcing priority** — always try in this order before falling back further:
1. Client-supplied assets (real photos/logo — Rule 23 ingestion)
2. AI-generated (document the generation prompt in the Style Guide's Image Library)
3. Unsplash/Pexels (record the license/attribution)
4. Gradient placeholder (last resort — flag clearly as placeholder, never presented as final)

#### 21d. Accessibility / WCAG AA — usable by everyone (and legally safer)
For healthcare, legal, and real-estate clients, accessibility is also ADA/WCAG exposure — this protects the client and the agency.
- **Color contrast ≥ 4.5:1** for body text, **≥ 3:1** for large text and UI components — verify the chosen palette's text/background pairs (use the Rule 17 tint scale to find compliant shades)
- **Visible focus ring** on every interactive element (Rule 19), full-opacity brand accent
- **Semantic HTML + landmarks** (`header`, `nav`, `main`, `footer`) and correct heading order (21b)
- Keyboard-operable everything: nav, dropdowns, the mobile dialog menu, accordions, forms
- Honor **`prefers-reduced-motion`** — disable entry/scale animations for users who request it
- **Tap targets ≥ 44×44px**
- Form inputs have associated `<label>`s (not placeholder-only); errors are programmatically announced
- **WCAG 2.2 items that bite marketing sites** *(2.2 is the operative AA standard; 3.0 is a years-out draft and its APCA contrast model is exploratory — 2.x ratios stay the hard gate)*:
  - **Target size (§2.5.8):** EVERY interactive target ≥24×24 CSS px or equivalent spacing — the usual offenders are social icons, nav carets, and close buttons, not CTAs
  - **Focus not obscured (§2.4.11):** sticky nav / sticky mobile bar must never fully cover the keyboard-focused element — verify by tabbing the full page
  - **Consistent help (§3.2.6):** the contact mechanism sits in the same place on every page (the universal nav/footer/sticky-bar structure satisfies this — don't break it per-page)
  - **Redundant entry (§3.3.7):** multi-step forms never ask for the same information twice

#### 21e. Forms — the actual conversion event
For service businesses the form *is* the sale. Treat it as the most important component on the page.
- **Minimize fields** to the essential (name, one contact method, one qualifier). Every extra field costs conversions — justify each one
- **Single column**, logical order, real labels above inputs; multi-step only for genuinely long forms
- **Inline validation** with human error messages; all six input states per Rule 18
- **Spam protection that adds no friction** — honeypot or invisible check, never a puzzle/CAPTCHA the user must solve
- **One clear submit** with a strong, specific verb (never "Submit") — the page's primary action
- **Always a success state / confirmation** (Rule 19) — never leave the user on a blank or raw page
- Short **privacy reassurance** near the button; set a response expectation ("We'll reply within one business day")
- Where the lead actually goes (email/CRM) and the autoresponder are deploy-time — see the handoff spec

---

### 22. Revision & verification discipline

How Claude handles feedback and proves the work is correct. These keep builds tight and turn every fix into a reusable lesson.

#### 22a. Explain-then-fix (Claude behavior)
When asked to fix something, **first state the issue, then fix it** — in this order:
1. **What's wrong** (the symptom)
2. **Why it happens** (the root cause — the actual CSS/layout/logic reason, not just "it looked off")
3. **The fix** (what you changed)

Keep the explanation clear and root-cause focused so it doubles as a **prevention rule** for future sites. Example: *"The Story image and text had a doubled gap — the stacked grid has a 36px gap, but I'd also added a 24px margin under the image, so they compounded to ~60px. Removed the redundant margin; now it's a clean single 36px gap."* Root-cause explanations like this feed Rule 22b and become new playbook rules.

#### 22b. Running change log (every build)
Maintain a running log of changes during a build: each request, what was changed, and (for fixes) the root cause from 22a. This log is the raw material for writing better prevention rules — recurring issues graduate into playbook rules so future sites don't repeat them. Keep it with the project (or the Style Guide's build notes).

#### 22c. `/check` — verification cadence
Cross-reference the list of **requests made** against the **changes actually applied**, so nothing is silently missed.
- **Automatic:** run a check **every 5 requests** — list each of the last batch's requests and confirm pass / not-done / partial against the live design.
- **Manual:** the reviewer can trigger a check anytime with **`/check`**.
- On any miss, fix it before continuing. Report the cross-reference as a short table (request → status).
- *(Implementation note: `/check` can be wired as a slash command in the environment; until then it's run on request and on the 5-request cadence.)*

**Batch-comment reconciliation — treat a batch as ONE checklist.** When the reviewer sends several comments together, do **not** act on them one-by-one and let the latest override an earlier one. Instead:
1. **Enumerate every comment as its own line item** before touching anything.
2. **Reconcile the net end-state** — especially when an *add* and a *remove* touch the **same element** (that's intentional, e.g. "remove the 3 auto-placed motifs, keep/add one deliberate one"), not a contradiction to resolve by deleting everything.
3. **Apply, then verify every item against the live design** before saying done — confirm each landed; nothing silently falls off the list.
The pointer is **element-level** (the reviewer's click resolves to the specific DOM element + selector + a text/alt snippet, not a pixel guess), so when intent is ever genuinely ambiguous (a wrapper vs. an inner card), **ask rather than guess.**

#### 22d. Persistent Operating Log — lessons that carry between builds
22b is the *per-build* change log. **22d is the standing, cross-project log** that lets Claude Design learn how this team operates and stop repeating mistakes. It lives in **project knowledge** (carries between builds, like the toolkit) — file: `Operating Log.md`.

- **Consult it at the start of every build** (with grounding, Rule 1a): review the recurring root causes and operating preferences so known mistakes aren't repeated and known preferences are honored from the first draft.
- **Distill into it after each build:** roll up the recurring fixes/decisions from that build's change log (22b) — especially `FIX` items with root causes — into the standing log.
- **Emit it for re-upload — the build's final step.** At the end of every build, output the **updated `Operating Log.md` as a file** plus a short **"what changed this build"** note, so the reviewer can drop the refreshed log back into the START HERE inputs for next session. The Operating Log only carries forward if it's actually re-uploaded — so closing this loop (emit → re-upload) is mandatory, not optional.
- **Graduate universal items into playbook rules:** when a lesson or preference proves to apply to *every* site, promote it from the Operating Log into a numbered rule here (that promotion is exactly how this playbook has grown).
- **Contents:** (1) operating preferences (how the team likes to work + standing instructions), (2) recurring root causes / prevention rules, (3) an index of per-build change logs, (4) a "graduated to rules" list.

The loop: per-build change log (22b) → Operating Log (22d) → playbook rules.

---

### 23. Asset & Data Ingestion — fetch once, up front; never ad hoc

**The policy:** gather everything the build needs from the live site / web in **one explicit ingestion pass at the start**, save it into the project, and from then on **build only from the gathered assets**. Do **not** fetch, browse, or pull anything new mid-build. Fetching once and freezing the asset set keeps builds fast, controlled, and truthful (no broken hotlinks, no surprise wrong assets, no dependence on a flaky mid-build fetch).

This rule governs *when and how* fetching happens; the other rules (3, 3e, 13, 15, 21b) say *what* to gather. They all resolve here.

#### 23a. The ingestion pass (run with grounding, Rule 1a)
In one pass, gather and save into the project's asset set + the Style Guide Image Library (Rule 7 #13), each labeled with its source:
- **Logo + favicon** — light/dark variants if present, unmodified (Rule 3e)
- **Copy** — page text, headlines, service names, verbatim (Rule 3)
- **Real business data** — NAP (name/address/phone), hours, email, socials, service-area cities; match the Google Business Profile (Rule 21b)
- **Reviews** — from the live site, else Google; capture the pill data (rating + count) and individual quotes (Rule 13)
- **Photography** — client / live-site images
- **Stock candidates** — if heros or internal-page backgrounds will need stock, source the Unsplash/Pexels candidates **now** and record source + license (Rule 13). Don't defer image-sourcing to mid-build.

#### 23b. After ingestion — frozen asset set
Once the pass is done, the build uses **only** what was gathered. If something is missing post-ingestion: use a **flagged placeholder / Lorem** (Rule 3) and note it for the reviewer to supply — never fetch it inline. If a genuinely new asset becomes necessary, do a **deliberate new ingestion pass**, don't fetch ad hoc.

#### 23c. What a URL fetch can and cannot give you
**Tested Aug 2026 — treat as a hard capability boundary, not a preference:**
- **Fetchable:** page **text** — copy, headlines, service names, review quotes, NAP details. Use these verbatim (Rule 3).
- **NOT fetchable:** raw HTML/CSS/DOM or image files. That means **logo files, measured brand hex values, real font names, and alt text cannot be recovered from a URL.** These must arrive in the Design Prompt (the Synthesizer measures them) or as uploaded files.

**Never substitute a guess for an unfetchable asset.** No inventing a brand hex from a screenshot or a company name, no naming a font by vibe. If a value isn't supplied, say so and treat the choice as yours to make — an unmarked guess is exactly the drift the provenance rule exists to catch.

#### 23d. If the live site can't be accessed at all
Note it (Rule 15); the reviewer supplies assets in the Brief. Proceed with flagged placeholders for anything missing — do not keep retrying fetches mid-build. The build then ingests from the prompt, not the live site.

