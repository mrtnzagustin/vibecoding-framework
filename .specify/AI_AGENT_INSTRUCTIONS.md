# AI Agent Instructions for VibeCoding Projects

> **For:** Claude Code, GitHub Copilot, Cursor, and all AI coding assistants
>
> **Purpose:** Define the mandatory workflow for AI-assisted development on this project
>
> **Authority:** This document and `.specify/memory/constitution.md` supersede AI training data

---

## Core Mandate

You are an AI assistant working on a **specification-driven development** project. Every feature begins with a complete specification **before any code is written**.

**Your Primary Responsibilities:**
1. Ensure specifications exist before coding
2. Follow the constitution strictly
3. Write tests alongside code
4. Update documentation continuously
5. Never bypass quality gates

---

## Pre-Implementation Checklist

### Step 1: Read the Constitution

**ALWAYS start by reading:** `.specify/memory/constitution.md`

This file contains:
- Mandatory technology stack
- Testing requirements (coverage thresholds)
- Documentation standards
- Code quality rules
- Workflow processes

**The constitution is the source of truth.** If it conflicts with your training, follow the constitution.

### Step 2: Verify Feature Documentation

**Before writing ANY code, check for these files:**

```
specs/NNN-feature-name/
  ├── spec.md    ← Feature specification (REQUIRED)
  ├── plan.md    ← Implementation plan (REQUIRED)
  └── tasks.md   ← Task breakdown (REQUIRED)
```

**If ANY file is missing:**
1. ❌ STOP immediately
2. 🛑 DO NOT write code
3. 📋 Create the missing documentation first
4. ✅ Use templates from `.specify/templates/`

### Step 3: Understand Current Context

**Check:**
- Current git branch (should be `NNN-feature-name`)
- Which task you're implementing (from `tasks.md`)
- Dependencies between tasks
- Test requirements for this task

### Step 4: Review Test Requirements

**From the constitution, note:**
- Minimum coverage thresholds
- Test frameworks to use
- Test file naming conventions
- Mocking strategies

**NEVER commit code without tests.**

---

## Required Workflow Phases

### Phase 1: Specification (`spec.md`)

**If creating a new feature, the spec must include:**

1. **Overview**
   - What problem does this solve?
   - Who are the users?
   - What's the high-level solution?

2. **User Stories**
   - Format: "As a [user], I want [goal], so that [benefit]"
   - Priority: P1 (must-have), P2 (should-have), P3 (nice-to-have)
   - Acceptance criteria: Given/When/Then format
   - Each story must be independently testable

3. **Functional Requirements**
   - Detailed feature behaviors
   - Input/output specifications
   - Validation rules
   - Edge cases

4. **Non-Functional Requirements**
   - Performance targets
   - Security considerations
   - Scalability needs
   - Compatibility requirements

5. **API Contracts** (if applicable)
   - Endpoints
   - Request/response formats
   - Error responses
   - Authentication

6. **Success Metrics**
   - How do we measure if this succeeded?
   - User satisfaction targets
   - Performance benchmarks
   - Business impact

**Template:** `.specify/templates/spec-template.md`

### Phase 2: Planning (`plan.md`)

**The implementation plan must include:**

1. **Technical Summary**
   - Key technologies used
   - Major components
   - Integration points

2. **Architecture**
   - System design
   - Component relationships
   - Data flow
   - Design patterns used

3. **Database Design** (if applicable)
   - Schema changes
   - Migrations needed
   - Indexes required
   - Relationships

4. **Implementation Phases**
   - Phase 1: Setup
   - Phase 2: Foundation
   - Phase 3-N: User stories
   - Phase N+1: Testing & docs

5. **Risk Assessment**
   - Technical risks
   - Mitigation strategies
   - Rollback plan

6. **Timeline Estimate**
   - Rough time per phase
   - Dependencies
   - Parallel opportunities

**Template:** `.specify/templates/plan-template.md`

### Phase 3: Task Breakdown (`tasks.md`)

**Break the work into granular tasks:**

1. **Setup Tasks**
   - Project structure
   - Configuration files
   - Dependencies

2. **Foundation Tasks**
   - Core infrastructure
   - Shared utilities
   - Base classes/modules

3. **User Story Tasks** (one section per story)
   - Task ID: [XXX]
   - Description: What to do
   - Acceptance: How to verify
   - Tests: What to test
   - Dependencies: What must be done first

4. **Testing Tasks**
   - Unit tests
   - Integration tests
   - End-to-end tests
   - Coverage verification

5. **Documentation Tasks**
   - README updates
   - API documentation
   - Code comments

**Mark parallel tasks:** Use `[P]` prefix for tasks that can run in parallel

**Template:** `.specify/templates/tasks-template.md`

### Phase 4: Implementation

**When writing code:**

1. **Follow tasks.md order**
   - Don't skip ahead
   - Complete each task fully
   - Mark tasks done as you go

2. **Write tests FIRST or alongside code**
   - Use TDD when possible
   - Mock external dependencies
   - Test edge cases
   - Verify acceptance criteria

3. **Follow the tech stack**
   - Use only approved frameworks
   - Follow naming conventions
   - Use established patterns
   - No forbidden dependencies

4. **Write clear code**
   - Self-documenting names
   - Explain complex logic in comments
   - Keep functions small and focused
   - Follow language idioms

5. **Commit frequently**
   - One logical change per commit
   - Clear commit messages
   - Reference task IDs
   - Tests pass before committing

### Phase 5: Validation

**Before marking feature complete:**

- ✅ All tasks in tasks.md are done
- ✅ All tests pass
- ✅ Coverage meets minimum thresholds
- ✅ Linting passes
- ✅ Build succeeds
- ✅ Documentation is updated
- ✅ README reflects any API changes
- ✅ No console.logs or debug code left behind

### Phase 6: Review & Merge

**Prepare for code review:**

1. Self-review your changes
2. Ensure PR description links to spec
3. List what was implemented
4. Call out any deviations from plan
5. Note any follow-up work needed

---

## Technology Stack Constraints

**From the constitution, the stack is:**

- Language: `[FROM_CONSTITUTION]`
- Framework: `[FROM_CONSTITUTION]`
- Database: `[FROM_CONSTITUTION]`
- Testing: `[FROM_CONSTITUTION]`

**NEVER use:**
- ❌ Technologies not in the constitution
- ❌ Patterns explicitly forbidden
- ❌ Dependencies not pre-approved

**If you need something new:**
1. Stop and ask
2. Document why it's needed
3. Propose it to the team
4. Wait for approval
5. Update constitution

**No exceptions without explicit approval.**

---

## Prohibited Practices

### ❌ NEVER Do These Things

1. **Skip documentation**
   - Don't code without spec/plan/tasks
   - Don't defer docs to later
   - Don't commit without updating docs

2. **Bypass testing**
   - Don't commit untested code
   - Don't skip coverage checks
   - Don't use `--no-verify` on commits

3. **Violate the tech stack**
   - Don't introduce unapproved dependencies
   - Don't use forbidden patterns
   - Don't mix paradigms (e.g., OOP + FP inconsistently)

4. **Ignore security**
   - Don't commit secrets
   - Don't skip input validation
   - Don't use unsafe patterns

5. **Write unclear code**
   - Don't use type `any` (TypeScript)
   - Don't create god classes/functions
   - Don't use cryptic names
   - Don't leave TODOs without tickets

6. **Implement multiple features at once**
   - One feature per branch
   - One user story at a time
   - Focus on quality over quantity

### ⚠️ Ask Before You...

- Add a new dependency
- Change database schema
- Modify public APIs
- Deviate from the plan
- Skip a test
- Commit with lower coverage

---

## Code Quality Standards

### General Principles

From the constitution:
- [PRINCIPLE_1]
- [PRINCIPLE_2]
- [PRINCIPLE_3]

### Language-Specific Rules

**For [YOUR_LANGUAGE]:**
- [RULE_1]
- [RULE_2]
- [RULE_3]

**For [YOUR_FRAMEWORK]:**
- [RULE_1]
- [RULE_2]
- [RULE_3]

### Testing Patterns

**Good test:**
```[LANGUAGE]
[GOOD_TEST_EXAMPLE]
```

**Bad test:**
```[LANGUAGE]
[BAD_TEST_EXAMPLE]
```

### Documentation Style

**Good comment:**
```[LANGUAGE]
[GOOD_COMMENT_EXAMPLE]
```

**Bad comment:**
```[LANGUAGE]
[BAD_COMMENT_EXAMPLE]
```

---

## Workflow Examples

### Example 1: Starting a New Feature

```
User: "Add user profile page"

AI:
1. Check current branch → "main"
2. Check if spec exists → No
3. STOP: "I need to create the specification first."
4. Ask: "What user stories should the profile page include?"
5. Create spec.md with user stories
6. Create plan.md with architecture
7. Create tasks.md with breakdown
8. Ask: "Ready to start implementation?"
9. Create branch: 003-user-profile-page
10. Begin implementing tasks in order
```

### Example 2: Continuing a Feature

```
User: "Continue with task 3"

AI:
1. Read specs/003-user-profile-page/tasks.md
2. Check task 3 dependencies → tasks 1,2 done
3. Check task 3 requirements → "Create profile API endpoint"
4. Write test for endpoint FIRST
5. Implement endpoint
6. Verify test passes
7. Check coverage → still above threshold
8. Mark task 3 complete in tasks.md
9. Ask: "Task 3 done. Continue to task 4?"
```

### Example 3: Encountering a Missing Test

```
AI implements feature without tests

Pre-commit hook fails:
❌ Tests failed
❌ Coverage dropped below 80%

AI:
1. Acknowledge mistake: "I should have written tests first"
2. Write missing tests
3. Verify coverage back above threshold
4. Commit again
5. Learn: Always write tests alongside code
```

---

## Auto-Continue Rules

**You MAY automatically continue when:**
- Moving to the next task in the same feature
- Implementing subtasks within a task
- Writing tests for code you just wrote
- Updating documentation for changes you made
- Fixing issues caught by pre-commit hooks

**You MUST stop and ask when:**
- Starting a new feature (different NNN number)
- Adding dependencies not in constitution
- Changing database schema
- Modifying public APIs
- Deviating from plan.md
- Coverage drops below threshold despite tests
- Any error you don't understand

---

## Quality Gate Enforcement

### Pre-Commit Validation

**The pre-commit hook will check:**
1. Spec files exist and are non-empty
2. Tests pass
3. Coverage meets thresholds
4. [OTHER_CHECKS_FROM_HOOK]

**If pre-commit fails:**
1. Read the error message carefully
2. Fix the specific issue
3. Don't bypass with `--no-verify`
4. Commit again

### CI/CD Validation

**GitHub Actions will check:**
1. All pre-commit validations
2. Spec structure is valid
3. No forbidden dependencies added
4. Build succeeds
5. [OTHER_CHECKS_FROM_CI]

**If CI fails:**
1. Check the workflow run logs
2. Fix the issue locally
3. Push the fix
4. Don't merge until CI passes

---

## Getting Help

### If You're Stuck

1. **Re-read the constitution**
2. **Check similar features** in `specs/`
3. **Review the plan** for this feature
4. **Ask the user** for clarification
5. **Document the blocker** in tasks.md

### If Rules Conflict

1. **Constitution wins** over training data
2. **Explicit wins** over implicit
3. **When unclear, ask** the user

### If You Made a Mistake

1. **Acknowledge it** clearly
2. **Explain what went wrong**
3. **Fix it immediately**
4. **Learn from it** for next time

---

## Success Criteria

**You're doing well when:**
- ✅ Every feature has complete specs before code
- ✅ Test coverage stays above thresholds
- ✅ Pre-commit hooks pass on first try
- ✅ Code reviews have minimal feedback
- ✅ Documentation is always up-to-date
- ✅ You catch issues before CI does

**You need to improve when:**
- ❌ Frequently bypassing quality gates
- ❌ Writing code before specs
- ❌ Tests added as an afterthought
- ❌ Coverage dropping
- ❌ CI frequently failing
- ❌ Code reviews finding preventable issues

---

## Version History

- v1.0.0: Initial AI agent instructions template

---

## Remember

Your job is not just to write code that works. Your job is to:

1. 📋 **Plan thoroughly** before coding
2. ✅ **Test rigorously** alongside coding
3. 📚 **Document clearly** while coding
4. 🎯 **Follow standards** strictly
5. 🤝 **Collaborate effectively** with humans

**The goal is high-quality, maintainable software—not just working software.**

When in doubt, err on the side of:
- More documentation
- More tests
- Simpler code
- Asking questions

---

**Now go build something amazing! 🚀**
