# Build rules for this project

You are building a real client website under the **Design Scarlet Macaw** design system.
This file applies to every chat in this project. The Design Prompt attached to a build
carries the client specifics; the uploaded playbooks carry the detail; this file is the
floor that holds regardless of what else did or didn't get attached.

## Order of authority

1. **The client's real brand assets** — supplied colors, fonts, logo. These beat every
   default in every playbook. A playbook is the fallback for a business with no brand,
   never an override of one that has one.
2. **The Design Prompt** for this build — brief, page list, resolved dimensions, DO/DON'T.
3. **This file** — the floor below.
4. **The uploaded playbooks** — `02-MASTER-PLAYBOOK.md` (Rules 1–23), `CRAFT-RULES.md`,
   `03-COMPONENT-LIBRARY.md`, `04-CONVERSION-PLAYBOOK.md`, `SECTION-LAYOUT-LIBRARY.md`,
   `OPERATING-LOG.md`, and one industry playbook. They govern all detail.

If a required playbook wasn't attached, say so and ask for it. Don't improvise its contents.

## Never ship a page below this floor

Count these. A page under any line is unfinished regardless of how good it looks.

- **≥2 ambient `@keyframes`** actually applied to visible elements; **≥1 scroll-linked
  effect**; **scroll reveal on every major section**; **hover feedback on every
  interactive element**, not just buttons; **count-up on every real stat**.
- **One signature motion moment**, matched to the build's Character dial.
- **All motion inside `@media (prefers-reduced-motion: no-preference)`.**
- **`<!-- MOTION MANIFEST -->`** comment above `</body>` listing patterns + counts.
- **Compliance Report emitted with each page** — deviations stated out loud, never silent.
- **`<title>`, unique meta description, favicon, OG tags, Schema JSON-LD** on every page.
- **Meaningful images are `<img>` with alt text**, dimensions reserved — not CSS backgrounds.
- **Announcement bar (desktop) · hamburger dialog + sticky CTA bar (mobile) · nav
  dropdowns** wherever sub-pages exist.

## Conventions you don't get to redesign (Jakob's Law)

Identity varies; interaction does not. A site may look like nothing else on the internet
and must still behave like everything else on it.

- Logo top-left, linking home.
- **Every phone number is a `tel:` link; every email a `mailto:` link** — nav,
  announcement bar, sticky mobile CTA, contact page, footer, location cards. A number
  that can't be tapped on mobile is a lost conversion.
- Close controls top-right, `Esc` also closes.
- Body links look like links — never color alone.
- Form labels above inputs and persistent. Placeholder-as-label is banned.
- Errors appear beside their field. Enter submits short forms.
- Skip-to-content link first in tab order. The back button works — never hijacked.
- Standard icons keep standard meanings. Restyle freely; never reassign.

**At most one deliberate exception per build**, named in the Compliance Report with what
the user gains.

## Accessibility floor (WCAG 2.2 AA — by construction)

Body text ≥4.5:1, large text and UI ≥3:1, verified per state. Interactive targets
≥24×24px; primary CTAs and nav ≥44×44px. Visible 2px focus ring, never removed. Sticky
elements never cover a focused element.

## Banned by default (the AI-slop tells)

- **Typefaces:** Inter, Roboto, Arial, Fraunces, system-font stacks. (`system-ui` as a
  *fallback* after a named face is fine.) Client's real brand font is always exempt.
- **Accent hexes:** the Tailwind-indigo family — `#6366f1 #4f46e5 #4338ca #3730a3
  #8b5cf6 #7c3aed #a855f7` and near neighbours.
- Purple/violet gradient heroes. Glassmorphism glow-cards and neon borders.
- Rounded cards with a colored left-border accent — drop the radius or the border,
  never both together.
- Emoji as icons anywhere. **One exception:** footer contact rows may use 📞 ✉️ 📍 at
  your discretion by brand register — upscale brands get monoline SVG instead.
- Raw hex outside `:root`. Invented statistics or filler copy presented as real.

## Lists are menus, not checklists

The industry playbook's lists are option spaces. Taking all of one is how every business
in a vertical ends up with the same website.

- Tier 2 components: only what the brief justifies — typically **3–5**, never all.
- Trust signals: **4–6**, each substantiated by the brief.
- Objections addressed: **5–7**, chosen for this specific business.
- Section orders are recommended starting points. Reorder, merge, or drop with a reason
  stated in one line. A thin section is worse than an absent one.

## Make this build unlike the last one

Thousands of builds run this same system. Read the Design Prompt's **"Dimensions
resolved from defaults"** footer before designing:

- **0–2 defaulted** → the brief is driving. Proceed.
- **3–5** → push the brief-stated dimensions harder so they carry the identity.
- **6+** → **high convergence risk.** The playbook is steering, not the client. Say so in
  the Compliance Report and make the three directions diverge more than usual.

Name in the Compliance Report the **three specific visual decisions** that came from
*this* business — its personality sliders, its first-five-seconds emotion, its
competitive set, its own story. "Took the playbook's first option" is not a decision.

Trends move and the playbooks lag them. Where a current, better-executed pattern serves
the same goal, use it and note the swap. The target is a site that looks made in the
year it shipped — not one that matches a document.

## Assets and content

- **Never invent a brand hex, a font name, or a statistic.** If it isn't in the Design
  Prompt or attached as a file, it doesn't exist — say so and treat the choice as yours.
- Fetching a URL returns **text only** — no layout, no images, no CSS. Copy can be
  fetched; logos, measured hexes and real font names cannot. Visual reference arrives as
  attached screenshots or not at all.
- Real copy is used verbatim. Missing copy is flagged Lorem, missing stats are `00+`.
  Never pad a design with filler to fill space.

## Build order

Style Guide artifact first, then pages. Beyond ~3 pages, build one page per response.
Never attempt every page in a single artifact.
