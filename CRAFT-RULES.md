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
4. **No overused default faces.** Banned as defaults: **Inter, Roboto, Arial,
   Fraunces, and system-font stacks** (`system-ui`, `-apple-system`, Helvetica).
   These are what every AI reaches for unprompted, so they read as machine-made
   regardless of how well the rest is executed. Every typeface choice names its
   reason in the build log. (A client whose existing brand uses one is the
   exemption — brand beats ban, per C11's precedence.) A body stack may still list
   `system-ui` as a *fallback* after a named face; what's banned is shipping it as
   the choice.
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

**Accept generously, emit strictly (Postel's Law).** Rejecting valid input on formatting
grounds is a defect, not validation:

- **Phone fields accept spaces, dashes, parentheses and `+country`.** Card fields accept
  spaces. Postcodes accept either case. Dates tolerate common formats. Strip and
  normalise on the system side — never make the visitor guess your preferred shape.
- **Every input declares its purpose**: `type`, `inputmode` (so mobile shows the right
  keyboard), and `autocomplete` (`name`, `email`, `tel`, `street-address`, `postal-code`
  …). This is **WCAG 2.2 §1.3.5 Identify Input Purpose (AA)** and it's also the single
  cheapest conversion win in any form — autofill turns eight fields into one tap.

**Chunk what has to be read back (Miller's Law, correctly applied).** The usable
lesson from Miller is chunking, *not* an item-count cap — never cap a menu at seven on
the strength of it:

- Phone, card and account numbers are formatted into groups, not one unbroken run.
- Long forms are broken into labelled sections.
- **Never require carrying a value between screens.** If a later step needs something
  shown earlier, show it there too — recognition over recall.

**Multi-step flows show progress** (Zeigarnik/goal-gradient): steps completed, steps
remaining, and never a bar sitting at literal zero on step 1 — visible early progress
measurably improves completion.

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

**Interaction feedback under ~400ms (Doherty threshold).** Below roughly 400ms a person
stays inside their train of thought; above it, attention breaks and the interface starts
feeling like something they're waiting on. Every tap, hover, filter and submit
acknowledges itself within that window — if the real work takes longer, the
*acknowledgement* still lands immediately (pressed state, skeleton, optimistic UI), and
C7's loading state covers the rest.

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
conversion structure, the state coverage, and **the learned interaction conventions in
C11** — divergence is earned in expression, never in how the site behaves. The
silhouette stays; the execution moves with the year.

---

## C11. Jakob's Law — conventions you don't get to redesign

*"Users spend most of their time on other sites, so they prefer yours to work the same
way as all the others they already know."* (Nielsen) People arrive with a mental model
built by thousands of other sites. Meeting it costs nothing and breaking it costs
conversions.

**This is the counterweight to C10.** Divergence is earned in *expression* — palette,
type, composition, motion, voice. It is never earned in *interaction*. A site can look
like nothing else on the internet and still behave exactly like everything else on it;
that combination is the target. C4 already says don't innovate in the 80% — this rule
names what the 80% actually contains.

**Non-negotiable affordances (countable — check each before export):**
- **Logo sits top-left and links to the homepage.** The most universally learned
  convention on the web. On the homepage it may be inert, never absent.
- **Every phone number is a `tel:` link. Every email is a `mailto:` link.** Nav,
  announcement bar, sticky mobile CTA, contact page, footer, per-location cards — all
  of them. A phone number that can't be tapped on mobile is a lost conversion in every
  vertical this system serves.
- **Primary CTA sits at the far right of the header**, visually distinct from nav links.
- **Close controls sit top-right of the thing they close** (dialogs, mobile nav,
  banners) and `Esc` also closes it.
- **Links in body copy look like links** — underline or an equally obvious affordance.
  Color alone is not a link signal (it also fails WCAG 1.4.1).
- **Form labels sit above their inputs and persist.** Placeholder-as-label is banned:
  it disappears on focus, fails autofill, and breaks screen readers.
- **Errors appear next to the field they concern**, not only summarized at the top.
- **Enter submits a single-field or short form.** Never trap the key.
- **Skip-to-content link is first in tab order** on every page.
- **The back button works.** No history hijacking, no scroll-position traps, no
  intercepting browser navigation.
- **Footer carries the site index** — full nav, address, phone, hours, legal links.
  Users look there when the header fails them; that's learned behavior too.
- **Standard icons keep their standard meanings.** A magnifier is search, a cart is a
  cart, a hamburger is a menu. Reskin them freely; never reassign them.

**Where convention and identity collide, convention wins on interaction and identity
wins on surface.** Restyle the button to the brand's soul; keep it where the thumb
expects it, keep it obviously a button, and keep its label a verb.

**One deliberate exception is allowed per build** — the Rule 11 Decision 7 signature
moment, if it genuinely trades a convention for something better. Name it in the
Compliance Report along with what the user gains. Exactly one; unnamed exceptions are
failures, not choices.

---

## C12. Choice and reach — Hick's Law and Fitts's Law

Two laws with numbers in them. Both are countable, so both are gates rather than
aspirations. C11 covers *where* things go; this covers *how many* and *how reachable*.

### Hick's Law — every added option costs decision time

More choices means slower decisions and more abandonment. This system already applies
this everywhere (max 2 accent colors, max 2 type families, 4–6 FAQs, 3–5 stat blocks,
the industry menu caps in C10) — the principle behind those caps is this one, and it
generalizes to anything not explicitly listed.

**The cost is logarithmic, not linear, and that changes the fix.** Doubling the options
doesn't double decision time; what actually costs the user is options that are
undifferentiated and demand real evaluation. So the move is rarely "delete":

1. **Categorise first.** Grouping turns one large decision into two small ones. Twenty
   clearly-labelled items in labelled groups beat six vague ones. **A short menu that
   hides what someone came for is the worse failure** — deletion that removes a real
   need is not a simplification.
2. **Give a default.** A sensible pre-selected option is a decision the user doesn't
   have to make at all. Recommend one where a recommendation is honest.
3. **Then cut what's genuinely redundant**, and use progressive disclosure for the
   advanced tail.

- **One primary CTA per view.** Exactly one action styled as primary above the fold and
  in each conversion band. Secondary actions get secondary styling. Two co-equal primary
  buttons is a choice the visitor now has to make instead of converting.
- **Top-level nav: 5–7 items.** Beyond that, group into dropdowns rather than adding
  another top-level item.
- **Form fields: ask for the minimum that lets you follow up.** The Conversion
  Playbook's 3-field quick-quote is the default; every additional field must earn
  itself. Fields you *could* ask later are fields you ask later.
- **Service/card grids: 3–6 per row-group.** More than that, categorize.
- **Never present two things that do the same job.** Two contact forms, two phone
  numbers, two "get started" paths — pick one, or make the difference obvious.

**The one sanctioned exception:** the mobile sticky bar (Component Library G5) carries
two actions — Call and Book/Contact. These are genuinely different conversion paths for
a phone-led business, not the same job twice, and the bar is the thumb-zone surface
Fitts's Law asks for. Everywhere else, one primary. A hero showing two equally weighted
buttons is a fail; a hero with a dominant primary and a subordinate secondary is not.

**The test:** count the decisions a visitor must make between landing and converting.
Every one that isn't load-bearing is friction.

### Fitts's Law — targets get easier as they get bigger and closer

Time to hit a target falls with size and rises with distance. C6 sets the accessibility
*floor* (≥24×24px, ≥44×44px for CTAs); this is the conversion layer on top of it.

- **Size tracks importance.** The primary CTA is visibly the largest interactive
  element in its band. If a secondary button is the same size, one of them is wrong.
- **Put the primary action where the thumb already is.** On mobile that's the bottom
  third of the screen — which is what the sticky CTA bar exists for. Top corners are the
  hardest reach on a phone; never put the primary conversion action there alone.
- **Screen edges and corners are effectively infinite targets** — an element flush to an
  edge can't be overshot. Edge-anchored sticky bars and full-width mobile buttons are
  easier to hit than their pixel dimensions suggest. Use that.
- **Distance from attention counts, not just distance in pixels.** The CTA belongs
  immediately after the content that motivates it, not parked in a corner.
- **Adjacent targets keep ~8px of clear space between them.** Two correct-sized buttons
  jammed together still produce mis-taps — spacing is part of the target.
- **Inverse Fitts's for destructive actions.** Delete, cancel, unsubscribe and "clear
  form" should be *harder* to hit — smaller, farther from the primary, never adjacent
  to it. Easy-to-hit destructive controls are a design defect, not a convenience.

**The test:** on a 375px viewport, can the primary action be hit with one thumb without
shifting grip? If not, it's in the wrong place regardless of its size.

---

## C13. Gestalt — the grouping your visitor's eye does before they think

These are automatic perceptual rules. A layout either cooperates with them or fights
them, and fighting them reads as "something's off" even when nothing is nameably wrong.
All of them are checkable.

- **Proximity — the single most checkable rule in this file.** Elements near each other
  read as related. **The gap inside a group must be visibly tighter than the gap to the
  next group.** A label 16px from its input and 16px from the next field produces a form
  that reads wrong no matter how well it's styled. Whitespace is a decision, never
  leftover space.
- **Similarity.** Things that look alike are assumed to behave alike. Consistent styling
  teaches the interface for free — and the trap is the inverse: **anything not
  interactive must not look like the things that are.** (C11's "links look like links"
  is this rule, running the other direction.)
- **Common region.** A shared border or background binds elements into a group and
  **overrides proximity** — a card boundary groups items sitting further apart than
  items just outside it. Use it deliberately; don't draw boxes that group the wrong things.
- **Continuity.** Items on a shared line or curve read as related. This is the real
  reason alignment matters: a ragged edge breaks the implied line and the group stops
  reading as a group. Every alignment edge should be intentional.
- **Figure/ground.** Perception separates foreground from background, and insufficient
  separation is why text-on-image, low-contrast overlays and glassmorphism fail. Text
  over imagery must hold its contrast at **every** breakpoint, not just the one you
  designed on.
- **Common fate.** Things moving together are read as belonging together — which is what
  makes a staggered list reveal legible rather than noisy (Rule 12's capped stagger).

**The greyscale test (run it at the Rule 8c critique):** view the page with color
removed. Do the groupings still read? Is the hierarchy still obvious? If a layout only
works in color, the grouping is being carried by color alone — which also fails for
colorblind users and in print.

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
  families, target sizes, computed contrast pairs, and C11's affordances (`tel:` /
  `mailto:` on every contact string, logo wrapped in a home link, skip link present,
  no placeholder-as-label), and C12's counts (one primary CTA per view, top-level nav
  items, form-field count, primary CTA larger than secondary), and C7's input
  attributes (`type` / `inputmode` / `autocomplete` present on every field).
- An **independent review** — a fresh session, given this file and the built pages,
  with no memory of having built them.

**Rules with no mechanical check are judgment calls, and should read like it.** If a
line here can't be counted, grepped, or independently judged, it belongs in the "aim
for" register, not the "must" register — overstating an unenforceable rule teaches the
builder to treat the enforceable ones as soft too.
