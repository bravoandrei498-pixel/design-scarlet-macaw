# Setup — one time, ~20 minutes
### How to get Design Scarlet Macaw running anywhere that's never seen it before

You need a claude.ai account with access to **Projects** and **Claude Design**
(paid plan). There are two ways to deploy this. Use Option A if you'll use the
system more than once — it makes every new Claude chat understand the whole system
instantly, with zero re-explaining. Use Option B only for a quick one-off look.

---

## Option A — claude.ai Project (recommended)

1. **Get the folder.** Clone this repo or download it (green "Code" button →
   Download ZIP) and put the folder anywhere on your computer.

2. **Create the Project.** On claude.ai, create a new Project. Suggested name:
   "Design Scarlet Macaw".

3. **Paste the instructions.** Open the Project's Instructions field and paste in
   the full contents of `PROJECT-INSTRUCTIONS.md` — everything below its own title
   line. This is what makes every new chat inside the Project already know the whole
   system, with no setup per conversation.

4. **Upload Project Knowledge — this exact list, 18 files, as file attachments,
   never pasted:**

   ```
   00-HOW-THIS-WORKS.md
   01-DESIGN-BRIEF-TEMPLATE.md
   02-MASTER-PLAYBOOK.md
   03-COMPONENT-LIBRARY.md
   04-CONVERSION-PLAYBOOK.md
   05-PROMPT-SYNTHESIZER.md
   SECTION-LAYOUT-LIBRARY.md
   OPERATING-LOG.md
   CRAFT-RULES.md
   industries/06-HEALTHCARE.md
   industries/07-LEGAL.md
   industries/08-REAL-ESTATE.md
   industries/09-INDUSTRIAL.md
   industries/10-GENERAL.md
   DEV-HANDOFF-TEMPLATE.md
   POST-LAUNCH-PLAYBOOK.md
   DESIGN-RATIONALE.md
   CLIENT-PRESENTATION.md
   ```

   Uploading as files (not pasting) matters — see the Golden Rule in
   `00-HOW-THIS-WORKS.md`: a paste of the Master Playbook once silently truncated
   it and dropped three entire rules.

   **Do NOT upload:** `README.md`, `SETUP.md`, `CLAUDE.md`, `LICENSE`, `docs/`,
   `tokens.css`, `brand-style-guide-template.html`, the kit scripts. These are
   background, meta, or builder-side files — not knowledge the assistant needs
   loaded for every brief.

5. **Test it.** Paste a filled Design Brief into a new chat inside the Project. It
   should identify the industry, run the Synthesizer, and produce the two output
   files without you explaining anything first. If it asks clarifying questions
   instead of building, something didn't upload correctly — recheck step 4.

That's it. Every new chat inside that Project now has the full system loaded
automatically.

---

## Option B — Claude Code / a plain chat with folder access (one-off only)

1. Give the Claude session access to this whole folder.
2. Tell it: "Read `README.md` first, then `00-HOW-THIS-WORKS.md`, then run the
   Synthesizer on this brief."
3. It will NOT do this on its own just because the folder is attached — someone has
   to say so, every time, in every new chat. That's the tradeoff vs. Option A.

---

## The per-project kit script — travels with the folder

Builds `clients/[name]-UPLOAD-KIT/` with the 7 system files copied fresh from the
masters (byte-verified, never stale, masters untouched):

- **Mac:** double-click `New Client Kit.command`. If macOS blocks it after a ZIP
  download ("unidentified developer"), right-click it → Open → Open, once. If it
  says you lack access privileges, run `chmod +x "New Client Kit.command"` once in
  Terminal from this folder.
- **Windows / Linux / any OS:** run `python3 new-client-kit.py` from this folder
  (needs only Python 3, no extra packages).
- **No scripts at all:** copy the 7 files listed in `README.md` step 3 into a new
  folder yourself, add your Design Prompt, upload all 8.

---

## Level up — Claude Design's native features (optional)

Once the basics work, see `docs/CLAUDE-DESIGN-NATIVE.md` to publish this system as
a native Claude Design **Design System** (enforced automatically on every project),
use `/design-sync` for developer handoff, and cut token usage with the Tweaks panel.

---
*Design Scarlet Macaw*
