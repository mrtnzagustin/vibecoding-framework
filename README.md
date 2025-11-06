# VibeCoding Framework Template

A comprehensive template for specification-driven development with AI-powered workflows.

## What is VibeCoding?

VibeCoding is a development methodology that combines:
- **Specification-First Development**: Every feature starts with a complete specification before any code is written
- **AI-Powered Workflows**: Optimized for Claude Code, GitHub Copilot, and other AI coding assistants
- **Automated Quality Gates**: Pre-commit hooks and CI/CD pipelines enforce quality standards
- **Documentation as Code**: Specifications, plans, and tasks are version-controlled alongside code

## Features

- 📋 **Spec-Kit Templates**: Structured templates for specifications, plans, and tasks
- 🤖 **AI Agent Configuration**: Pre-configured instructions for Claude Code and other AI assistants
- ✅ **Automated Validation**: Husky pre-commit hooks validate specs, tests, and code quality
- 🔄 **GitHub Actions**: CI/CD workflows enforce specification compliance
- 📝 **Constitution Framework**: Define and enforce project-specific rules and standards
- 🛠️ **Helper Scripts**: Bash utilities for creating features, validating prerequisites, and more

## Quick Start

### 1. Clone this template

```bash
git clone https://github.com/your-username/your-project.git
cd your-project
```

### 2. Run the initialization script

```bash
npm run init-project
```

This interactive script will:
- Configure your project name and description
- Set up your tech stack preferences
- Customize the constitution for your needs
- Initialize git hooks and dependencies

### 3. Start coding with VibeCoding

```bash
# Create your first feature
npm run create-feature "User authentication"

# Or use the interactive version
npm run create-feature
```

## Directory Structure

```
.
├── .claude/                    # Claude Code configuration
│   └── CLAUDE.md              # AI assistant instructions
├── .github/
│   └── workflows/             # GitHub Actions workflows
│       ├── speckit-enforcement.yml
│       └── speckit-validation.yml
├── .husky/                    # Git hooks
│   └── pre-commit            # Pre-commit validation
├── .specify/                  # Specification framework
│   ├── memory/
│   │   └── constitution.md   # Project rules and standards
│   ├── scripts/
│   │   └── bash/             # Helper scripts
│   ├── templates/            # Document templates
│   │   ├── spec-template.md
│   │   ├── plan-template.md
│   │   ├── tasks-template.md
│   │   └── checklist-template.md
│   ├── AI_AGENT_INSTRUCTIONS.md
│   └── README.md
├── specs/                     # Feature specifications
│   └── XXX-feature-name/     # Each feature gets a numbered folder
│       ├── spec.md
│       ├── plan.md
│       └── tasks.md
├── src/                       # Your source code
├── tests/                     # Your tests
├── package.json
├── SETUP.md                   # Detailed setup instructions
└── INIT_PROMPT.md            # Prompt for AI-assisted setup
```

## Core Workflow

### 1. Specify
Create a detailed specification for your feature using `spec.md`:
- User stories and personas
- Functional and non-functional requirements
- API contracts
- Success criteria

### 2. Plan
Design the technical implementation in `plan.md`:
- Architecture decisions
- Database schema
- Implementation phases
- Risk assessment

### 3. Break Down
Split the work into granular tasks in `tasks.md`:
- Setup tasks
- Foundation tasks
- User story tasks
- Testing tasks

### 4. Implement
Code following the task breakdown with AI assistance

### 5. Validate
Automated checks ensure:
- All specs exist and are complete
- Tests pass with required coverage
- Code meets quality standards
- Builds succeed

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

## Available Scripts

```bash
# Project setup
npm run init-project          # Interactive project initialization
npm install                   # Install dependencies and setup hooks

# Feature management
npm run create-feature        # Interactive feature creation
npm run create-feature "name" # Create feature with name
npm run validate-spec         # Check current feature compliance

# Testing
npm test                      # Run all tests
npm run test:coverage         # Generate coverage report
npm run test:watch            # Run tests in watch mode

# Quality checks
npm run lint                  # Run linter
npm run format                # Format code
npm run typecheck             # Check TypeScript types
```

## Customization for Your Stack

This template is stack-agnostic. Customize it for your needs:

### For Node.js/TypeScript Projects
- Update package.json with your dependencies
- Configure tsconfig.json
- Set up your preferred testing framework (Jest/Vitest)

### For Python Projects
- Add requirements.txt or pyproject.toml
- Configure pytest or unittest
- Adjust pre-commit hook for Python tests

### For Go/Rust/Other
- Update constitution with language-specific rules
- Modify pre-commit hook to run language-specific tests
- Adjust GitHub Actions workflows

### For Frontend/Backend/Fullstack
- Structure src/ directory appropriately
- Add frontend/ and backend/ folders if needed
- Update scripts for monorepo support

## AI Assistant Integration

### Using with Claude Code

1. Claude Code automatically reads `.claude/CLAUDE.md` on session start
2. Follow the workflow it suggests
3. Use natural language to create features: "Create a new feature for user profiles"

### Using with GitHub Copilot

1. Copilot reads `.specify/AI_AGENT_INSTRUCTIONS.md`
2. It will suggest code following your constitution
3. Tests and specs are generated automatically

### Using with Cursor

1. Add `.specify/` to your Cursor workspace
2. Reference constitution in your prompts
3. Use specs as context for implementation

## Best Practices

### ✅ DO
- Write specs before code
- Keep user stories small and testable
- Update documentation as you go
- Run tests before committing
- Follow your constitution strictly
- Use AI assistants to generate boilerplate

### ❌ DON'T
- Skip spec creation
- Commit without tests
- Bypass pre-commit hooks with --no-verify
- Mix multiple features in one branch
- Deviate from tech stack without approval
- Copy/paste without understanding

## Examples

Check out the `examples/` directory for sample features:
- `001-user-authentication/`: Complete auth system
- `002-api-endpoints/`: REST API with validation
- `003-dashboard/`: Frontend component with tests

## Troubleshooting

### Pre-commit hook failing
```bash
# Check which validation failed
git commit -v

# Run validations manually
npm run validate-spec
npm test

# Fix issues and try again
```

### Spec validation errors
```bash
# Ensure you're on a feature branch
git checkout -b 001-my-feature

# Create required files
npm run create-feature "my feature"

# Validate structure
npm run validate-spec
```

### Tests not running
```bash
# Check test configuration
npm test -- --version

# Update test scripts in package.json
# See package.json for examples
```

## Contributing

This template evolves with your needs:
1. Customize constitution for your project
2. Add project-specific scripts
3. Extend templates with your patterns
4. Share improvements back to the template

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
