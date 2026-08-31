# Design Scarlet Macaw — Conversion Playbook
### CRO rules baked into every layout decision.

> Beautiful sites that don't convert are portfolio pieces. This playbook is the business logic behind every design decision. Apply it on every page, every section, every CTA.

---

## THE CORE PRINCIPLE

**Every page has exactly one primary conversion goal.**
Everything on that page — hierarchy, section order, CTA placement, copy, imagery — serves that one goal. Secondary goals exist but never compete with the primary.

If a page is trying to do everything, it accomplishes nothing.

---

## PER-PAGE CONVERSION GOALS

| Page | Primary Goal | Primary CTA |
|---|---|---|
| Home | Book / Schedule / Contact | "Book an Appointment" / "Schedule a Consultation" |
| About | Build trust → Contact | "Contact Us" / "Meet the Team" |
| Services Index | Discover → Click into a service | "Learn More" per service card |
| Service Detail | Convert the interested visitor | "Book an Appointment" / "Get a Quote" |
| What We Treat | Match visitor's pain → Book | "Book an Appointment" |
| Locations | Visit or call | "Book here" / "Get Directions" |
| Contact | Submit the form or call | Form submit / Phone |
| Forms / Intake | Complete the form | "Fill Online" / "Download" |
| Blog / Resources *(only if checked in the brief)* | Read → subscribe or contact | Newsletter signup / primary site CTA |

**The CTA label must match the goal exactly.** "Learn More" is never a primary CTA. "Submit" is never acceptable. Always a strong, specific action verb.

---

## THE CONVERSION HIERARCHY

### 1. Above the Fold is Everything
The visitor decides in under 3 seconds whether to stay or leave. Everything above the fold must answer:
- **Who is this for?** (headline)
- **What do I get?** (subheadline)
- **What do I do next?** (CTA button)
- **Can I trust this?** (trust micro-element)

If any of these four are missing above the fold, the page is failing at its first job.

### 2. Phone Number Placement — Always Visible
The phone number must appear in:
- Announcement bar (desktop)
- Navigation (right side, always)
- Hero section
- Footer (per location, with a phone icon — per the Component Library G3 contact icon policy: emoji glyphs are permitted in footer contact rows only, at Claude Design's discretion by brand register; upscale brands get monoline SVG icons instead)
- Contact page (large, prominent)
- Mobile dialog (with an SVG phone icon — never emoji outside the footer)

A visitor who wants to call should never have to search for the number.

### 3. Trust Signals Live Near Conversion Moments
Don't put all social proof at the bottom of the page. Place it near the ask:
- Reviews / star rating near the hero CTA
- Stat bar immediately after the hero
- Credentials near the contact form
- "Real reviews" section before the final CTA band

### 4. One Primary CTA Per Section
Every section has at most one primary CTA button. Multiple competing CTAs split attention and reduce clicks on both. If a section needs a secondary action, make it a text link or ghost button — visually subordinate to the primary.

---

## CTA STANDARDS

**Strong action verbs only:**
✅ "Book Your Appointment"
✅ "Schedule a Free Consultation"
✅ "Get My Quote"
✅ "Call Now"
✅ "View All Services"
✅ "Get Directions"

❌ "Submit"
❌ "Click Here"
❌ "Learn More" (as a primary CTA)
❌ "Send"
❌ "Go"

**CTA labels must be consistent site-wide.** If the primary booking CTA is "Book an Appointment" on the home page, it is "Book an Appointment" everywhere — not "Schedule Now" on one page and "Get Started" on another.

**Button hierarchy:**
- Primary CTA: solid fill, brand accent color, prominent size
- Secondary CTA: ghost/outline button, visually subordinate
- Tertiary action: text link with arrow →

---

## FORM STANDARDS

**Minimum viable fields only.** Every additional field reduces completion rate. Only ask what is genuinely needed at this stage.

**(v12) The quick-quote default is THREE fields:** name · phone-or-email · one qualifier
(service dropdown or short "what brings you in"). Evidence: form length is the single
biggest completion lever (Venture Harbour/HubSpot: ~3 fields is the sweet spot; longer
forms convert better only when split into steps). The standard set below is the
**ceiling** for a single-step form — anything beyond it becomes a **multi-step form
that opens with the easiest question** (service needed), never a longer single page.

**Standard contact / booking form fields (single-step ceiling):**
- First name + Last name (side by side on desktop — **single column on mobile, and
  prefer single column everywhere**: Baymard's testing shows multi-column layouts
  measurably hurt completion)
- Email
- Phone
- One relevant dropdown (location, service, or "what brings you in")
- Optional free-text message (never required — and **marked "optional" explicitly**;
  unmarked optional fields add silent cognitive load)

**Never require:** address, date of birth, insurance details, or any sensitive data at the initial inquiry stage.

**Every form must have:**
- Clear success state (confirmation message or redirect — what happens next)
- Clear error state (inline validation, not a page-level error)
- Spam protection (honeypot field or invisible check — never a user-facing CAPTCHA)
- Autoresponder confirmation to the lead within the session
- Submissions delivered to an agreed destination (email + CRM)

**Required compliance notices:**
- Healthcare: HIPAA notice below the form
- Legal: attorney-client disclaimer
- All: Privacy Policy link near the submit button

---

## TRUST SIGNAL HIERARCHY

Deploy trust signals in this priority order — highest impact first:

1. **Real numbers** — patients seen, years in practice, satisfaction rate (count-up animation)
2. **Google reviews** — real Google G logo, real star rating, real review count
3. **Verbatim testimonials** — real names, real quotes, no paraphrasing
4. **Credentials and certifications** — real credentials, not invented
5. **Before/after or process clarity** — what happens step by step
6. **Team photos** — real people build more trust than stock

**Never invent trust signals.** A fabricated stat or testimonial is a legal and ethical liability.

---

## OBJECTION HANDLING

Every visitor has objections. Design answers them before they're asked.

**Common objections and where to address them:**

| Objection | Answer | Where |
|---|---|---|
| "Is this covered by insurance?" | Insurance accepted list / "most insurances accepted" | Near the hero, sidebar, FAQ |
| "How much does it cost?" | Pricing or "get a quote" CTA | Services detail, sidebar |
| "Are you qualified?" | Credentials, certifications, years in practice | About page, service sidebar |
| "Is this the right service for me?" | Condition matching, "What We Treat" | Home, Services, treatment page |
| "What happens at my first visit?" | Step-by-step first visit section | About, FAQ |
| "Can I trust these reviews?" | Real Google reviews with G logo | Homepage, About |

---

## SECTION ORDER LOGIC

Sections should appear in persuasion order, not arbitrary order:

**Home page persuasion flow:**
1. Hook (Hero) — stop the scroll, state the value
2. Credibility (Trust Bar) — prove the numbers
3. Understanding (Brand Story) — show you get them
4. Discovery (Services Preview) — show what you offer
5. Proof (Testimonials) — let others speak for you
6. Accessibility (Locations) — remove friction
7. Differentiation (Why Choose Us) — close the gap vs. competitors
8. Action (CTA Band) — final push
9. Safety net (FAQ + Consult Form) — catch the undecided

**Never lead with the company story.** Lead with the visitor's problem and your solution. The company story earns its place after the visitor has decided they're interested.

---

## MOBILE CONVERSION REQUIREMENTS

Mobile visitors convert differently. Address them specifically:

- **Mobile sticky CTA bar** (pinned to bottom): Call + Book. Always visible, never obstructed.
- **Click-to-call on every phone number** — all `tel:` links must be active on mobile
- **Tap targets:** interactive targets ≥24×24px hard floor (WCAG 2.5.8); primary CTAs and nav items ≥44×44px
- **Form fields full-width on mobile** — no side-by-side fields on small screens
- **Hero CTA above the fold on mobile** — never pushed below a tall hero image
- **Address links to Google Maps** — `https://maps.google.com/?q=` links on all addresses

---

## WHAT "CONVERTING" ACTUALLY LOOKS LIKE

A converting page is not just one that has a CTA button. It is a page where:

- The visitor understands what they get within 3 seconds
- They see proof they can trust the business
- Their objections are addressed before they ask
- The next step is obvious and frictionless
- The CTA is visible without scrolling (above fold)
- The phone number is always one glance away
- The form has the minimum friction possible

Design every page against this checklist before delivering it.

---

## THE EVIDENCE LAYER *(v12, Aug 31 2026 — the numbers behind the rules above, from primary sources; folklore stats flagged at the bottom)*

**Copy converts at a 5th–7th grade reading level.** Unbounce's large-scale
landing-page research (tens of millions of conversions) found pages written at simpler
reading levels convert meaningfully better than college-level copy; word count,
reading time, and 3+-syllable words all correlate *negatively* with conversion. This
is why Rule 3f writes short and plain —
and why client-supplied copy that reads academic gets flagged in the handoff.

**Mobile is the money view.** Most local-service traffic is mobile, and mobile
converts worse than desktop — design mobile-first: the sticky CTA bar, click-to-call,
and the ≥44px targets above aren't mobile polish, they're where most conversions
actually happen.

**Speed is a conversion feature with a price on it.** Google/Deloitte ("Milliseconds
Make Millions," 37 brands): a **0.1s** mobile-speed improvement lifted retail
conversions **+8.4%**; a 1s delay costs ~7%. This is the business case for the
single-page static build, the ≤1MB page budget, and the 200KB hero cap (Rule 21c) —
protect them in every negotiation about "just one more script."

**Testimonial adjacent to the CTA, aggregate proof in the hero.** The tested pattern:
star-rating/review-count in the hero (the trust micro-element above), one short named
testimonial directly beside or below each primary CTA (WikiJob's classic A/B: +34%),
detailed reviews mid-page. "Trust signals near conversion moments" (§3 above), made
positional.

**Up-front disclosure is a measured trust driver (NN/g).** Four factors: design
quality · **up-front disclosure** (physical address/service area, phone, pricing or
"from" pricing where the client allows) · comprehensive current content · real
connection to the wider web. Hiding the price reads as "expensive"; hiding the address
reads as "not real." Push clients on this — it's evidence, not taste.

**Multi-step beats long single-step.** When more than the 3-field quick-quote is
genuinely needed, split it: multi-step forms consistently outperform long single-step
forms in published A/B research. Start with the easiest question; never re-ask
anything (WCAG 2.2 §3.3.7).

**⚠️ Folklore stats — use the principle, never quote the number:** "above-fold CTAs
convert 3× better" and "social proof below the CTA lifts 68%" circulate widely but
trace only to vendor listicles, not primary studies. The *directional* principles
(CTA visible without scrolling; proof near the ask) are sound and already rules above —
just never put those numbers in front of a client.

---

*Design Scarlet Macaw · Conversion Playbook*
