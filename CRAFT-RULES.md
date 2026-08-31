# CRAFT RULES — universal design craft, brand-agnostic
### Design Scarlet Macaw (added Aug 31, 2026). Travels in the upload set alongside the Master Playbook.

> **What this file is:** the rules a competent senior designer applies to ANY brand,
> separated from the Master Playbook's workflow/client rules so universal craft and
> per-project process stop sharing one file. The Master Playbook says *what to build
> and in what order*; this file says *what good looks like at the pixel level,
> regardless of client*. Where the two ever appear to conflict, the Master Playbook's
> hard gates (Motion Contract, Compliance Audit, Rule 8b) win — this file sharpens
> them, it never relaxes them.
>
> **Provenance:** distilled Aug 31 2026 from three research passes: open-design's
> `craft/` layer (adapted from MIT-licensed refero_skill — attribution retained),
> Anthropic's own frontend-design skill guidance, Radix/USWDS/Carbon color methods,
> and 2025–26 CRO + WCAG 2.2 evidence (Unbounce 57M-conversion benchmark, Baymard,
> NN/g, Google/Deloitte, W3C).

**Why this layer exists (read once, it explains every rule below):** an LLM left
alone regresses to the statistical mean of its training data — Inter, an indigo
accent, a purple gradient, three centered rounded cards. Quality comes from
**explicit constraint, not more generation.** Every rule here is a constraint with
a named failure it prevents.

---

## C1. The banned-defaults list (P0 — hard bans, checked in the Rule 8b gate)

These are the recognizable "AI slop" tells. They are bans, not suggestions —
concrete prohibitions are followed far more reliably than aspirations.

1. **Banned accent hexes** — never use the Tailwind-indigo family as an accent:
   `#6366f1 #4f46e5 #4338ca #3730a3 #8b5cf6 #7c3aed #a855f7` (or near neighbors).
   Root cause: these saturate AI training data via Tailwind demos. If a client's
   real brand color genuinely lands here, document it as a client asset (Rule 23)
   — that's the only exemption.
2. **No two-stop purple→blue (or purple→cyan) gradient heroes.** The single most
   recognizable AI tell.
3. **No emoji as feature/service icons.** Icons are 1.5px-stroke monoline SVG in
   theme colors (Master Playbook Rule 11 icon rule). Single exception: footer
   contact rows may use 📞 ✉️ 📍 at Claude Design's discretion, matched to brand
   register — upscale/high-formality brands get monoline SVG icons instead.
4. **No Inter or Roboto by default.** Every typeface choice names its reason in
   the build log. (A client whose existing brand uses them is, again, the exemption.)
5. **No "rounded card + colored left-border accent" tiles** — the canonical AI
   dashboard tell. Drop the radius or drop the border; never ship both together.
6. **No invented metrics** (Master Playbook Rule 3 already bans this — `00+`
   placeholders only) and **no filler copy** presented as real.
7. **No glassmorphism glow-cards / neon glow borders** unless the direction
   explicitly declares them as its signature (and then only once).

**The three "AI default looks"** (from Anthropic's own frontend-design guidance) —
not banned, but choosing one requires a stated client-specific reason, because they
are what every AI reaches for when unconstrained:
- Warm cream `#F4F1EA` + high-contrast serif + terracotta accent
- Near-black + a single acid-green or vermilion accent
- Broadsheet/editorial layout with hairline rules and zero border-radius

**Layout tells (P1 — flag, fix unless deliberate):**
- A page that is entirely centered sections of uniform rounded cards. Require at
  least two asymmetric/editorial compositions per page (offset grid, split section,
  mixed-size bento) — the Section Layout Library's families exist for this.
- Uniform border-radius on every element regardless of role. Radius follows the
  component's role and the direction's radius language (Master Playbook Rule 13).
- The unvaried Hero → Features → Pricing → FAQ → CTA skeleton with nothing moved
  or merged for this specific client.

---

## C2. Typography craft

**The two most reliable AI typography tells are tracking failures. These are exact:**

| Context | Letter-spacing | Why |
|---|---|---|
| ALL CAPS (eyebrows, labels, buttons in caps) | **+0.06 to +0.1em** | Caps set tight read cramped and amateur (Bringhurst) |
| Display type ≥48px | **−0.02 to −0.03em** | Large type needs negative tracking or it reads loose |
| Small text ≤13px | **+0.01 to +0.02em** | Small sizes need air to stay legible |

*(These reconcile with Master Playbook Rule 13's "−0.02 to −0.04em on large display" —
that rule stands; this table adds the caps and small-text rows it didn't cover.)*

- **Three-weight system — scoped to BODY and UI text:** Read **400** / Emphasize
  **500–550** / Announce **600**. In body copy, labels, nav, and forms, weight
  700+ is rarely needed — reach for size, color, or spacing contrast first.
  **Display/headline faces are exempt:** when the industry archetype calls for a
  heavy display cut (ExtraBold/Black, 700–900 — e.g. condensed industrial or
  bold-modern directions), use it. What's banned is heavy weights sprayed across
  body text, not bold display typography.
- **Pairing:** one expressive display face + one quiet body face, max 2 families
  (Rule 11 already caps at 1–2). Prefer **variable fonts** — vary weight/width for
  hierarchy instead of adding families; they're the 2026 baseline for serious work.
- **Body:** 65ch max line length (Rule 13's 60–75ch stands), line-height 1.5–1.7,
  never justified.
- `text-wrap: balance` on multi-line headings (also serves Rule 13's no-orphans rule).

---

## C3. Color craft

- **Pixel-share budget** for any given screen: neutrals **70–90%** · one accent
  **5–10%** · semantic colors **0–5%** · decorative effects **<1%**. A page that
  "feels loud" is almost always over budget here.
- **Accent discipline:** in any single viewport, the accent color earns its place
  on the primary CTA first; beyond the CTA + one supporting appearance, each
  additional accent use needs a reason. Links and focus rings count toward the
  budget. (This sharpens — never overrides — Rule 12's "one primary action per
  page, repeated down the page": the *repeats* are in different viewports as the
  user scrolls, so they don't stack in one screen.)
- **Author palettes in OKLCH; ship hex.** Derive a tint scale by varying **L** at
  fixed C/H — steps stay perceptually even, which eyeballed hex scales never are.
  The Rule 17 50→900 scale is the structure; OKLCH is how the values get made.
- **Every color exists as a bg/fg PAIR** that passes contrast (C6) — including
  hover/active/focus states, not just resting states.
- **Dark surfaces:** `#0f0f0f`-class darks, never pure `#000`; borders on dark as
  semi-transparent white (`rgba(255,255,255,0.08)`), not gray hexes.
- **Name tokens by purpose, never hue** (`--cta`, not `--green`) — tokens.css
  already does this; keep it that way in every per-client fork.
- **Variety across the book:** never reuse the same accent hue family two clients
  in a row. Check the Operating Log's recent-builds notes.

---

## C4. The 80/20 soul doctrine

**~80% proven patterns + ~20% distinctive choice.** The 80% is the Component
Library, the section stacks, the conversion structure — don't innovate there. The
20% is where the build earns its identity, and it lives in exactly four places:

1. One bold type or color move (the direction's thesis made visible)
2. Microcopy voice (short copy Rule 3f permits, written in the client's register)
3. One memorable micro-interaction (the Rule 11 Decision 7 signature moment)
4. One detail only a real customer of this business would recognize

**Spend the boldness in one place.** One decisive flourish — one, not three
(this is Rule 1a's "ONE signature flex" restated as a craft law).

**The screenshot test (run at the Rule 8c critique):** if someone could screenshot
any section and name the client, the build has soul. If the screenshot could be any
business in the vertical, it's a template — go back to the four slots above.

---

## C5. Copy register (for the copy Rule 3f permits)

Scope: this governs ONLY the short copy the system is allowed to write (headlines,
eyebrows, button labels, section titles — Rule 3's exception list). Body prose
stays verbatim-or-Lorem per Rule 3, always.

- **5th–7th grade reading level.** Evidence: Unbounce's large-scale landing-page
  research (their multi-million-conversion benchmark dataset) found simpler copy
  converts meaningfully better than college-level copy — directionally robust,
  so don't quote a precise percentage. Cut 3+-syllable words; front-load the point.
- **Headlines <14 words.** Word count is a cost, not a canvas.
- **CTAs say what happens:** "Get My Free Quote" beats "Get Started" beats
  "Submit" (Rule 3f already bans "Submit" — this is the positive form).
- **Same verb for the same action everywhere** (Rule 8b's button-label consistency
  check, restated as a writing rule).
- Errors never apologize ("Sorry!") — they say what to do next. Empty states are
  invitations to act, not dead ends.
- When client copy arrives written at college level, flag it in the Dev Handoff
  as a conversion risk — never rewrite it silently (Rule 3).

---

## C6. Accessibility floors — by construction, not by audit (WCAG 2.2 AA)

These land in tokens.css so passing is structural, not a post-hoc check:

- **Contrast:** body text ≥4.5:1, large text + UI components ≥3:1 — verified for
  every bg/fg pair in every interactive state (Rule 21d stands; the per-state
  check is the addition).
- **Target size (WCAG 2.2 §2.5.8, new AA):** every interactive target ≥24×24 CSS px
  or equivalent spacing. Mobile CTAs stay at Rule 21d's ≥44px (48px preferred).
  This catches the small offenders: social icons, nav carets, close buttons.
- **Focus not obscured (§2.4.11, new AA):** the sticky nav and any sticky
  mobile bar must never fully cover a keyboard-focused element — check by tabbing
  through the page with the sticky elements in place.
- **Focus ring:** 2px visible outline, ≥3:1 contrast against its background —
  tokenized (`--focus-ring`), never removed, never color-only.
- **Consistent help (§3.2.6):** the contact mechanism (phone/CTA) appears in the
  same place on every page — the system's universal nav/footer/sticky-bar
  structure already satisfies this; don't break it per-page.
- **Redundant entry (§3.3.7):** multi-step forms never ask for the same
  information twice.
- All motion inside `@media (prefers-reduced-motion: no-preference)` — the Motion
  Contract's gate, restated because it is also a legal floor.

*(Status note, verified Aug 2026: WCAG 2.2 is the operative standard; WCAG 3.0 is
a working draft years from adoption and its APCA contrast model is exploratory
only — WCAG 2.x ratios remain the hard gate.)*

---

## C7. State coverage — five states per dynamic surface

Rule 18 covers the six *interaction* states of components. This covers the five
*content* states of any section fed by real data (reviews, posts, team, stats):

1. **Populated** — the happy path (the only one AI builds unprompted)
2. **Empty** — designed placeholder with a message + CTA (Rule 18 edge cases)
3. **Loading** — where applicable; if loading can exceed ~15s, show a "taking
   longer than usual" fallback, never an infinite spinner
4. **Error** — human message, a path forward, no raw strings
5. **Edge** — the 200-character title, the missing avatar, the 1-item grid, the
   40-item grid (Rule 18's variable-length rule, made a named state)

Forms validate on **blur**, not on every keystroke.

---

## C8. Performance is a design decision

(Concrete numbers live in Rule 21c's image table — this states the law.)
- Page weight target **≤1MB** total; hero image ≤200KB (Rule 21c). Scope: this
  budget applies to the FINAL exported build — the in-review React+Babel preview
  shell the playbook mandates is exempt from it.
- Zero JS frameworks in the shipped artifact beyond what Rule 9's format requires.
- Google/Deloitte's mobile-speed research ties every tenth of a second of load
  time to a meaningful conversion lift. Speed is not an engineering nicety; for
  local-service clients it is the conversion lever.
- Glassmorphism `backdrop-filter` costs real FPS on mid-tier phones — budget it
  like a signature moment, not a default card style.

---

## C9. Token-cost discipline (Claude Design sessions)

- Use the Tweaks panel / direct canvas edits for fine adjustments (color nudges,
  spacing, copy tweaks) — they don't consume model turns.
- Edit a previous prompt instead of stacking new messages when refining the same
  request.
- Regenerate individual sections, never whole pages, when only one section changed.

---

## C10. Cross-project variation — defeating the system fingerprint

C4's screenshot test asks whether this site could be *any business in its vertical*.
This rule asks the harder question: **could this site be any build produced by this
system?**

Thousands of people may run this playbook. If each one takes the industry file's first
listed palette lean, its first type archetype, and its section order verbatim, the
output converges — and the tell won't be a bad font, it will be that a hundred sites
share one silhouette. A shared standard should produce a shared *quality floor*, never
a shared look.

**The test.** Line this build's homepage screenshot up beside another build in the same
vertical from this system. If the two are twins, the industry file made the decisions —
not the brief. That's a fail; go back to the divergence inputs below.

**The divergence inputs — resolve these from the brief, never from defaults:**
1. **Personality sliders + "first five seconds" emotion** (Brief §9) — the primary
   divergence lever. Two practices wanting *calm/established* and *energetic/modern*
   should not share a palette, a type pairing, or a hero composition.
2. **The competitive set** (Rule 1a's Competitive Analysis) — the design must be
   visually distinguishable from the competitors the brief names. Looking like the
   local market leader is a loss, not a benchmark.
3. **The business's own specifics** — its story, premises, demographic, locale, price
   point. C4's fourth soul slot ("a detail only a real customer would recognize") is
   where this becomes visible.
4. **Existing brand assets** — where they exist they dominate, and they are the
   strongest anti-convergence force available. Use them.

**Sample the menus, don't read them top-down.** Industry palette and typography lists
are option spaces, not rankings. Taking the first item every time is what produces the
fingerprint. Pick what this business argues for; if nothing argues, pick deliberately
and say so.

**The defaults-count signal (mechanical).** Every Design Prompt ends with a
"Dimensions resolved from defaults" footer. Read it before designing:
- **0–2 dimensions from defaults** → the brief is driving. Proceed.
- **3–5** → partial. Push the resolved-from-brief dimensions harder so they carry the
  identity.
- **6+** → **convergence risk: high.** The brief isn't steering this build, the
  playbook is. Say so plainly in the Compliance Report, and make the three directions
  diverge *more* than usual to compensate — this is the exact condition under which
  generic output ships.

**What must never vary:** the accessibility floors, the banned defaults, the
conversion structure, the state coverage. Divergence is earned in expression, not by
lowering the floor. The silhouette stays; the execution moves with the year.

---

## How this file is enforced

Enforcement runs on three channels, strongest first. **A rule that lives only in an
uploaded file is the weakest form of enforcement there is** — field testing showed
uploaded rules get skipped at generation while prompt-carried rules ship. Anything that
must not be missed belongs in channel 1.

**1. In the Design Prompt (most reliable — it ships).**
- The **NON-NEGOTIABLE FLOOR** block: countable minimums, the P0 slop scan, menu
  discipline (C10's caps), brand precedence, and the divergence check.
- The **DO / DON'T list**: C1–C3 translated into named, client-specific prohibitions.
- The **"Dimensions resolved from defaults"** footer, whose count sets C10's
  convergence-risk verdict.

**2. Self-reported gates inside the build (useful, not proof).**
- **Rule 8b Pre-Export Gate** — the P0 slop scan plus the Motion and Contrast Manifests.
- **Rule 8c critique pass** — applies C4's screenshot test and scores the build.
- The per-page **Compliance Report**, where every deviation must be stated out loud.
- Treat these as a first-pass filter. A model auditing its own output in the same
  conversation grades generously; that is why channel 3 exists.

**3. Mechanical / independent verification (the only real proof).**
- Greppable checks: banned hexes, raw hex outside `:root`, emoji in headings, font
  families, target sizes, computed contrast pairs.
- An **independent review** — a fresh session, given this file and the built pages,
  with no memory of having built them.

**Rules with no mechanical check are judgment calls, and should read like it.** If a
line here can't be counted, grepped, or independently judged, it belongs in the "aim
for" register, not the "must" register — overstating an unenforceable rule teaches the
builder to treat the enforceable ones as soft too.
