# Design Scarlet Macaw — Post-Launch Playbook
### Closing the loop between what shipped and what actually converts.

> Run this per project, starting 2–4 weeks after launch (per
> `DEV-HANDOFF-TEMPLATE.md` Section 10). It's an ongoing service, not a one-time
> checklist — revisit quarterly for as long as the client relationship continues.

---

## 1. STANDARD ANALYTICS REVIEW

Pull these five views for the launched site. Use whatever analytics platform was
set up in Dev Handoff Section 1 (GA4 by default):

- **Heatmap scroll-depth analysis** — where do visitors actually stop scrolling,
  per page? Compare against where the primary CTA and trust signals sit (Rule 10's
  section order) — if the CTA sits below where most visitors stop, that's a real
  finding, not a design opinion.
- **CTA click rates by placement** — which CTA instances (hero, mid-page, footer,
  sticky mobile bar) actually get clicked, and in what proportion.
- **Form abandonment funnel** — at which field do visitors drop off, if the form
  platform supports funnel tracking.
- **Bounce rate by page** — flag any page bouncing meaningfully higher than the
  site average; check it against the Rule 10 "3-second test" (does the page answer
  who/what/next-step/trust within the first fold).
- **Conversion rate by traffic source** — organic vs. paid vs. direct vs. referral,
  segmented by the primary conversion goal (Dev Handoff Section 1).

Document findings in plain language — a sentence per metric, not a raw data dump.

---

## 2. DESIGN HYPOTHESIS LOG

Every non-obvious design decision on a build is, implicitly, a bet. Make the bet
explicit at build time (or retroactively, the first time this playbook runs on an
older project) so it can be checked against real data later.

**Format — one entry per hypothesis:**

```markdown
### [Project name] — [decision made]
**Hypothesis:** [What we expect this to do, and roughly how much]
  e.g. "Hero proof-cluster (rating badge + avatar cluster + stats) increases
  consult bookings by 15% vs. a plain hero."
**Rule/Decision this maps to:** [e.g. Rule 10 Hero Impact Standard — trust-vertical
  proof-cluster]
**Where to check it:** [which metric from Section 1 above confirms or denies this]
**Status:** [ ] Untested (too early)  [ ] Testing  [ ] Validated  [ ] Refuted
**Result (fill in after 2–4+ weeks of data):**
```

Log a hypothesis for anything that isn't just "following the rulebook" — a bespoke
section, an unusual section order, a motion choice above the Tier floor, an
industry-playbook deviation. Routine rule-following doesn't need its own hypothesis;
the interesting bets do.

---

## 3. VALIDATION → RULE PIPELINE

Individual hypotheses are project-specific. The point of logging them is to notice
when the **same** hypothesis validates across multiple, unrelated builds — that's
signal the rulebook itself should change, not just this one client's site.

**Process:**
1. After each post-launch review, check this project's validated/refuted hypotheses
   against the running list of hypotheses from other projects (kept in this file's
   Section 4 below).
2. If a hypothesis has been **validated in 3 or more independent builds**, it
   graduates from "recommendation" to "requirement" — propose the specific rule
   change to `02-MASTER-PLAYBOOK.md` and note it as a candidate in
   `OPERATING-LOG.md`'s "Graduated to rules" section (Rule 22d).
3. If a hypothesis is **refuted 2+ times**, flag the corresponding rule/pattern for
   review — it may be a default that doesn't hold as broadly as assumed.
4. Either way, record the outcome in Section 4 so the count is cumulative across
   projects, not lost per-project.

This is deliberately a higher bar than the Operating Log's build-time lessons (which
graduate off recurrence of a *problem*, not a *validated hypothesis*) — performance
data is noisier than a build bug, so it needs more independent confirmations before
it becomes a rule.

---

## 4. CROSS-PROJECT HYPOTHESIS TRACKER

Running tally — append a row every time a hypothesis from Section 2 is resolved on
any project. This is what Section 3's graduation count is checked against.

| Hypothesis (generalized) | Validated on | Refuted on | Count | Status |
|---|---|---|---|---|
| Hero proof-cluster increases trust-vertical bookings | | | 0 | Tracking |
| Testimonial adjacent to primary CTA lifts clicks vs. proof-elsewhere *(v12 seed — externally evidenced: WikiJob-class A/B +34%; needs OUR validation)* | | | 0 | Tracking |
| 3-field quick-quote form outperforms the 5-field standard on completion *(v12 seed — Venture Harbour/HubSpot direction)* | | | 0 | Tracking |
| Multi-step form beats long single-step when >3 fields are needed *(v12 seed)* | | | 0 | Tracking |
| Visible "from" pricing lowers bounce on service pages *(v12 seed — NN/g up-front disclosure)* | | | 0 | Tracking |
| Simplified 5th–7th-grade rewrite of a client-approved page lifts conversion *(v12 seed — Unbounce 11.1% vs 5.3%; test only with client sign-off, Rule 3)* | | | 0 | Tracking |
| Sub-2.5s LCP pages convert measurably better than 2.5s+ pages in our own book *(v12 seed — Google/Deloitte +8.4%/0.1s)* | | | 0 | Tracking |
| [add rows as hypotheses resolve] | | | | |

*(v12 note, Aug 31 2026: the seeded rows are externally-evidenced bets worth testing
first — external evidence sets the direction, but only OUR cross-project validation
(3+ builds, Section 3) graduates anything into a rule.)*

---

*Design Scarlet Macaw · Post-Launch Playbook*
