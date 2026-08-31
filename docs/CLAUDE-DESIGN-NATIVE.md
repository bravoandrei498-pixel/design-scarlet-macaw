# Claude Design's native features — leveling up this workflow

Claude Design has shipped features since this system was first designed that make
parts of it enforceable *by the platform* instead of by uploaded files. Everything
below is optional — the 8-file upload workflow in the README works on its own —
but these are the highest-leverage upgrades.

---

## 1. Publish a native Design System (biggest win)

Claude Design supports **Design Systems**: you set one up once, toggle it
"Published," and every new project automatically inherits its colors, fonts,
components, and layout patterns — no re-uploading, no hoping the model re-reads
your files. This directly fixes the documented failure mode where rules carried in
uploaded files get applied less reliably than rules in the prompt (Operating Log
R10).

**How to set one up (~15 min, on claude.ai/design):**

1. Open Claude Design → Design Systems (see Anthropic's guide: "Set up your design
   system in Claude Design" on support.claude.com).
2. Feed the extractor **real examples, not just specs** — it works best with
   rendered artifacts. Give it, in this order:
   - `brand-style-guide-template.html` from this repo (a rendered specimen of the
     16-section style guide — open it in a browser first to confirm it renders)
   - `tokens.css` (the 4-layer token contract)
   - Screenshots of your best past approved builds, if you have any
3. Review what it extracted (palette, type, components, layout patterns), then use
   "Remix" (chat editing) to correct anything that drifted from CRAFT-RULES —
   especially the banned-defaults list.
4. Toggle **Published**. New projects now inherit it automatically.

**Per-client use:** for a client with a real brand, create a *second* design system
from their brand assets (logo, brand deck PDF, screenshots of their site) and apply
it to that client's projects. Multiple design systems per account are supported.

**What still travels as uploads:** the Design Prompt and the rule/behavior files
(playbook, conversion, industry, operating log). A design system carries *visual
identity*; the playbooks carry *rules and process* — you need both.

---

## 2. What a URL fetch can and cannot give you (tested Aug 2026)

The Design Prompt tells the builder to pull content from the client's live URL.
We tested this. **Result: text yes, markup and assets no.**

The fetch returned the real page content — the actual wordmark text, tagline, and
visible copy — but reported that it receives *extracted text, not raw HTML/DOM*, so
it could not confirm tag-level markup or alt attributes.

**What this means for the workflow:**

| Asset | Fetchable at build time? | Where it must come from |
|---|---|---|
| Copy, headlines, review quotes, NAP | ✅ Yes | Fetch, with pasted copy as fallback |
| Logo file | ❌ No | Uploaded file, or a text-lockup placeholder |
| Brand hex values | ❌ No | The Synthesizer measures and pastes them, tagged `(live site — measured)` |
| Real font names | ❌ No | Same — measured, or marked `derived` |
| Alt text / tag-level markup | ❌ No | Not recoverable; write fresh |

The system is already built for this: the Synthesizer's **Existing-site extraction
checklist** is where colors, fonts, and logo candidates get measured, and the
provenance rule (every hex and font cites a source or is marked `derived`) is what
stops the builder quietly guessing what it couldn't fetch. Treat that checklist as
mandatory whenever a live URL exists.

**Re-test after major Claude Design updates** — capabilities change, and a version
that exposes raw HTML would let you move color/font extraction back to build time.
Same prompt: *"Fetch https://www.wikipedia.org and tell me the exact H1 text and
main logo description you see. Do not guess — if you cannot fetch it, say so
plainly."*

---

## 3. `/design-sync` and handoff bundles (developer handoff)

Claude Design can hand builds to developers natively:

- **Send to Claude Code / local coding agent** — pushes the build into a coding
  session directly.
- **Handoff bundles** — export containing components, design tokens, copy, and
  interaction notes.
- **Exports** — zip, standalone HTML, PDF/PPTX, plus Vercel, Replit, Wix, and
  others.

When you use these, the `DEV-HANDOFF-TEMPLATE.md` document narrows to what the
bundle *doesn't* carry: analytics setup, form destinations, legal/compliance,
hosting/platform notes, redirects, and content migration. Don't hand-spec
components and tokens the bundle already exports.

---

## 4. Token-cost discipline (your plan limits are shared)

All Claude Design activity counts against your plan's shared usage limits, and
heavy sessions are expensive — community benchmarks put two heavy build sessions
at roughly half a Pro plan's week. Habits that cut usage dramatically:

- **Use the Tweaks panel / sliders and direct canvas edits** for fine adjustments —
  they don't consume model turns.
- **Edit your previous prompt** instead of stacking new correction messages.
- **Regenerate one section**, not the whole page, when only one section is wrong.
- **Build page-by-page** on larger sites (the Design Prompt already instructs
  this) — a failed giant generation costs the same as a successful one.
- Inline canvas comments are occasionally dropped — if a comment seems ignored,
  repeat it in chat rather than re-generating.

---
*Design Scarlet Macaw · docs*
