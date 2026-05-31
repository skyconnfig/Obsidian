# claude.md

```bash
Analyze this codebase and create a CLAUDE.md file following these principles:

1. Keep it under 150 lines total - focus only on universally applicable information
2. Cover the essentials: WHAT (tech stack, project structure), WHY (purpose), and HOW (build/test commands)
3. Use Progressive Disclosure: instead of including all instructions, create a brief index pointing to other markdown files in .claude/docs/ for specialized topics
4. Include file:line references instead of code snippets
5. Assume I'll use linters for code style - don't include formatting guidelines

Structure it as: project overview, tech stack, key directories/their purposes, essential build/test commands, and a list of additional documentation files Claude should check when relevant.

Additionally, extract patterns you observe into separate files:
- .claude/docs/architectural_patterns.md - document the architectural patterns, design decisions, and conventions used (e.g., dependency injection, state management, API design patterns). Make sure these are patterns that appear in multiple files.

Reference these files in the CLAUDE.md's "Additional Documentation" section.
## 📝 Workflow Summary
1. **Check Context**: Read relevant docs from index above.
5. **Compare**: Analyze image vs reference. Fix errors.
6. **Repeat**: Until pixel-perfect

```

```bash
/compact remember we're building a unique musicalinterpretation of DNA andcompleted 1st version of the app with night mode
```

[附件: 5 Hacks to Build Professional Websites with Claude Code.pdf](./attachments/_Z7EF5OfwDLjs7b6/5 Hacks to Build Professional Websites with Claude Code.pdf)



```bash
# CLAUDE.md — Frontend Website Rules

## Always Do First

- **Invoke the `frontend-design` skill** before writing any frontend code, every session, no exceptions.

## Reference Images

- If a reference image is provided: match layout, spacing, typography, and color exactly. Swap in placeholder content (images via `https://placehold.co/`, generic copy). Do not improve or add to the design.
- If no reference image: design from scratch with high craft (see guardrails below).
- Screenshot your output, compare against reference, fix mismatches, re-screenshot. Do at least 2 comparison rounds. Stop only when no visible differences remain or user says so.

## Local Server

- **Always serve on localhost** — never screenshot a `file:///` URL.
- Start the dev server: `node serve.mjs` (serves the project root at `http://localhost:3000`)
- `serve.mjs` lives in the project root. Start it in the background before taking any screenshots.
- If the server is already running, do not start a second instance.

## Screenshot Workflow

- Puppeteer is installed at `C:/Users/nateh/AppData/Local/Temp/puppeteer-test/`. Chrome cache is at `C:/Users/nateh/.cache/puppeteer/`.
- **Always screenshot from localhost:** `node screenshot.mjs http://localhost:3000`
- Screenshots are saved automatically to `./temporary screenshots/screenshot-N.png` (auto-incremented, never overwritten).
- Optional label suffix: `node screenshot.mjs http://localhost:3000 label` → saves as `screenshot-N-label.png`
- `screenshot.mjs` lives in the project root. Use it as-is.
- After screenshotting, read the PNG from `temporary screenshots/` with the Read tool — Claude can see and analyze the image directly.
- When comparing, be specific: "heading is 32px but reference shows ~24px", "card gap is 16px but should be 24px"
- Check: spacing/padding, font size/weight/line-height, colors (exact hex), alignment, border-radius, shadows, image sizing

## Output Defaults

- Single `index.html` file, all styles inline, unless user says otherwise
- Tailwind CSS via CDN: `<script src="https://cdn.tailwindcss.com"></script>`
- Placeholder images: `https://placehold.co/WIDTHxHEIGHT`
- Mobile-first responsive

## Brand Assets

- Always check the `brand_assets/` folder before designing. It may contain logos, color guides, style guides, or images.
- If assets exist there, use them. Do not use placeholders where real assets are available.
- If a logo is present, use it. If a color palette is defined, use those exact values — do not invent brand colors.

## Anti-Generic Guardrails

- **Colors:** Never use default Tailwind palette (indigo-500, blue-600, etc.). Pick a custom brand color and derive from it.
- **Shadows:** Never use flat `shadow-md`. Use layered, color-tinted shadows with low opacity.
- **Typography:** Never use the same font for headings and body. Pair a display/serif with a clean sans. Apply tight tracking (`-0.03em`) on large headings, generous line-height (`1.7`) on body.
- **Gradients:** Layer multiple radial gradients. Add grain/texture via SVG noise filter for depth.
- **Animations:** Only animate `transform` and `opacity`. Never `transition-all`. Use spring-style easing.
- **Interactive states:** Every clickable element needs hover, focus-visible, and active states. No exceptions.
- **Images:** Add a gradient overlay (`bg-gradient-to-t from-black/60`) and a color treatment layer with `mix-blend-multiply`.
- **Spacing:** Use intentional, consistent spacing tokens — not random Tailwind steps.
- **Depth:** Surfaces should have a layering system (base → elevated → floating), not all sit at the same z-plane.

## Hard Rules

- Do not add sections, features, or content not in the reference
- Do not "improve" a reference design — match it
- Do not stop after one screenshot pass
- Do not use `transition-all`
- Do not use default Tailwind blue/indigo as primary color
```

```bash
# CLAUDE.md - Frontend Design Project Rules

## 1. Project Overview
This project focuses on **High-Craft Frontend Design**. The primary goal is to produce pixel-perfect, visually distinct single-page applications or components that strictly adhere to provided reference images or high-end design guardrails.

**Core Philosophy:**
- **Reference First:** If a reference image exists, match it exactly. Do not "improve" it.
- **No Generic AI Look:** Avoid default Tailwind colors, flat shadows, and standard typography pairings.
- **Iterative Verification:** Code -> Serve -> Screenshot -> Compare -> Fix. Minimum 2 rounds of verification.

## 2. Tech Stack & Structure
- **Output:** Single `index.html` (inline styles/scripts) unless specified otherwise.
- **Styling:** Tailwind CSS via CDN (`<script src="https://cdn.tailwindcss.com"></script>`).
- **Server:** Node.js script `serve.mjs` (Root).
- **Verification:** Puppeteer script `screenshot.mjs` (Root).
- **Assets:** `brand_assets/` (Logos, Colors) > `placehold.co` (Fallbacks).

## 3. Essential Commands

### Start Local Server
**ALWAYS** serve on localhost. Never screenshot `file:///`.
```bash
node serve.mjs
# Serves root at http://localhost:3000
```



> 更新: 2026-04-03 13:01:07  
> 原文: <https://www.yuque.com/lixinsi/yh04az/nhc83ri31uolbctr>