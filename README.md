# VibeCoding Framework

A specification-driven development template combining **GitHub Spec-Kit** with **VibeCoding workflows** for AI-assisted development.

---

## What is VibeCoding + Spec-Kit?

This template combines two powerful methodologies:

- **GitHub Spec-Kit**: Structured specification-first development (spec → plan → tasks → implement)
- **VibeCoding**: AI-first development with small steps and strong guardrails

**Result:** A complete framework for building quality software with AI assistance

## Features

✅ **Spec-Kit Integration**
- Agent-neutral prompts in `.github/prompts/`
- Use `/speckit.specify`, `/speckit.plan`, `/speckit.tasks` commands
- Structured templates for all documentation

✅ **VibeCoding Layer**
- Claude Code instructions (`.claude/CLAUDE.md`)
- General AI instructions (`.specify/AI_AGENT_INSTRUCTIONS.md`)
- Pre-commit hooks with quality gates

✅ **Stack-Agnostic**
- Works with Node.js, Python, Go, Rust, Java, and more
- Customizable constitution for your tech stack
- Multi-language test detection in CI/CD

✅ **Automated Quality**
- Husky pre-commit hooks validate specs and tests
- GitHub Actions enforce standards
- No code without specs

## Quick Start

### 1. Install

```bash
npm install
```

This installs Husky and sets up git hooks automatically.

### 2. Initialize Your Project

```bash
npm run init-project
```

Answer the prompts for project name, description, and tech stack.

### 3. Create Your First Feature

```bash
npm run create-feature "User authentication"
```

This creates `specs/001-user-authentication/` with spec.md, plan.md, and tasks.md.

### 4. Fill in the Docs

Edit the three files, or use AI:
- `/speckit.specify` - Generate spec.md
- `/speckit.plan` - Generate plan.md
- `/speckit.tasks` - Generate tasks.md

### 5. Start Coding

Follow the tasks in `tasks.md`, checking them off as you go

## Directory Structure

```
.
├── .claude/                    # Claude Code configuration
│   └── CLAUDE.md              # AI assistant instructions
├── .github/
│   ├── prompts/                # Spec-Kit agent prompts
│   │   ├── specify.prompt.md
│   │   ├── plan.prompt.md
│   │   └── tasks.prompt.md
│   └── workflows/              # CI/CD
│       └── spec-kit-validation.yml
├── .husky/                    # Git hooks
│   └── pre-commit            # Pre-commit validation
├── .specify/
│   ├── memory/
│   │   └── constitution.md       # Project rules (customize this!)
│   ├── scripts/bash/
│   │   ├── init-project.sh       # Initialize project
│   │   ├── create-feature.sh     # Create new feature
│   │   └── validate-spec.sh      # Validate specs
│   ├── templates/                # Document templates
│   │   ├── spec-template.md
│   │   ├── plan-template.md
│   │   └── tasks-template.md
│   ├── AI_AGENT_INSTRUCTIONS.md  # General AI instructions
│   └── README.md                 # Spec-Kit documentation
├── specs/                        # Feature specifications
│   └── NNN-feature-name/
│       ├── spec.md
│       ├── plan.md
│       └── tasks.md
├── src/                          # Your source code (create as needed)
├── tests/                        # Your tests (create as needed)
├── README.md                     # This file
├── SETUP.md                      # Project-specific setup (generated)
├── INIT_PROMPT.md                # AI initialization prompt
└── package.json
```

## Example Feature

See `specs/001-example-feature/` for a complete working example showing:
- How to structure a spec.md (WHAT and WHY)
- How to write a plan.md (HOW)
- How to break down tasks.md (concrete steps)

This example demonstrates a simple logging utility and can serve as a reference when creating your own features. Feel free to delete it once you're familiar with the workflow.

## Workflow

### Spec-Kit Workflow

1. **Specify** - Define WHAT and WHY
   ```bash
   npm run create-feature "Feature name"
   # Edit specs/NNN-feature-name/spec.md
   # Or use: /speckit.specify
   ```

2. **Plan** - Define HOW
   ```bash
   # Edit specs/NNN-feature-name/plan.md
   # Or use: /speckit.plan
   ```

3. **Tasks** - Break into steps
   ```bash
   # Edit specs/NNN-feature-name/tasks.md
   # Or use: /speckit.tasks
   ```

4. **Implement** - Code following tasks
   - Check off tasks as you complete them
   - Write tests alongside code
   - Update docs as you go

5. **Validate** - Quality gates pass
   ```bash
   npm run validate-spec  # Specs exist and valid
   npm test               # Tests pass
   npm run lint           # Linting passes
   ```

### VibeCoding with AI

**With Claude Code:**
- Opens `.claude/CLAUDE.md` automatically
- Follows VibeCoding rules
- Uses Spec-Kit prompts

**With other AI:**
- Read `.specify/AI_AGENT_INSTRUCTIONS.md`
- Follow the constitution
- Use structured prompts

## Configuration

### Customize the Constitution

Edit `.specify/memory/constitution.md` to define your project's:
- Technology stack requirements
- Testing standards (coverage thresholds)
- Documentation requirements
- Code quality rules
- Workflow processes

### Configure Pre-Commit Hooks

Edit `.husky/pre-commit` to adjust:
- Test coverage thresholds
- Which validations run
- Branch naming conventions
- Skip conditions

### Adjust GitHub Actions

Edit workflows in `.github/workflows/` to:
- Add/remove validation steps
- Configure forbidden dependencies
- Set up deployment pipelines
- Customize enforcement rules

## Available Commands

```bash
# Setup
npm run init-project          # Initialize project (interactive)
npm install                   # Install deps and setup hooks

# Features
npm run create-feature "name" # Create feature with specs
npm run validate-spec         # Validate spec structure

# Quality
npm test                      # Run tests (configure in package.json)
npm run lint                  # Run linter (configure in package.json)
npm run format                # Format code (configure in package.json)
npm run typecheck             # Type check (configure in package.json)
```

## Customization

### 1. Update Constitution

Edit `.specify/memory/constitution.md`:
- Define your tech stack
- Set testing requirements
- Add code quality rules
- Document your workflow

### 2. Configure package.json

Update scripts for your stack:
```json
{
  "scripts": {
    "test": "jest",              // or pytest, go test, cargo test
    "lint": "eslint src/",       // or ruff, golangci-lint
    "format": "prettier --write .", // or black, gofmt
    "typecheck": "tsc --noEmit"  // if using TypeScript
  }
}
```

### 3. Update Pre-Commit Hook

`.husky/pre-commit` runs:
- `npm run validate-spec`
- `npm run lint`
- `npm test`

These use your configured commands from package.json.

### 4. Customize Templates

Edit templates in `.specify/templates/` to match your needs:
- `spec-template.md`
- `plan-template.md`
- `tasks-template.md`

## AI Integration

### Using Spec-Kit Prompts

In any AI tool that supports prompts:
```
/speckit.specify
/speckit.plan
/speckit.tasks
```

These load prompts from `.github/prompts/` and generate structured documentation.

### Using with Claude Code

Claude Code automatically loads `.claude/CLAUDE.md` which:
- Enforces VibeCoding rules
- Requires specs before code
- Uses Spec-Kit workflow

### Using with Copilot/Cursor

These tools read:
- `.specify/AI_AGENT_INSTRUCTIONS.md`
- `.specify/memory/constitution.md`

They'll follow your project rules automatically

## Examples

### Create a Feature

```bash
$ npm run create-feature "User authentication"

✅ Created feature folder: specs/001-user-authentication

Next steps:
  1. Edit specs/001-user-authentication/spec.md (define WHAT and WHY)
  2. Edit specs/001-user-authentication/plan.md (define HOW)
  3. Edit specs/001-user-authentication/tasks.md (break into tasks)
  4. Start implementing!
```

### Validate Specs

```bash
$ npm run validate-spec

🔍 Validating Spec Structure...

Checking: 001-user-authentication
  ✅ spec.md (45 lines)
  ✅ plan.md (38 lines)
  ✅ tasks.md (62 lines)

✅ All feature folders have valid specs!
```

## Pre-Commit Hooks

Every commit triggers:
1. Spec validation (specs exist and non-empty)
2. Linting (your configured linter)
3. Tests (your configured test command)

This ensures quality at commit time, not in CI.

---

## CI/CD

GitHub Actions workflow (`.github/workflows/spec-kit-validation.yml`) runs on:
- Pull requests
- Pushes to main/develop

It validates:
- Specs structure
- Linting passes
- Tests pass

---

## FAQ

**Q: Do I need to use Node.js?**
A: No. This template uses npm for scripts, but works with any language. Just configure the test/lint commands for your stack.

**Q: Can I use this without AI?**
A: Yes! The Spec-Kit workflow works great manually. AI instructions are optional.

**Q: What if I don't like the templates?**
A: Customize them! Edit files in `.specify/templates/` to match your needs.

**Q: How do I change test coverage requirements?**
A: Update `.specify/memory/constitution.md` and your test framework config.

**Q: Can I use this with an existing project?**
A: Yes. Copy the `.specify/`, `.github/`, `.husky/`, and `.claude/` folders. Run `npm install` to set up hooks

## Resources

- [Full Setup Guide](SETUP.md)
- [AI Initialization Prompt](INIT_PROMPT.md)
- [Constitution Template](.specify/memory/constitution.md)
- [Spec-Kit Documentation](.specify/README.md)

## License

MIT License - Use this template freely for your projects

## Support

- 📧 Issues: Create a GitHub issue
- 💬 Discussions: Start a discussion
- 📚 Docs: Check SETUP.md for detailed guides

---

**Ready to start?** Run `npm install` and then `npm run init-project` to customize this template for your project!
