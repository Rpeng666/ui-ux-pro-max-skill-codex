# UI/UX Pro Max for Codex

A Codex design intelligence skill with a searchable database of 84 UI styles, 161 color palettes, 73 font pairings, 99 UX guidelines, and 25 chart types across 22 tech stacks.

No npm CLI dependency. The `SKILL.md` is pre-built and a single `install.sh` copies everything into `.codex/skills/`. No Node, no bun, no build step required at install time.

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

### Automatic Sync (GitHub Actions)

A weekly GitHub Actions workflow (`.github/workflows/sync-upstream.yml`) automatically:

1. Fetches the latest commits from `upstream/main`
2. Merges them into the fork
3. If conflicts occur in our customized files (`README.md`, `.gitignore`), keeps our versions
4. Rebuilds `dist/SKILL.md` from any updated templates
5. Pushes the result to `main`
6. If conflicts appear in files we did **not** customize, it creates a PR for manual review

To use this:
- Push the fork to GitHub
- Enable Actions in repo settings (Settings > Actions > Allow all actions)
- The workflow runs every Monday at 06:00 UTC, or trigger it manually from the Actions tab


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

## License

MIT License. See [LICENSE](LICENSE) for details.

This project is derived from [ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) by [NextLevelBuilder](https://github.com/nextlevelbuilder), originally licensed under MIT. All design data, Python scripts, and intelligence content originate from the upstream project. This repository modifies only the installation method (pre-built SKILL.md + shell installer instead of npm CLI) and adds automatic upstream sync via GitHub Actions.

The original copyright notice is preserved in the LICENSE file as required by the MIT license.
