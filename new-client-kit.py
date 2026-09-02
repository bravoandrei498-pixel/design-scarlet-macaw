#!/usr/bin/env python3
"""
NEW CLIENT KIT — Design Scarlet Macaw (cross-platform)

Creates a per-project upload kit for claude.ai/design. Works on Windows, macOS,
and Linux with plain Python 3 — no packages needed.

Why this exists: the master files in this folder must NEVER be edited per
project. This script copies FRESH from the masters, verifies every copy is
byte-identical, and writes the kit into clients/ (gitignored), so a kit can
never be stale and the masters are never touched.

Usage:  python3 new-client-kit.py
"""

import filecmp
import re
import shutil
import sys
from datetime import datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parent

MASTERS = [
    "02-MASTER-PLAYBOOK.md",
    "03-COMPONENT-LIBRARY.md",
    "04-CONVERSION-PLAYBOOK.md",
    "SECTION-LAYOUT-LIBRARY.md",
    "OPERATING-LOG.md",
    "CRAFT-RULES.md",
]

INDUSTRIES = {
    "1": ("Healthcare      (chiro, mental health, medical, dental, wellness)", "industries/06-HEALTHCARE.md"),
    "2": ("Legal           (PI, family, criminal, business, estate, immigration)", "industries/07-LEGAL.md"),
    "3": ("Real Estate     (sales, development, renovation, property mgmt)", "industries/08-REAL-ESTATE.md"),
    "4": ("Industrial      (manufacturing, construction, engineering, trades)", "industries/09-INDUSTRIAL.md"),
    "5": ("General         (anything else)", "industries/10-GENERAL.md"),
}


def die(msg: str) -> None:
    print(f"❌ {msg}")
    sys.exit(1)


def main() -> None:
    for f in MASTERS:
        if not (ROOT / f).is_file():
            die(f"Can't find master file: {f}\n   Run this from inside the Design Scarlet Macaw folder, next to the masters.")

    print("=" * 47)
    print("  Design Scarlet Macaw — New Client Kit")
    print("=" * 47)
    raw_name = input("\nProject/client name (e.g. Acme Chiropractic): ").strip()
    if not raw_name:
        die("No name given — nothing created.")

    slug = re.sub(r"-{2,}", "-", re.sub(r"[^a-z0-9-]", "", re.sub(r"[ _]", "-", raw_name.lower()))).strip("-")
    if not slug:
        die("Name produced an empty slug — nothing created.")

    print("\nIndustry playbook (only the ONE matching file goes in the kit):")
    for key, (label, _) in INDUSTRIES.items():
        print(f"  {key}) {label}")
    choice = input("Pick 1-5: ").strip()
    if choice not in INDUSTRIES:
        die("Invalid choice — nothing created.")
    ind_file = INDUSTRIES[choice][1]

    kit = ROOT / "clients" / f"{slug}-UPLOAD-KIT"
    if kit.exists():
        die(f"{kit} already exists — refusing to overwrite an existing kit.\n   Delete or rename it first if you really want to rebuild it.")

    kit.mkdir(parents=True)
    to_copy = MASTERS + [ind_file, "claude-design-project/CLAUDE.md"]
    for f in to_copy:
        shutil.copy2(ROOT / f, kit / Path(f).name)

    for f in to_copy:
        if not filecmp.cmp(ROOT / f, kit / Path(f).name, shallow=False):
            die(f"Copy verification FAILED: {f}\n   Kit may be corrupt — delete '{kit}' and run this again.")

    stamp = datetime.now().strftime("%b %d, %Y at %H:%M")
    ind_name = Path(ind_file).name
    (kit / "KIT-INFO.txt").write_text(
        f"""PROJECT KIT — {raw_name}
Created: {stamp}
Source: copied fresh from the Design Scarlet Macaw MASTER files (verified
byte-identical at creation). The masters were not touched.

TO FINISH THIS KIT:
1. Drop in {slug}-DESIGN-PROMPT.md (Synthesizer output 1).
2. Put CLAUDE.md at the ROOT of your Claude Design project. It applies to
   every chat in that project automatically — the floor that holds even if
   an upload is forgotten. (Only the project root is read.)
3. Upload the other 8 .md files to claude.ai/design as FILE ATTACHMENTS —
   never paste any of them:
   Design Prompt + 02-MASTER-PLAYBOOK + 03-COMPONENT-LIBRARY +
   04-CONVERSION-PLAYBOOK + {ind_name} +
   SECTION-LAYOUT-LIBRARY + OPERATING-LOG + CRAFT-RULES.
   (This KIT-INFO.txt is a note to you — it is NOT uploaded.)
4. Keep {slug}-DEV-HANDOFF.md (Synthesizer output 2) next to this folder for
   the dev team — it is NOT uploaded to claude.ai/design.
5. AFTER the build: Claude Design emits an updated OPERATING-LOG.md — copy it
   back over the MASTER OPERATING-LOG.md in the Design Scarlet Macaw folder
   (Rule 22d: the log only carries forward if it actually gets copied back).
""",
        encoding="utf-8",
    )

    print(f"\n✅ Kit created: {kit}")
    print("   7 system files + CLAUDE.md copied fresh from the masters, + KIT-INFO.txt.")
    print("   Next: drop in the Design Prompt, put CLAUDE.md at your Claude Design\n   project root, then upload the 8 .md files.")


if __name__ == "__main__":
    main()
