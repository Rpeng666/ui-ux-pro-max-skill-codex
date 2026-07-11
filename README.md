# UI/UX Pro Max for Codex

A **Codex-optimized fork** of [ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) by NextLevelBuilder.

This fork removes the npm CLI dependency. Instead, the `SKILL.md` is pre-built and a single `install.sh` copies everything into `.codex/skills/`. No Node, no bun, no build step required at install time.

## What It Does

A searchable design intelligence database that Codex can use when building UI:

- **84 UI styles** with color palettes, effects, and implementation guidance
- **161 color palettes** with light/dark mode support
- **73 font pairings** with Google Fonts integration
- **99 UX guidelines** covering accessibility, touch, layout, navigation
- **25 chart types** with accessibility and responsive guidance
- **22 tech stacks** (React, Next.js, Vue, Svelte, Tailwind, shadcn, etc.)
- **Design system generator** with persist (Master + page overrides)
- **Sub-skills**: banner-design, brand, design, design-system, slides, ui-styling

## Quick Install

```bash
# Clone this fork
git clone <your-fork-url> ui-ux-pro-max-skill
cd ui-ux-pro-max-skill

# Install into current project
./install.sh

# Or install into a specific project
./install.sh /path/to/your/project

# Or install globally (~/.codex/)
./install.sh --global
```

This creates:

```
.codex/
  skills/
    ui-ux-pro-max/       # Main orchestrator skill
      SKILL.md            # Pre-built, ready to use
      data/               # CSV databases (styles, colors, fonts, etc.)
      scripts/            # Python search engine (stdlib only)
    banner-design/        # Sub-skill: banner creation
    brand/                # Sub-skill: brand identity
    design/               # Sub-skill: comprehensive design
    design-system/        # Sub-skill: design system builder
    slides/               # Sub-skill: HTML presentations
    ui-styling/           # Sub-skill: UI styling guidance
```

## Requirements

- **Python 3** (standard library only, no pip packages needed)
- That's it. No Node, no npm, no bun.

Check Python:

```bash
python3 --version
```

## How Codex Uses It

Once installed, Codex automatically discovers the skill via `.codex/skills/ui-ux-pro-max/SKILL.md`. When you ask Codex to build UI, it can:

1. **Generate a design system**: `python3 skills/ui-ux-pro-max/scripts/search.py "saas landing page" --design-system`
2. **Search styles**: `python3 skills/ui-ux-pro-max/scripts/search.py "fintech dashboard" --domain style`
3. **Search colors**: `python3 skills/ui-ux-pro-max/scripts/search.py "warm minimal" --domain color`
4. **Search UX rules**: `python3 skills/ui-ux-pro-max/scripts/search.py "form validation" --domain ux`
5. **Search stack best practices**: `python3 skills/ui-ux-pro-max/scripts/search.py "react performance" --stack react`

## Rebuilding SKILL.md

The `dist/SKILL.md` is pre-built and committed. You only need to rebuild if you modify the templates:

```bash
node scripts/build-codex-skill.mjs
```

This reads from `cli/assets/templates/` and produces `dist/SKILL.md`.

## Syncing with Upstream

This fork tracks the upstream repository:

```bash
git remote -v
# upstream  https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git

# Pull upstream changes
git fetch upstream
git merge upstream/main

# Rebuild SKILL.md if templates changed
node scripts/build-codex-skill.mjs
```

## Project Structure

```
.
├── install.sh                  # One-command installer
├── dist/
│   └── SKILL.md                # Pre-built Codex skill file
├── scripts/
│   └── build-codex-skill.mjs   # Rebuilds dist/SKILL.md from templates
├── cli/assets/                  # Source data, scripts, and templates
│   ├── data/                    # CSV databases
│   ├── scripts/                 # Python search engine
│   ├── skills/                  # Sub-skills (banner, brand, etc.)
│   └── templates/               # SKILL.md templates + platform configs
├── src/ui-ux-pro-max/           # Original source (data + scripts)
└── README.md                    # This file
```

## Credits

- **Original author**: [NextLevelBuilder](https://github.com/nextlevelbuilder)
- **Original repo**: [ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- **License**: MIT

This fork only modifies the installation method (pre-built SKILL.md + shell installer instead of npm CLI). All design data, scripts, and intelligence come from the upstream project.
