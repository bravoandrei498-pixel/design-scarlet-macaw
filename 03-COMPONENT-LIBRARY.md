# Design Scarlet Macaw — Component Library
### All sections, page architecture, and component tiers.

> This is the vocabulary of every build. Tier 1 components are always available. Tier 2 components are unlocked by the industry playbook. Claude Design selects from this library based on the brief — never inventing sections outside it, never forcing sections the brief doesn't call for.

> **This file is the structural inventory** — what each global component contains and how it's ordered. **`02-MASTER-PLAYBOOK.md` Rule 10 governs behavior** — sticky/scroll rules, mobile-hide logic, z-index, and other implementation behavior for these same components. If the two ever disagree on a structural detail (contents, icons, ordering), this file wins; if they disagree on a behavioral detail, Rule 10 wins.

---

## Component Tiers

**Tier 1 — Universal**
Available on every build, regardless of industry. These are the sections that appear on 98% of builds using this system.

**Tier 2 — Industry-Specific**
Unlocked by the industry playbook loaded during Synthesis. A real estate build never sees "Meet Our Doctors." A healthcare build gets the full clinical set. The industry playbook defines which Tier 2 components are in play for a given project.

---

## Standard Page Architecture

This is the default site structure for 98% of builds using this system. The brief specifies which pages to build — Claude Design builds exactly those pages, nothing more.

```
Global (every page)
├── Announcement Bar
├── Navigation (sticky, with dropdowns)
├── [Page Content]
├── Mobile Sticky CTA Bar
└── Footer

Pages
├── Home
├── About
├── Services (Index)
├── Service Detail (one per listed service)
├── What We Treat / Conditions
├── Locations
├── Contact
└── Forms / Patient Intake (if in brief)
```

> Blog components (Post Grid, Newsletter CTA, Blog Preview) are specced in the Master Playbook Rule 10, not here — that is the one sanctioned exception to this library's "never invent sections outside it" rule.

---

## GLOBAL COMPONENTS (Present on every page)

### G1 — Announcement Bar
**Tier 1 | Desktop only**
Dark strip pinned above the navigation. Contains: key offer or trust statement + click-to-call phone link.
- One line only
- Never stacked or multi-line
- Appears on desktop only (hidden on mobile — the sticky CTA bar handles mobile urgency)

---

### G2 — Navigation
**Tier 1 | Required**
Sticky top bar that shrinks/adds shadow on scroll.

**Desktop layout:**
- Logo: left-aligned
- Nav links: centered
- CTA element: right (phone number and/or primary action button)
- No "Home" link — logo links home

**Dropdown menus:**
- Required on every nav item with sub-pages
- Beautiful and fully functional — never a flat nav
- If live site exists: fetch sub-pages and populate with real content
- If no live site: populate with appropriate sample content for the industry
- Hover intent: CSS `:hover` with a hover bridge to prevent premature closing

**Mobile:**
- Collapses to hamburger icon
- Opens the Mobile Dialog (see G4)

---

### G3 — Footer
**Tier 1 | Required**
Dark background. Full business detail.

**Required elements:**
- Logo + tagline
- Navigation columns (grouped logically: Services, Company, Locations, or equivalent)
- For each location: full address with a location icon, phone number with a phone icon
- Email address with an email icon
- Social media icons (Instagram, Facebook, LinkedIn as applicable)
- Legal links: Privacy Policy, Terms, required compliance notices
- Copyright line with dynamic year

**Contact icon policy (site-wide):** footer contact rows SHOULD each carry a phone, email, or location icon. The emoji glyphs 📞 ✉️ 📍 are permitted HERE ONLY — in the footer contact rows — at Claude Design's discretion based on brand register: upscale / high-formality brands get monoline SVG icons (Lucide / Heroicons / Phosphor style) instead of emoji. Everywhere else on the site — mobile dialog, location cards, sidebars, contact panels — icons are SVG only, never emoji. Icons are never required as emoji; the icon is what matters, not the glyph format.

---

### G4 — Mobile Dialog (Hamburger Menu)
**Tier 1 | Mobile only**
Slide-in panel (≈85% width, page peeks behind) or full-screen overlay. Hamburger icon animates to × on open.

**Required contents in this exact order:**
1. Logo (left) + × close button (right) — one row
2. Primary nav links as an accordion — items with sub-pages show + that expands in place
3. A faded decorative motif behind the menu, low opacity — **required**, from the project's Motif Gallery (Master Playbook Rule 7 §14), so the panel isn't a bare list
4. Primary CTA button — full width
5. Thin divider
6. Address(es) with a location icon (SVG — per G3's contact icon policy)
7. Phone with a phone icon, click-to-call (SVG — per G3's contact icon policy)
8. Social icons row

No "Home" link. Logo links home.
Dialog is scrollable if content overflows.

---

### G5 — Mobile Sticky CTA Bar
**Tier 1 | Mobile only**
Pinned to the bottom of every page on mobile. Two half-buttons side by side.
- Left: Call (tel: link)
- Right: Book / Contact / Schedule (links to primary conversion page)
Present on every page without exception.

---

## HOME PAGE

### H1 — Hero
**Tier 1 | Required**
Full viewport height (100vh) on desktop. Creates an immediate emotional response within 0.5 seconds.

**Required elements:**
- H1 headline: maximum 8 words (stricter than CRAFT-RULES C5's <14-word ceiling — the hero H1 earns the tighter cap), large (min 60px desktop / 36px mobile), benefit-led
- One-sentence subheadline: who / what / why
- Primary CTA button above the fold
- Secondary CTA (ghost button or text link)
- Trust micro-element: star rating, key stat, or "trusted by X clients" near the CTA
- Composed depth: main image + one companion layer (not flat single photo)
- Brand motif element
- Motion: kinetic or ambient (breathing field, parallax, or equivalent)

**Hero is never:**
- A flat single photo with text overlaid and nothing else
- A repeated composition from a prior build
- Missing motion

---

### H2 — Trust / Stats Bar
**Tier 1**
Full-width dark band. Single lean line — not a fat block.
- 3–5 stat blocks (social proof numbers)
- Google reviews pill with real Google G logo (when reviews exist)
- Count-up animation on all numbers (mandatory)

---

### H3 — Brand Story / Welcome Panel
**Tier 1**
Two-column layout: photo left, copy right (or reversed).
- Eyebrow label
- H2 brand mission or positioning statement
- 2–3 prose paragraphs
- CTA button to About page

---

### H4 — Services Preview Grid
**Tier 1**
3-column card grid. Each card:
- Real photo (no auto-generated icons on the image)
- H3 service/category name
- Short description
- 2–4 bullet points
- Button or link to the full services page

---

### H5 — Testimonials / Reviews
**Tier 1**
Dark full-bleed background. Real verbatim reviews.
- Google Rating pill with real Google G logo
- H2 section heading
- 3-column review card grid (real review screenshots or styled quote cards)
- CTA button

---

### H6 — Locations
**Tier 1**
2-column grid per location.
- Embedded map (left) + location detail card (right)
- Each card: clinic/office name, address (location icon), phone (phone icon), hours, "Book here" + "Get Directions" buttons — SVG icons per G3's contact icon policy

---

### H7 — Value Props / Why Choose Us
**Tier 1**
3-column icon card grid.
- Eyebrow + H2
- 3 differentiator cards with icons, title, and short description

---

### H8 — Process / Getting Started Steps
**Tier 1**
Numbered step cards (3 steps).
- Eyebrow + H2
- Each step: number, title, one-line description
- CTA button at the end

---

### H9 — CTA Conversion Band
**Tier 1**
Dark full-bleed section. The primary conversion push before the footer.
- Eyebrow + H2
- Brand mission or urgent value statement
- Primary CTA button (large, prominent)

---

### H10 — Meet the Team Preview
**Tier 2 | Unlocked by industry playbook**
Named practitioners or key team members with photos, names, titles, and brief bio.
- Relevant for: Healthcare, Legal, some Real Estate
- Not applicable for: Industrial, general services without named staff

---

### H11 — What We Treat / Conditions Preview
**Tier 2 | Healthcare only**
Condition pill tags in a contained card.
- List of conditions treated
- Link to full conditions page

---

## ABOUT PAGE

### A1 — Interior Page Hero (PageHead)
**Tier 1 | All interior pages**
Photo-background hero banner.
- Eyebrow + H1 + subheadline
- Breadcrumb trail: Home / Page Name
- Overlaid gradient for text contrast

---

### A2 — Brand Story / Mission
**Tier 1**
2-column layout: photo + prose.
- Eyebrow + H2
- 2–3 paragraphs (origin story, mission, values)

---

### A3 — Brand Values
**Tier 1**
Soft background band.
- Eyebrow + H2
- 3-column icon card grid

---

### A4 — Why Choose Us
**Tier 1**
2 or 3-column icon card grid.
- Differentiators specific to this business

---

### A5 — Meet the Team / Practitioners
**Tier 2 | Unlocked by industry playbook**
Named staff with photos, credentials, bios.
- Healthcare: Doctors + Care Coordinators
- Legal: Attorneys + Support Staff
- Real Estate: Agents

---

### A6 — Your First Visit / What to Expect
**Tier 2 | Healthcare, Legal**
4-step numbered card sequence explaining the client onboarding experience.

---

### A7 — Certifications / Awards
**Tier 2 | Healthcare, Legal**
Dark band. Professional credentials, certifications, industry recognition.
- Explicitly labeled SAMPLE if no real data is available

---

### A8 — Services Preview (cross-sell)
**Tier 1**
Same as H4. Placed on About page to drive discovery.

---

### A9 — Locations (cross-sell)
**Tier 1**
Same as H6. Placed on About page.

---

### A10 — Testimonials (cross-sell)
**Tier 1**
Same as H5. Placed on About page.

---

## SERVICES INDEX PAGE

### S1 — Interior Page Hero
**Tier 1** — same as A1

### S2 — Full Service Index Grid
**Tier 1**
3-column card grid of all services.
Each card:
- Real service photo
- Category tag pill
- H3 service name
- Short description paragraph
- "Learn More →" link to the detail page

### S3 — Process / Getting Started
**Tier 1** — same as H8

### S4 — Conditions Cross-Sell
**Tier 2 | Healthcare only**
Dark card with condition pill list and CTA to the What We Treat page.

---

## SERVICE DETAIL PAGE

### SD1 — Interior Page Hero
**Tier 1**
Dark photo-background hero with breadcrumb (Home / Services / Service Name).

### SD2 — Two-Column Body Layout
**Tier 1**
Constrained-width layout with left prose column and sticky right sidebar.

**Left column — prose blocks:**
- Service overview (2 paragraphs)
- What is it? (definition + image)
- Who it helps / conditions addressed
- Benefits (paragraphs + bullet list)
- What to expect
- Named technique or approach (if applicable)

**Right column — sticky sidebar.** Full module spec, conversion-order rationale, and
styling live in `02-MASTER-PLAYBOOK.md` **Rule 14**; **if this list and Rule 14 ever
disagree, Rule 14 wins** — a deliberate exception to this file's usual
structure-precedence, because Rule 14 is the maintained, conversion-ordered spec. The 7 modules,
in Rule 14's order:
1. Booking CTA block + trust line (headline + CTA button + star-rating micro-proof)
2. Insurance & Payment card
3. Meet Your Doctor / Practitioner card (Tier 2 — industry-specific)
4. Hours of operation
5. Visit + Directions (phone, address with Maps link, email — each with its SVG icon per G3's contact icon policy)
6. Explore Other Services (low visual weight, deliberately near-last)
7. Downloadable resource — only if one exists; omit entirely, never placeholder

---

## WHAT WE TREAT / CONDITIONS PAGE
**Tier 2 | Healthcare, some Legal (practice areas)**

### WT1 — Interior Page Hero
**Tier 1** — same as A1

### WT2 — Condition Groups
3-column card grid, one card per anatomical or category group.
Each item: row link with → arrow.

### WT3 — How We Help
**Tier 1**
2-column layout: process steps (left) + image (right).

---

## LOCATIONS PAGE

### L1 — Interior Page Hero
**Tier 1** — same as A1

### L2 — Location Cards
**Tier 1**
2-column grid, one card per location.
Each card: embedded map + clinic name + open status badge + address (location icon) + phone (phone icon) + hours + CTA buttons — SVG icons per G3's contact icon policy.

### L3 — Service Area
**Tier 1**
2-column layout: city/town pills (left) + photo (right).
Eyebrow "Proudly serving" + H2 + prose + area pill list.

---

## CONTACT PAGE

### C1 — Interior Page Hero
**Tier 1** — same as A1

### C2 — Two-Column Contact Layout
**Tier 1**

**Left — Appointment / Contact Form:**
- H3 + instructions
- Fields: First name, Last name, Email, Phone, relevant dropdowns (location, service, etc.), optional message
- Primary submit button (strong action verb)
- Required compliance notice if applicable (HIPAA for healthcare)

**Right — Contact Detail Panel:**
- Call card (dark background, large phone number)
- Location cards per location (address + phone, each with its SVG icon per G3's contact icon policy)
- Email + social links card (SVG email icon)

**No PageOutro (FAQ + Form) on Contact — it has its own form.**

---

## FORMS / INTAKE PAGE
**Tier 2 | Healthcare, Legal**

### F1 — Interior Page Hero
**Tier 1** — same as A1

### F2 — How It Works
**Tier 1**
3-step numbered cards explaining the form process.

### F3 — Available Forms List
**Tier 2**
2-column card grid. Each card: form name, estimated time, fill online + download buttons.

### F4 — Help Strip
**Tier 1**
Dark card. "Need help?" + phone + fallback instructions.

---

## PAGE OUTRO (Shared Block)
**Tier 1 | Appended to every page except Contact**

### PO1 — FAQ Accordion
4–6 questions relevant to the business. Real answers from live site or brief. If none available, use appropriate sample questions for the industry.

### PO2 — Free Consultation / Contact Form (Inline)
Two-column promotional form.
- Headline + teaser copy
- Minimal fields: Name, Email, Phone, optional preference
- CTA button

---

## BRAND STYLE GUIDE (Internal Reference Page)
**Not a client-facing page. Internal use only.**

> **Canonical spec: `02-MASTER-PLAYBOOK.md` Rule 7** — the full 16-section Brand Style
> Guide (fixed dark sidebar, numbered anchor nav, token-truth rule, exact section list
> 01–16, v12 added `16 · Agent Prompt Guide`) plus the built template `brand-style-guide-template.html`. The BSG blocks below
> are a **summary index of the most-used specimen groups only** — they map into Rule 7's
> 16 sections and do not replace them. **If the two ever disagree, Rule 7 wins.** This is
> a deliberate exception to this file's usual structure-precedence, because Rule 7's v9
> redesign is the maintained spec.

### BSG1 — Logo Lockups
Light and dark background treatments with clear-space guidance.

### BSG2 — Color Palette
All tokens with hex codes, names, and usage roles.

### BSG3 — Type System
Live specimens for: Display/H1, Section/H2, Subhead/H3, Body, Eyebrow, Caption.

### BSG4 — Component Specimens
All button variants, pills, cards, form inputs, badges — live renders.

### BSG5 — Imagery Direction
"Do" vs "Don't" examples for photography.

### BSG6 — Motion Specs
Timing and easing for every deployed animation pattern.

### BSG7 — Motif / Texture System
How the brand motif appears across the site (low opacity, hero, section backgrounds, mobile menu).

---

## COMPONENT CRAFT ADDENDUM *(v12, Aug 31 2026 — cross-component rules that pair with Rule 18's six states and `CRAFT-RULES.md`)*

### State completeness — contrast is checked per state, not per component
Rule 18's six states are the list; the v12 addition is the check: **every state's
text/background pair passes contrast on its own** (≥4.5:1 body, ≥3:1 large/UI —
CRAFT-RULES C6). The common failure is a passing default state with a hover state that
drifts below 3:1 (light-accent hover backgrounds are the usual offender — Rule 17's
tint scale exists to find a compliant shade).

### Tint-scale step jobs — which step does what (companion to Rule 17)
When reaching into the 50→900 scale, each step has a *job* — don't freestyle:

| Steps | Job |
|---|---|
| 50–100 | Section tints, card + hover backgrounds |
| 200–300 | Borders, dividers, tag fills, disabled |
| 500 | The working brand color — buttons, links, accents |
| 700 | Hover/active on buttons, focus rings, icon emphasis |
| 900 | Dark anchor (nav/footer/CTA bands), display text on light |

Text sits at 700+ on light backgrounds, 50–100 on dark — never mid-scale (400–500
text is the classic contrast failure).

### Small-target audit — the WCAG 2.2 §2.5.8 offenders (≥24×24px, every one)
The components in THIS library that habitually ship under 24px: **G3's social icons ·
G2's dropdown chevrons · G4's × close and accordion `+` toggles · form field
"clear" affordances · map pins**. Give each a padded hit area to ≥24×24 even when the
glyph is smaller. Standard, stated once for the whole system: **interactive targets
≥24×24px hard floor (WCAG 2.5.8); primary CTAs and nav items ≥44×44px** (the G5 bar
runs 44–48px per Rule 21d).

### Per-component self-check — three lines in the brand's own register
When documenting a component in the Style Guide, close its spec with a 3-line
self-check written in the *direction's emotional register*, not generic QA — the test
a reviewer actually runs with their eyes. Example for a recovery build's testimonial
wall: "reads supportive, not salesy · no quote trimmed into a brag · names feel like
neighbors, not stock photos." Example for a luxury RE hero: "reads assured, not loud ·
one accent appearance · the photography does the talking." This is CRAFT-RULES C4's
screenshot test, scaled down to the component.

---

*Design Scarlet Macaw · Component Library*
