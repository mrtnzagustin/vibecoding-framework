# Task Breakdown: [Feature Name]

**Feature Branch:** `NNN-feature-name`
**Created:** [DATE]
**Status:** `[NOT_STARTED / IN_PROGRESS / COMPLETE]`
**Specification:** See `spec.md`
**Plan:** See `plan.md`

---

## Task Naming Convention

**Format:** `[ID] [Flags] Description`

**Flags:**
- `[P]` = Can be done in **Parallel** with other `[P]` tasks in same phase
- `[Story N]` = Related to user story N from spec.md
- `[BLOCKED]` = Cannot proceed (explain blocker)

**Examples:**
- `[001] [P] Set up project structure` (parallel with other setup)
- `[015] [Story 1] Create user login endpoint`
- `[023] [P] [Story 2] Add dashboard API` (parallel within story)
- `[030] [BLOCKED] Deploy to staging` (blocked by infra team)

---

## Execution Strategy

### Sequential Phases

**Phases execute in order:**
1. Phase 1: Setup (everything needed to start coding)
2. Phase 2: Foundation (core infrastructure needed by all stories)
3. Phase 3-N: User Stories (one phase per story, prioritized P1 → P2 → P3)
4. Phase N+1: Final Testing & Documentation

### Parallel Opportunities

**Within each phase:**
- Tasks marked `[P]` can run in parallel (if team has capacity)
- Tasks without `[P]` must be done sequentially
- Dependencies always override parallelization

**User stories:**
- Can be implemented in parallel by different developers
- Must be independently testable
- Integration happens after individual validation

---

## Phase 1: Setup & Configuration

**Goal:** Prepare environment for implementation

**Estimated Duration:** [X hours]

---

### [001] [P] Create feature branch

**Description:**
Create branch `NNN-feature-name` from main

**Commands:**
```bash
git checkout main
git pull origin main
git checkout -b NNN-feature-name
```

**Acceptance:**
- ✅ Branch created
- ✅ Branch name follows convention
- ✅ Pushed to remote

**Dependencies:** None

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [002] [P] Set up directory structure

**Description:**
Create folders for this feature's code

**Structure:**
```
src/
  [feature-name]/
    ├── controllers/
    ├── services/
    ├── repositories/
    ├── dto/
    ├── entities/
    └── [feature-name].module.ts

tests/
  [feature-name]/
    ├── unit/
    └── integration/
```

**Acceptance:**
- ✅ Folders created
- ✅ Structure follows project conventions
- ✅ Empty index files added where needed

**Dependencies:** [001]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [003] [P] Install new dependencies

**Description:**
Install any new packages needed for this feature

**Packages:**
```bash
npm install [package-1] [package-2]
npm install --save-dev [test-package]
```

**Justification:**
[Why each package is needed - reference plan.md]

**Acceptance:**
- ✅ Dependencies installed
- ✅ package.json updated
- ✅ package-lock.json committed
- ✅ No security vulnerabilities

**Dependencies:** None (can run parallel)

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [004] [P] Configure test environment

**Description:**
Set up test configuration for this feature

**Tasks:**
- Add test database configuration
- Create test fixtures/factories
- Set up test utilities
- Configure coverage thresholds

**Acceptance:**
- ✅ Test command runs (even with no tests)
- ✅ Test database configured
- ✅ Coverage reports generated

**Dependencies:** [003]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [005] Create database migration

**Description:**
Create migration for new database schema

**Migration File:** `migrations/TIMESTAMP_create_[tables].sql`

**Tables to Create:**
- [table_1]: [columns from plan.md]
- [table_2]: [columns from plan.md]

**Acceptance:**
- ✅ Migration file created
- ✅ Migration runs successfully (up)
- ✅ Migration can be rolled back (down)
- ✅ Schema matches plan.md

**Dependencies:** None (sequential)

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [006] Run migration

**Description:**
Apply migration to development database

**Commands:**
```bash
npm run migration:run
# or your ORM's migration command
```

**Acceptance:**
- ✅ Migration applied successfully
- ✅ Tables exist in database
- ✅ Schema verified
- ✅ Can query new tables

**Dependencies:** [005]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

## Phase 2: Foundation

**Goal:** Build core infrastructure used by all user stories

**Estimated Duration:** [X hours]

**Note:** These tasks MUST be complete before ANY user story can be implemented.

---

### [007] Create entity models

**Description:**
Create ORM entities for database tables

**Files:**
- `src/[feature]/entities/[entity-1].entity.ts`
- `src/[feature]/entities/[entity-2].entity.ts`

**Requirements:**
- Match database schema exactly
- Include validation decorators
- Define relationships
- Add indexes

**Example:**
```typescript
@Entity('table_name')
export class EntityName {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 100 })
  name: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
```

**Acceptance:**
- ✅ All entities created
- ✅ Entities match schema
- ✅ Relationships defined
- ✅ Validation rules added

**Testing:**
- Unit test: Entity creation and validation

**Dependencies:** [006]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [008] Create DTOs

**Description:**
Create Data Transfer Objects for API requests/responses

**Files:**
- `src/[feature]/dto/create-[entity].dto.ts`
- `src/[feature]/dto/update-[entity].dto.ts`
- `src/[feature]/dto/[entity]-response.dto.ts`

**Requirements:**
- Validation decorators
- Transform decorators
- OpenAPI annotations
- Match API spec from spec.md

**Example:**
```typescript
export class CreateEntityDto {
  @IsString()
  @Length(3, 100)
  name: string;

  @IsNumber()
  @Min(0)
  value: number;
}
```

**Acceptance:**
- ✅ All DTOs created
- ✅ Validation rules match spec
- ✅ Types are correct
- ✅ API documentation generated

**Testing:**
- Unit test: DTO validation

**Dependencies:** None (can be parallel with [007])

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [009] Create repositories

**Description:**
Create repository classes for data access

**Files:**
- `src/[feature]/repositories/[entity].repository.ts`

**Methods Needed:**
- findAll(filters?)
- findById(id)
- create(data)
- update(id, data)
- delete(id)
- [custom queries from spec]

**Example:**
```typescript
@Injectable()
export class EntityRepository {
  constructor(
    @InjectRepository(Entity)
    private repo: Repository<Entity>
  ) {}

  async findAll(): Promise<Entity[]> {
    return this.repo.find();
  }

  async findById(id: number): Promise<Entity | null> {
    return this.repo.findOne({ where: { id } });
  }

  // ... other methods
}
```

**Acceptance:**
- ✅ All repositories created
- ✅ All CRUD methods implemented
- ✅ Custom queries implemented
- ✅ Error handling added

**Testing:**
- Unit test: Repository methods with mocked ORM
- Integration test: Repository with real test database

**Dependencies:** [007]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [010] Create base service

**Description:**
Create service class with shared business logic

**File:** `src/[feature]/services/[feature].service.ts`

**Responsibilities:**
- Business logic validation
- Orchestrate repository calls
- Handle transactions
- Format responses

**Acceptance:**
- ✅ Service class created
- ✅ Injected with repositories
- ✅ Error handling added
- ✅ Logging added

**Testing:**
- Unit test: Service methods with mocked repositories

**Dependencies:** [009]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [011] Set up authentication/authorization

**Description:**
Configure auth for this feature's endpoints

**Tasks:**
- Create auth guard
- Create role decorator
- Add permission checks
- Set up JWT validation

**Acceptance:**
- ✅ Auth guard created
- ✅ Can protect endpoints
- ✅ Roles can be checked
- ✅ Unauthorized requests rejected

**Testing:**
- Unit test: Guard logic
- Integration test: Protected endpoints

**Dependencies:** None (foundation task)

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [012] Create error handling

**Description:**
Set up consistent error responses

**Tasks:**
- Create custom exception classes
- Create exception filter
- Format error responses
- Add error codes

**Error Format:**
```json
{
  "success": false,
  "error": "Human readable message",
  "code": "ERROR_CODE",
  "details": ["Field error 1", "Field error 2"]
}
```

**Acceptance:**
- ✅ Exception classes created
- ✅ Exception filter configured
- ✅ Consistent error format
- ✅ Error codes documented

**Testing:**
- Unit test: Exception handling

**Dependencies:** None (foundation task)

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

## Phase 3: User Story 1 - [Story Name]

**Priority:** P1

**From spec.md:**
> As a [user], I want [goal], so that [benefit]

**Estimated Duration:** [X hours]

**Acceptance Criteria:**
1. [Criterion 1 from spec.md]
2. [Criterion 2 from spec.md]
3. [Criterion 3 from spec.md]

---

### [013] [Story 1] Write tests for [functionality]

**Description:**
Write tests BEFORE implementing (TDD approach)

**Test Files:**
- `tests/[feature]/unit/[component].test.ts`
- `tests/[feature]/integration/[endpoint].test.ts`

**Test Cases:**
- ✅ Happy path: [scenario]
- ✅ Error case: [scenario]
- ✅ Edge case: [scenario]
- ✅ Validation: [scenario]

**Acceptance:**
- ✅ All test cases written
- ✅ Tests fail (no implementation yet)
- ✅ Tests are clear and readable

**Dependencies:** Phase 2 complete

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [014] [Story 1] Implement [component/endpoint]

**Description:**
Implement the actual functionality

**Files Modified:**
- `src/[feature]/controllers/[controller].ts`
- `src/[feature]/services/[service].ts`

**Implementation:**
- Add controller endpoint
- Implement service method
- Add validation
- Handle errors
- Add logging

**Acceptance:**
- ✅ Functionality implemented
- ✅ All tests pass
- ✅ Code follows conventions
- ✅ Error handling works

**Dependencies:** [013]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [015] [Story 1] Verify acceptance criteria

**Description:**
Manually verify each acceptance criterion from spec.md

**Checklist:**
- [ ] Criterion 1: [Test manually how]
- [ ] Criterion 2: [Test manually how]
- [ ] Criterion 3: [Test manually how]

**Acceptance:**
- ✅ All criteria met
- ✅ Feature works end-to-end
- ✅ Edge cases handled
- ✅ Error messages clear

**Dependencies:** [014]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [016] [Story 1] Update documentation

**Description:**
Document the implemented feature

**Files to Update:**
- README.md: Add usage example
- API docs: Document new endpoints
- Inline comments: Complex logic

**Acceptance:**
- ✅ README updated
- ✅ API docs generated
- ✅ Comments added
- ✅ Examples provided

**Dependencies:** [015]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

## Phase 4: User Story 2 - [Story Name]

**Priority:** P1/P2

**From spec.md:**
> As a [user], I want [goal], so that [benefit]

**Estimated Duration:** [X hours]

**Acceptance Criteria:**
1. [Criterion 1 from spec.md]
2. [Criterion 2 from spec.md]

---

### [017] [Story 2] Write tests for [functionality]

[Same structure as Story 1]

**Dependencies:** Phase 3 complete (or Story 1 complete if independent)

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [018] [Story 2] Implement [component/endpoint]

[Same structure as Story 1]

**Dependencies:** [017]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [019] [Story 2] Verify acceptance criteria

[Same structure as Story 1]

**Dependencies:** [018]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [020] [Story 2] Update documentation

[Same structure as Story 1]

**Dependencies:** [019]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

## Phase 5: User Story 3 - [Story Name]

[Repeat structure for each remaining user story]

---

## Phase N: Integration & Final Testing

**Goal:** Ensure all stories work together correctly

**Estimated Duration:** [X hours]

---

### [N01] Run full test suite

**Description:**
Execute all tests across entire feature

**Commands:**
```bash
npm test
npm run test:coverage
```

**Acceptance:**
- ✅ All tests pass
- ✅ No test failures
- ✅ No test timeouts

**Dependencies:** All user stories complete

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N02] Verify coverage thresholds

**Description:**
Ensure test coverage meets minimum from constitution

**Thresholds (from constitution):**
- Statements: [X]%
- Branches: [X]%
- Functions: [X]%
- Lines: [X]%

**Commands:**
```bash
npm run test:coverage
```

**Acceptance:**
- ✅ Coverage meets all thresholds
- ✅ Coverage report generated
- ✅ No uncovered critical paths

**Dependencies:** [N01]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N03] Integration testing

**Description:**
Test complete user journeys end-to-end

**Scenarios:**
- [ ] Happy path: User completes main workflow
- [ ] Error path: Invalid input handled gracefully
- [ ] Edge case: [Specific edge case]
- [ ] Performance: Feature responds in < [X]ms

**Acceptance:**
- ✅ All scenarios pass
- ✅ No integration issues found
- ✅ User experience smooth

**Dependencies:** [N01]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N04] Security review

**Description:**
Verify security requirements are met

**Checklist:**
- [ ] All inputs validated
- [ ] SQL injection prevented (parameterized queries)
- [ ] XSS prevented (output encoding)
- [ ] Authentication required where needed
- [ ] Authorization checked properly
- [ ] No secrets in code
- [ ] Error messages don't leak sensitive info

**Acceptance:**
- ✅ All security checks pass
- ✅ No vulnerabilities found
- ✅ Follows security best practices

**Dependencies:** [N03]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N05] Performance testing

**Description:**
Verify performance requirements from spec.md

**Metrics:**
- Response time: < [X]ms
- Throughput: [N] requests/second
- Database query time: < [Y]ms

**Load Testing:**
```bash
# Example with k6 or artillery
npm run load-test
```

**Acceptance:**
- ✅ Meets response time targets
- ✅ Handles expected load
- ✅ No memory leaks
- ✅ Database queries optimized

**Dependencies:** [N03]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

## Phase N+1: Documentation & Cleanup

**Goal:** Complete all documentation and prepare for merge

**Estimated Duration:** [X hours]

---

### [N11] Update README.md

**Description:**
Document the new feature in project README

**Sections to Update:**
- [ ] Features list
- [ ] API endpoints (if public)
- [ ] Configuration options
- [ ] Usage examples
- [ ] Migration guide (if breaking changes)

**Acceptance:**
- ✅ README accurately reflects changes
- ✅ Examples work
- ✅ Clear and concise

**Dependencies:** All implementation complete

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N12] Generate API documentation

**Description:**
Generate/update API documentation

**Tools:**
- Swagger/OpenAPI
- JSDoc/TSDoc
- [Your doc tool]

**Acceptance:**
- ✅ All endpoints documented
- ✅ Request/response examples included
- ✅ Error codes documented
- ✅ Authentication requirements clear

**Dependencies:** [N11]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N13] Code cleanup

**Description:**
Remove debug code, TODOs, and clean up

**Checklist:**
- [ ] Remove console.log statements
- [ ] Remove commented code
- [ ] Remove TODO comments (or create tickets)
- [ ] Remove unused imports
- [ ] Remove unused variables
- [ ] Format code consistently

**Commands:**
```bash
npm run lint
npm run format
```

**Acceptance:**
- ✅ No debug code left
- ✅ Code formatted consistently
- ✅ Linting passes
- ✅ No warnings

**Dependencies:** [N12]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N14] Update spec files

**Description:**
Ensure spec.md, plan.md, tasks.md reflect reality

**Updates Needed:**
- [ ] spec.md: Any scope changes documented
- [ ] plan.md: Architecture matches implementation
- [ ] tasks.md: All tasks marked complete
- [ ] Add "lessons learned" section

**Acceptance:**
- ✅ Specs match implementation
- ✅ No outdated information
- ✅ Deviations documented

**Dependencies:** [N13]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N15] Pre-commit verification

**Description:**
Verify pre-commit hooks will pass

**Checks:**
- [ ] Spec files exist and non-empty
- [ ] All tests pass
- [ ] Coverage meets thresholds
- [ ] Linting passes
- [ ] Build succeeds

**Commands:**
```bash
# Manually run what pre-commit hook does
npm run validate-spec
npm test
npm run test:coverage
npm run lint
npm run build
```

**Acceptance:**
- ✅ All checks pass
- ✅ Ready to commit
- ✅ Pre-commit hook will succeed

**Dependencies:** [N14]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

### [N16] Create pull request

**Description:**
Open PR for code review

**PR Description Template:**
```markdown
## Feature: [Feature Name]

**Spec:** specs/NNN-feature-name/spec.md

### What was implemented
- [User Story 1]: [Brief description]
- [User Story 2]: [Brief description]

### Testing
- [X] Unit tests (coverage: XX%)
- [X] Integration tests
- [X] Manual testing complete

### Checklist
- [X] All acceptance criteria met
- [X] Tests passing
- [X] Documentation updated
- [X] No breaking changes (or documented)

### Notes
[Any important context for reviewers]
```

**Acceptance:**
- ✅ PR created
- ✅ Description complete
- ✅ CI/CD running
- ✅ Ready for review

**Dependencies:** [N15]

**Status:** [ ] Not Started / [ ] In Progress / [ ] Complete

---

## Task Summary

**Total Tasks:** [N]

**By Phase:**
- Phase 1 (Setup): [N] tasks
- Phase 2 (Foundation): [N] tasks
- Phase 3-N (User Stories): [N] tasks
- Final Testing: [N] tasks
- Documentation: [N] tasks

**Estimated Total Duration:** [X hours/days]

---

## Progress Tracking

**Overall Status:** [X / N] tasks complete ([Y]%)

**Current Phase:** [Phase name]

**Blockers:** [List any blockers or "None"]

**Notes:** [Any important observations during implementation]

---

## Lessons Learned

*[Update this section as you work]*

**What went well:**
- [Item 1]
- [Item 2]

**What was challenging:**
- [Challenge 1]: [How it was resolved]
- [Challenge 2]: [How it was resolved]

**What would we do differently:**
- [Learning 1]
- [Learning 2]

**Underestimated tasks:**
- [Task ID]: Estimated [X], actual [Y]

**Overestimated tasks:**
- [Task ID]: Estimated [X], actual [Y]

---

## References

- **Specification:** `spec.md` in this directory
- **Plan:** `plan.md` in this directory
- **Constitution:** `.specify/memory/constitution.md`
- **Templates:** `.specify/templates/`

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | [DATE] | [AUTHOR] | Initial task breakdown |
| 1.1 | [DATE] | [AUTHOR] | [Updates made] |

---

**Ready to start? Begin with Phase 1, Task [001]! 🚀**
