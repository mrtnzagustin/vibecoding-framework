# Claude Code – VibeCoding Mode

You are an AI coding assistant working in a **VibeCoding + Spec-Kit** project.

---

## Core Rules

- Always read the relevant folder under `specs/NNN-feature-name/` before changing code.
- Use:
  - `spec.md` → WHAT & WHY
  - `plan.md` → HOW
  - `tasks.md` → concrete steps

- Never write or change code without:
  1. Mapping your work to specific tasks in `tasks.md`
  2. Updating spec/plan if they become outdated

---

## Workflow

### 1. When user says "create a new feature":

- Propose a folder name `NNN-kebab-feature-name`.
- Create `spec.md`, `plan.md`, `tasks.md` from `.specify/templates/`.
- Optionally suggest using `/speckit.specify`, `/speckit.plan`, `/speckit.tasks`.

### 2. When user says "implement this feature":

- List which tasks you will complete in this change.
- Propose file paths and modules before writing code.
- Implement in small, reviewable steps.
- Check off tasks in `tasks.md` as you complete them.

### 3. When user says "update the spec":

- Edit the existing spec instead of rewriting from scratch.
- Update the `Changelog` section with a short note.
- Reflect any changes in `plan.md` and `tasks.md` if needed.

### 4. When user says "work on this in AI Dev Tasks mode":

**This activates detailed, granular implementation workflow.**

**Setup:**
1. Verify `specs/NNN-feature-name/` exists (spec.md, plan.md, tasks.md)
   - If missing, create with Spec-Kit workflow first
2. Create directory: `ai-dev/NNN-feature-name/`
3. Copy and fill `ai-dev/templates/feature-prd-template.md` → `ai-dev/NNN-feature-name/prd.md`
   - Base it on existing spec.md and plan.md
   - Add detailed requirements, edge cases, API contracts
4. Copy and fill `ai-dev/templates/feature-tasks-template.md` → `ai-dev/NNN-feature-name/tasks.md`
   - Break high-level tasks into very granular steps (15-30 min each)
   - Organize into phases: Setup → Foundation → Stories → Testing → Docs

**Implementation:**
1. **Before each task:**
   - Read PRD section for this task
   - Propose what will change (files, functions, tests)
   - Wait for confirmation if significant

2. **During task:**
   - Make ONLY changes needed for THIS task
   - Write/update tests alongside code
   - Keep scope tight (resist temptation to "fix other things")

3. **After task:**
   - Run tests: `npm test` (must pass)
   - Run linter: `npm run lint` (must pass)
   - Mark task complete: `[x]` in `ai-dev/NNN-feature-name/tasks.md`
   - If milestone reached, update `specs/NNN-feature-name/tasks.md`
   - Commit with clear message: `[NNN] Task TXXX: [description]`
   - Suggest next task

**Key Rules:**
- ✅ Work ONE task at a time (never batch tasks)
- ✅ Keep `specs/` and `ai-dev/` in sync
- ✅ Update PRD when discoveries are made
- ✅ Never bypass quality gates
- ❌ Never commit without tests passing
- ❌ Never skip validation steps

**See:** `ai-dev/README.md` for full AI Dev Tasks documentation

---

## Style

- Prefer clear, simple code.
- Add tests or test changes for every meaningful behavior.
- Suggest improvements, but do not over-engineer.

---

## Instruction Hierarchy

Follow this priority order when conflicts arise:

1. **Constitution** (`.specify/memory/constitution.md`) – highest authority
2. **Spec-Kit** (`specs/NNN-feature-name/`) – feature requirements
3. **This file** (`.claude/CLAUDE.md`) – Claude Code workflows
4. **General AI instructions** (`.specify/AI_AGENT_INSTRUCTIONS.md`)

**If anything conflicts with the constitution, the constitution wins.**

---

## Quick Reference

```bash
# Create new feature
npm run create-feature "Feature name"

# Validate specs
npm run validate-spec

# Run tests
npm test

# Lint code
npm run lint
```

---

**Remember:** Read `spec.md`, `plan.md`, and `tasks.md` before coding. Update them as you go.
