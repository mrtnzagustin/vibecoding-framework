# AI Dev Tasks Mode

**AI Dev Tasks** is an optional, feature-level workflow for detailed, AI-driven implementation on top of the VibeCoding + Spec-Kit template.

---

## What is AI Dev Tasks?

AI Dev Tasks mode provides:
- **Fine-grained task breakdown** beyond what's in `specs/NNN-feature-name/tasks.md`
- **Detailed PRD** (Product Requirements Document) for complex features
- **One-task-at-a-time workflow** with strong checkpoints and validation
- **Session-based development** with clear entry/exit points

Think of it as a **working notebook** for implementation details, while `specs/` remains the **source of truth** for what you're building.

---

## When to Use AI Dev Tasks Mode

Use this mode when:
- ✅ Feature is complex with many interdependent parts
- ✅ You want more structure than basic Spec-Kit provides
- ✅ Working with AI and want granular, verifiable progress
- ✅ Need detailed notes for handoffs or future reference

**Don't use** when:
- ❌ Feature is simple (< 5 tasks)
- ❌ You're just fixing a bug
- ❌ High-level Spec-Kit workflow is sufficient

---

## How It Works

### Relationship with Spec-Kit

```
┌─────────────────────────────────────────┐
│  Project Level: Spec-Kit (Required)    │
│                                         │
│  specs/NNN-feature-name/                │
│  ├── spec.md   ← WHAT & WHY            │
│  ├── plan.md   ← HOW (high-level)      │
│  └── tasks.md  ← High-level milestones │
└─────────────────────────────────────────┘
                   ↓
┌─────────────────────────────────────────┐
│  Feature Level: AI Dev Tasks (Optional) │
│                                         │
│  ai-dev/NNN-feature-name/               │
│  ├── prd.md    ← Detailed requirements │
│  └── tasks.md  ← Granular task list    │
└─────────────────────────────────────────┘
```

**Key rules:**
1. **`specs/` is the source of truth** – AI Dev Tasks elaborates, never contradicts
2. **Changes flow both ways** – update `specs/` when implementation reveals new insights
3. **AI Dev Tasks can be deleted** – once feature ships, the work area is disposable

---

## Workflow

### 1. Start from Spec-Kit

Before using AI Dev Tasks, ensure you have:
- [ ] Created `specs/NNN-feature-name/` with spec.md, plan.md, tasks.md
- [ ] High-level requirements are clear
- [ ] Acceptance criteria defined

### 2. Enter AI Dev Tasks Mode

Tell your AI assistant:
> "Work on feature NNN in AI Dev Tasks mode"

The AI will:
1. Create `ai-dev/NNN-feature-name/` directory
2. Generate `prd.md` from the template
3. Generate `tasks.md` with very granular tasks
4. Propose the first task to implement

### 3. Work One Task at a Time

For each task:
1. **Read**: Relevant spec/plan/PRD sections
2. **Plan**: What will change (files, modules, tests)
3. **Implement**: Make minimal changes for this task only
4. **Validate**: Run tests, lint, manual checks
5. **Commit**: Small, focused commit
6. **Update**: Check off task, update docs if needed

### 4. Keep Specs in Sync

Throughout implementation:
- ✅ Mark tasks complete in both `specs/NNN-feature-name/tasks.md` and `ai-dev/NNN-feature-name/tasks.md`
- ✅ Update `spec.md` if requirements changed
- ✅ Update `plan.md` if architecture changed
- ✅ Add notes to `prd.md` for discoveries

### 5. Exit AI Dev Tasks Mode

When feature is complete:
- [ ] All tasks in both `specs/` and `ai-dev/` are checked off
- [ ] Tests passing
- [ ] Docs updated
- [ ] Code reviewed

Optionally:
- Archive `ai-dev/NNN-feature-name/` for reference
- Or delete it (everything important should be in `specs/` or code)

---

## File Structure

### Per-Feature Work Area

```
ai-dev/NNN-feature-name/
├── prd.md     # Detailed Product Requirements Document
└── tasks.md   # Very granular task breakdown
```

### Templates

Use these templates to start new feature work:

- `ai-dev/templates/feature-prd-template.md` – PRD structure
- `ai-dev/templates/feature-tasks-template.md` – Task breakdown format
- `ai-dev/templates/feature-session-checklist.md` – Per-session checklist

---

## AI Instructions

### For AI Assistants

When user requests **"AI Dev Tasks mode"**:

#### Setup Phase
1. Check that `specs/NNN-feature-name/` exists
   - If missing, create it first using Spec-Kit workflow
2. Create `ai-dev/NNN-feature-name/` directory
3. Copy `ai-dev/templates/feature-prd-template.md` → `ai-dev/NNN-feature-name/prd.md`
4. Fill in PRD based on `specs/NNN-feature-name/spec.md` and `plan.md`
5. Copy `ai-dev/templates/feature-tasks-template.md` → `ai-dev/NNN-feature-name/tasks.md`
6. Break down `specs/NNN-feature-name/tasks.md` into very granular steps

#### Implementation Phase
1. **Before each task:**
   - Read PRD + relevant spec/plan sections
   - Propose specific changes (files, functions, tests)
   - Get confirmation if unclear

2. **During task:**
   - Make minimal changes for this task only
   - Write/update tests alongside code
   - Run validation (tests, lint)

3. **After task:**
   - Check off task in `ai-dev/NNN-feature-name/tasks.md`
   - Update `specs/NNN-feature-name/tasks.md` if milestone reached
   - Commit with clear message
   - Suggest next task

#### Quality Gates
- ❌ Never bypass pre-commit hooks
- ❌ Never introduce changes not in PRD without updating it
- ❌ Never commit without tests passing
- ❌ Never work on multiple tasks in parallel

---

## Examples

### Example 1: Simple Feature (No AI Dev Tasks Needed)

**Feature:** Add timestamp to log output

**Spec-Kit only:**
```
specs/015-log-timestamps/
├── spec.md    (1 user story, 2 requirements)
├── plan.md    (modify logger.js, add format function)
└── tasks.md   (3 tasks: setup, implement, test)
```

**Verdict:** This is simple enough for basic Spec-Kit. No need for AI Dev Tasks.

---

### Example 2: Complex Feature (Use AI Dev Tasks)

**Feature:** User authentication with OAuth2 + JWT + refresh tokens

**Spec-Kit:**
```
specs/023-user-authentication/
├── spec.md    (5 user stories, security requirements)
├── plan.md    (architecture, database schema, 4 phases)
└── tasks.md   (12 high-level tasks)
```

**AI Dev Tasks:**
```
ai-dev/023-user-authentication/
├── prd.md     (Detailed OAuth flows, error cases, edge cases)
└── tasks.md   (48 granular tasks broken into sessions)
```

**Why AI Dev Tasks?**
- Many moving parts (OAuth provider, JWT, refresh, logout)
- Security-critical (needs careful step-by-step)
- Multiple integration points
- Benefits from detailed notes

---

## Best Practices

### ✅ DO

- **Keep tasks small**: Each task should be ~15-30 minutes
- **Commit frequently**: After each task completion
- **Update both levels**: Keep `specs/` and `ai-dev/` in sync
- **Run tests always**: Never skip validation
- **Ask questions**: When PRD is unclear, clarify before coding

### ❌ DON'T

- **Skip Spec-Kit**: Always create `specs/` first
- **Let them diverge**: Keep high-level tasks and granular tasks aligned
- **Work ahead**: Stick to one task at a time
- **Keep stale work**: Delete `ai-dev/NNN-feature-name/` after feature ships

---

## Customization

### Adjust Templates

Edit templates in `ai-dev/templates/` to:
- Add project-specific sections to PRD
- Change task breakdown format
- Add custom checklists

### Integrate with Tools

- **GitHub Projects**: Link granular tasks to issues
- **Jira**: Create sub-tasks from `ai-dev/NNN-feature-name/tasks.md`
- **CI/CD**: Run extra validation on `ai-dev/` branches

---

## FAQ

**Q: Is AI Dev Tasks required?**
A: No. It's optional. Use it when you need more structure.

**Q: What if I'm not using AI?**
A: AI Dev Tasks works manually too. It's just more verbose than you might need.

**Q: Can I use AI Dev Tasks without Spec-Kit?**
A: No. Spec-Kit provides the foundation. AI Dev Tasks builds on top.

**Q: Do I commit `ai-dev/` files to git?**
A: Yes, they're useful for review and handoffs. But they can be deleted post-merge.

**Q: What if AI Dev Tasks conflicts with the spec?**
A: The spec wins. Update the PRD to match, or update the spec if requirements changed.

---

## Resources

- **Main README**: `../README.md`
- **Spec-Kit Docs**: `../.specify/README.md`
- **Constitution**: `../.specify/memory/constitution.md`
- **Templates**: `templates/` directory

---

**Ready to try AI Dev Tasks mode?** Pick a complex feature and tell your AI:

> "Work on feature [NNN] in AI Dev Tasks mode"

Happy building! 🚀
