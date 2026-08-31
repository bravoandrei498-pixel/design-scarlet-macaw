# Update Log — Design Scarlet Macaw

Maintainer changelog, most recent first. If you fork this system and change rule
or template content, add an entry here so downstream users can see what moved.
(Full pre-release provenance lives in `docs/HISTORY.md`.)

---

## 2026-08-31 — v1.0 public release pass

**Changed by:** the maintainer (with Claude Code)
**What changed:** Prepared the system for public GitHub release.
- Rewrote the front door: new public `README.md` (3-step quick start + pipeline
  diagram), `SETUP.md` (one-time deployment), `CLAUDE.md` (AI auto-context);
  system history moved to `docs/HISTORY.md`.
- Removed all internal/agency references and client-identifying content
  throughout; the system is now fully generic and self-contained.
- Fixed cross-file contradictions found in a 4-agent review: industry playbooks
  no longer recommend fonts the craft layer bans; the footer emoji-icon policy is
  now consistent everywhere (footer contact rows only, at Claude Design's
  discretion by brand register); display-weight guidance scoped to body/UI text;
  `tokens.css` sample palette corrected to pass its own contrast floors; rule
  cross-references corrected.
- Slimmed the Master Playbook upload: version changelogs moved to
  `docs/PLAYBOOK-HISTORY.md`; inline provenance annotations removed.
- Added `new-client-kit.py` (cross-platform kit script) alongside the Mac
  `.command`; retired the manual `_UPLOAD-KIT-TEMPLATE/` folder (the scripts copy
  fresh from the masters).
- Added `docs/CLAUDE-DESIGN-NATIVE.md`: publishing this system as a native Claude
  Design Design System, `/design-sync` handoff, the URL-fetch capability test,
  and token-cost discipline.
- Added `LICENSE` (MIT).

---

## 2026-08-31 — v12 upgrade pass (pre-release)

**Changed by:** the maintainer (with Claude Code)
**What changed:** Research-driven upgrade across the whole system, and the fork
that made this a standalone project. Highlights: new `CRAFT-RULES.md` master file
(upload set became Design Prompt + 7 system files); Master Playbook v12
(anti-slop P0/P1 scan in Rule 8b, new Rule 8c critique pass, Rule 7 Style Guide
expanded to 16 sections); `tokens.css` rebuilt (4-layer contract, fluid clamp()
scales, accessibility tokens); Brief personality sliders; Synthesizer dimension
resolution + provenance rules; Section Layout Library rhythm rules; Conversion
Playbook evidence layer; Component Library craft addendum; Dev Handoff
tokens→platform mapping; Post-Launch hypothesis seeds.

---
