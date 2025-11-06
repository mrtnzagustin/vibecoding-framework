# VibeCoding Framework Initialization Prompt

Use this prompt with Claude Code, Copilot, or any AI assistant to set up and customize this template for your project.

---

## Copy and paste this prompt:

```
I want to set up the VibeCoding framework template for my project. Please help me customize it step by step.

Context about my project:
- Project name: [YOUR_PROJECT_NAME]
- Description: [BRIEF_DESCRIPTION]
- Type: [WEB_APP / API / CLI / MOBILE / DESKTOP / LIBRARY / OTHER]
- Primary language: [JAVASCRIPT / TYPESCRIPT / PYTHON / GO / RUST / JAVA / OTHER]
- Tech stack:
  - Framework: [REACT / VUE / ANGULAR / NESTJS / EXPRESS / DJANGO / FLASK / FASTAPI / OTHER]
  - Database: [POSTGRESQL / MYSQL / MONGODB / SQLITE / OTHER / NONE]
  - Testing: [JEST / VITEST / PYTEST / GO_TEST / CARGO_TEST / OTHER]
  - [Add any other important tools]

Please help me:

1. **Update the Constitution** (`.specify/memory/constitution.md`)
   - Set my tech stack requirements
   - Define test coverage thresholds (I want [X]% coverage)
   - Customize documentation requirements
   - Add any project-specific rules

2. **Configure AI Instructions** (`.specify/AI_AGENT_INSTRUCTIONS.md`)
   - Adapt the workflow for my stack
   - Add language-specific best practices
   - Include project-specific patterns I follow

3. **Set up Pre-Commit Hook** (`.husky/pre-commit`)
   - Configure test command for my stack
   - Set coverage thresholds
   - Add any custom validation I need

4. **Update GitHub Actions** (`.github/workflows/speckit-enforcement.yml` and `speckit-validation.yml`)
   - Configure test commands for my stack
   - Add forbidden dependencies (if any)
   - Set up build steps

5. **Configure Claude Code** (`.claude/CLAUDE.md` or create if missing)
   - Add project context
   - Include coding standards
   - Document important architectural decisions

6. **Update package.json** (or equivalent for my language)
   - Set project name and description
   - Configure test scripts
   - Add any custom scripts I need

7. **Create an example feature** (`specs/001-example-feature/`)
   - Create a simple example showing the workflow
   - Include spec.md, plan.md, tasks.md
   - Can be a "Hello World" or simple CRUD feature

After customization, please:
- Show me what changes were made
- Explain how to use the customized template
- Suggest next steps for my first real feature

Let's go step by step. Start by showing me the updated constitution based on my stack.
```

---

## Alternative: Quick Setup Prompt

If you want a faster, less interactive setup:

```
I want to quickly set up VibeCoding framework for my [LANGUAGE] project using [FRAMEWORK] and [DATABASE].

Please update all configuration files in one go:
1. Constitution with my stack requirements
2. Pre-commit hook with correct test commands
3. GitHub Actions with my stack
4. Package.json with project details
5. Claude Code config

My requirements:
- Test coverage: [X]% minimum
- Code quality: [LINTING_TOOL]
- Documentation: [REQUIREMENTS]
- Branch naming: [PATTERN] (or keep default NNN-feature-name)

Project structure:
[DESCRIBE: monorepo / single app / frontend+backend / etc]

Show me all the changes and let me know if I need to review anything before committing.
```

---

## Example: Full Interactive Session

Here's an example of how a conversation might go:

### You:
```
I want to set up the VibeCoding framework template for my project.

Context about my project:
- Project name: TaskMaster API
- Description: A task management API with team collaboration features
- Type: API
- Primary language: TypeScript
- Tech stack:
  - Framework: NestJS 10.x
  - Database: PostgreSQL 15 with TypeORM
  - Testing: Jest
  - Validation: class-validator
  - Auth: JWT with Passport

Please help me update the Constitution first.
```

### Claude:
```
I'll help you set up VibeCoding for TaskMaster API. Let's start with the Constitution.

Based on your stack (NestJS + PostgreSQL + Jest), here's the customized constitution:

[Shows updated constitution.md with your stack]

Key points I've configured:
- NestJS 10.x as mandatory framework
- PostgreSQL 15 + TypeORM for data layer
- Jest for testing with 80% coverage thresholds
- TypeScript strict mode required
- JWT authentication pattern
- class-validator for DTOs

Does this look good? Any adjustments needed before we move to the next step?
```

### You:
```
Looks great! Let's move to configuring the pre-commit hook.
```

### Claude:
```
Perfect! Now let's set up the pre-commit hook for NestJS...

[Shows updated .husky/pre-commit with correct test commands]

This hook will:
- Validate spec files exist on feature branches
- Run Jest tests
- Check coverage meets 80% threshold
- Fail fast if any step fails

Should I also add lint-staged for automatic code formatting?
```

... and so on.

---

## Advanced: Custom Constitution Prompt

If you have very specific requirements:

```
I need to create a custom constitution for my project with these specific rules:

## Tech Stack
[DETAILED STACK WITH VERSIONS]

## Testing Philosophy
- [YOUR_APPROACH: TDD / BDD / Integration-first / etc]
- Coverage requirements: [DETAILED_REQUIREMENTS]
- [ADDITIONAL_RULES]

## Code Quality
- Formatting: [TOOL_AND_CONFIG]
- Linting: [RULES]
- Type safety: [REQUIREMENTS]
- [OTHER_STANDARDS]

## Architecture
- Pattern: [ARCHITECTURE_STYLE]
- Folder structure: [YOUR_STRUCTURE]
- Module boundaries: [RULES]
- [OTHER_PATTERNS]

## Documentation
- Code comments: [REQUIREMENTS]
- API docs: [TOOL_AND_FORMAT]
- Architecture docs: [WHAT_YOU_NEED]
- [OTHER_DOCS]

## Workflow
- Branch strategy: [GITFLOW / TRUNK / OTHER]
- PR requirements: [RULES]
- Review process: [REQUIREMENTS]
- [OTHER_PROCESSES]

## Security
- Secrets management: [APPROACH]
- Input validation: [RULES]
- Authentication: [PATTERN]
- [OTHER_SECURITY_RULES]

## Prohibited Practices
- [THINGS_YOU_NEVER_WANT_TO_SEE]

Please create a comprehensive constitution that enforces all of this, and then help me configure the tooling to enforce it automatically.
```

---

## Stack-Specific Quick Prompts

### For Python Django Project:
```
Set up VibeCoding for Python Django project:
- Python 3.11+ with Django 4.2+
- PostgreSQL 15
- pytest with 85% coverage
- black + isort for formatting
- mypy for type checking
- django-rest-framework for API

Configure all files accordingly.
```

### For Go API:
```
Set up VibeCoding for Go API:
- Go 1.21+
- PostgreSQL with pgx
- standard library testing + testify
- 80% coverage
- golangci-lint
- gRPC + REST endpoints

Configure all files accordingly.
```

### For React + NestJS Monorepo:
```
Set up VibeCoding for fullstack monorepo:
- Frontend: React 18 + TypeScript + Vite
- Backend: NestJS 10 + TypeScript
- Database: PostgreSQL 15 + TypeORM
- Testing: Vitest (frontend), Jest (backend)
- Shared: pnpm workspace

Structure:
  apps/frontend/
  apps/backend/
  packages/shared/
  specs/
  .specify/

Configure all files for monorepo structure.
```

---

## Post-Setup Validation Prompt

After Claude sets up your template:

```
Now that you've configured the VibeCoding template for my project, please:

1. Create a simple example feature to demonstrate the workflow
   - specs/001-example-feature/ with all required files
   - Implement a basic [YOUR_SIMPLE_FEATURE]
   - Include tests showing coverage
   - Show how the validation works

2. Validate the setup:
   - Check that pre-commit hook works
   - Verify test commands work
   - Ensure coverage thresholds are enforced

3. Create a commit with the initial setup:
   - Commit message following best practices
   - Include all configuration files
   - Tag as v1.0.0-template

4. Provide a "Next Steps" guide:
   - How to create my first real feature
   - Common commands I'll use
   - How to extend the template as I learn more

Let me know when complete!
```

---

## Tips for Using This Prompt

1. **Be Specific**: The more details you provide about your stack, the better the setup
2. **Ask Questions**: If Claude suggests something unclear, ask for clarification
3. **Iterate**: You can always refine the configuration later
4. **Test**: After setup, create a test feature to verify everything works
5. **Document**: Add project-specific notes to your constitution as you go

## Troubleshooting Prompts

### If setup fails:
```
The setup failed at [STEP]. Error message:
[ERROR]

Please:
1. Explain what went wrong
2. Fix the issue
3. Verify the fix works
4. Continue with the remaining steps
```

### If you need to change something:
```
I need to change [CONFIGURATION] because [REASON].

Please:
1. Update the relevant files
2. Explain what changed
3. Show me how to verify it works
4. Document this change in the constitution
```

### If you want to add a new validation:
```
I want to add a new pre-commit check that validates [WHAT].

Please:
1. Add it to .husky/pre-commit
2. Update constitution to document this rule
3. Add it to GitHub Actions if needed
4. Show me how to test it
```

---

## Ready to Start?

1. Copy the main prompt above
2. Fill in your project details
3. Paste into Claude Code or your AI assistant
4. Follow the interactive setup
5. Review changes before committing
6. Start coding with VibeCoding! 🚀

---

**Note:** This is a one-time setup. Once configured, the framework enforces your standards automatically. You can always refine your constitution as your project evolves.
