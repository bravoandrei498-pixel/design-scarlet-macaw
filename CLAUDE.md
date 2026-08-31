# CLAUDE.md — auto-context for this folder

This is the **Design Scarlet Macaw** system: a Design Brief → a Claude Project
(the Synthesizer) produces a Design Prompt + Dev Handoff → claude.ai/design builds
the site → it ships.

**If you are an AI assistant opening this folder for the first time:** read
`README.md`, then `00-HOW-THIS-WORKS.md`. That's the whole orientation. (If a file
named `HANDOFF-SUMMARY.md` exists locally, it's the original maintainer's private
working notes — read it too, but it is not part of the public system and won't
exist in most clones.)

**If a person is setting this system up fresh** (new computer, new Claude account):
point them to `SETUP.md` — it's the concrete step-by-step.

**If you're running the day-to-day workflow** (a brief has arrived, build the Design
Prompt + Dev Handoff): that's `PROJECT-INSTRUCTIONS.md` — it's written to be pasted
into a Claude Project's Instructions field and is the operational source of truth.

**If a per-project upload kit needs assembling** (the 8-file set for
claude.ai/design): on a Mac the user double-clicks `New Client Kit.command`; on any
OS, `python3 new-client-kit.py` does the same thing — or, if you have file-system
tools, assemble it yourself per Synthesizer Step 4. The kit lands in `clients/`
(gitignored), copied fresh from the masters — the masters are never edited
per project.

**One hard rule that applies everywhere in this folder:** never paste
`02-MASTER-PLAYBOOK.md` (or any other system file) as text into a prompt or chat.
Always attach it as a file. A past paste silently truncated it and dropped three
entire rules — see the Golden Rule at the top of `00-HOW-THIS-WORKS.md`.
