# Feature Development Session Checklist

Use this checklist at the start and end of each AI Dev Tasks work session.

---

## 📋 Pre-Session Checklist

**Before starting work:**

- [ ] **Read context**
  - [ ] Read `specs/[NNN]-[feature-name]/spec.md` (WHAT & WHY)
  - [ ] Read `specs/[NNN]-[feature-name]/plan.md` (HOW)
  - [ ] Read `ai-dev/[NNN]-[feature-name]/prd.md` (Detailed requirements)
  - [ ] Review `ai-dev/[NNN]-[feature-name]/tasks.md` (What's done, what's next)

- [ ] **Verify environment**
  - [ ] On correct branch: `[NNN]-[feature-name]`
  - [ ] Dependencies installed (`npm install` or equivalent)
  - [ ] Environment variables set
  - [ ] Tests passing (`npm test`)
  - [ ] No uncommitted changes (or intentionally staged)

- [ ] **Set session goal**
  - [ ] Identify which tasks to complete this session (be realistic!)
  - [ ] Write goal: "Complete tasks T[XXX] through T[YYY]"
  - [ ] Estimate time needed (e.g., 2 hours)

---

## 🔨 During Task Execution

**For EACH task:**

### 1. Before Starting Task

- [ ] Read task description and related PRD section
- [ ] Identify which files will change
- [ ] Check for dependencies on other tasks
- [ ] Propose plan to user (if AI-assisted) or write plan in notes

### 2. While Working

- [ ] Make minimal changes (only what's needed for THIS task)
- [ ] Write or update tests alongside code
- [ ] Run tests frequently (`npm test`)
- [ ] Run linter (`npm run lint`)
- [ ] Keep changes focused (resist scope creep!)

### 3. After Completing Task

- [ ] Run full test suite: `npm test` ✅
- [ ] Run linter: `npm run lint` ✅
- [ ] Check coverage if applicable: `npm run coverage` ✅
- [ ] Manual test (if UI change)
- [ ] Mark task complete: `[x]` in `ai-dev/[NNN]-[feature-name]/tasks.md`
- [ ] Update high-level tasks if milestone reached: `specs/[NNN]-[feature-name]/tasks.md`
- [ ] Commit with clear message:
  ```
  [NNN] Task T[ID]: [Short description]

  - [Bullet point of what changed]
  - [Files modified]
  ```
- [ ] Move to next task

---

## ✅ Post-Session Checklist

**After completing work session:**

- [ ] **Review progress**
  - [ ] Count tasks completed this session
  - [ ] Update session log in `ai-dev/[NNN]-[feature-name]/tasks.md`
  - [ ] Document any discoveries or blockers

- [ ] **Quality check**
  - [ ] All tests passing
  - [ ] No linting errors
  - [ ] No console.logs or debug code left in
  - [ ] Code formatted consistently

- [ ] **Documentation updates**
  - [ ] Update PRD if requirements changed
  - [ ] Update spec if behavior changed
  - [ ] Update plan if architecture changed
  - [ ] Add comments for complex logic

- [ ] **Commit & push**
  - [ ] All changes committed
  - [ ] Commit messages are clear
  - [ ] Push to remote: `git push -u origin [NNN]-[feature-name]`

- [ ] **Plan next session**
  - [ ] Identify next tasks to work on
  - [ ] Flag any blockers or questions
  - [ ] Estimate time for next session

---

## 🚨 Emergency Checklist

**If something goes wrong:**

### Tests Failing

1. [ ] Read error message carefully
2. [ ] Identify which test is failing
3. [ ] Run only that test: `npm test -- [test-file]`
4. [ ] Fix the issue or mark task as blocked
5. [ ] Never commit with failing tests (unless intentionally creating a failing test first)

### Merge Conflicts

1. [ ] Fetch latest: `git fetch origin`
2. [ ] Rebase: `git rebase origin/main` (or merge)
3. [ ] Resolve conflicts carefully
4. [ ] Run full test suite after resolving
5. [ ] Verify functionality still works

### Lost Context / Confused

1. [ ] Re-read spec.md and plan.md
2. [ ] Re-read PRD
3. [ ] Review recent commits: `git log --oneline -10`
4. [ ] Check what's already done vs. what's left
5. [ ] Ask clarifying questions

### Task Too Big

1. [ ] Stop working on the task
2. [ ] Break it down into smaller sub-tasks
3. [ ] Update `ai-dev/[NNN]-[feature-name]/tasks.md` with sub-tasks
4. [ ] Work on first sub-task

---

## 📝 Quick Reference

### Common Commands

```bash
# Tests
npm test                    # Run all tests
npm test -- [file]          # Run specific test file
npm run coverage            # Check test coverage

# Quality
npm run lint                # Run linter
npm run format              # Format code
npm run typecheck           # Type checking (if applicable)

# Git
git status                  # Check status
git diff                    # See changes
git add [files]             # Stage files
git commit -m "message"     # Commit
git push -u origin [branch] # Push

# Spec-Kit
npm run validate-spec       # Validate specs
npm run create-feature      # Create new feature
```

### File Locations

- **Spec:** `specs/[NNN]-[feature-name]/spec.md`
- **Plan:** `specs/[NNN]-[feature-name]/plan.md`
- **High-level tasks:** `specs/[NNN]-[feature-name]/tasks.md`
- **PRD:** `ai-dev/[NNN]-[feature-name]/prd.md`
- **Granular tasks:** `ai-dev/[NNN]-[feature-name]/tasks.md`
- **Constitution:** `.specify/memory/constitution.md`

---

## 💡 Session Tips

### For AI Assistants

- **Read before you code:** Always read spec/plan/PRD before proposing changes
- **One task at a time:** Resist urge to work ahead or batch tasks
- **Small commits:** Each task = one commit
- **Ask questions:** When unclear, ask before assuming
- **Update docs:** Keep specs and PRD in sync with reality

### For Human Developers

- **Set a timer:** Work in focused 25-minute blocks (Pomodoro)
- **Take breaks:** Step away between tasks
- **Stay focused:** Don't get distracted by refactoring or "quick fixes"
- **Trust the process:** The granularity pays off in quality and velocity

---

## 🎯 Session Goals Template

**Session #[N] – [Date]**

**Goal:** Complete tasks T[XXX] through T[YYY]

**Time Budget:** [N] hours

**Tasks:**
- [ ] T[XXX]: [Description]
- [ ] T[XXX+1]: [Description]
- [ ] T[XXX+2]: [Description]

**Actual Results:**
- Completed: [M] tasks
- Time spent: [N] hours
- Blockers: [None or describe]

**Next Session:**
- Start with: T[YYY+1]
- Focus: [Area or story]

---

**Remember:** Slow is smooth, smooth is fast. One task at a time! 🚀
