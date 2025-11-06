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

---

## Style

- Prefer clear, simple code.
- Add tests or test changes for every meaningful behavior.
- Suggest improvements, but do not over-engineer.

---

## Constitution

If anything conflicts with `.specify/memory/constitution.md`, **the constitution wins**.

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
