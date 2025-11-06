#!/usr/bin/env bash
set -e

echo "🔥 VibeCoding – Project Initialization"
echo "======================================="
echo ""

read -p "Project name: " PROJECT_NAME
read -p "Short description: " PROJECT_DESC
read -p "Primary language/stack (e.g. node, python, go): " PROJECT_STACK

if [ -f "package.json" ]; then
  echo ""
  echo "⚠️  Please update package.json manually:"
  echo "   name: $(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"
  echo "   description: $PROJECT_DESC"
fi

cat > SETUP.md <<EOF
# ${PROJECT_NAME}

${PROJECT_DESC}

## Tech Stack

**Primary stack:** \`${PROJECT_STACK}\`

> Update this section with concrete versions, tools, and environment setup.

## Getting Started

\`\`\`bash
# Install dependencies
npm install

# Create your first feature
npm run create-feature "Your first feature"

# Validate specs
npm run validate-spec

# Run tests
npm test

# Lint code
npm run lint
\`\`\`

## Development Workflow

1. Create feature: \`npm run create-feature "Feature name"\`
2. Fill in \`specs/NNN-feature-name/spec.md\`
3. Fill in \`specs/NNN-feature-name/plan.md\`
4. Fill in \`specs/NNN-feature-name/tasks.md\`
5. Implement following the tasks
6. Run tests: \`npm test\`
7. Commit and push

## Configuration

Update \`.specify/memory/constitution.md\` with:
- Your tech stack details
- Testing requirements
- Code quality standards
- Project-specific rules
EOF

echo ""
echo "✅ Project initialized!"
echo ""
echo "Next steps:"
echo "  1. Update package.json name and description"
echo "  2. Review and customize SETUP.md"
echo "  3. Edit .specify/memory/constitution.md for your stack"
echo "  4. Run: npm run create-feature \"Your first feature\""
echo ""
