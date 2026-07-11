#!/usr/bin/env bash
#
# install.sh - Install ui-ux-pro-max skill for Codex
#
# Usage:
#   ./install.sh                  # install into current project (./.codex/)
#   ./install.sh /path/to/project # install into a specific project
#   ./install.sh --global         # install into ~/.codex/ (all projects)
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Parse arguments ---
TARGET=""
GLOBAL=false

for arg in "$@"; do
  case "$arg" in
    --global|-g)
      GLOBAL=true
      ;;
    -h|--help)
      echo "Usage: ./install.sh [target-dir|--global]"
      echo ""
      echo "  no args        Install into ./.codex/ (project-level)"
      echo "  /path/to/proj  Install into /path/to/proj/.codex/"
      echo "  --global       Install into ~/.codex/ (user-level)"
      exit 0
      ;;
    *)
      TARGET="$arg"
      ;;
  esac
done

if [ "$GLOBAL" = true ]; then
  CODEX_DIR="$HOME/.codex"
else
  if [ -z "$TARGET" ]; then
    TARGET="$(pwd)"
  fi
  CODEX_DIR="$TARGET/.codex"
fi

SKILLS_DIR="$CODEX_DIR/skills"
MAIN_SKILL_DIR="$SKILLS_DIR/ui-ux-pro-max"

echo "Installing ui-ux-pro-max for Codex..."
echo "  Target: $CODEX_DIR"
echo ""

# --- Create directories ---
mkdir -p "$MAIN_SKILL_DIR"

# --- Copy pre-built SKILL.md ---
cp "$SCRIPT_DIR/dist/SKILL.md" "$MAIN_SKILL_DIR/SKILL.md"
echo "  ✓ SKILL.md"

# --- Copy data files ---
if [ -d "$SCRIPT_DIR/cli/assets/data" ]; then
  cp -R "$SCRIPT_DIR/cli/assets/data" "$MAIN_SKILL_DIR/data"
  echo "  ✓ data/ (CSV databases)"
fi

# --- Copy Python scripts ---
if [ -d "$SCRIPT_DIR/cli/assets/scripts" ]; then
  cp -R "$SCRIPT_DIR/cli/assets/scripts" "$MAIN_SKILL_DIR/scripts"
  chmod +x "$MAIN_SKILL_DIR/scripts/search.py" 2>/dev/null || true
  echo "  ✓ scripts/ (search.py, core.py, design_system.py)"
fi

# --- Copy sub-skills ---
if [ -d "$SCRIPT_DIR/cli/assets/skills" ]; then
  for sub_dir in "$SCRIPT_DIR/cli/assets/skills"/*/; do
    [ -d "$sub_dir" ] || continue
    sub_name="$(basename "$sub_dir")"
    cp -R "$sub_dir" "$SKILLS_DIR/$sub_name"
    echo "  ✓ skills/$sub_name/"
  done
fi

echo ""
echo "Done! Skill installed to $CODEX_DIR"
echo ""
echo "Verify:"
echo "  python3 $MAIN_SKILL_DIR/scripts/search.py --help"
echo "  cat $MAIN_SKILL_DIR/SKILL.md | head -5"
