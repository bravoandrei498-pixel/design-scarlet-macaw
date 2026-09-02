# `CLAUDE.md` — the persistent build layer

The file in this folder is **not** for this repo. Copy it into the **root of your
Claude Design project**, named exactly `CLAUDE.md`.

Claude Design reads a `CLAUDE.md` at a project's root and applies it to **every chat in
that project**, automatically, without anyone attaching it. Only the root is read —
subfolders are ignored.

## Why this matters

The rest of this system travels as uploaded files, and uploaded rules are the weakest
enforcement channel there is — a build that skips an attachment silently loses the rules
inside it. `CLAUDE.md` sits above that: it's project configuration, not an attachment,
so it holds even when someone forgets a file or starts a fresh chat.

It doesn't replace the uploads. It's the floor that survives without them.

## Installing it

- **Per build project:** the kit scripts (`New Client Kit.command`, `new-client-kit.py`)
  copy this file into every kit they create. Upload it to your Claude Design project root
  along with the rest of the kit.
- **By hand:** create a file named `CLAUDE.md` at your Claude Design project root and
  paste this file's contents in.

## Keeping it current

It is generated from the same rules as the playbooks — C1's bans, C6's accessibility
floors, C10's divergence gate, C11's conventions, the Rule 8b floor. If you change those
in the masters, update this file too, or your build projects will drift from your system.

Don't confuse it with the `CLAUDE.md` at this repository's root — that one orients AI
assistants working *on* the system. This one governs Claude Design building *with* it.
