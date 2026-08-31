# [CLIENT NAME] — Developer Handoff
### Design Scarlet Macaw
**Generated:** [DATE]
**Industry:** [INDUSTRY]
**Primary conversion goal:** [GOAL FROM BRIEF]

> This document is for the development team. Every item here must be confirmed before the site goes live. Items marked `[TO CONFIRM]` require information not provided in the brief — confirm with the client before launch.

> **Canonical launch QA:** if your team keeps a separate production launch QA
> checklist (platform/SEO/security/analytics items with assignees), that document is
> canonical for launch. This Handoff is the short, design-aware bridge from Brief →
> that checklist — it does not duplicate it.

---

## 0. HOST PLATFORM & DEPLOYMENT

**Target platform:** [FROM BRIEF OUTPUT SECTION — WordPress / Webflow / Framer /
Squarespace / Custom code / Not yet decided]

**Platform Adaptation table** — constraints to check before/during build-out, by platform:

| Platform | Constraints to check |
|---|---|
| WordPress | Confirm the page builder (Elementor / Gutenberg / other) can reproduce the delivered layout; motion (Rule 12) may need a JS snippet or plugin if the builder doesn't support it natively; forms route through the builder's form plugin, not the Preview Shell's mock submit |
| Webflow | Recreate sections as Webflow symbols/components; interactions (hover, scroll-triggered motion) rebuilt in Webflow's native interactions panel, not copied JS; CMS collections needed if content (services, locations) should be client-editable |
| Framer | Components and variants map closely to the delivered React structure; verify breakpoint behavior matches the two-breakpoint spec (375px / 1280px) — Framer's default breakpoints differ |
| Squarespace | Most constrained — custom CSS/JS injection only; some Rule 10 components (dropdown mega-menus, custom motion) may need to be simplified; confirm before committing to a direction that assumes full custom markup |
| Custom code | No adaptation needed — the delivered React JSX / standalone HTML ships close to as-is; confirm hosting/build pipeline (static export vs. framework) with the dev team |
| Not yet decided | Flag as **[TO CONFIRM]** — do not assume Custom code by default; the choice affects which Rule 10/12 features are safe to promise the client during Stage 5 (Client Review) |

---

## 0b. DESIGN TOKENS → PLATFORM *(v12, Aug 31 2026)*

The build's `tokens.css` is the single source of truth (Rule 9), and **the artifact
declares every token in one `:root` block because a pasted style block has no cascade
behind it. That rule inverts at handoff:** in production the tokens become the
platform's own variable system — don't ship the flat block as-is where the platform
has a native token layer.

| Platform | Where the tokens go |
|---|---|
| WordPress (block themes) | `theme.json` — colors → `settings.color.palette`, type scale → `settings.typography.fontSizes`, spacing → `settings.spacing.spacingSizes`; anything `theme.json` can't express stays as `:root` custom properties in the theme stylesheet |
| WordPress (Elementor) | Site Settings → Global Colors / Global Fonts for the role tokens; the full `:root` block loads via a custom-CSS stylesheet so `var()` references keep working |
| Webflow | Webflow Variables (colors, type, spacing) mapped 1:1 to the role tokens |
| Framer | Design tokens / color styles panel |
| Squarespace / other constrained | Keep the `:root` block in injected CSS — the one case the flat block ships as-is |

**Token-name translation (for devs coming from shadcn/Tailwind conventions** — the
de-facto vocabulary most component libraries and AI tools speak; ours predates it and
is NOT being renamed):

| Ours | shadcn-equivalent | Ours | shadcn-equivalent |
|---|---|---|---|
| `--canvas` | `--background` | `--cta` | `--primary` |
| `--surface` | `--card` | `--cta-hover` | *(primary hover shade)* |
| `--ink` | `--foreground` | `--anchor` | *(no equivalent — dark section bg)* |
| `--muted` | `--muted-foreground` | `--line` / `--line-soft` | `--border` |
| `--error` | `--destructive` | `--focus-ring` | `--ring` |

- [ ] Tokens transferred into the platform's native system per the table above
- [ ] Contrast pairs re-verified **after** transfer (platform defaults can silently
  substitute shades — CRAFT-RULES C6 pairs must survive the move)
- [ ] Proprietary fonts: production loads the REAL family (license confirmed);
  the build's "stand-in for [X]" Google Font is dev-preview only
- [ ] **Copy readability flag:** [Synthesizer notes here if client-supplied copy reads
  college-level — a measured conversion risk (simpler reading levels convert meaningfully
  better, see `04-CONVERSION-PLAYBOOK.md` Evidence Layer). Flag for the client conversation;
  never rewritten silently.]

---

## 0c. CLAUDE DESIGN NATIVE HANDOFF *(when applicable)*

When the project runs through Claude Design's /design-sync or handoff-bundle export —
components, tokens, copy, and interaction notes land in Claude Code directly — this
document covers only what the bundle doesn't: analytics, forms/destinations,
legal/compliance, hosting/platform notes, and content-migration items. Skip the items
the bundle already answers; everything else below still applies.

---

## 1. ANALYTICS & MEASUREMENT

- [ ] Analytics platform installed on every page: [GA4 / [TO CONFIRM]]
- [ ] Conversion events tracked per page:

| Page | Conversion Event | Event Name |
|---|---|---|
| Home | [Primary CTA click — e.g. "Book Appointment"] | `cta_click_book` |
| Contact | Form submission | `form_submit_contact` |
| [Service Detail] | "Book" sidebar click | `cta_click_sidebar_book` |
| All pages | Phone number click | `phone_click` |

- [ ] Call tracking on phone numbers: [YES — provider: [TO CONFIRM]] / [NO]
- [ ] Google Search Console connected: [TO CONFIRM]
- [ ] Google Business Profile connected: [TO CONFIRM]
- [ ] Heatmap / session recording tool: [TO CONFIRM — optional for first optimization round]

---

## 2. FORMS & LEAD DELIVERY

- [ ] Form submissions delivered to: [EMAIL — [TO CONFIRM]] and/or [CRM — [TO CONFIRM]]
- [ ] Autoresponder / confirmation email sent to lead: [YES] / [TO CONFIRM]
  - Confirmation message must match: [brief's promised response time / next steps]
- [ ] Internal notification to client's team: [YES] / [TO CONFIRM]
- [ ] Spam protection live: honeypot field or invisible check (no user-facing CAPTCHA)
- [ ] Submissions backed up / stored (not email-only): [YES — platform: [TO CONFIRM]]
- [ ] HIPAA-compliant form handling (healthcare only): [YES] / [N/A]

---

## 3. SEO DEPLOYMENT

**Business NAP (must match Google Business Profile exactly):**
- Business name: [FROM BRIEF SECTION 1]
- Address(es): [FROM BRIEF SECTION 8]
- Phone: [FROM BRIEF SECTION 1]

- [ ] `sitemap.xml` generated and submitted to Google Search Console
- [ ] `robots.txt` correct (not blocking live site)
- [ ] Canonical tags per page — no duplicate content
- [ ] Schema markup validated (Rich Results Test):
  - Schema type: [HEALTHCARE → LocalBusiness + MedicalBusiness] / [LEGAL → LocalBusiness + LegalService] / [REAL ESTATE → LocalBusiness + RealEstateAgent] / [INDUSTRIAL → LocalBusiness + HomeAndConstructionBusiness]
  - Additional schema: [FAQPage on pages with FAQ] / [Review on review sections] / [Service on service pages]
- [ ] Title tags present and unique per page (from design — [TO CONFIRM if not in design])
- [ ] Meta descriptions present and unique per page
- [ ] NAP matches Google Business Profile exactly (verified)
- [ ] Redirects from old URLs mapped (if replacing existing site) — **from Brief Section 10**:

| Old URL | New URL |
|---|---|
| [FROM BRIEF SECTION 10] | |

- [ ] Content migration resolved per Brief Section 10's Content Migration table — every
  "Drop" row has a redirect target (no orphaned 404s), every "Migrate as-is / Rewrite" row
  has an owner and a source location confirmed before launch

---

## 4. PERFORMANCE VERIFICATION

Run after deployment on key page templates (Home, Services, Contact):

- [ ] Lighthouse / PageSpeed Insights:
  - LCP (Largest Contentful Paint): **must be < 2.5s**
  - CLS (Cumulative Layout Shift): **must be < 0.1**
  - INP (Interaction to Next Paint): **must be < 200ms**
- [ ] Images: served in WebP format, correctly sized, lazy-loaded below the fold
- [ ] Fonts: subset + `font-display: swap` — no render-blocking font weight
- [ ] Caching / CDN configured
- [ ] Animations using GPU-composited properties (`transform`, `opacity`) — no layout-triggering animation

---

## 5. ACCESSIBILITY

- [ ] Automated accessibility pass (axe / Lighthouse a11y) — no critical issues
- [ ] Keyboard walkthrough: nav dropdowns, mobile hamburger menu, forms, accordions, CTAs
- [ ] Color contrast spot-check against live palette (WCAG 2.2 AA: 4.5:1 body, 3:1 large text)
- [ ] Screen reader sanity check on primary conversion path
- [ ] All `prefers-reduced-motion` gates active — motion disabled when user requests it
- [ ] All `tel:` links are click-to-call on mobile
- [ ] All address links open Google Maps
- [ ] **Visible focus indicator** on every interactive element when tabbed to — no `outline: none` without a replacement focus style
- [ ] **Tap target size**: every clickable element ≥ 24×24 CSS px (WCAG 2.2 SC 2.5.8), 44×44px recommended on mobile
- [ ] **Heading hierarchy**: exactly one H1 per page, sequential H2/H3, no skipped levels, no heading used purely for its font size

---

## 6. LEGAL & COMPLIANCE

- [ ] Privacy Policy live and linked in footer — source: **[FROM BRIEF SECTION 10]**
- [ ] Terms of Service live and linked in footer (if applicable)
- [ ] Cookie consent banner (if GDPR or analytics tracking requires it) — Accept and Reject All at equal visual weight, default to privacy-preserving
- [ ] SSL / HTTPS enforced sitewide
- [ ] **HTTP security headers** present and correctly configured:
  - [ ] `Strict-Transport-Security` (max-age ≥ 63072000)
  - [ ] `X-Frame-Options: DENY` or CSP `frame-ancestors`
  - [ ] `X-Content-Type-Options: nosniff`
  - [ ] `Referrer-Policy`
- [ ] Required vertical-specific compliance:
  - Healthcare: HIPAA Notice linked in footer + below all patient forms
  - Legal: Attorney-client disclaimer on all case evaluation / contact forms
  - Healthcare (addiction/mental health): Crisis resources visible (988 Lifeline, SAMHSA 1-800-662-4357)
  - Other: **[FROM BRIEF SECTION 10]**

---

## 7. INTEGRATIONS

**From Brief Section 10:**
- [ ] Booking system: [FROM BRIEF SECTION 10 / TO CONFIRM]
- [ ] CRM: [FROM BRIEF SECTION 10 / TO CONFIRM]
- [ ] Chat widget: [FROM BRIEF SECTION 10 / TO CONFIRM]
- [ ] EHR / practice management system: [FROM BRIEF SECTION 10 / TO CONFIRM]
- [ ] Other: [FROM BRIEF SECTION 10 / TO CONFIRM]

---

## 8. BROWSER & DEVICE QA

- [ ] Favicon: 32×32 + 180×180 live on every page
- [ ] OG / social share image live on every page (1200×630px)
- [ ] Custom 404 page deployed and branded
- [ ] Form success and error states deployed and tested
- [ ] Cross-browser testing:
  - [ ] iOS Safari (latest)
  - [ ] Android Chrome (latest)
  - [ ] Desktop Chrome (latest)
  - [ ] Desktop Safari (latest)
  - [ ] Desktop Firefox (latest)
- [ ] Mobile sticky CTA bar visible and functional on all mobile devices
- [ ] All dropdown menus functional on desktop (hover) and mobile (touch / dialog accordion)
- [ ] Mobile hamburger dialog opens, scrolls, and closes correctly
- [ ] External links open in new tab
- [ ] Copyright year is dynamic

---

## 9. PATIENT / CLIENT FORMS (if applicable)

**From Brief Section 10:**

| Form Name | Est. Completion Time | Fill Online | Download PDF |
|---|---|---|---|
| [FROM BRIEF SECTION 10] | | [ ] | [ ] |

- [ ] Forms delivered to: [FROM BRIEF SECTION 10 / TO CONFIRM]
- [ ] Forms compliant with applicable regulations (HIPAA / legal privilege)

---

## 10. POST-LAUNCH OPTIMIZATION

Once analytics has 2–4 weeks of real traffic, run the full process in
`POST-LAUNCH-PLAYBOOK.md`:

- Review data against each page's declared conversion goal
- Check heatmaps for scroll depth and CTA click patterns
- Identify highest-exit pages and lowest-converting CTAs
- Form hypotheses and A/B test — log them in `POST-LAUNCH-PLAYBOOK.md` Section 2
- Iterate

This is an ongoing service — not a design-phase step. Every non-obvious design
decision on this build should have a corresponding hypothesis logged in
`POST-LAUNCH-PLAYBOOK.md` before this review happens, so there's something concrete
to check the data against.

---

*Design Scarlet Macaw · Developer Handoff*
*Anything verified in the design Compliance Audit should be re-confirmed here post-deploy — rendering, data, and performance can change between preview and production.*
