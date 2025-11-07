# VibeCoding Spec-Kit

This directory contains the specification framework for VibeCoding projects.

## What is Spec-Kit?

Spec-Kit is a structured workflow system that requires features to be thoroughly specified, planned, and broken down into tasks **before any implementation begins**.

### Core Principles

1. **Specification-First**: Every feature starts with a complete specification
2. **Sequential Development**: One feature at a time, properly documented
3. **High Test Coverage**: Mandatory 80%+ coverage (configurable)
4. **Continuous Documentation**: Specs, plans, and tasks stay up-to-date

### Benefits

- ✅ **Prevents Scope Creep**: Clear boundaries defined upfront
- ✅ **Reduces Bugs**: Thorough planning catches issues early
- ✅ **Improves Collaboration**: Everyone understands what's being built
- ✅ **Creates Documentation**: Specs serve as living documentation
- ✅ **Enables AI Assistance**: AI agents follow structured workflows

---

## Directory Structure

```
.specify/
├── memory/
│   └── constitution.md          # Project rules and standards (THE source of truth)
├── scripts/
│   └── bash/
│       ├── common.sh            # Shared utilities
│       ├── create-feature.sh    # Feature creation script
│       ├── init-project.sh      # Project initialization script
│       └── validate-spec.sh     # Spec validation script
├── templates/
│   ├── spec-template.md         # Feature specification template
│   ├── plan-template.md         # Implementation plan template
│   └── tasks-template.md        # Task breakdown template
├── AI_AGENT_INSTRUCTIONS.md     # Instructions for AI assistants
└── README.md                    # This file
```

---

## Workflow Stages

### Stage 1: Specification (`spec.md`)

**Purpose:** Define WHAT to build and WHY

**Contents:**
- Problem statement
- User stories with acceptance criteria
- Functional requirements
- Non-functional requirements
- API contracts (if applicable)
- Data models (if applicable)
- Success metrics

**Template:** `templates/spec-template.md`

**Command:**
```bash
npm run create-feature "Feature Name"
# Creates specs/NNN-feature-name/spec.md from template
```

---

### Stage 2: Planning (`plan.md`)

**Purpose:** Define HOW to build it

**Contents:**
- Technical architecture
- Database design
- Implementation phases
- Testing strategy
- Risk assessment
- Timeline estimates

**Template:** `templates/plan-template.md`

---

### Stage 3: Task Breakdown (`tasks.md`)

**Purpose:** Break work into granular, actionable tasks

**Contents:**
- Setup tasks
- Foundation tasks
- User story tasks (one section per story)
- Testing tasks
- Documentation tasks
- Dependencies marked
- Parallel opportunities identified

**Template:** `templates/tasks-template.md`

---

### Stage 4: Implementation

**Follow the task breakdown**:
1. Implement tasks in order
2. Write tests alongside code
3. Update documentation as you go
4. Commit frequently

**Pre-commit hooks validate**:
- Spec files exist and are non-empty
- Tests pass
- Coverage meets thresholds

---

### Stage 5: Validation

**Quality gates check**:
- All tests pass
- Coverage ≥ thresholds
- Linting passes
- Build succeeds
- Specs match implementation

---

## Required Files

Every feature **must** have these three files:

### 1. `specs/NNN-feature-name/spec.md`

Feature specification with:
- User stories
- Requirements
- Acceptance criteria
- Success metrics

### 2. `specs/NNN-feature-name/plan.md`

Implementation plan with:
- Architecture
- Database design
- Phases
- Risks

### 3. `specs/NNN-feature-name/tasks.md`

Task breakdown with:
- Ordered tasks
- Dependencies
- Testing requirements

---

## Constitution

**File:** `memory/constitution.md`

The constitution is the **single source of truth** for:
- Technology stack requirements
- Testing standards
- Documentation requirements
- Code quality rules
- Workflow processes

**All team members and AI agents must follow the constitution.**

### Key Sections

1. **Technology Stack**: Required frameworks, libraries, versions
2. **Testing**: Coverage thresholds, testing strategies
3. **Documentation**: Required docs, update frequency
4. **Quality Gates**: Pre-commit and CI/CD checks
5. **Workflow**: Sequential development process
6. **Code Quality**: Language-specific standards
7. **Enforcement**: How rules are enforced

### Customizing

Edit `memory/constitution.md` to:
- Set your tech stack
- Define coverage thresholds
- Add project-specific rules
- Configure quality gates

---

## Helper Scripts

### Create New Feature

```bash
npm run create-feature "Feature Name"

# Options:
#   --number NNN    Use specific number (default: auto-increment)
#   --no-branch     Don't create git branch
#   --no-templates  Don't copy templates
```

**What it does:**
1. Generates next feature number (e.g., 001, 002, 003)
2. Creates `specs/NNN-feature-name/` directory
3. Copies spec templates
4. Creates and checks out git branch `NNN-feature-name`
5. Stages spec files for commit

### Validate Specs

```bash
npm run validate-spec

# Options:
#   --feature NNN   Validate specific feature
```

**What it checks:**
1. Feature directory exists
2. spec.md exists and non-empty
3. plan.md exists and non-empty
4. tasks.md exists and non-empty
5. Constitution exists

---

## AI Agent Integration

### Supported AI Agents

- **Claude Code**: `.claude/CLAUDE.md` or `CLAUDE.md`
- **GitHub Copilot**: Reads `.specify/AI_AGENT_INSTRUCTIONS.md`
- **Cursor**: Includes `.specify/` in workspace

### Workflow for AI Agents

**On session start:**
1. Read `memory/constitution.md`
2. Read `AI_AGENT_INSTRUCTIONS.md`
3. Check current branch for feature number
4. Verify spec files exist
5. If missing, STOP and create them first

**During implementation:**
1. Follow tasks.md order
2. Write tests alongside code
3. Update docs continuously
4. Never bypass quality gates

---

## Pre-Commit Hooks

**File:** `../.husky/pre-commit`

**Checks on every commit:**
1. **Spec Validation**: Validates that all feature folders have spec.md, plan.md, and tasks.md
2. **Linting**: Runs your configured linter (must pass)
3. **Tests**: Runs your configured test suite (must pass)

**Customize:** Edit `.husky/pre-commit` to add coverage checks, branch-specific validation, or other quality gates.

**Cannot be bypassed** without explicit `--no-verify` (discouraged).

---

## GitHub Actions

### Spec & Quality Validation Workflow

**File:** `../.github/workflows/spec-kit-validation.yml`

**Runs on:** Pull requests and pushes to main/develop

**Validates:**
- Spec structure is correct (all feature folders have spec.md, plan.md, tasks.md)
- Linting passes (using your configured linter)
- Tests pass (using your configured test command)

**Customize:** Edit the workflow file to add additional checks like coverage thresholds, forbidden dependencies, or deployment steps

---

## Branch Naming Convention

**Pattern:** `NNN-feature-name`

Where:
- `NNN` = 3-digit feature number (001, 002, 003, ...)
- `feature-name` = kebab-case description

**Examples:**
- `001-user-authentication`
- `042-dashboard-analytics`
- `147-export-to-csv`

**Why?**
- Enables automatic spec validation
- Links branches to spec directories
- Enforces sequential development

---

## Best Practices

### ✅ DO

- **Write specs before code**: Every time, no exceptions
- **Keep user stories small**: Independently testable
- **Update docs as you go**: Don't defer to later
- **Follow the constitution**: It's the source of truth
- **Use AI assistants**: They're optimized for this workflow
- **Run validation early**: `npm run validate-spec` before starting

### ❌ DON'T

- **Skip spec creation**: Creates technical debt
- **Commit without tests**: Violates quality standards
- **Bypass pre-commit hooks**: Use `--no-verify` only in emergencies
- **Mix multiple features**: One feature per branch
- **Deviate from tech stack**: Get approval first
- **Leave TODOs in code**: Create tickets or finish now

---

## Troubleshooting

### Pre-commit hook failing

```bash
# Check what's failing
git commit -v

# Validate specs manually
npm run validate-spec

# Run tests manually
npm test

# Fix issues and try again
```

### Spec validation errors

```bash
# Ensure you're on a feature branch
git checkout -b 001-my-feature

# Create spec files
npm run create-feature "My Feature"

# Validate
npm run validate-spec
```

### Constitution not found

```bash
# Check if it exists
cat .specify/memory/constitution.md

# If missing, copy from template
# (template should be in this repo)
```

---

## Customization

### For Your Stack

1. **Update constitution** with your tech stack
2. **Configure pre-commit hook** with your test commands
3. **Adjust GitHub Actions** for your build process
4. **Customize templates** with your patterns

### For Your Team

1. **Define your standards** in constitution
2. **Set coverage thresholds** to your comfort level
3. **Add custom scripts** for your workflow
4. **Document exceptions** in constitution

---

## Examples

### Example Feature: User Authentication

```
specs/001-user-authentication/
  ├── spec.md          # Problem, user stories, requirements, API contracts
  ├── plan.md          # Architecture, database schema, phases
  └── tasks.md         # Setup → Foundation → Story 1 → Story 2 → Testing → Docs
```

**Spec highlights:**
- User story: "As a user, I want to log in with email/password"
- Acceptance criteria: Given valid credentials, when I submit, then I'm logged in
- API: POST /api/auth/login with email + password

**Plan highlights:**
- JWT authentication with bcrypt password hashing
- Users table with email, password_hash, created_at
- Phase 1: Setup, Phase 2: Foundation, Phase 3: Login, Phase 4: Testing

**Tasks highlights:**
- [001] Create users table migration
- [002] Create User entity
- [003] [Story 1] Implement login endpoint
- [004] [Story 1] Write login tests

---

## Resources

- **Main README**: `../README.md`
- **Setup Guide**: `../SETUP.md`
- **Init Prompt**: `../INIT_PROMPT.md` (for AI-assisted setup)
- **Templates**: `templates/` directory
- **Constitution**: `memory/constitution.md`

---

## Support

Questions or issues?
- Check the main README
- Review example features
- Read the constitution
- Ask in discussions

---

**Remember:** The goal isn't bureaucracy—it's **quality software delivered consistently**.

Specs prevent surprises. Plans prevent mistakes. Tasks prevent chaos.

Happy VibeCoding! 🚀
