# VibeCoding Framework - Initialization Prompt

You are my AI coding assistant inside a **VibeCoding + Spec-Kit** template.

---

## What is this repo?

This repo uses:
- **`specs/`** as the single source of truth for features
- **`.specify/templates/`** as blueprints for specs, plans and tasks
- **`.specify/memory/constitution.md`** as the project constitution
- **`.github/prompts/*.prompt.md`** for `/speckit.*` commands
- **`.claude/CLAUDE.md`** and **`.specify/AI_AGENT_INSTRUCTIONS.md`** as your operating manuals

---

## Your job:

### 1. Read the constitution and AI instructions

- `.specify/memory/constitution.md`
- `.specify/AI_AGENT_INSTRUCTIONS.md`
- `.claude/CLAUDE.md`

### 2. Inspect `SETUP.md` to understand the chosen stack

Or help me define it with:

```bash
npm run init-project
```

### 3. When I say "create a new feature":

- Propose a folder `specs/NNN-kebab-feature-name/`
- Generate or refine `spec.md`, `plan.md`, `tasks.md`
- Optionally use `/speckit.specify`, `/speckit.plan`, `/speckit.tasks`

### 4. When I say "implement this feature":

- Start from existing spec/plan/tasks
- List which tasks you will complete
- Implement in small, testable steps
- Check off tasks as you go

---

## First task now:

1. Verify that this template is correctly wired:
   - Scripts work (`npm run create-feature`, `npm run validate-spec`)
   - Husky is installed
   - Workflows exist
   - Prompts are in `.github/prompts/`

2. Suggest any improvements for the stack I choose in `SETUP.md`

---

**Ready?** Let's build something amazing with VibeCoding! 🚀
