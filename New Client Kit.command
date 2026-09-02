#!/bin/bash
# ============================================================================
# NEW CLIENT KIT — Design Scarlet Macaw (macOS double-click version)
# Double-click this file to create a per-project upload kit for claude.ai/design.
# Cross-platform equivalent: python3 new-client-kit.py (works on any OS).
#
# Why this exists: the masters in this folder must NEVER be edited per project.
# This script copies FRESH from the MASTER files, so a kit can never be stale —
# no "Last refreshed" date to check, ever. The masters are read-only to this
# script; it only ever creates new files inside clients/ (which is gitignored,
# so per-project kits never enter the repo).
#
# Manual fallback: copy the 7 system files listed in README.md step 3 into a
# new folder yourself. The Synthesizer can also assemble kits during Synthesis
# (Step 4) when it has file-system tools.
# ============================================================================

set -euo pipefail
cd "$(dirname "$0")"

# --- sanity: are we in the Design Scarlet Macaw folder? --------------------------
MASTERS=(
  "02-MASTER-PLAYBOOK.md"
  "03-COMPONENT-LIBRARY.md"
  "04-CONVERSION-PLAYBOOK.md"
  "SECTION-LAYOUT-LIBRARY.md"
  "OPERATING-LOG.md"
  "CRAFT-RULES.md"
)
for f in "${MASTERS[@]}"; do
  if [ ! -f "$f" ]; then
    echo "❌ Can't find master file: $f"
    echo "   This script must live in the 'Claude Design Scarlet Macaw' folder, next to the masters."
    read -r -p "Press Enter to close..." _
    exit 1
  fi
done

echo "==============================================="
echo "  Design Scarlet Macaw — New Client Kit"
echo "==============================================="
echo ""
printf "Client name (e.g. Acme Chiropractic): "
read -r RAW_NAME
if [ -z "${RAW_NAME// }" ]; then
  echo "❌ No name given — nothing created."
  read -r -p "Press Enter to close..." _
  exit 1
fi

# slugify: lowercase, spaces/underscores → hyphens, strip everything else
SLUG=$(printf '%s' "$RAW_NAME" \
  | tr '[:upper:]' '[:lower:]' \
  | sed -e 's/[ _]/-/g' -e 's/[^a-z0-9-]//g' -e 's/--*/-/g' -e 's/^-//' -e 's/-$//')
if [ -z "$SLUG" ]; then
  echo "❌ Client name produced an empty slug — nothing created."
  read -r -p "Press Enter to close..." _
  exit 1
fi

echo ""
echo "Industry playbook (only the ONE matching file goes in the kit):"
echo "  1) Healthcare      (chiro, mental health, medical, dental, wellness)"
echo "  2) Legal           (PI, family, criminal, business, estate, immigration)"
echo "  3) Real Estate     (sales, development, renovation, property mgmt)"
echo "  4) Industrial      (manufacturing, construction, engineering, trades)"
echo "  5) General         (anything else)"
printf "Pick 1-5: "
read -r IND
case "$IND" in
  1) INDFILE="industries/06-HEALTHCARE.md" ;;
  2) INDFILE="industries/07-LEGAL.md" ;;
  3) INDFILE="industries/08-REAL-ESTATE.md" ;;
  4) INDFILE="industries/09-INDUSTRIAL.md" ;;
  5) INDFILE="industries/10-GENERAL.md" ;;
  *) echo "❌ Invalid choice — nothing created."; read -r -p "Press Enter to close..." _; exit 1 ;;
esac

KIT="clients/${SLUG}-UPLOAD-KIT"
if [ -e "$KIT" ]; then
  echo "❌ $KIT already exists — refusing to overwrite an existing kit."
  echo "   Delete or rename it first if you really want to rebuild it."
  read -r -p "Press Enter to close..." _
  exit 1
fi

mkdir -p "$KIT"
for f in "${MASTERS[@]}"; do cp "$f" "$KIT/"; done
cp "$INDFILE" "$KIT/"
cp "claude-design-project/CLAUDE.md" "$KIT/CLAUDE.md"

# --- verify every copy is byte-identical to its master --------------------
FAIL=0
for f in "${MASTERS[@]}"; do
  cmp -s "$f" "$KIT/$(basename "$f")" || { echo "❌ Copy verification FAILED: $f"; FAIL=1; }
done
cmp -s "$INDFILE" "$KIT/$(basename "$INDFILE")" || { echo "❌ Copy verification FAILED: $INDFILE"; FAIL=1; }
cmp -s "claude-design-project/CLAUDE.md" "$KIT/CLAUDE.md" || { echo "❌ Copy verification FAILED: CLAUDE.md"; FAIL=1; }
if [ "$FAIL" -eq 1 ]; then
  echo "   Kit may be corrupt — delete '$KIT' and run this again."
  read -r -p "Press Enter to close..." _
  exit 1
fi

STAMP=$(date "+%b %d, %Y at %H:%M")
cat > "$KIT/KIT-INFO.txt" <<EOF
CLIENT KIT — ${RAW_NAME}
Created: ${STAMP}
Source: copied fresh from the Design Scarlet Macaw MASTER files (verified byte-identical
at creation), so this kit matches the masters as of the moment above. The
masters were not touched.

TO FINISH THIS KIT:
1. Drop in ${SLUG}-DESIGN-PROMPT.md (Synthesizer output 1).
2. Put CLAUDE.md at the ROOT of your Claude Design project. It applies to
   every chat in that project automatically — it is the floor that holds
   even if an upload is forgotten. (Only the project root is read.)
3. Upload the other 8 .md files to claude.ai/design as FILE ATTACHMENTS —
   never paste any of them:
   Design Prompt + 02-MASTER-PLAYBOOK + 03-COMPONENT-LIBRARY +
   04-CONVERSION-PLAYBOOK + $(basename "$INDFILE") +
   SECTION-LAYOUT-LIBRARY + OPERATING-LOG + CRAFT-RULES.
   (This KIT-INFO.txt is a note to you — it is NOT uploaded.)
4. Keep ${SLUG}-DEV-HANDOFF.md (Synthesizer output 2) next to this folder for
   the dev team — it is NOT uploaded to claude.ai/design.
5. AFTER the build: Claude Design emits an updated OPERATING-LOG.md — copy it
   back over the MASTER OPERATING-LOG.md in the Design Scarlet Macaw folder (Rule 22d:
   the log only carries forward if it actually gets copied back).
EOF

echo ""
echo "✅ Kit created: $KIT"
echo "   7 system files + CLAUDE.md copied fresh from the masters, + KIT-INFO.txt."
echo "   Next: drop in the Design Prompt, put CLAUDE.md at your Claude Design"
echo "   project root, then upload the 8 .md files."
open "$KIT" 2>/dev/null || true
read -r -p "Press Enter to close..." _
