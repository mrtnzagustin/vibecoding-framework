# [Feature Name] - Implementation Checklist

**Feature:** `NNN-feature-name`
**Created:** [DATE]
**Purpose:** Track completion of all implementation requirements

**Spec:** See `spec.md` | **Plan:** See `plan.md` | **Tasks:** See `tasks.md`

---

## How to Use This Checklist

1. **Check off items** as you complete them: `- [ ]` → `- [x]`
2. **Add notes** under any item if needed
3. **Link to commits** or PRs for reference
4. **Update regularly** to track progress

**Note:** This is a supplementary checklist. Primary task tracking is in `tasks.md`.

---

## Pre-Implementation

### Documentation Review

- [ ] Read `.specify/memory/constitution.md`
- [ ] Read `spec.md` for this feature
- [ ] Read `plan.md` for this feature
- [ ] Understand all user stories and acceptance criteria
- [ ] Reviewed similar features for patterns

**Notes:**
- [Any observations or questions]

---

### Environment Setup

- [ ] Feature branch created (`NNN-feature-name`)
- [ ] Development environment configured
- [ ] Database migrations ready
- [ ] Test environment configured
- [ ] All dependencies installed

**Notes:**
- [Any setup issues or deviations]

---

## Implementation

### Phase 1: Setup

- [ ] Project structure created
- [ ] Configuration files set up
- [ ] Database migrations written
- [ ] Database migrations applied
- [ ] Initial files scaffolded

**Notes:**
- [Progress notes]

---

### Phase 2: Foundation

- [ ] Entity models created
- [ ] DTOs created and validated
- [ ] Repositories implemented
- [ ] Base services created
- [ ] Authentication/authorization set up
- [ ] Error handling implemented
- [ ] Logging configured

**Foundation Tests:**
- [ ] Entity validation tests
- [ ] DTO validation tests
- [ ] Repository unit tests
- [ ] Repository integration tests
- [ ] Service unit tests

**Coverage:** `____%` (Target: `____%`)

**Notes:**
- [Implementation notes]

---

### Phase 3: User Story 1 - [Story Name]

**Priority:** P1

**As a** [user], **I want** [goal], **so that** [benefit]

#### Implementation

- [ ] Tests written (TDD)
- [ ] Controller/endpoint implemented
- [ ] Service logic implemented
- [ ] Validation added
- [ ] Error handling added
- [ ] Logging added

#### Testing

- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing complete

#### Acceptance Criteria

- [ ] Criterion 1: [From spec.md]
- [ ] Criterion 2: [From spec.md]
- [ ] Criterion 3: [From spec.md]

**Coverage:** `____%` (Target: `____%`)

**Notes:**
- [User story notes]

---

### Phase 4: User Story 2 - [Story Name]

**Priority:** P1/P2

[Repeat structure from User Story 1]

---

### Phase N: Additional User Stories

[Add sections for each user story]

---

## Integration & Testing

### Full Test Suite

- [ ] All unit tests pass
- [ ] All integration tests pass
- [ ] End-to-end tests pass (if applicable)
- [ ] No test failures
- [ ] No flaky tests

**Test Results:**
```
Total Tests: ___
Passing: ___
Failing: ___
Skipped: ___
Duration: ___ seconds
```

**Notes:**
- [Test issues or observations]

---

### Coverage Verification

**Coverage Thresholds (from constitution):**
- [ ] Statements: `____%` / `____%` target
- [ ] Branches: `____%` / `____%` target
- [ ] Functions: `____%` / `____%` target
- [ ] Lines: `____%` / `____%` target

**Uncovered Areas:**
- [List any intentionally uncovered code with justification]

**Notes:**
- [Coverage notes]

---

### Quality Checks

- [ ] Linting passes
- [ ] Type checking passes (if applicable)
- [ ] Build succeeds
- [ ] No compiler warnings
- [ ] No security vulnerabilities

**Command Results:**
```bash
npm run lint     # [✓ / ✗]
npm run typecheck # [✓ / ✗]
npm run build    # [✓ / ✗]
```

**Notes:**
- [Quality check notes]

---

### Security Review

- [ ] All user inputs validated
- [ ] SQL injection prevented (parameterized queries)
- [ ] XSS prevented (output encoding)
- [ ] CSRF protection (if applicable)
- [ ] Authentication required where needed
- [ ] Authorization checked properly
- [ ] Rate limiting implemented (if applicable)
- [ ] No secrets in code
- [ ] Sensitive data encrypted
- [ ] Error messages don't leak information

**Security Scan Results:**
- Tool used: [Tool name]
- Vulnerabilities found: [Number or "None"]
- Resolved: [Yes/No]

**Notes:**
- [Security notes]

---

### Performance Testing

**Performance Targets (from spec.md):**

- [ ] Response time < `___ms` for `___%` of requests
- [ ] Handles `___` concurrent users
- [ ] Throughput: `___` requests/second
- [ ] Database queries optimized
- [ ] No N+1 query problems
- [ ] Appropriate caching implemented

**Load Test Results:**
```
Concurrent Users: ___
Requests/Second: ___
Avg Response Time: ___ ms
95th Percentile: ___ ms
99th Percentile: ___ ms
Errors: ___
```

**Notes:**
- [Performance notes]

---

## Documentation

### Code Documentation

- [ ] Inline comments for complex logic
- [ ] JSDoc/docstrings for public APIs
- [ ] TODOs removed or converted to tickets
- [ ] No commented-out code
- [ ] Clear function/method names

**Documentation Coverage:**
- Public APIs: `____%` documented
- Complex logic: All explained

**Notes:**
- [Documentation notes]

---

### External Documentation

- [ ] README.md updated
- [ ] API documentation generated
- [ ] Usage examples added
- [ ] Configuration options documented
- [ ] Migration guide (if breaking changes)

**Documentation Updates:**
- Files modified: [List files]
- New examples added: [Count]

**Notes:**
- [External doc notes]

---

### Spec Files Updated

- [ ] spec.md reflects final implementation
- [ ] plan.md matches actual architecture
- [ ] tasks.md all marked complete
- [ ] Deviations from plan documented
- [ ] Lessons learned added

**Changes Made:**
- [List significant changes from original spec]

**Notes:**
- [Spec update notes]

---

## Pre-Commit Verification

### Local Validation

- [ ] Spec files exist (`spec.md`, `plan.md`, `tasks.md`)
- [ ] Spec files are non-empty
- [ ] Tests pass: `npm test`
- [ ] Coverage meets thresholds: `npm run test:coverage`
- [ ] Linting passes: `npm run lint`
- [ ] Build succeeds: `npm run build`

**Dry Run:**
```bash
git add .
git commit --dry-run
```
Result: [✓ / ✗]

**Notes:**
- [Pre-commit notes]

---

### Constitution Compliance

- [ ] Tech stack adhered to
- [ ] No forbidden dependencies
- [ ] Testing requirements met
- [ ] Documentation requirements met
- [ ] Code quality standards met
- [ ] No prohibited practices used

**Compliance Notes:**
- [Any approved deviations]

---

## Code Review Preparation

### Self-Review

- [ ] Reviewed all changed files
- [ ] No debug code left behind
- [ ] No unnecessary changes
- [ ] Commit messages are clear
- [ ] Commits are logical units

**Files Changed:** `___`
**Lines Added:** `___`
**Lines Removed:** `___`

**Notes:**
- [Self-review notes]

---

### PR Description

- [ ] PR title is descriptive
- [ ] Links to spec files
- [ ] Lists what was implemented
- [ ] Notes any deviations
- [ ] Includes testing summary
- [ ] Screenshots/demos (if applicable)

**PR Link:** [URL when created]

**Notes:**
- [PR notes]

---

## CI/CD Validation

### GitHub Actions

- [ ] Spec validation workflow passed
- [ ] Test workflow passed
- [ ] Build workflow passed
- [ ] No workflow failures

**Workflow Results:**
- Spec Validation: [✓ / ✗]
- Tests: [✓ / ✗]
- Build: [✓ / ✗]

**Notes:**
- [CI/CD notes]

---

## Code Review

### Review Feedback

- [ ] Code review requested
- [ ] Feedback addressed
- [ ] Changes pushed
- [ ] Re-review requested (if needed)
- [ ] Approved

**Reviewers:**
- [Reviewer 1]: [Status]
- [Reviewer 2]: [Status]

**Major Feedback:**
- [Summarize key feedback items]

**Notes:**
- [Review notes]

---

## Deployment

### Pre-Deployment

- [ ] All reviews approved
- [ ] CI/CD passing
- [ ] Merge conflicts resolved
- [ ] Final testing complete
- [ ] Rollback plan documented

**Notes:**
- [Pre-deployment notes]

---

### Post-Deployment

- [ ] Feature deployed to [environment]
- [ ] Smoke tests passed
- [ ] Monitoring configured
- [ ] Alerts set up
- [ ] Documentation published

**Deployment Details:**
- Environment: [staging / production]
- Date: [DATE]
- Version: [VERSION]

**Notes:**
- [Deployment notes]

---

## Success Metrics

### User Adoption (from spec.md)

- [ ] Tracking configured
- [ ] Baseline measured
- [ ] Target: [TARGET from spec]

**Actual Results:** (After 1 week / 1 month)
- [Metric]: [Value]

**Notes:**
- [Adoption notes]

---

### Performance Metrics

- [ ] Response time within targets
- [ ] Error rate acceptable
- [ ] Resource usage normal

**Actual Results:**
- Avg Response Time: `___ ms`
- Error Rate: `___%`
- CPU Usage: `___%`
- Memory Usage: `___ MB`

**Notes:**
- [Performance notes]

---

### Business Impact (from spec.md)

- [ ] Business metric tracking configured
- [ ] Impact measured

**Target:** [TARGET from spec]

**Actual Results:**
- [Metric]: [Value]

**Notes:**
- [Business impact notes]

---

## Lessons Learned

### What Went Well

1. [Item 1]
2. [Item 2]
3. [Item 3]

### What Was Challenging

1. [Challenge 1]: [How resolved]
2. [Challenge 2]: [How resolved]

### What to Do Differently Next Time

1. [Learning 1]
2. [Learning 2]

### Estimates vs Actuals

| Phase | Estimated | Actual | Variance |
|-------|-----------|--------|----------|
| Setup | [X hours] | [Y hours] | [+/- Z%] |
| Foundation | [X hours] | [Y hours] | [+/- Z%] |
| Story 1 | [X hours] | [Y hours] | [+/- Z%] |
| Testing | [X hours] | [Y hours] | [+/- Z%] |
| **Total** | **[X hours]** | **[Y hours]** | **[+/- Z%]** |

**Notes:**
- [Estimation notes]

---

## Sign-Off

- [ ] **Developer:** Feature complete and tested - [NAME] - [DATE]
- [ ] **Code Reviewer:** Code quality approved - [NAME] - [DATE]
- [ ] **QA/Tester:** Testing approved - [NAME] - [DATE]
- [ ] **Product Owner:** Feature approved - [NAME] - [DATE]
- [ ] **Tech Lead:** Ready for production - [NAME] - [DATE]

---

## References

- **Specification:** `specs/NNN-feature-name/spec.md`
- **Plan:** `specs/NNN-feature-name/plan.md`
- **Tasks:** `specs/NNN-feature-name/tasks.md`
- **Constitution:** `.specify/memory/constitution.md`
- **PR:** [LINK]
- **Deployment:** [LINK]

---

## Status

**Overall Progress:** `____%` complete

**Current Phase:** [Phase name]

**Blockers:** [List or "None"]

**Next Steps:**
1. [Next step 1]
2. [Next step 2]

---

**Last Updated:** [DATE] by [NAME]
