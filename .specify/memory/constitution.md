# Project Constitution – VibeCoding + Spec Kit

**Version:** 1.0.0
**Last Updated:** 2025-01-06

---

## Purpose

This repository is a **template** that combines:
- **GitHub Spec Kit** (spec → plan → tasks → implement)
- **VibeCoding workflows** (AI-first development, small steps, strong guardrails)

This constitution defines non-negotiable rules for any project created from this template.

---

## Tech Stack

- This template itself is **stack-agnostic**.
- Each project must define its concrete stack (Node/TS, Python, Go, etc.) in `SETUP.md`.
- Specs and plans must reference the chosen stack explicitly.

**When choosing a stack:**
- Document framework versions
- List required tools and runtime versions
- Specify testing frameworks
- Define linting and formatting standards

---

## General Rules

### Specification-First Development

- **No code without a spec.**
- **No spec without a plan.**
- **No plan without tasks.**

### Branch & PR Requirements

Every branch / PR must:
- Reference at least one `specs/NNN-feature-name/` folder
- Mark relevant tasks in `tasks.md` as completed or updated
- Keep tests passing on main branches
- Follow the naming convention: `NNN-feature-name` or `feature/NNN-feature-name`

### Feature Folder Structure

```
specs/NNN-feature-name/
  ├── spec.md    # WHAT and WHY
  ├── plan.md    # HOW (technical approach)
  └── tasks.md   # Concrete actionable steps
```

**Required for every feature:**
- `spec.md` must exist before any code is written
- `plan.md` must be created before implementation begins
- `tasks.md` must list all work items with checkboxes

---

## Code Quality

### Pre-Commit Requirements

- Specs must exist for the current feature
- Lint and formatting must succeed
- Tests must pass locally
- No placeholder code (`TODO`, `FIXME`) without linked issues

### CI/CD Requirements

- All tests must pass in CI
- Spec validation must succeed
- No merge to `main` or `develop` without approval
- Any exception must be clearly documented in the PR

### Testing Standards

- **Unit tests** for business logic
- **Integration tests** for APIs and critical paths
- **E2E tests** for key user journeys (when applicable)
- Maintain coverage thresholds (define in SETUP.md)

---

## AI Usage

### Allowed AI Tools

AI tools (Claude Code, GitHub Copilot, Cursor, etc.) may:
- Create and modify specs, plans, tasks, and code
- Suggest improvements and refactorings
- Generate tests and documentation
- Automate repetitive tasks

### AI Requirements

AI must follow:
- **This constitution** (highest priority)
- **The Spec-Kit prompts** (`.github/prompts/*.prompt.md`)
- **VibeCoding instructions** (`.claude/CLAUDE.md` and `.specify/AI_AGENT_INSTRUCTIONS.md`)

AI must **not**:
- Introduce new external dependencies without:
  - Explaining why in the spec
  - Updating `plan.md` with integration details
  - Getting approval in the PR
- Bypass quality gates or tests
- Modify the constitution without explicit approval
- Create features without specs

### AI Workflow

1. **Before coding:** Read spec, plan, and tasks
2. **During coding:** Update tasks as work progresses
3. **After coding:** Update spec/plan if behavior changed
4. **Always:** Run tests and validation before committing

---

## Workflow Stages

### 1. Specification (`spec.md`)

**Focus:** WHAT are we building and WHY?

**Must include:**
- Problem statement and context
- User stories with acceptance criteria
- Functional and non-functional requirements
- API contracts (if applicable)
- Success metrics

**Use:** `.specify/templates/spec-template.md` or `/speckit.specify`

---

### 2. Planning (`plan.md`)

**Focus:** HOW will we build it?

**Must include:**
- Technical architecture
- Data models and schema changes
- Implementation phases
- Risk assessment
- Testing strategy

**Use:** `.specify/templates/plan-template.md` or `/speckit.plan`

---

### 3. Task Breakdown (`tasks.md`)

**Focus:** Concrete steps to execute

**Must include:**
- Setup tasks
- Foundation tasks
- Feature implementation tasks
- Testing tasks
- Documentation tasks

**Use:** `.specify/templates/tasks-template.md` or `/speckit.tasks`

---

### 4. Implementation

**Rules:**
- Follow tasks in order
- Check off tasks as completed
- Write tests alongside code
- Commit frequently with clear messages
- Update docs as you go

---

### 5. Validation

**Before merging:**
- [ ] All tasks marked complete
- [ ] Tests passing
- [ ] Lint/format passing
- [ ] Spec reflects actual implementation
- [ ] Documentation updated

---

## Repository Structure

```
.
├── .claude/                      # Claude Code instructions
│   └── CLAUDE.md
├── .github/
│   ├── prompts/                  # Spec-Kit agent prompts
│   │   ├── specify.prompt.md
│   │   ├── plan.prompt.md
│   │   └── tasks.prompt.md
│   └── workflows/                # CI/CD validation
├── .husky/                       # Git hooks
│   └── pre-commit
├── .specify/
│   ├── memory/
│   │   └── constitution.md       # This file
│   ├── scripts/bash/             # Helper scripts
│   ├── templates/                # Spec/plan/tasks templates
│   ├── AI_AGENT_INSTRUCTIONS.md
│   └── README.md
├── specs/                        # Feature specifications
│   └── NNN-feature-name/
│       ├── spec.md
│       ├── plan.md
│       └── tasks.md
├── src/                          # Source code (if applicable)
├── tests/                        # Tests (if applicable)
├── README.md                     # Project overview
├── SETUP.md                      # Setup instructions
└── package.json                  # Scripts and dependencies
```

---

## Exceptions & Amendments

### Exception Process

To request an exception:
1. Document the reason in the PR description
2. Tag relevant stakeholders
3. Update specs to reflect the deviation
4. Get explicit approval before merging

### Amendment Process

To amend this constitution:
1. Create a PR with proposed changes
2. Explain rationale in PR description
3. Get team consensus
4. Update version number
5. Announce changes to all contributors

---

## Non-Negotiables

These rules have **no exceptions**:

1. ✅ **Specs required before code**
2. ✅ **Tests must pass before merge**
3. ✅ **No secrets in repository**
4. ✅ **Code review required for main/develop**
5. ✅ **Documentation must stay current**

---

## Quick Reference

### Create New Feature
```bash
npm run create-feature "Feature name"
```

### Validate Specs
```bash
npm run validate-spec
```

### Run Quality Checks
```bash
npm run lint
npm test
```

---

## Version History

- **v1.0.0** (2025-01-06): Initial Spec-Kit + VibeCoding constitution

---

**Remember:** This constitution exists to maintain quality, not to create bureaucracy. When in doubt, ask your team.
