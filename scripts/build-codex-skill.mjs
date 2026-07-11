#!/usr/bin/env node
/**
 * Pre-builds the Codex SKILL.md from template files.
 * Replicates the CLI's renderSkillFile() logic without requiring npm/bun.
 *
 * Usage: node scripts/build-codex-skill.mjs
 * Output: dist/SKILL.md
 */
import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');
const ASSETS = join(ROOT, 'cli', 'assets');
const DIST = join(ROOT, 'dist');

async function main() {
  // Load platform config
  const config = JSON.parse(
    await readFile(join(ASSETS, 'templates', 'platforms', 'codex.json'), 'utf-8')
  );

  // Load templates
  let content = await readFile(join(ASSETS, 'templates', 'base', 'skill-content.md'), 'utf-8');
  const quickRef = config.sections.quickReference
    ? '\n' + await readFile(join(ASSETS, 'templates', 'base', 'quick-reference.md'), 'utf-8')
    : '';

  // Render frontmatter
  const fmLines = ['---'];
  for (const [key, value] of Object.entries(config.frontmatter)) {
    if (value.includes(':') || value.includes('"') || value.includes('\n')) {
      fmLines.push(`${key}: "${value.replace(/"/g, '\\"')}"`);
    } else {
      fmLines.push(`${key}: ${value}`);
    }
  }
  fmLines.push('---', '');
  const frontmatter = fmLines.join('\n');

  // Replace placeholders
  content = content
    .replace(/\{\{TITLE\}\}/g, config.title)
    .replace(/\{\{DESCRIPTION\}\}/g, config.description)
    .replace(/\{\{SCRIPT_PATH\}\}/g, config.scriptPath)
    .replace(/\{\{SKILL_OR_WORKFLOW\}\}/g, config.skillOrWorkflow)
    .replace(/\{\{QUICK_REFERENCE\}\}/g, quickRef);

  // Write output
  await mkdir(DIST, { recursive: true });
  await writeFile(join(DIST, 'SKILL.md'), frontmatter + content, 'utf-8');
  console.log('✓ Built dist/SKILL.md');
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
