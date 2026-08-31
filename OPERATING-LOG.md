# Design Scarlet Macaw — Operating Log

**Standing, cross-project lessons-learned log** (Playbook Rule 22d). Lives in project knowledge so it carries between builds.

**How to use:**
- **Start of every build (grounding, Rule 1a):** scan §2 (root causes) and §1 (preferences) so known mistakes aren't repeated and known preferences are honored from the first draft.
- **After every build:** roll up that build's change log (Rule 22b) into here — especially `FIX` items with root causes.
- **Graduate** universal items into numbered playbook rules; mark them in §4.

The loop: per-build change log → this Operating Log → playbook rules.

> **Format note:** §2 uses YAML-frontmatter + markdown entries (one per root cause) so
> severity, recurrence count, and graduation status stay parseable instead of buried in
> prose or table cells. Keep each entry's `status` field in sync with the playbook —
> graduation status drifting out of date is exactly the kind of rot this log exists to
> prevent.

---

## 1 · Operating preferences (how this team works)

- **Explain root cause before fixing.** State what's wrong + why (root cause) before applying a fix, so it's reusable as a prevention rule. *(Rule 22a)*
- **Keep a per-build change log**, tagged CHANGE / Q / FIX, and feed it back here. *(Rule 22b)*
- **`/check` cadence** — auto cross-reference requests vs. applied changes every 5 requests; manual `/check` anytime. *(Rule 22c)*
- **When no brand guide is provided, "Claude decides"** colors/fonts/brand — using muted, on-brand palettes. *(Rules 11, 13)*
- **Always offer the 4th "Mix & Match" canvas option.** *(Rule 1c)*
- **Fetch assets once, up front** (ingestion pass), then build only from that frozen set — no ad-hoc fetching mid-build. *(Rule 23)*
- **Toolkit lives in project knowledge** (playbook, style-guide template, tokens, this log); only re-sent when a new playbook version ships.

---

## 2 · Recurring root causes (prevention)

Each entry: `id` matches the table row this replaces, `severity` is a rough impact
estimate (not measured — assign judgment), `recurrences` is how many separate builds
hit this (best available count; mark `unknown` where the source log didn't track it),
`status` is `graduated` (now a numbered rule), `candidate` (recurs, not yet graduated),
or `dev-level` (real but code-level, not a design-system rule — stays logged here only).

```yaml
id: R1
severity: medium
recurrences: unknown
status: graduated
graduated_rule: "Rule 12 (hover-intent)"
```
### R1 — Dropdown closes too fast
**Root cause:** Dead-zone gap between the trigger and the dropdown panel — JS-timed close fires before the cursor reaches the panel.
**Prevention:** Hover bridge + CSS `:hover` (not JS timing).

```yaml
id: R2
severity: medium
recurrences: 2
status: graduated
graduated_rule: "Rule 4 (corner-clip fix)"
```
### R2 — `backdrop-filter` breaks rounded-corner clipping
**Root cause:** `backdrop-filter` on a rounded container can render outside the intended clip radius — nav and sticky bar poked outside the phone frame. Hit twice.
**Prevention:** Use a solid/translucent background inside rounded frames; match radius + clip instead of relying on `backdrop-filter`'s own clipping.

```yaml
id: R3
severity: medium
recurrences: unknown
status: graduated
graduated_rule: "Rule 13"
```
### R3 — Compounding spacing
**Root cause:** Child margin added on top of a grid/flex `gap`, doubling the intended spacing (observed ~60px where ~30px was intended).
**Prevention:** One source of spacing per axis — `gap` **or** margin, never both stacked.

```yaml
id: R4
severity: high
recurrences: 1
status: graduated
graduated_rule: "Rule 18"
```
### R4 — Variable-length CMS content overflows/breaks layout
**Root cause:** Layout assumed a fixed content length; an oversized testimonial broke the pages.
**Prevention:** Test short AND long content for every dynamic-content section; use flexible heights and contained text, never a fixed-height assumption.

```yaml
id: R5
severity: high
recurrences: 2
status: graduated
graduated_rule: "Rule 13 (Layering & stacking gotchas)"
```
### R5 — `overflow: hidden` on an ancestor hijacks sticky positioning
**Root cause:** A sticky sidebar/element inside an ancestor with `overflow: hidden` (or `auto`) never sticks correctly — starts offset or doesn't stick at all.
**Prevention:** Sections containing a sticky element need `overflow: visible` ancestors; use `overflow-x: clip` instead of `overflow: hidden` where horizontal containment is still needed.
**Graduation note:** was marked "⭐ candidate" in a prior version of this log; the playbook's v11 changelog (`docs/PLAYBOOK-HISTORY.md`) confirms this graduated into Rule 13. Corrected here.

```yaml
id: R6
severity: medium
recurrences: 2
status: graduated
graduated_rule: "Rule 13 (Layering & stacking gotchas)"
```
### R6 — Overlay badge sits behind the hero image
**Root cause:** Overlay/badge elements without an explicit stacking context render behind the image they're meant to sit on top of.
**Prevention:** Explicit `z-index` + a positioning context (`position: relative` or similar) on every overlay element.
**Graduation note:** same correction as R5 — graduated into Rule 13, this log previously still showed it as a candidate.

```yaml
id: R7
severity: low
recurrences: unknown
status: dev-level
graduated_rule: null
```
### R7 — CSS selector subtlety
**Root cause:** `.prose ul` does not match `ul.prose` — descendant selector vs. same-element selector confusion.
**Prevention:** Use the correct selector for the intended target; add a direct rule when both cases need covering.
**Note:** code-level correctness issue, not a design-system rule — stays logged here only, not a graduation candidate.

```yaml
id: R8
severity: low
recurrences: unknown
status: dev-level
graduated_rule: null
```
### R8 — Unicode escapes render literally in JSX text nodes
**Root cause:** Escape sequences (e.g. `—`) inside JSX text nodes render as the literal escape string, not the character, in some build setups.
**Prevention:** Use real characters (e.g. actual `—`) directly in JSX text, not escape sequences.
**Note:** code-level, not a design-system rule — stays logged here only.

```yaml
id: R10
severity: high
recurrences: 2
status: graduated
graduated_rule: "NON-NEGOTIABLE FLOOR block in every Design Prompt (05-PROMPT-SYNTHESIZER.md, Aug 15 2026)"
```
### R10 — File-carried enforcement rules ignored at generation
**Root cause:** Claude Design applies instructions written in the Design Prompt itself far more reliably than rules carried in the uploaded system files. Proven on two separate builds in June–August 2026: one shipped 0 keyframes with the full playbook loaded (led to the Motion Contract); a later stress-test build shipped 0 animated elements, no Motion Manifest, and no Compliance Report with all four system files attached — while the prompt-carried token direction and age gate shipped perfectly.
**Prevention:** the Synthesizer embeds a numeric "NON-NEGOTIABLE FLOOR" block in every Design Prompt — the gate lives where the attention is. The uploaded files still govern the details (how); the prompt carries the floor (whether).

```yaml
id: R9
severity: medium
recurrences: unknown
status: graduated
graduated_rule: "Rule 13"
```
### R9 — Orphan words
**Root cause:** Headline/sentence wrapping leaves 1–2 words alone on a second line at common breakpoints.
**Prevention:** Breakpoint-aware wrapping, `&nbsp;` between the last two words, or `text-wrap: balance` where supported.

---

## 3 · Per-build change log index

| Project | Log | Notes |
|---|---|---|
| Example: a chiropractic redesign | `Change Log.md` | 69 revision requests. Source of R1–R8 + many v9 rules. Standing instructions captured in §1. |

## 4 · Graduated to rules (lesson → rule)

Lessons that have already become numbered playbook rules:
- No "Home" in nav; logo links home → **Rule 10**
- Centered nav menu → **Rule 10**
- Single Services/Treatments page by default → **Rule 10**
- Google-reviews pill whenever reviews exist; verbatim real quotes → **Rule 13**
- No custom icons beside meta/eyebrow (use a `——` rule) → **Rule 13**
- Soft muted palettes → **Rule 13**
- Background-image heroes on internal pages → **Rule 13**
- CTA band uses image + theme overlay → **Rule 13**
- Body links themed (never default blue) → **Rule 13**
- Consistent CTA button labels site-wide → **Rule 13 + gate**
- Face-safe portrait crops; hero image-first on mobile → **Rules 13 / 10**
- Mobile section padding scaled down (~64px) → **Rule 13**
- Sticky header + footer + mobile bar always → **Rules 8 / 10**
- Mobile nav dialog (from a past build's layout, brand theme) → **Rule 4**
- R1, R2, R3, R4, R9 → **Rules 12 / 4 / 13 / 18** (see §2 entries above for each)
- R10 → **Design Prompt NON-NEGOTIABLE FLOOR block** (05-PROMPT-SYNTHESIZER.md — enforcement travels in the prompt, not only in uploaded files; added Aug 15 2026 after the E-commerce Stress-Test)
- R5, R6 → **Rule 13** (Layering & stacking gotchas)

## 5 · Open per-project placeholders (client inputs needed)

Track any placeholder content per build here — hours, FAQ answers, sample imagery, copy quirks to confirm — so nothing ships as a silent placeholder.

- *(none currently tracked — add one line per build, listing what the client still needs to supply)*

---

*Design Scarlet Macaw · Operating Log*
