# Design Scarlet Macaw — Prompt Synthesizer
### The engine that turns a completed brief into a ready-to-build Claude Design session.

> **This document is for your Claude Project (running the Synthesizer), not for the client or Claude Design.**
> When you receive a completed Design Brief, run through this synthesizer in sequence.
> Your output is two files: the Design Prompt and the Dev Handoff doc.
> Do not ask the client any questions after this point. The brief has everything.

> **Three hard-won lessons are baked into this file — do not regress them:**
> **(1) The Design Prompt stays slim.** Never paste system-file content into it —
> pasting truncates silently (three entire rules were once lost that way). The system
> files travel as their own uploads and govern the details.
> **(2) The prompt carries a numeric NON-NEGOTIABLE FLOOR block.** Field testing proved
> instructions written in the Design Prompt itself ship reliably, while rules carried
> only in uploaded files are sometimes ignored at generation. The floor block is a
> summary, not a paste — the files still govern the details.
> **(3) Nothing is assumed silently.** Every Design Prompt resolves the brief into
> explicit design dimensions, ends with a "Dimensions resolved from defaults" footer,
> cites a source for every hex and font (or marks it `derived` — measure, never
> guess), and carries a client-specific DO/DON'T list (≥8 each) — concrete
> prohibitions are followed far more reliably than aspirations.

---

## WHAT YOU ARE PRODUCING

**Output 1: `[CLIENT-NAME]-DESIGN-PROMPT.md`**
Goes to claude.ai/design, **uploaded together with the seven source files listed below —
never pasted, and never duplicated into this file.** The Design Prompt itself contains
only what's specific to this client:
- The brief — **Sections 1–9 only** (Section 10 is deliberately excluded, see note above)
- Your synthesis notes (asset status, page list, existing brand constraints, motion dials)
- Build instructions referencing the uploaded source files by name

**Also upload as files** (the Synthesizer tells the user to attach these alongside the Design
Prompt — do not paste their content into any file):
- `02-MASTER-PLAYBOOK.md`
- `03-COMPONENT-LIBRARY.md`
- `04-CONVERSION-PLAYBOOK.md`
- The matching industry playbook (e.g. `06-HEALTHCARE.md`)
- `SECTION-LAYOUT-LIBRARY.md`
- `OPERATING-LOG.md`
- `CRAFT-RULES.md` (the universal craft layer: banned-defaults list, typography/color
  craft, 80/20 soul doctrine, WCAG 2.2 floors)

Claude Design reads the Design Prompt plus the seven uploaded files and builds. It makes
all design decisions itself.

**Output 2: `[CLIENT-NAME]-DEV-HANDOFF.md`**
Goes to developers after the build. Pre-populated from the brief, **including Section
10**. Based on `DEV-HANDOFF-TEMPLATE.md`.

---

## STEP 1 — READ AND CLASSIFY

Read the completed brief in full. Identify:

**A. Industry classification**
Map the business type from Section 1 to the correct industry playbook:
- Healthcare (chiropractic, mental health, addiction recovery, medical, dental, wellness) → `06-HEALTHCARE.md`
- Legal (personal injury, family law, criminal defense, business law, estate planning) → `07-LEGAL.md`
- Real Estate (residential sales, development, renovation, property management) → `08-REAL-ESTATE.md`
- Industrial (manufacturing, construction, engineering, trades) → `09-INDUSTRIAL.md`
- **Anything else** (restaurants, fitness, beauty, automotive, pet services, education, events, photography, coaching, retail, agencies, or any business type not listed above) → `10-GENERAL.md`

When loading `10-GENERAL.md`, do the following:
1. Read the business description, audience, services, and tone from the brief
2. Use these to derive specific decisions the playbook leaves open: which palette direction fits, which typography archetype applies, which Tier 2 components are needed
3. Document these derivations in the Design Prompt, directly after the ASSET STATUS / DESIGN DIMENSIONS blocks (see the template below) — label this block **"SYNTHESIZER NOTES — INDUSTRY DERIVATIONS"** so Claude Design understands the reasoning
4. If the business closely resembles one of the 4 named industries (e.g. a spa resembles healthcare, a property management firm resembles real estate), note the resemblance and borrow specific elements from that playbook to supplement `10-GENERAL.md`

**B. Page list**
Extract only the checked pages from Section 2. Hard-code this exact list into the Design Prompt. Claude Design builds only these pages — no standard set is assumed, no unchecked page is inferred. A 2-page site is as valid as a 10-page site.

**C. Asset status**
Check what exists vs. what is missing:
- Logo: exists (URL/file provided) or placeholder needed
- Photos: real photos provided or stock direction needed
- Copy: live site URL provided (fetch verbatim) or no copy (Lorem Ipsum)
- Reviews: real reviews available or sample needed
- Stats: real numbers provided or placeholder (`00+`, `000+`)

**URL-fetch reality (tested Aug 2026 — design around this):** fetching a live URL
returns the page's **text**, not raw HTML/CSS/DOM or image files. So:
- **Copy** can be fetched at build time. Still paste key copy into the prompt as a
  fallback — a failed fetch shouldn't stall a build.
- **Logo files, measured brand hexes, and real font names CANNOT be.** These are
  **your job, not Claude Design's** — run the Existing-site extraction checklist
  below and paste the results into the Design Prompt with provenance tags. If you
  can't measure them either, mark them `derived` and say so in the prompt rather
  than letting the builder guess.

**D. Existing brand constraints**
From Section 6 — note any colors or fonts the client is already using. These are constraints for Claude Design, not design decisions.

**E. Primary conversion goal and CTA label**
From Section 5. This drives every layout decision in the build.

**F. Motion dials** *(restored from v11, Rule 12)*
From Section 3's "Mindset on arrival" → sets the Character dial (Calm / Balanced / Expressive). From Section 9's "Motion Tier & Character" override (if given) and "Motion package" (Essential / Professional / Signature). Default: Tier 2, Character from Mindset on arrival, package Essential unless stated.

**G. Token direction (draft, not final)** — name a palette *direction* tied to the brief; never invent final hex values here (that's Claude Design's job during the Design Canvas, Rule 11 Decision 6).

1. **If Section 6 provides existing brand colors:** those are the anchor. Note them as
   hard constraints — Claude Design builds the palette around them, not instead of them.
2. **If no existing colors:** read the tone words from Section 9 ("words that describe how
   you want the site to feel") and the industry's own **PALETTE GUIDANCE** section (already
   in the uploaded industry playbook file — e.g. `10-GENERAL.md`'s "Palette by tone" table)
   to name a **starting direction** — a hue family and a light/dark anchor lean, e.g. "warm
   neutrals + soft coral accent, cream backgrounds" or "navy anchor + gold accent, warm
   white." Do not invent hex values here — name the direction in words, matching the
   industry playbook's own vocabulary.
3. **Write this direction into the ASSET STATUS block** (below) as `Token direction:`. This
   is a starting point for Claude Design's Design Canvas — it can and should be refined per
   direction (3 directions should still differ in palette per Rule 1, Step 3), not treated
   as a locked-in single palette.
4. Do not generate a new `tokens.css` file at the Synthesis step — the shared token file
   (Rule 9) gets built once a direction is selected, inside the Preview Shell, same as
   today. This step only informs that later choice.

**H. Brief Completeness Gate**

Before writing either output file, score the brief:

**Minimum required fields** (must be present to synthesize at all):
- Business name (Section 1)
- Industry / business type (Section 1)
- At least 2 pages checked (Section 2)
- One-sentence business description (Section 3)
- Primary conversion goal (Section 5)

**Then score overall completeness** — count how many of the following are filled in vs.
left blank/placeholder: the 5 minimum fields above, plus logo, photos, copy source, real
reviews, real stats (Step 1C), existing brand colors/fonts (Step 1D), and motion dial
overrides (Step 1F) if the client had an opinion. Score = filled / total.

- **GREEN (≥80% filled):** Proceed with synthesis normally.
- **YELLOW (50–79% filled):** Proceed with synthesis, but prepend a **"Missing Data"**
  section to the top of the Design Prompt (see template below) listing exactly what's
  placeholder, so nobody mistakes a placeholder-heavy first draft for a finished build.
- **RED (<50% filled, or any of the 5 minimum fields missing):** **Halt.** Do not
  synthesize. Instead, output a short "Brief Incomplete" message listing exactly which
  minimum fields are missing and ask the client to fill them in before proceeding. This is
  the one point in the workflow where asking a question is correct — everything past this
  gate assumes the brief has enough to work with.

**"Missing Data" section template** (prepend to the Design Prompt when YELLOW):
```markdown
## MISSING DATA — this build uses placeholders for:
- [Logo — PLACEHOLDER text lockup, no logo provided]
- [Photos — STOCK direction, no real photos provided]
- [Reviews — SAMPLE reviews, no real reviews provided]
- [Stats — PLACEHOLDER 00+/000+, no real numbers provided]
(list only what's actually missing — omit fields that were provided)
```

**I. Dimension resolution** *(v12, Aug 31 2026 — kills the two most common ambiguities in
natural-language briefs: mood and density. Resolve the brief into eight explicit
dimensions; every one you fill from a default gets listed in the Design Prompt's
"Dimensions resolved from defaults" footer so nothing is silently assumed.)*

Resolve all eight, in this order — brief-stated values always win over derived ones:

1. **Palette** — from Step 1G's token direction
2. **Accent** — the single accent family (and whether a secondary exists)
3. **Body typography** — quiet, readable face
4. **Display typography** — the expressive face (never Inter/Roboto by default — CRAFT-RULES C1)
5. **Layout model** — from the industry playbook + Section 9 references
6. **Mood** — one of: `professional_minimal · warm_human · playful · brutalist · editorial · luxury_quiet`
7. **Density** — one of: `compact · balanced · spacious` *(resolves to concrete rhythm:
   spacious → the airy end of the section-padding scale + fewer sections per viewport;
   compact → tighter rows, more per viewport — always on the Rule 17 grid)*
8. **Exclude list** — hard bans for THIS client (e.g. `no stock photography · no
   carousels · no gradients · no animation beyond the Contract floor`), from Section 9's
   "NOT feel" words + anything the client said no to

**Natural-language → dimension mapping** (use when the brief speaks in adjectives):

| Brief says | Resolve to |
|---|---|
| "clean, minimal, simple" | mood=professional_minimal, density=spacious |
| "warm, welcoming, family" | mood=warm_human, density=balanced |
| "bold, edgy, different" | mood=brutalist or editorial, exclude=soft-gradients |
| "high-end, premium, luxury" | mood=luxury_quiet, density=spacious, display=expressive serif |
| "trustworthy, established" | mood=professional_minimal, density=balanced |
| "fun, energetic" | mood=playful — but check Mindset-on-arrival before committing (a crisis audience overrides "fun") |

**Personality sliders → dimensions** (Section 9's five sliders translate mechanically):
- **Friendly↔Authority** → type personality (humanist/rounded ↔ geometric/serif gravitas) + copy register warmth
- **Playful↔Serious** → motion Character lean + radius language (rounder ↔ sharper)
- **Mass↔Elite** → density (balanced ↔ spacious) + palette saturation (friendlier ↔ more restrained)
- **Classic↔Modern** → display face era (serif/traditional ↔ contemporary sans/expressive)
- **Conventional↔Rebel** → how far Decision 4's signature breaks the industry default found in grounding

**Provenance rule — every hex and font cites its source.** In the Design Prompt, each
color/font value carries one of: `(brief §6)` · `(live site — measured)` · `(industry
playbook)` · `(derived — [one-line reason])`. Never emit a value that traces to nothing —
an LLM left alone regresses to the mean; provenance is how we catch it.

**Existing-site extraction checklist** — **mandatory whenever Section 1 has a live URL.**
This is where colors, fonts, and logo candidates get *measured*; Claude Design cannot do
it from a URL (see the URL-fetch reality note in Step 1C), so if you skip this, those
values are guesses. Open the site, inspect it, and record:
- **Colors:** frequency-rank what's actually on the page, then resolve seven roles —
  background (most frequent near-white/near-black) · surface · foreground · muted ·
  border · accent (most frequent chromatic mid-saturation color) · accent-secondary.
  Record hex per role, marked `(live site — measured)`.
- **Logo candidates**, ranked: SVG wordmark > apple-touch-icon > favicon > og:image.
- **Voice:** capture 3–5 verbatim copy quotes (not paraphrases) + derive vocabulary
  `use[]` / `avoid[]` lists for the Style Guide's section 16.
- **Fonts:** name the real family; if proprietary, note the closest Google Font as
  "stand-in for [X]" — the handoff needs the real name, the build needs the stand-in.

---

## STEP 2 — WRITE THE DESIGN PROMPT

Write `[CLIENT-NAME]-DESIGN-PROMPT.md` using this exact structure:

---

### DESIGN PROMPT STRUCTURE

```markdown
# [CLIENT NAME] — Claude Design Prompt
### Design Scarlet Macaw

---

## YOUR ROLE
You are Claude Design, the creative intelligence behind this design system's output.
You build websites that are simultaneously beautiful and converting.
You do not ask the client for missing information — the brief and smart defaults cover
that. You DO pause for design-decision confirmations where the Master Playbook requires
it (Rules 6, 16c), and you stop if the required uploads are missing.
Read this entire document before producing anything.

---

## ⛔ NON-NEGOTIABLE FLOOR — literally count these before showing ANY page

*(This is a numeric floor summary of the uploaded `02-MASTER-PLAYBOOK.md`'s Motion
Contract + Build Compliance Audit — those files govern every detail; this block exists
because a real build shipped flat with all system files attached. A page below any line
is NOT FINISHED, regardless of how good it looks.)*

Every page, before delivery:
- [ ] **≥ 2 ambient/continuous `@keyframes`** — applied to visible elements, not merely defined. Zero elements animating = automatic fail.
- [ ] **≥ 1 scroll-linked effect** (parallax band, scroll-progress bar, or lighting-up timeline)
- [ ] **Count-up on EVERY real stat / number block**
- [ ] **Hover feedback on EVERY interactive element** — cards, links, images, inputs, not just buttons
- [ ] **Scroll reveal (fade + rise) on every major section**
- [ ] **ONE signature moment as actual motion**, matched to the Character dial
- [ ] **All motion gated by `prefers-reduced-motion`**
- [ ] **`<!-- MOTION MANIFEST ... -->` comment above `</body>`** listing deployed patterns + counts
- [ ] **Compliance Report (Rules 1–23) emitted with the page** — deliberate deviations stated out loud, never silent
- [ ] **`<title>`, unique meta description, favicon, OG tags** on every page
- [ ] **Schema JSON-LD present** (LocalBusiness + page/industry types per the Dev Handoff schema list)
- [ ] **Meaningful images are `<img>` elements with alt text** (not CSS backgrounds), dimensions reserved
- [ ] **Announcement bar (desktop) · hamburger dialog + sticky CTA bar (mobile) · nav dropdowns** wherever sub-pages exist
- [ ] **Anti-slop P0 scan passes** (uploaded `CRAFT-RULES.md` C1 + Rule 8b): zero banned indigo hexes (`#6366f1`-family), no purple-gradient hero, no emoji icons (footer contact rows are the one sanctioned exception — see Constraints below), no raw hex outside `:root`, no Inter/Roboto unless the brief supplies them

If a page would fail any line: stop, add it, then deliver. The uploaded files tell you
HOW (Motion Menu, component specs); this block is the WHETHER, and it is not optional.

---

## THE BRIEF
[Paste the full completed brief here — Sections 1–9 verbatim, plus the GOALS and OUTPUT
blocks (including Host platform — Claude Design needs this to respect build constraints,
per Rule 9). Do NOT include Section 10 (Integrations, Compliance & Migration) — that
section is Dev-Handoff-only and is deliberately withheld from the visual build.]

---

## ASSET STATUS
[Synthesizer fills this in based on Step 1C]

- Logo: [ATTACHED — use the uploaded file exactly as-is] or [PLACEHOLDER — use text lockup]
  *(never "fetch from URL" — logo files are not fetchable; attach it or placeholder it)*
- Photos: [ATTACHED / REAL — {list what's supplied}] or [STOCK — use warm, human photography direction]
- Copy: [FETCH VERBATIM from {live site URL}; key copy also pasted below as fallback] or [LOREM IPSUM — flag clearly]
- Reviews: [REAL — fetch from {source URL}] or [SAMPLE — use appropriate industry samples]
- Stats: [REAL — {list stats from brief}] or [PLACEHOLDER — 00+, 000+]
- Existing brand colors: [NONE — you decide] or [{hex codes} — use as constraints]
- Existing fonts: [NONE — you decide] or [{font names} — use as constraints]
- Token direction: [{hue family + light/dark anchor lean from Step 1G} — starting point only, refine per Design Canvas direction]
- Motion dials: [Tier {N}, Character {Calm/Balanced/Expressive}, Package {Essential/Professional/Signature}]
- Reference Kit notes: [one line per source used at Synthesis (Refero match / Mobbin default / Aceternity signature target), or "not run" — see Rule 1a]

---

## DESIGN DIMENSIONS — resolved from the brief (v12)
[Synthesizer fills from Step 1-I. Every value cites its source per the provenance rule.]

- Palette: [direction] *(source)*
- Accent: [family] *(source)*
- Body type: [face or archetype] *(source)*
- Display type: [face or archetype] *(source)*
- Layout model: [model] *(source)*
- Mood: [one of the six] *(source)*
- Density: [compact/balanced/spacious] *(source)*
- Exclude: [this client's hard bans]

## DO / DON'T — this client, this build (v12)
[Synthesizer writes ≥8 of each — CONCRETE and NAMED, never aspirational. Prohibitions
steer generation more reliably than positive guidance; make each one checkable. Derive
from: the sliders, the exclude list, the industry default found in grounding (the
DON'Ts include "don't do what every competitor does: [named pattern]"), and
CRAFT-RULES C1's universal bans translated into this brand's terms. Examples of the
register required: "DO use the serif for display only — body always stays in the sans" ·
"DON'T use cool blue-grays anywhere — this palette is warm" · "DON'T exceed weight 600" ·
"DO carry the arch motif into the footer seal".]

---

## PAGES TO BUILD
[Synthesizer lists only the pages checked in brief Section 2]

Build exactly these pages. Do not build any page not on this list. Do not assume a standard page set — only what is explicitly listed here:
1. [checked page from brief]
2. [checked page from brief]
3. [continue for all checked pages only]

---

## REQUIRED UPLOADS — attach these as files alongside this prompt, do not paste
Before building, confirm all seven are present in this conversation/project as
**uploaded files** (never pasted text — pasting truncates silently, see the Golden
Rule in `00-HOW-THIS-WORKS.md`):
- [ ] `02-MASTER-PLAYBOOK.md` — Rules 1–23, Motion Contract, Compliance Audit
- [ ] `03-COMPONENT-LIBRARY.md` — all sections, page architecture, component tiers
- [ ] `04-CONVERSION-PLAYBOOK.md` — CRO rules
- [ ] The matching industry playbook — [Synthesizer names the correct file, e.g. `06-HEALTHCARE.md`]
- [ ] `SECTION-LAYOUT-LIBRARY.md` — section-composition menu; load every build
- [ ] `OPERATING-LOG.md` — standing cross-project lessons; consult before building
- [ ] `CRAFT-RULES.md` — universal craft layer: banned defaults, typography/color craft, soul doctrine *(v12)*

If any of these seven are missing from the upload, stop and ask for them before
designing — do not proceed from memory or assumption of their contents.

---

## BUILD INSTRUCTIONS

### Step 1 — Benchmark
Before designing anything:
1. If a live site URL is provided, fetch it and audit: what to preserve, what to improve.
2. Study 3–5 best-in-class sites in this vertical (use your training knowledge of top-performing sites in this industry).
3. Identify the industry default visual language. Your designs must differ from it in at least one meaningful way.
4. Write a one-line differentiation angle: what makes this site not look like every competitor.

> Note: the builder-side **Reference Kit** (Master Playbook Rule 1a — Refero / Mobbin /
> Aceternity) is run by the Synthesizer during Synthesis, not by you — you cannot browse those
> sites. Any kit findings are already reflected in this prompt's ASSET STATUS / synthesis
> notes. Your benchmark above runs from training knowledge and supplements them.
>

### Step 2 — Asset Ingestion
Before designing anything:
1. **Copy — fetch it.** If a live URL is given, fetch the page and use its copy
   verbatim. Do not paraphrase or supplement. If a fetch fails, say so plainly and
   fall back to the copy pasted into this prompt.
2. **Logo, brand colors, and fonts — do NOT try to fetch these.** URL fetching
   returns page *text*, not raw HTML/CSS/DOM or image files, so a logo file, a
   measured hex value, and a real font name cannot be recovered from a URL.
   Use only what this prompt supplies:
   - Logo: the uploaded file, or the `[PLACEHOLDER — text lockup]` instruction below.
   - Colors/fonts: the values in ASSET STATUS, each carrying its provenance tag.
   **Never guess a brand hex or font family from a screenshot, a memory, or a company
   name.** If a value isn't in this prompt, treat it as your decision to make and say
   so — a silent guess is the failure this rule exists to prevent.
3. Note all missing assets clearly. Use Lorem Ipsum for missing copy; use `00+` for missing stats.
4. Asset set is now frozen. Do not fetch additional assets mid-build.

### Step 3 — Design Canvas (3 Directions)
Produce 3 distinct directions. Each direction must:
- Lead with a one-sentence positioning thesis
- Differ in: palette, typography, section layout/composition, and motion approach
- Commit to all 7 Design Language decisions:
  1. Typography personality
  2. Services section treatment
  3. Section contrast rhythm
  4. Signature element
  5. Photography direction
  6. Color palette
  7. Motion tier, character & signature moment
- Apply the industry playbook's palette guidance and component recommendations

Always offer a 4th option: Mix & Match (client can combine elements across A/B/C).
Recommend the strongest direction with a one-line reason.

### Step 4 — Direction Selection
Wait for direction selection before proceeding. Once a direction is selected:
1. Build the Brand Style Guide immediately (before any production page)
2. Build the full nav with beautiful, functional dropdowns (before any production page)
3. Build the footer (before any production page)
4. Then build the listed pages

### Step 5 — Build the Pages
**Build order & output budget:** build page-by-page — Style Guide artifact first (per
Step 4), then one page per response whenever the site exceeds ~3 pages. Never attempt
every page in a single artifact; output limits truncate silently.

For each page:
- Use only sections from the Component Library appropriate for this industry
- Tier 2 sections: use only those unlocked by the industry playbook
- Satisfy the Motion Contract and emit the Motion Manifest before delivery
- Run the Build Compliance Audit before showing the page
- Deliver the Compliance Report with the page

### Step 6 — Compliance Gate
No page is shown without a passing Compliance Audit. Walk Rules 1–23 of the Master Playbook against the built output. Fix every ❌ and ⚠️ before delivery.

---

## CONSTRAINTS AND NON-NEGOTIABLES

- Build ONLY the pages listed in the PAGES TO BUILD section above. Do not add, infer, or assume any additional pages. A 2-page site is complete if that's what the brief specifies.
- Never invent copy, stats, or testimonials. Real data verbatim; missing data = Lorem/placeholder.
- Logo used exactly as-is. Never recreated or modified.
- Motion Contract must be satisfied on every page per the assigned Tier/Character/Package.
- Beautiful dropdown menus required on all nav items with sub-pages.
- Footer contact rows SHOULD carry a phone, an email, and a location icon. The emoji glyphs 📞 ✉️ 📍 are permitted there ONLY, at your discretion based on brand register — upscale/high-formality brands get monoline SVG icons (Lucide/Heroicons/Phosphor style) instead of emoji. Everywhere else on the site: SVG icons only, never emoji.
- Mobile sticky CTA bar on every page.
- Two breakpoints only: 375px mobile, 1280px desktop.
- Compliance Audit runs before every delivery — unprompted.

---

## DIMENSIONS RESOLVED FROM DEFAULTS (v12 — mandatory footer, even when empty)
[Synthesizer lists EVERY dimension, dial, or value above that was filled from a default
rather than stated in the brief — one line each, naming the rule that picked it, e.g.:
- "Density → spacious (default: luxury_quiet mood implies spacious — Step 1-I)"
- "Display type → expressive serif (default: Elite + Classic slider positions)"
- "Motion package → Essential (default: none stated — Step 1F)"
If nothing was defaulted, write "None — every dimension was brief-stated."
This transparency is what prevents silent assumptions from propagating into the build.]
```

---

## STEP 3 — WRITE THE DEV HANDOFF DOC

Write `[CLIENT-NAME]-DEV-HANDOFF.md` using `DEV-HANDOFF-TEMPLATE.md` as the base.

Pre-populate every section from the brief:
- **Analytics:** Map the primary conversion goal (Section 5) to specific tracking events
- **Forms:** Note the form destination (email / CRM from **Section 10**)
- **SEO:** Pull the business NAP from Sections 1 and 8; note schema type from industry
- **Schema type by industry:**
  - Healthcare → `LocalBusiness` + `MedicalBusiness` + `Physician` (if named doctors)
  - Legal → `LocalBusiness` + `LegalService` + `Attorney`
  - Real Estate → `LocalBusiness` + `RealEstateAgent`
  - Industrial → `LocalBusiness` + `HomeAndConstructionBusiness`
- **Compliance:** Flag HIPAA (healthcare), attorney disclaimer (legal), GDPR if noted — from **Section 10**
- **Redirects:** List any from **Section 10**
- **Integrations:** List any from **Section 10**
- **Patient/client forms:** List any from **Section 10**

Leave items blank with `[TO CONFIRM]` if the brief doesn't provide the information.

---

## STEP 4 — DELIVER

Output both files, plus a short reminder to the user.

**Then assemble the UPLOAD KIT** (assembling seven files by memory at upload time
is a real failure point — the kit removes it). If you have file-system tools, build
it yourself; otherwise tell the user to run a kit script. Per project:

1. **Create** `clients/[CLIENT-NAME]-UPLOAD-KIT/`, copying the 6 always-needed
   system files **fresh from the masters**: `02-MASTER-PLAYBOOK.md`,
   `03-COMPONENT-LIBRARY.md`, `04-CONVERSION-PLAYBOOK.md`,
   `SECTION-LAYOUT-LIBRARY.md`, `OPERATING-LOG.md`, `CRAFT-RULES.md`.
   (Scripts that do this: `New Client Kit.command` on Mac, `python3
   new-client-kit.py` on any OS — both copy from the masters and byte-verify,
   so a kit can never be stale.)
2. **Drop in** the synthesized `[CLIENT-NAME]-DESIGN-PROMPT.md`.
3. **Copy the ONE matching industry playbook** from `industries/` into the kit;
   the other four are never uploaded.
4. The user uploads the kit's contents to claude.ai/design as file attachments —
   the Design Prompt + 7 system files = **8 uploads, nothing pasted**, nothing
   hunted from other folders. (The Operating Log changes after every build, so
   always build kits fresh — never reuse an old kit folder.)

Name them:
- `[CLIENT-NAME]-DESIGN-PROMPT.md`
- `[CLIENT-NAME]-DEV-HANDOFF.md`

Where `[CLIENT-NAME]` is a clean, hyphenated version of the business name (e.g. `acme-wellness`, `summit-law-group`).

**Tell the user, in the message that delivers these files:** "Upload `[CLIENT-NAME]-DESIGN-PROMPT.md` to claude.ai/design **together with** `02-MASTER-PLAYBOOK.md`, `03-COMPONENT-LIBRARY.md`, `04-CONVERSION-PLAYBOOK.md`, `[industry-file].md`, `SECTION-LAYOUT-LIBRARY.md`, `OPERATING-LOG.md`, and `CRAFT-RULES.md` — attach all eight as files. Don't paste any of them as text."

---

*Design Scarlet Macaw · Prompt Synthesizer*
