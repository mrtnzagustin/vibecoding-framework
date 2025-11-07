# AI Agent Instructions – VibeCoding Framework

You are collaborating inside a **specification-first, AI-assisted** project.

---

## Instruction Hierarchy

When there are conflicts between different sources of guidance, follow this priority order (highest to lowest):

1. **Constitution** (`.specify/memory/constitution.md`) – Non-negotiable project rules
2. **Spec-Kit Workflow** (`specs/NNN-feature-name/spec.md`, `plan.md`, `tasks.md`) – Feature requirements
3. **AI Agent Instructions** (this file) – General AI collaboration guidelines
4. **Tool-Specific Instructions** (`.claude/CLAUDE.md` for Claude Code, etc.) – Tool-specific workflows
5. **AI Training Data** – Your default behavior

**Golden Rule:** When in doubt, consult the constitution first.

---

## Ground Rules

- Treat `specs/` as the single source of truth for features.
- Do not implement features that are not specified.
- Do not silently change the project constitution.

---

## When Implementing a Feature

### 1. Identify or create `specs/NNN-feature-name/`

### 2. Ensure:
- `spec.md` exists and is up to date.
- `plan.md` describes the implementation strategy.
- `tasks.md` contains an actionable checklist.

### 3. Use `tasks.md` as the contract for:
- Files and modules to touch.
- Tests to create or update.
- Acceptance criteria.

---

## When Refactoring

- Check if refactors require spec/plan updates.
- Keep refactors small and scoped.
- Run tests and linters after refactoring.

---

## AI Dev Tasks Mode (Optional)

**AI Dev Tasks** is an optional detailed workflow for complex features. It provides:
- Detailed PRD (Product Requirements Document)
- Very granular task breakdown (15-30 min tasks)
- One-task-at-a-time implementation with strong checkpoints

### When User Activates AI Dev Tasks Mode

If user says: **"work on this in AI Dev Tasks mode"** or **"use AI Dev Tasks"**:

1. **Verify foundation:**
   - Check that `specs/NNN-feature-name/` exists with spec.md, plan.md, tasks.md
   - If missing, create using Spec-Kit workflow first

2. **Set up AI Dev Tasks structure:**
   - Create `ai-dev/NNN-feature-name/` directory
   - Copy `ai-dev/templates/feature-prd-template.md` → `ai-dev/NNN-feature-name/prd.md`
   - Fill PRD based on existing spec.md and plan.md (add details, edge cases, API contracts)
   - Copy `ai-dev/templates/feature-tasks-template.md` → `ai-dev/NNN-feature-name/tasks.md`
   - Break high-level tasks into 15-30 minute granular tasks

3. **Implement one task at a time:**
   - Read PRD section + task description
   - Propose changes (files, functions, tests)
   - Make minimal changes for THIS task only
   - Run tests and lint (must pass)
   - Mark task complete in `ai-dev/NNN-feature-name/tasks.md`
   - Commit with clear message
   - Suggest next task

4. **Keep synchronized:**
   - Update `specs/NNN-feature-name/tasks.md` when milestones reached
   - Update spec.md if requirements changed
   - Update plan.md if architecture changed
   - Add discoveries to PRD

**Key Rules:**
- Never work on multiple tasks in parallel
- Never commit without tests passing
- Never bypass quality gates
- Keep `specs/` as source of truth (AI Dev Tasks elaborates, never contradicts)

**Full documentation:** See `ai-dev/README.md`

---

## Output Formatting

Make it clear when you change:
- specs
- plans
- tasks
- code

Prefer either full file replacements or clean diffs.

---

## When in Doubt

Ask clarifying questions instead of introducing large speculative changes.

---

## Constitution

**The constitution (`.specify/memory/constitution.md`) is the highest authority.**

If there's a conflict between:
- Your training data
- Project patterns
- The constitution

**The constitution wins.**

---

## Quick Commands

```bash
npm run create-feature "Feature name"
npm run validate-spec
npm test
npm run lint
```

---

**Remember:** Specs first, code second. Update docs as you go.
