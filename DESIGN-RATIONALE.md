# Design Rationale — [CLIENT NAME]
### The strategic thinking behind the recommended direction — internal / stakeholder-facing.

*(This is the internal counterpart to `CLIENT-PRESENTATION.md`. Client Presentation
translates the 3 directions into plain English for the client. This file is the
underlying strategic reasoning — for you, a boss, or anyone internal who needs to
understand and defend why the recommended direction is the recommended direction,
not just what it looks like.)*

> **Who fills this out:** whoever ran the Design Canvas (Stage 3) — usually right after
> the 3 directions and the Rule 1b recommendation exist, same moment as
> `CLIENT-PRESENTATION.md`.
> **Source material:** Rule 1a's grounding pass (including the Competitive Analysis
> table, if filled in — see `02-MASTER-PLAYBOOK.md` Rule 1a), Rule 1b's recommendation
> rationale, and the 7 Design Language decisions (Rule 11) already committed to in the
> Design Canvas. This document doesn't add new design reasoning — it collects reasoning
> that already exists across those steps into one place.
> **Relationship to `POST-LAUNCH-PLAYBOOK.md`:** the A/B Test Hypotheses section below
> is where hypotheses are first drafted, pre-launch. Once the site is live, move each
> one into `POST-LAUNCH-PLAYBOOK.md`'s Design Hypothesis Log to actually track and
> resolve it against real data — don't maintain the same hypothesis in both places.

---

## Differentiation angle

**One-line thesis:** [from Rule 1a's grounding pass — what makes this site not look
like every competitor in the space]

**Why it matters for this client specifically:** [1-2 sentences — tie the angle to
something concrete about this business, not a generic claim]

---

## Benchmark insights

What the 3–5 best-in-class sites studied in Rule 1a actually do well, and which of
those patterns this build adopts (or deliberately doesn't):

| Pattern observed | Adopted here? | Why / why not |
|---|---|---|
| [e.g. hero proof-cluster] | [Yes/No] | [reasoning] |
| [e.g. single-page services vs. split pages] | | |

See the Competitive Analysis table in the build log (Rule 1a) for the full site-by-site
notes this summarizes.

---

## Why craft is a business argument, not a taste argument

*(Standing section — the case for spending on design at all. Keep or trim per audience;
the specifics below should reference this build.)*

Design decisions in this system are grounded in named, long-studied principles, not
preference:

- **Aesthetic-usability effect** — people judge better-looking interfaces as easier to
  use, and are more tolerant of minor usability problems in them. Craft doesn't just
  make a site look expensive; it measurably changes how capable the business appears and
  how forgiving visitors are.
- **Jakob's Law** — visitors spend nearly all their time on other sites, so familiar
  interaction patterns outperform clever ones. This is why the build is distinctive in
  its *look* and conventional in its *behavior* (CRAFT-RULES C11).
- **Hick's Law / Fitts's Law** — every extra choice costs decision time, and every
  target gets easier as it grows and nears the thumb. This is why there's one primary
  CTA per view and why the mobile action bar sits where it does (C12).

The practical point for a stakeholder: anyone can generate a website quickly now.
Knowing *why* one converts and another doesn't is the part that didn't get automated —
and it's what this system encodes.

## Conversion strategy

**How the section order serves the primary goal:** [reference the per-page conversion
goal from Rule 21a and explain how the chosen direction's section stack — Rule 10's
per-page stacks — is sequenced to build toward it]

**Primary CTA and why it's positioned where it is:** [tie back to Conversion Playbook's
section-order logic]

---

## Risk assessment

**What might not work, and why:** [be honest here — every direction is a bet. Name the
part most likely to need revision after real client/user feedback — a bold typography
choice, an unconventional section order, a signature motion element, etc.]

**What we'd do if it doesn't land:** [the fallback — usually "revert that one element,
keep the rest" rather than a full redirection]

---

## A/B test hypotheses

Non-obvious decisions worth validating once the site has real traffic. Draft them here;
move each to `POST-LAUNCH-PLAYBOOK.md`'s Design Hypothesis Log once the site launches.

- **Hypothesis:** [e.g. "Hero proof-cluster increases consult bookings by 15% vs. a
  plain hero."]
  **What would confirm/deny it:** [which metric, from Post-Launch Playbook Section 1]

- **Hypothesis:**
  **What would confirm/deny it:**

---

*Design Scarlet Macaw · Design Rationale*
