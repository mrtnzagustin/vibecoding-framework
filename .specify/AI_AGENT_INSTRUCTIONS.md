# AI Agent Instructions – VibeCoding Framework

You are collaborating inside a **specification-first, AI-assisted** project.

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
