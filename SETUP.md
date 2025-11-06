# VibeCoding Framework - Detailed Setup Guide

This guide walks you through setting up the VibeCoding framework for your project.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Initial Setup](#initial-setup)
3. [Customization](#customization)
4. [Configuration](#configuration)
5. [First Feature](#first-feature)
6. [Validation](#validation)
7. [Stack-Specific Setup](#stack-specific-setup)

## Prerequisites

Before you begin, ensure you have:

- Git installed (v2.0+)
- Node.js and npm (for JavaScript/TypeScript projects)
- Your preferred IDE with AI assistant (Claude Code, Copilot, Cursor)
- Basic understanding of your project's tech stack

## Initial Setup

### Step 1: Clone or Use Template

**Option A: GitHub Template**
```bash
# Use this repo as a template on GitHub
# Click "Use this template" button

# Then clone your new repo
git clone https://github.com/your-username/your-project.git
cd your-project
```

**Option B: Direct Clone**
```bash
# Clone this template
git clone https://github.com/mrtnzagustin/vibecoding-framework.git my-project
cd my-project

# Remove template git history
rm -rf .git
git init
git add .
git commit -m "Initial commit from VibeCoding template"
```

### Step 2: Install Dependencies

```bash
# For Node.js/TypeScript projects
npm install

# For other languages, skip this or adjust as needed
```

This will:
- Install husky and lint-staged
- Set up git hooks automatically
- Prepare the pre-commit validation

### Step 3: Run Interactive Setup

```bash
npm run init-project
```

Or manually customize the following files (see [Customization](#customization) section).

## Customization

### 1. Update Constitution

Edit `.specify/memory/constitution.md`:

```markdown
# Your Project Constitution

## I. Technology Stack

**Mandatory Technologies:**
- Language: [YOUR_LANGUAGE] v[VERSION]
- Framework: [YOUR_FRAMEWORK] v[VERSION]
- Database: [YOUR_DATABASE] v[VERSION]
- Testing: [YOUR_TEST_FRAMEWORK]

**Rationale:**
[Why these choices? Consistency, team expertise, etc.]

## II. Testing Requirements

**Coverage Thresholds:**
- Statements: [YOUR_THRESHOLD]%+
- Branches: [YOUR_THRESHOLD]%+
- Functions: [YOUR_THRESHOLD]%+
- Lines: [YOUR_THRESHOLD]%+

**Testing Standards:**
- [ ] All new features must have unit tests
- [ ] Integration tests for API endpoints
- [ ] [YOUR_SPECIFIC_REQUIREMENTS]

## III. Documentation Requirements

**Required Documentation:**
1. spec.md - Feature specification
2. plan.md - Implementation plan
3. tasks.md - Task breakdown
4. README.md updates
5. [YOUR_ADDITIONAL_DOCS]

## IV. Quality Gates

**Pre-Commit Checks:**
- [ ] Spec files exist and have content
- [ ] Tests pass
- [ ] Coverage meets thresholds
- [ ] Linting passes
- [ ] [YOUR_CHECKS]

## V. Development Workflow

**Feature Branch Pattern:** `NNN-feature-name`

**Process:**
1. Create spec
2. Create plan
3. Break into tasks
4. Implement
5. Test
6. Document
7. Review
8. Merge

## VI. Code Quality Standards

**[Your Language] Specific:**
- [ ] [STYLE_GUIDE]
- [ ] [NAMING_CONVENTIONS]
- [ ] [ARCHITECTURE_PATTERNS]

## VII. Enforcement

**Automated:**
- Pre-commit hooks (Husky)
- CI/CD pipelines (GitHub Actions)
- [YOUR_TOOLS]

**Manual:**
- Code reviews
- [YOUR_PROCESSES]
```

### 2. Customize AI Instructions

Edit `.specify/AI_AGENT_INSTRUCTIONS.md`:

```markdown
# AI Agent Instructions for [Your Project]

## Context

You are working on [PROJECT_DESCRIPTION].

Tech Stack:
- [YOUR_STACK_ITEM_1]
- [YOUR_STACK_ITEM_2]
- [YOUR_STACK_ITEM_3]

## Mandatory Workflow

### Phase 1: Read Constitution
ALWAYS start by reading `.specify/memory/constitution.md`

### Phase 2: Verify Specs Exist
Check for:
- specs/NNN-feature-name/spec.md
- specs/NNN-feature-name/plan.md
- specs/NNN-feature-name/tasks.md

If missing, STOP and create them first.

### Phase 3: Follow the Plan
Implement according to tasks.md order.

### Phase 4: Write Tests
BEFORE committing:
- Write unit tests
- Verify coverage: [YOUR_THRESHOLD]%+
- Run full test suite

### Phase 5: Update Docs
Update:
- README.md (if public API changed)
- Inline documentation
- Spec files if scope changed

## Prohibited Practices

NEVER:
- Skip spec creation
- Commit without tests
- Use [FORBIDDEN_PATTERN]
- Bypass pre-commit hooks
- [YOUR_PROHIBITIONS]

## [Your Language] Specific Rules

[LANGUAGE_SPECIFIC_BEST_PRACTICES]
```

### 3. Configure Pre-Commit Hook

Edit `.husky/pre-commit`:

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

echo "🔍 VibeCoding Pre-Commit Validation"
echo "===================================="

# Detect if code changes exist
BACKEND_CHANGES=$(git diff --cached --name-only | grep -E '^(src/|lib/|app/)' || true)
CODE_CHANGES=$(git diff --cached --name-only | grep -E '\.(ts|js|py|go|rs|java)$' || true)

# If no code changes, skip validation
if [ -z "$CODE_CHANGES" ]; then
  echo "📄 Documentation-only commit, skipping validation"
  exit 0
fi

# Extract feature number from branch name
BRANCH=$(git branch --show-current)
FEATURE_NUM=$(echo "$BRANCH" | grep -oE '^[0-9]{3}')

# If on feature branch, validate specs exist
if [ -n "$FEATURE_NUM" ]; then
  echo "📋 Validating specs for feature $FEATURE_NUM..."

  SPEC_DIR=$(find specs -type d -name "${FEATURE_NUM}-*" | head -n 1)

  if [ -z "$SPEC_DIR" ]; then
    echo "❌ ERROR: No spec directory found for feature $FEATURE_NUM"
    echo "   Expected: specs/${FEATURE_NUM}-feature-name/"
    echo "   Run: npm run create-feature"
    exit 1
  fi

  # Check required files
  REQUIRED_FILES="spec.md plan.md tasks.md"
  for file in $REQUIRED_FILES; do
    if [ ! -f "$SPEC_DIR/$file" ]; then
      echo "❌ ERROR: Missing $SPEC_DIR/$file"
      exit 1
    fi

    if [ ! -s "$SPEC_DIR/$file" ]; then
      echo "❌ ERROR: $SPEC_DIR/$file is empty"
      exit 1
    fi
  done

  echo "✅ Spec files validated"
fi

# Run tests
echo "🧪 Running tests..."

# CUSTOMIZE THIS SECTION FOR YOUR STACK
# Node.js/TypeScript example:
if [ -f "package.json" ]; then
  npm test -- --passWithNoTests || {
    echo "❌ Tests failed"
    exit 1
  }
fi

# Python example:
# if [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
#   pytest || exit 1
# fi

# Go example:
# if [ -f "go.mod" ]; then
#   go test ./... || exit 1
# fi

# Rust example:
# if [ -f "Cargo.toml" ]; then
#   cargo test || exit 1
# fi

echo "✅ All tests passed"

# Check coverage (optional)
# npm run test:coverage -- --silent || echo "⚠️  Coverage check skipped"

echo "✅ Pre-commit validation passed!"
exit 0
```

### 4. Update GitHub Actions

Edit `.github/workflows/speckit-enforcement.yml`:

Update the test commands for your stack:

```yaml
# For Node.js
- name: Run Tests
  run: npm test -- --passWithNoTests
  working-directory: ./

# For Python
- name: Run Tests
  run: pytest
  working-directory: ./

# For Go
- name: Run Tests
  run: go test ./...
  working-directory: ./

# For Rust
- name: Run Tests
  run: cargo test
  working-directory: ./
```

### 5. Customize Claude Config

Edit `.claude/CLAUDE.md` (or create it):

```markdown
# Claude Code Context for [Your Project]

## Project Overview

[YOUR_PROJECT_DESCRIPTION]

## Before Coding

1. **Read the constitution**: `.specify/memory/constitution.md`
2. **Check current branch**: Extract feature number from branch name
3. **Verify specs exist**: specs/NNN-feature-name/{spec,plan,tasks}.md
4. **If missing specs**: Create them using templates in `.specify/templates/`

## Tech Stack

**Language:** [YOUR_LANGUAGE]
**Framework:** [YOUR_FRAMEWORK]
**Database:** [YOUR_DATABASE]
**Testing:** [YOUR_TEST_FRAMEWORK]

NEVER deviate from this stack without explicit approval.

## Workflow

### 1. Specification (spec.md)
- User stories with acceptance criteria
- Functional requirements
- Non-functional requirements
- Success metrics

### 2. Planning (plan.md)
- Technical architecture
- Database schema
- Implementation phases
- Risk assessment

### 3. Tasks (tasks.md)
- Granular, ordered tasks
- Each independently testable
- Dependencies marked
- Parallel opportunities identified

### 4. Implementation
- Follow tasks.md order
- Write tests FIRST (TDD)
- Update docs as you go
- Commit frequently with clear messages

## Quality Standards

**Test Coverage:**
- Statements: [YOUR_THRESHOLD]%+
- Branches: [YOUR_THRESHOLD]%+
- Functions: [YOUR_THRESHOLD]%+
- Lines: [YOUR_THRESHOLD]%+

**Code Quality:**
- [YOUR_LINTING_RULES]
- [YOUR_FORMATTING_RULES]
- [YOUR_PATTERNS]

## Prohibited Actions

NEVER:
- Skip spec creation
- Commit without tests
- Use `--no-verify`
- Implement multiple features simultaneously
- Use [FORBIDDEN_PATTERNS]

## Example Commands

```bash
# Create a new feature
npm run create-feature "user authentication"

# Validate current feature
npm run validate-spec

# Run tests
npm test

# Check coverage
npm run test:coverage
```

## Reference Examples

See `specs/001-example-feature/` for a complete reference implementation.
```

### 6. Configure Package.json

Edit `package.json`:

```json
{
  "name": "your-project-name",
  "version": "1.0.0",
  "description": "Your project description",
  "scripts": {
    "prepare": "husky install",
    "init-project": "node .specify/scripts/init-project.js",
    "create-feature": "bash .specify/scripts/bash/create-new-feature.sh",
    "validate-spec": "bash .specify/scripts/bash/check-prerequisites.sh",

    "test": "# YOUR_TEST_COMMAND",
    "test:coverage": "# YOUR_COVERAGE_COMMAND",
    "test:watch": "# YOUR_WATCH_COMMAND",

    "lint": "# YOUR_LINT_COMMAND",
    "format": "# YOUR_FORMAT_COMMAND",
    "typecheck": "# YOUR_TYPECHECK_COMMAND",

    "build": "# YOUR_BUILD_COMMAND",
    "dev": "# YOUR_DEV_COMMAND",
    "start": "# YOUR_START_COMMAND"
  },
  "devDependencies": {
    "husky": "^9.1.7",
    "lint-staged": "^16.2.6"
  }
}
```

## Configuration

### Test Coverage Thresholds

Configure in your test framework's config file:

**Jest (jest.config.js):**
```javascript
module.exports = {
  coverageThreshold: {
    global: {
      statements: 80,
      branches: 75,
      functions: 80,
      lines: 80
    }
  }
}
```

**Vitest (vitest.config.ts):**
```typescript
export default defineConfig({
  test: {
    coverage: {
      statements: 80,
      branches: 75,
      functions: 80,
      lines: 80
    }
  }
})
```

**pytest (pytest.ini):**
```ini
[pytest]
addopts = --cov --cov-fail-under=80
```

### Branch Naming Convention

The default pattern is `NNN-feature-name` where:
- `NNN` = 3-digit feature number (e.g., 001, 042, 147)
- `feature-name` = kebab-case description

To change this, edit:
1. `.husky/pre-commit` - Update `FEATURE_NUM` extraction
2. `.github/workflows/*.yml` - Update branch pattern regex
3. `.specify/scripts/bash/common.sh` - Update `check_feature_branch()`

### Spec Directory Structure

Default: `specs/NNN-feature-name/`

To change location, update:
1. `.husky/pre-commit` - Update `SPEC_DIR` search path
2. `.github/workflows/*.yml` - Update spec path
3. `.specify/scripts/bash/common.sh` - Update `get_repo_root()`

## First Feature

### Create Your First Feature

```bash
# Interactive mode
npm run create-feature

# Or provide a name
npm run create-feature "User Authentication"
```

This creates:
```
specs/001-user-authentication/
  ├── spec.md      # From .specify/templates/spec-template.md
  ├── plan.md      # From .specify/templates/plan-template.md
  └── tasks.md     # From .specify/templates/tasks-template.md
```

And a git branch: `001-user-authentication`

### Fill Out the Spec

Edit `specs/001-user-authentication/spec.md`:

1. Add user stories with acceptance criteria
2. Define functional requirements
3. Specify API contracts
4. Set success metrics

### Create the Plan

Edit `specs/001-user-authentication/plan.md`:

1. Design architecture
2. Plan database schema
3. Break into implementation phases
4. Assess risks

### Break Into Tasks

Edit `specs/001-user-authentication/tasks.md`:

1. Setup tasks
2. Foundation tasks
3. User story tasks (one section per story)
4. Testing tasks

### Start Coding

```bash
# Checkout the feature branch
git checkout 001-user-authentication

# Start implementing following tasks.md
# Claude Code will guide you through each task
```

## Validation

### Manual Validation

```bash
# Check if specs exist and are valid
npm run validate-spec

# Run tests
npm test

# Check coverage
npm run test:coverage

# Try a dry-run commit
git add .
git commit --dry-run
```

### Automated Validation

Validation runs automatically:

1. **Pre-Commit**: When you `git commit`
   - Checks spec files exist
   - Runs tests
   - Verifies coverage

2. **Pull Request**: When you open a PR
   - Full spec validation
   - Test suite execution
   - Build verification
   - Constitution compliance

3. **Push to Main**: When merging
   - All of the above
   - Additional integration tests
   - Deployment checks

## Stack-Specific Setup

### JavaScript/TypeScript

```bash
# Install testing framework
npm install --save-dev jest @types/jest ts-jest

# Configure Jest
npx ts-jest config:init

# Update package.json scripts
{
  "test": "jest",
  "test:coverage": "jest --coverage",
  "test:watch": "jest --watch"
}
```

### Python

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # or `venv\Scripts\activate` on Windows

# Install testing tools
pip install pytest pytest-cov

# Create pytest.ini
# [pytest]
# testpaths = tests
# python_files = test_*.py
# addopts = --cov --cov-report=term-missing

# Update pre-commit hook to use pytest
```

### Go

```bash
# Initialize module
go mod init your-project

# Update pre-commit hook
# Replace test command with: go test ./...

# Optional: Add coverage check
# go test -coverprofile=coverage.out ./...
# go tool cover -func=coverage.out
```

### Rust

```bash
# Initialize project
cargo init

# Update pre-commit hook
# Replace test command with: cargo test

# Configure coverage (optional)
# cargo install cargo-tarpaulin
# cargo tarpaulin --out Xml
```

### Monorepo (Frontend + Backend)

```
your-project/
  ├── frontend/
  │   ├── src/
  │   ├── tests/
  │   └── package.json
  ├── backend/
  │   ├── src/
  │   ├── tests/
  │   └── package.json
  ├── specs/
  ├── .specify/
  ├── .husky/
  └── package.json (root)
```

Update `.husky/pre-commit`:
```bash
# Test frontend
if [ -d "frontend" ]; then
  cd frontend && npm test && cd ..
fi

# Test backend
if [ -d "backend" ]; then
  cd backend && npm test && cd ..
fi
```

## Troubleshooting

### Husky not running

```bash
# Reinstall husky
npm uninstall husky
npm install --save-dev husky
npm run prepare

# Verify hook exists
ls -la .husky/pre-commit
```

### Tests not found

```bash
# Verify test command works
npm test

# Check test file patterns
# Jest: *.test.ts, *.spec.ts
# Vitest: *.test.ts, *.spec.ts
# pytest: test_*.py

# Update pre-commit hook if needed
```

### Spec validation failing

```bash
# Check branch name
git branch --show-current
# Should be: 001-feature-name

# Check spec directory
ls -la specs/
# Should have: 001-feature-name/

# Check required files
ls -la specs/001-feature-name/
# Should have: spec.md, plan.md, tasks.md

# Verify files are not empty
wc -l specs/001-feature-name/*.md
```

### Coverage not meeting threshold

```bash
# Generate coverage report
npm run test:coverage

# View detailed report
open coverage/lcov-report/index.html

# Add missing tests
# Focus on uncovered lines shown in report
```

## Next Steps

1. ✅ Customize constitution for your project
2. ✅ Configure pre-commit hook for your stack
3. ✅ Update GitHub Actions workflows
4. ✅ Set up test coverage thresholds
5. ✅ Create your first feature
6. ✅ Commit and push
7. ✅ Open a pull request
8. ✅ Verify CI passes
9. ✅ Merge and celebrate! 🎉

## Additional Resources

- [README.md](README.md) - Overview and quick start
- [INIT_PROMPT.md](INIT_PROMPT.md) - AI-assisted initialization
- [.specify/README.md](.specify/README.md) - Spec-Kit documentation
- [.specify/memory/constitution.md](.specify/memory/constitution.md) - Constitution template

## Support

Need help?
- Check existing issues on GitHub
- Create a new issue with your question
- Include your constitution and error messages

Happy VibeCoding! 🚀
