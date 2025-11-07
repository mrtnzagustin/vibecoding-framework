# [NNN] [Feature Name] – Granular Task Breakdown

**Feature Number:** [NNN]
**Feature Name:** [Feature Name]
**Created:** [DATE]
**Last Updated:** [DATE]

---

## Overview

This document contains the **very granular** task breakdown for implementing this feature. Each task should be small enough to complete in ~15-30 minutes.

**Related Files:**
- **Spec:** `specs/[NNN]-[feature-name]/spec.md`
- **Plan:** `specs/[NNN]-[feature-name]/plan.md`
- **High-Level Tasks:** `specs/[NNN]-[feature-name]/tasks.md`
- **PRD:** `ai-dev/[NNN]-[feature-name]/prd.md`

---

## Task Guidelines

### Task Size
- Each task should be **15-30 minutes** of focused work
- If a task feels too big, break it down further
- One task = one small commit

### Task Format
```
- [ ] [ID] Task description (files: file1.js, file2.js)
```

### Status Tracking
- `[ ]` = Not started
- `[x]` = Complete
- `[~]` = In progress
- `[!]` = Blocked

### Dependencies
Mark dependencies: `(depends on: T001, T002)`

---

## Session Plan

**Estimated Total:** [N] tasks, [M] sessions

Break work into logical sessions (e.g., 2-3 hours each):

- **Session 1:** Tasks T001-T008 (Setup & foundation)
- **Session 2:** Tasks T009-T016 (User story 1)
- **Session 3:** Tasks T017-T024 (User story 2)
- **Session 4:** Tasks T025-T032 (Testing & docs)

---

## Phase 0: Setup & Prerequisites

**Goal:** Prepare environment and verify dependencies

- [ ] **T000** Read and understand spec.md, plan.md, and prd.md
- [ ] **T001** Verify all required dependencies are installed (files: package.json)
- [ ] **T002** Create branch: `[NNN]-[feature-name]` if not exists
- [ ] **T003** Set up feature flag or config (files: config.js, .env.example)
- [ ] **T004** Create placeholder files/directories (files: [list])
- [ ] **T005** Write first passing test (files: [feature].test.js)

**Checkpoint:** All setup tasks complete, test suite passing ✅

---

## Phase 1: Foundation

**Goal:** Build core infrastructure and data layer

### Data Models

- [ ] **T010** Define [Model1] schema/interface (files: models/model1.js)
- [ ] **T011** Add validation for [Model1] (files: models/model1.js)
- [ ] **T012** Write unit tests for [Model1] validation (files: models/model1.test.js)
- [ ] **T013** Define [Model2] schema/interface (files: models/model2.js)
- [ ] **T014** Add validation for [Model2] (files: models/model2.js)
- [ ] **T015** Write unit tests for [Model2] validation (files: models/model2.test.js)

### Database / Storage

- [ ] **T020** Create database migration for [table/collection] (files: migrations/001_*.sql)
- [ ] **T021** Add indexes for performance (files: migrations/001_*.sql)
- [ ] **T022** Create seed data for development (files: seeds/001_*.sql)
- [ ] **T023** Write database integration tests (files: db/[feature].test.js)

### Core Services / Business Logic

- [ ] **T030** Create [Service1] with basic structure (files: services/service1.js)
- [ ] **T031** Implement [Service1.method1] (files: services/service1.js)
- [ ] **T032** Write tests for [Service1.method1] (files: services/service1.test.js)
- [ ] **T033** Implement [Service1.method2] (files: services/service1.js)
- [ ] **T034** Write tests for [Service1.method2] (files: services/service1.test.js)

**Checkpoint:** Foundation complete, all tests passing ✅

---

## Phase 2: User Story 1 – [Story Title]

**Goal:** [What this story accomplishes]

**Acceptance Criteria:** (from prd.md)
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

### Backend / API

- [ ] **T100** Create API endpoint: `[METHOD] /api/[path]` (files: routes/[feature].js)
- [ ] **T101** Add request validation middleware (files: middleware/validate[Feature].js)
- [ ] **T102** Implement main handler logic (files: handlers/[feature].js)
- [ ] **T103** Add error handling (files: handlers/[feature].js)
- [ ] **T104** Write API integration tests (files: api/[feature].test.js)
- [ ] **T105** Test error cases (files: api/[feature].test.js)

### Frontend / UI (if applicable)

- [ ] **T110** Create [Component] component (files: components/[Component].jsx)
- [ ] **T111** Add props and state management (files: components/[Component].jsx)
- [ ] **T112** Implement UI logic (files: components/[Component].jsx)
- [ ] **T113** Add styling (files: components/[Component].module.css)
- [ ] **T114** Write component tests (files: components/[Component].test.jsx)
- [ ] **T115** Add loading state (files: components/[Component].jsx)
- [ ] **T116** Add error state (files: components/[Component].jsx)
- [ ] **T117** Add empty state (files: components/[Component].jsx)

### Integration

- [ ] **T120** Connect frontend to API (files: api/client.js, components/[Component].jsx)
- [ ] **T121** Add error handling in UI (files: components/[Component].jsx)
- [ ] **T122** Add loading indicators (files: components/[Component].jsx)
- [ ] **T123** Test end-to-end flow manually

**Checkpoint:** User Story 1 complete, acceptance criteria met ✅

---

## Phase 3: User Story 2 – [Story Title]

**Goal:** [What this story accomplishes]

**Acceptance Criteria:** (from prd.md)
- [ ] [Criterion 1]
- [ ] [Criterion 2]

### [Repeat similar structure as Phase 2]

- [ ] **T200** [Task description] (files: [files])
- [ ] **T201** [Task description] (files: [files])
- [ ] **T202** [Task description] (files: [files])
- [ ] **T203** [Task description] (files: [files])

**Checkpoint:** User Story 2 complete, acceptance criteria met ✅

---

## Phase 4: Edge Cases & Error Handling

**Goal:** Handle edge cases and ensure robustness

- [ ] **T300** Handle case: [edge case 1] (files: [files])
- [ ] **T301** Write test for [edge case 1] (files: [test files])
- [ ] **T302** Handle case: [edge case 2] (files: [files])
- [ ] **T303** Write test for [edge case 2] (files: [test files])
- [ ] **T304** Add input validation edge cases (files: [files])
- [ ] **T305** Add timeout handling (files: [files])
- [ ] **T306** Add retry logic for failures (files: [files])
- [ ] **T307** Test network failure scenarios (files: [test files])

**Checkpoint:** Edge cases handled, system is robust ✅

---

## Phase 5: Performance & Optimization

**Goal:** Meet non-functional requirements

- [ ] **T400** Add caching for [resource] (files: [files])
- [ ] **T401** Optimize database queries (files: [files])
- [ ] **T402** Add pagination for [list endpoint] (files: [files])
- [ ] **T403** Lazy load [component/resource] (files: [files])
- [ ] **T404** Run performance benchmarks (files: benchmarks/[feature].js)
- [ ] **T405** Optimize bundle size (check impact)
- [ ] **T406** Profile and fix bottlenecks

**Checkpoint:** Performance targets met ✅

---

## Phase 6: Security & Validation

**Goal:** Ensure security requirements are met

- [ ] **T500** Add authentication checks (files: middleware/auth.js)
- [ ] **T501** Add authorization checks (files: middleware/authz.js)
- [ ] **T502** Sanitize user inputs (files: [files])
- [ ] **T503** Add rate limiting (files: middleware/rateLimit.js)
- [ ] **T504** Validate JWT tokens (files: middleware/auth.js)
- [ ] **T505** Add CSRF protection (files: middleware/csrf.js)
- [ ] **T506** Test security edge cases (files: security/[feature].test.js)
- [ ] **T507** Run security audit (npm audit, or equivalent)

**Checkpoint:** Security requirements met ✅

---

## Phase 7: Testing & Quality Assurance

**Goal:** Achieve comprehensive test coverage

### Unit Tests

- [ ] **T600** Review unit test coverage (target: > 80%)
- [ ] **T601** Write missing unit tests for [module] (files: [test files])
- [ ] **T602** Test all error paths (files: [test files])
- [ ] **T603** Test all edge cases (files: [test files])

### Integration Tests

- [ ] **T610** Write integration test: [scenario 1] (files: integration/[feature].test.js)
- [ ] **T611** Write integration test: [scenario 2] (files: integration/[feature].test.js)
- [ ] **T612** Test database interactions (files: integration/[feature].test.js)
- [ ] **T613** Test external API calls (files: integration/[feature].test.js)

### End-to-End Tests

- [ ] **T620** Write e2e test: [happy path] (files: e2e/[feature].test.js)
- [ ] **T621** Write e2e test: [error path] (files: e2e/[feature].test.js)
- [ ] **T622** Test cross-browser compatibility
- [ ] **T623** Test on different devices (mobile, tablet, desktop)

### Manual Testing

- [ ] **T630** Manual test: [scenario 1]
- [ ] **T631** Manual test: [scenario 2]
- [ ] **T632** Manual test: [scenario 3]
- [ ] **T633** Test accessibility (screen reader, keyboard nav)
- [ ] **T634** Test with real data

**Checkpoint:** All tests passing, coverage > 80% ✅

---

## Phase 8: Documentation & Polish

**Goal:** Ensure everything is documented and production-ready

### Code Documentation

- [ ] **T700** Add JSDoc/docstrings to public APIs (files: [files])
- [ ] **T701** Add inline comments for complex logic (files: [files])
- [ ] **T702** Document configuration options (files: README.md, config.md)
- [ ] **T703** Add TypeScript types (if applicable) (files: [files])

### User Documentation

- [ ] **T710** Update README with new feature (files: README.md)
- [ ] **T711** Add usage examples (files: docs/examples.md)
- [ ] **T712** Update API documentation (files: docs/api.md)
- [ ] **T713** Add troubleshooting guide (files: docs/troubleshooting.md)
- [ ] **T714** Update changelog (files: CHANGELOG.md)

### Polish

- [ ] **T720** Fix linting warnings (files: all)
- [ ] **T721** Format code consistently (files: all)
- [ ] **T722** Remove console.logs and debug code (files: all)
- [ ] **T723** Remove TODO comments (create issues or finish them) (files: all)
- [ ] **T724** Update dependencies to latest stable (files: package.json)
- [ ] **T725** Run full test suite one more time

**Checkpoint:** Documentation complete, code is polished ✅

---

## Phase 9: Code Review & Merge Prep

**Goal:** Prepare for code review and merge

- [ ] **T800** Self-review changes (git diff main)
- [ ] **T801** Verify all acceptance criteria met
- [ ] **T802** Verify all tasks checked off (this file + specs/[NNN]/tasks.md)
- [ ] **T803** Update specs/[NNN]/spec.md if requirements changed
- [ ] **T804** Update specs/[NNN]/plan.md if architecture changed
- [ ] **T805** Squash/clean commit history if needed
- [ ] **T806** Write comprehensive PR description
- [ ] **T807** Request code review
- [ ] **T808** Address review feedback
- [ ] **T809** Get approval and merge

**Checkpoint:** Feature complete, merged to main! 🎉

---

## Blocked Tasks

[List any blocked tasks here with reasons]

- [ ] **T[ID]** [Task] – Blocked by: [reason]

---

## Notes & Discoveries

[Add notes as you work through tasks]

- **[Date]:** [Note about implementation discovery]
- **[Date]:** [Note about challenge faced and solution]

---

## Session Log

Track time spent per session:

| Date | Session | Tasks Completed | Time Spent | Notes |
|------|---------|----------------|------------|-------|
| [DATE] | 1 | T001-T005 | 2h | Setup complete |
| [DATE] | 2 | T010-T015 | 2.5h | Models done |
| [DATE] | 3 | T020-T023 | 1.5h | DB migrations |

---

## Summary

**Total Tasks:** [N]
**Completed:** [M]
**Remaining:** [N-M]
**Progress:** [M/N * 100]%

**Estimated Time Remaining:** [Hours]

---

**Remember:** Work on ONE task at a time. Check it off. Commit. Move to next. Keep it simple!
