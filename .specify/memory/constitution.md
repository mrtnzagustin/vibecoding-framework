# Project Constitution (Template)

**Version:** 1.0.0
**Ratified:** [DATE]
**Last Updated:** [DATE]

> This constitution establishes the foundational principles, standards, and workflows for this project. All contributors—human and AI—must follow these rules.

---

## I. Technology Stack Adherence

### Mandatory Technologies

**Language & Runtime:**
- Language: `[YOUR_LANGUAGE]` v`[VERSION]`+
- Runtime: `[YOUR_RUNTIME]` v`[VERSION]`+ (if applicable)

**Framework:**
- Framework: `[YOUR_FRAMEWORK]` v`[VERSION]`+
- Purpose: `[WHY_THIS_FRAMEWORK]`

**Database:**
- Database: `[YOUR_DATABASE]` v`[VERSION]`+
- ORM/Query Tool: `[YOUR_ORM]` v`[VERSION]`+ (if applicable)

**Testing:**
- Test Framework: `[YOUR_TEST_FRAMEWORK]`
- Coverage Tool: `[YOUR_COVERAGE_TOOL]`
- Additional Tools: `[E2E_FRAMEWORK, MOCKING_LIBRARY, etc.]`

**Additional Stack:**
- [Add other critical dependencies: validation libraries, auth frameworks, etc.]

### Rationale

> **Why these technologies?**
>
> [Explain why you chose this stack:]
> - Team expertise
> - Ecosystem maturity
> - Performance requirements
> - Community support
> - Long-term maintainability
> - [Other reasons]

### Forbidden Technologies

The following technologies are **prohibited** without explicit team approval:

- ❌ [FORBIDDEN_FRAMEWORK_1] - Reason: [WHY]
- ❌ [FORBIDDEN_LIBRARY_1] - Reason: [WHY]
- ❌ [FORBIDDEN_PATTERN_1] - Reason: [WHY]

> Any usage of forbidden technologies requires:
> 1. Written justification
> 2. Architecture review approval
> 3. Documentation of the exception in this constitution

---

## II. Unit Testing (Non-Negotiable)

### Coverage Requirements

**Minimum Thresholds:**
- **Statements:** `[80]%`+
- **Branches:** `[75]%`+
- **Functions:** `[80]%`+
- **Lines:** `[80]%`+

> These thresholds are enforced automatically by:
> - Pre-commit hooks
> - CI/CD pipelines
> - Test framework configuration

### Testing Standards

**All code must include:**
- ✅ Unit tests for business logic
- ✅ Integration tests for API endpoints
- ✅ [YOUR_ADDITIONAL_TEST_TYPES]

**Test Quality Requirements:**
- Tests must be isolated (no shared state)
- External dependencies must be mocked
- Tests must be fast (< `[X]` seconds per test suite)
- Test names must clearly describe what they test
- [YOUR_ADDITIONAL_REQUIREMENTS]

### Test Structure

```
[YOUR_LANGUAGE_TEST_STRUCTURE]

Examples:
JavaScript/TypeScript: src/__tests__/ or src/**/*.test.ts
Python: tests/ or src/**/test_*.py
Go: *_test.go files
Rust: tests/ or #[cfg(test)] modules
```

### Rationale

> **Why strict testing?**
>
> - Prevents regressions before they reach production
> - Enables confident refactoring
> - Documents expected behavior
> - Reduces debugging time
> - Improves code design through testability

---

## III. Documentation Updates (Continuous)

### Required Documentation

Every feature requires **five mandatory documentation artifacts**:

1. **spec.md** - Feature specification
   - User stories with acceptance criteria
   - Functional and non-functional requirements
   - API contracts
   - Success metrics

2. **plan.md** - Implementation plan
   - Technical architecture
   - Database schema
   - Implementation phases
   - Risk assessment

3. **tasks.md** - Task breakdown
   - Granular, ordered tasks
   - Dependencies identified
   - Parallel opportunities marked
   - Testing tasks included

4. **README.md updates** - When public APIs change
   - Usage examples
   - Configuration options
   - Breaking changes noted

5. **Code comments** - Inline documentation
   - Complex logic explained
   - "Why" not just "what"
   - API documentation (JSDoc, docstrings, etc.)

### Documentation Standards

- Use Markdown for all documentation
- Keep specifications up-to-date with code
- Document breaking changes prominently
- Include examples for complex features
- [YOUR_ADDITIONAL_STANDARDS]

### Rationale

> **Why continuous documentation?**
>
> - Prevents knowledge silos
> - Reduces onboarding time
> - Enables better collaboration
> - Improves feature planning
> - Creates audit trail for decisions

---

## IV. Regression Testing & Quality Gates

### Pre-Commit Quality Gates

**Before any commit is accepted:**

- ✅ Spec files exist (spec.md, plan.md, tasks.md)
- ✅ Spec files are non-empty
- ✅ All tests pass
- ✅ Coverage meets minimum thresholds
- ✅ [YOUR_ADDITIONAL_CHECKS]

**Optional Pre-Commit Checks:**
- Linting passes
- Type checking passes (for typed languages)
- Formatting is consistent
- No debug statements or console.logs

### CI/CD Quality Gates

**Pull Request Requirements:**

- ✅ All pre-commit checks pass
- ✅ Feature has complete specifications
- ✅ Build succeeds
- ✅ No forbidden dependencies added
- ✅ Test files exist for new code
- ✅ [YOUR_ADDITIONAL_REQUIREMENTS]

**Merge to Main Requirements:**

- ✅ All PR requirements pass
- ✅ Code review approved
- ✅ [YOUR_INTEGRATION_TESTS]
- ✅ [YOUR_DEPLOYMENT_CHECKS]

### Rationale

> **Why quality gates?**
>
> - Catches issues early when they're cheap to fix
> - Prevents broken code from reaching production
> - Enforces standards consistently
> - Reduces code review burden
> - Maintains high code quality over time

---

## V. Sequential Feature Development

### Feature Workflow

**Each feature follows this exact sequence:**

1. **Create Specification**
   - Define problem and solution
   - Write user stories
   - Specify acceptance criteria
   - Document success metrics

2. **Create Plan**
   - Design architecture
   - Plan database changes
   - Break into phases
   - Assess risks

3. **Break Into Tasks**
   - List granular tasks
   - Identify dependencies
   - Mark parallel opportunities
   - Include testing tasks

4. **Implement**
   - Follow task order
   - Write tests first (TDD) or alongside code
   - Commit frequently
   - Update docs as you go

5. **Validate**
   - Run full test suite
   - Check coverage
   - Verify specs are met
   - Update README if needed

6. **Review & Merge**
   - Open pull request
   - Address review feedback
   - Merge when approved

### Branch Naming Convention

**Pattern:** `NNN-feature-name`

Where:
- `NNN` = 3-digit feature number (001, 002, 003, ...)
- `feature-name` = kebab-case description

**Examples:**
- `001-user-authentication`
- `042-dashboard-analytics`
- `147-export-to-csv`

### Auto-Continue Rules

AI assistants may proceed automatically between subtasks within the same feature, but must stop and ask for approval when:

- Moving to a new feature
- Changing architecture significantly
- Adding new dependencies
- Modifying database schema
- [YOUR_ADDITIONAL_STOP_CONDITIONS]

### Rationale

> **Why sequential development?**
>
> - Prevents scope creep
> - Enables focus on quality
> - Makes testing easier
> - Simplifies code review
> - Allows proper planning

---

## VI. Code Quality & Best Practices

### [Your Language] Standards

**General Principles:**
- [YOUR_PRINCIPLE_1]
- [YOUR_PRINCIPLE_2]
- [YOUR_PRINCIPLE_3]

**Specific Rules:**

#### Type Safety
- [YOUR_TYPE_RULES]
- Example: Use strict TypeScript, avoid `any`, prefer interfaces

#### Naming Conventions
- [YOUR_NAMING_RULES]
- Example: PascalCase for classes, camelCase for functions, UPPER_SNAKE_CASE for constants

#### File Organization
- [YOUR_FILE_STRUCTURE]
- Example: Feature-based folders, index.ts for exports, types in separate files

#### Error Handling
- [YOUR_ERROR_HANDLING_RULES]
- Example: Always catch exceptions, use custom error classes, log errors

#### Security
- [YOUR_SECURITY_RULES]
- Example: Validate all input, sanitize output, never commit secrets, use parameterized queries

### [Your Framework] Best Practices

- [FRAMEWORK_BEST_PRACTICE_1]
- [FRAMEWORK_BEST_PRACTICE_2]
- [FRAMEWORK_BEST_PRACTICE_3]

**Examples:**
- NestJS: Use modules, dependency injection, decorators for routes
- React: Functional components, hooks, avoid class components
- Django: Use CBVs or FBVs consistently, keep views thin, use serializers

### Architecture Patterns

**Preferred Patterns:**
- [YOUR_PATTERN_1]: [When to use]
- [YOUR_PATTERN_2]: [When to use]
- [YOUR_PATTERN_3]: [When to use]

**Anti-Patterns to Avoid:**
- ❌ [ANTI_PATTERN_1]: [Why it's bad]
- ❌ [ANTI_PATTERN_2]: [Why it's bad]
- ❌ [ANTI_PATTERN_3]: [Why it's bad]

### Rationale

> **Why enforce code quality?**
>
> - Ensures consistency across codebase
> - Makes code easier to understand
> - Reduces bugs and security issues
> - Facilitates refactoring
> - Improves maintainability

---

## VII. Speckit Workflow Integration

### Prerequisite Checks

**Before starting any feature, verify:**

1. You've read this constitution
2. You understand the tech stack
3. You know the quality standards
4. You have access to required tools
5. [YOUR_ADDITIONAL_PREREQUISITES]

### Workflow Commands

**Available helper scripts:**

```bash
# Create a new feature with spec files
npm run create-feature "feature name"

# Validate current feature specs
npm run validate-spec

# Run tests
npm test

# Check coverage
npm run test:coverage

# [YOUR_ADDITIONAL_COMMANDS]
```

### AI Assistant Integration

**All AI assistants must:**

1. Read this constitution before coding
2. Follow the sequential workflow
3. Create specs before implementation
4. Write tests alongside code
5. Update documentation continuously
6. Never bypass quality gates

**Configuration files for AI:**
- `.claude/CLAUDE.md` - Claude Code instructions
- `.specify/AI_AGENT_INSTRUCTIONS.md` - General AI instructions

### Rationale

> **Why formalize the workflow?**
>
> - Ensures consistent process
> - Reduces misunderstandings
> - Enables automation
> - Improves collaboration
> - Makes AI assistance more effective

---

## VIII. Governance & Amendments

### Compliance

**All team members must:**
- Read and understand this constitution
- Follow it strictly in daily work
- Raise concerns if rules are unclear
- Suggest improvements through amendments

**Enforcement:**
- Automated: Pre-commit hooks, CI/CD
- Manual: Code reviews, pair programming
- [YOUR_ENFORCEMENT_MECHANISMS]

### Amendments

**To propose a change to this constitution:**

1. Create a branch: `constitution-amendment-[topic]`
2. Update this file with proposed changes
3. Document rationale in commit message
4. Open PR with "CONSTITUTION" label
5. Discuss with team
6. Require [YOUR_APPROVAL_THRESHOLD] approval
7. Update version number
8. Merge and announce to team

**Amendment History:**
- v1.0.0 ([DATE]): Initial constitution

### Exceptions

**Process for one-time exceptions:**

1. Document exception request
2. Explain why it's necessary
3. Get approval from [YOUR_APPROVER]
4. Document in code comments
5. Create task to remove exception

**Repeated exceptions indicate a rule needs amendment.**

### Non-Negotiables

**The following principles have no exceptions:**

1. ✅ Testing is mandatory
2. ✅ Specifications required before coding
3. ✅ Quality gates must pass
4. ✅ Security practices must be followed
5. ✅ [YOUR_NON_NEGOTIABLES]

---

## IX. Onboarding

### For New Team Members

**Required reading:**
1. This constitution (you are here!)
2. [PROJECT_README.md]
3. [YOUR_ARCHITECTURE_DOCS]
4. [YOUR_CODING_GUIDELINES]

**Required setup:**
1. Install required tools
2. Set up development environment
3. Configure pre-commit hooks (`npm install`)
4. Create a practice feature following the workflow

**First tasks:**
1. Review existing features in `specs/`
2. Pair with experienced developer
3. Pick up a small feature to learn the process

### For AI Assistants

**On session start, always:**
1. Read this constitution
2. Check `.specify/AI_AGENT_INSTRUCTIONS.md`
3. Verify current branch and feature
4. Check if specs exist
5. Follow the workflow strictly

---

## X. Success Metrics

### Project Health Indicators

**We measure success by:**

- 🎯 Test coverage ≥ [YOUR_THRESHOLD]%
- 🐛 Production bugs < [YOUR_TARGET] per release
- 📚 All features have complete specs
- ⏱️ Build time < [YOUR_TARGET] minutes
- 🚀 Deploy frequency: [YOUR_TARGET]
- [YOUR_ADDITIONAL_METRICS]

### Code Quality Metrics

**We track:**

- Code churn (% of code rewritten)
- Technical debt items
- Code review time
- Test execution time
- [YOUR_QUALITY_METRICS]

---

## Conclusion

This constitution is a living document that evolves with the project. It exists to:

- 🎯 Maintain high quality
- 🤝 Enable collaboration
- 📈 Support scalability
- 🔒 Ensure security
- 🚀 Ship with confidence

**When in doubt:**
1. Consult this constitution
2. Ask the team
3. Default to higher quality

---

**Version History:**
- v1.0.0 ([DATE]): Initial template constitution

**Next Review:** [DATE]

---

**Remember:** This constitution is here to help you build better software. If a rule doesn't make sense, propose an amendment. If you need an exception, document it. The goal is quality, not bureaucracy.

Happy coding! 🚀
