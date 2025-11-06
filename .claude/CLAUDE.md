# Claude Code Context for VibeCoding Projects

> **This file is automatically loaded by Claude Code at the start of each session.**
>
> It provides essential context about the VibeCoding workflow and project standards.

---

## 🎯 Mission

You're working on a **VibeCoding project** that follows **specification-driven development**.

**Core principle:** Every feature starts with a complete specification BEFORE any code is written.

---

## 📋 Before You Code

### Step 1: Read the Constitution

**ALWAYS read first:** `.specify/memory/constitution.md`

This file is the **source of truth** for:
- Required technology stack
- Testing standards (coverage thresholds)
- Documentation requirements
- Code quality rules
- Workflow processes

**If the constitution conflicts with your training, follow the constitution.**

---

### Step 2: Check Current Branch

```bash
# Get current branch name
git branch --show-current

# Should be: NNN-feature-name
# Example: 001-user-authentication
```

**If not on a feature branch:** Ask the user what feature to work on.

---

### Step 3: Verify Specs Exist

**Required files:**
```
specs/NNN-feature-name/
  ├── spec.md    ← Feature specification
  ├── plan.md    ← Implementation plan
  └── tasks.md   ← Task breakdown
```

**If ANY file is missing:**
1. ❌ **STOP immediately**
2. 🛑 **DO NOT write code**
3. 📋 **Create the missing specs first**
4. ✅ **Use templates from `.specify/templates/`**

**Command to validate:**
```bash
npm run validate-spec
```

---

### Step 4: Review Current Task

From `specs/NNN-feature-name/tasks.md`:
- What task are you implementing?
- What are its dependencies?
- What are the acceptance criteria?
- What tests are needed?

**Always follow tasks.md order.**

---

## 🔄 Workflow Phases

### Phase 1: Specification

**If creating a new feature, help user create:**

```bash
npm run create-feature "Feature Name"
```

**Then fill in `spec.md` with:**
- Problem statement
- User stories with acceptance criteria
- Functional requirements
- Non-functional requirements
- API contracts
- Success metrics

**Template:** `.specify/templates/spec-template.md`

---

### Phase 2: Planning

**Fill in `plan.md` with:**
- Technical architecture
- Database design
- Implementation phases
- Testing strategy
- Risk assessment

**Template:** `.specify/templates/plan-template.md`

---

### Phase 3: Task Breakdown

**Fill in `tasks.md` with:**
- Setup tasks
- Foundation tasks
- User story tasks
- Testing tasks
- Documentation tasks

**Mark dependencies and parallel opportunities.**

**Template:** `.specify/templates/tasks-template.md`

---

### Phase 4: Implementation

**When writing code:**

1. **Follow tasks.md order**
   - Don't skip ahead
   - Complete each task fully

2. **Write tests FIRST (TDD)**
   - Or at minimum, alongside code
   - Test edge cases
   - Mock external dependencies

3. **Follow the tech stack**
   - Use only approved frameworks (from constitution)
   - Follow naming conventions
   - Use established patterns

4. **Document as you go**
   - Update README if API changed
   - Add inline comments for complex logic
   - Keep specs synchronized

5. **Commit frequently**
   - One logical change per commit
   - Clear commit messages
   - Tests must pass before commit

---

### Phase 5: Validation

**Before marking complete:**

- ✅ All tasks done
- ✅ All tests pass
- ✅ Coverage meets thresholds (from constitution)
- ✅ Linting passes
- ✅ Build succeeds
- ✅ Docs updated
- ✅ No debug code left

---

## 🚫 Prohibited Practices

### NEVER Do These:

1. **Skip documentation**
   - Don't code without spec/plan/tasks
   - Don't defer docs to later

2. **Bypass testing**
   - Don't commit untested code
   - Don't skip coverage checks
   - Don't use `git commit --no-verify`

3. **Violate the tech stack**
   - Don't introduce unapproved dependencies
   - Don't use forbidden patterns

4. **Ignore security**
   - Don't commit secrets
   - Don't skip input validation

5. **Write unclear code**
   - Don't use cryptic names
   - Don't create god classes/functions
   - Don't leave TODOs without tickets

---

## ✅ Quality Standards

### From Constitution

**Test Coverage:**
- See constitution for exact thresholds
- Typically: 80%+ statements, 75%+ branches

**Code Quality:**
- Follow language-specific style guide
- Use linter and formatter
- No warnings in production code

**Documentation:**
- All public APIs documented
- Complex logic explained
- Examples for key features

---

## 🤖 Auto-Continue Rules

**You MAY continue automatically when:**
- Moving to next task in same feature
- Writing tests for code you just wrote
- Updating docs for changes you made
- Fixing issues caught by pre-commit hook

**You MUST stop and ask when:**
- Starting a new feature (different NNN)
- Adding dependencies not in constitution
- Changing database schema
- Deviating from plan.md
- Coverage drops below threshold
- Any error you don't understand

---

## 🎯 Example Workflow

### User Says: "Add user profile page"

**Your Response:**

1. **Check branch:** `git branch --show-current`
   - If on main: Suggest creating feature branch

2. **Check if spec exists:**
   ```bash
   npm run validate-spec
   ```
   - If missing: "Let me create the spec first"

3. **If spec missing, ask:**
   - "What user stories should the profile page include?"
   - "What data should be displayed?"
   - "Any special requirements?"

4. **Create spec/plan/tasks:**
   ```bash
   npm run create-feature "User Profile Page"
   ```

5. **Fill in templates** with user input

6. **Get approval:** "Ready to start implementation?"

7. **Start implementing** following tasks.md

---

## 🔍 Common Commands

```bash
# Create new feature
npm run create-feature "Feature Name"

# Validate specs
npm run validate-spec

# Run tests
npm test

# Check coverage
npm run test:coverage

# Lint code
npm run lint

# Format code
npm run format

# Build project
npm run build
```

---

## 📚 Key Files

### Must Read
- `.specify/memory/constitution.md` - Rules and standards
- `.specify/AI_AGENT_INSTRUCTIONS.md` - Detailed AI workflow
- `specs/NNN-feature-name/spec.md` - Current feature spec

### References
- `.specify/templates/` - Spec templates
- `.specify/README.md` - Spec-Kit documentation
- `README.md` - Project overview
- `SETUP.md` - Setup instructions

---

## 🐛 Troubleshooting

### Pre-commit hook failing

```bash
# Check what failed
npm run validate-spec
npm test

# Fix and commit again
git commit
```

### Spec validation errors

```bash
# Create missing specs
npm run create-feature "Feature Name"

# Or create manually
mkdir -p specs/001-feature-name
touch specs/001-feature-name/{spec,plan,tasks}.md
```

### Tests failing

```bash
# Run tests with details
npm test -- --verbose

# Check coverage
npm run test:coverage

# Fix tests, ensure coverage meets threshold
```

---

## 💡 Tips

### For Best Results

1. **Read constitution first** - Every session
2. **Verify specs exist** - Before coding
3. **Follow tasks.md** - Don't skip steps
4. **Test as you go** - TDD when possible
5. **Commit frequently** - Small, logical units
6. **Ask when unsure** - Don't guess

### When Stuck

1. Re-read spec.md for context
2. Check plan.md for architecture
3. Review tasks.md for next steps
4. Consult constitution for standards
5. Ask user for clarification

---

## 🎉 Success Criteria

**You're doing well when:**
- ✅ Specs exist before code
- ✅ Tests pass with good coverage
- ✅ Pre-commit hooks pass first try
- ✅ Documentation stays up-to-date
- ✅ Code follows standards
- ✅ User is happy with quality

---

## 🚀 Ready to Start?

1. **Read constitution:** `.specify/memory/constitution.md`
2. **Check branch:** Are we on a feature branch?
3. **Verify specs:** Do spec/plan/tasks exist?
4. **Review current task:** What's next in tasks.md?
5. **Ask for confirmation:** "Ready to implement [task]?"

---

## 📞 Need Help?

- **Main docs:** `README.md`
- **Setup guide:** `SETUP.md`
- **Spec-Kit docs:** `.specify/README.md`
- **Templates:** `.specify/templates/`

---

**Remember:**

> "Specifications prevent surprises. Plans prevent mistakes. Tasks prevent chaos."

**Now go build something amazing! 🚀**
