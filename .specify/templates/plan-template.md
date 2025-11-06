# Implementation Plan: [Feature Name]

**Feature Branch:** `NNN-feature-name`
**Created:** [DATE]
**Status:** `[DRAFT / IN_PROGRESS / REVIEW / COMPLETE]`
**Specification:** See `spec.md` in this directory

---

## Executive Summary

> Extract from feature spec: primary requirement + technical approach from research

**What:** [One sentence: what are we building?]

**Why:** [One sentence: what problem does it solve?]

**How:** [One sentence: what's the technical approach?]

**Timeline:** [Rough estimate: X days/weeks]

---

## Technical Context

### Tech Stack for This Feature

**Primary Language:**
- Language: [FROM_CONSTITUTION]
- Version: [FROM_CONSTITUTION]

**Framework:**
- Framework: [FROM_CONSTITUTION]
- Version: [FROM_CONSTITUTION]

**Database:**
- Database: [FROM_CONSTITUTION]
- ORM/Driver: [FROM_CONSTITUTION]

**Testing:**
- Test Framework: [FROM_CONSTITUTION]
- Coverage Tool: [FROM_CONSTITUTION]

**Additional Dependencies:**
- [Library 1]: [Version] - [Purpose]
- [Library 2]: [Version] - [Purpose]
- [New dependencies must be justified below]

### New Dependencies Justification

| Dependency | Purpose | Why Needed | Alternatives Considered |
|------------|---------|------------|-------------------------|
| [package-name] | [What it does] | [Why we need it] | [What else was considered and why rejected] |

### Constitution Compliance Check

**Before Phase 0 Research:**
- [ ] Read constitution
- [ ] Confirmed tech stack alignment
- [ ] Identified any deviations
- [ ] Documented exceptions needed

**After Phase 1 Design:**
- [ ] Architecture follows patterns
- [ ] No forbidden dependencies
- [ ] Testing approach approved
- [ ] Documentation plan sound

**Deviations from Constitution:**
[List any deviations and their justifications, or write "None"]

---

## Architecture Overview

### High-Level Design

```
[Create an ASCII diagram or describe the architecture]

Example:
┌─────────────┐
│   Client    │
└──────┬──────┘
       │ HTTP/REST
       ▼
┌─────────────┐
│   API Layer │
│  (Routes)   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Business   │
│    Logic    │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Data Layer │
│   (ORM)     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Database   │
└─────────────┘
```

**Key Components:**

1. **[Component Name]**
   - **Purpose:** [What does it do?]
   - **Responsibilities:** [What is it responsible for?]
   - **Dependencies:** [What does it depend on?]
   - **Technology:** [What tech is used?]

2. **[Component Name]**
   [Repeat for each major component]

### Design Patterns Used

**Pattern 1: [Pattern Name]**
- **Where:** [Which component(s)]
- **Why:** [What problem does it solve]
- **How:** [Brief implementation approach]

**Pattern 2: [Pattern Name]**
[Repeat for each pattern]

### Data Flow

**Primary Flow:**
1. User triggers [action]
2. Request hits [endpoint]
3. Controller validates [input]
4. Service processes [business logic]
5. Repository queries [data]
6. Response returned to user

**Alternative Flows:**
- Error handling path: [Description]
- Background job path: [Description]
- [Other flows]

---

## Database Design

### Schema Changes

#### New Tables

**Table: `[table_name]`**

```sql
CREATE TABLE table_name (
  id SERIAL PRIMARY KEY,
  field1 VARCHAR(100) NOT NULL,
  field2 INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Purpose:** [Why this table exists]

**Columns:**
- `id`: Auto-incrementing primary key
- `field1`: [Description]
- `field2`: [Description]
- `created_at`: Record creation timestamp
- `updated_at`: Record modification timestamp

**Indexes:**
```sql
CREATE INDEX idx_table_field1 ON table_name(field1);
CREATE UNIQUE INDEX idx_table_unique ON table_name(field1, field2);
```

**Relationships:**
- Foreign key to `[other_table]` (many-to-one)
- Referenced by `[another_table]` (one-to-many)

---

#### Modified Tables

**Table: `[existing_table]`**

**Changes:**
```sql
-- Add new column
ALTER TABLE existing_table ADD COLUMN new_field VARCHAR(50);

-- Add index
CREATE INDEX idx_existing_new ON existing_table(new_field);
```

**Impact:** [How this affects existing data]

**Migration Notes:**
- [Any special handling needed]
- [Default values for existing rows]
- [Backfill strategy if needed]

---

### Migrations

**Migration 1: `001_create_table_name.sql`**
```sql
-- Up
CREATE TABLE table_name (...);

-- Down
DROP TABLE table_name;
```

**Migration 2: `002_alter_existing_table.sql`**
```sql
-- Up
ALTER TABLE existing_table ADD COLUMN new_field VARCHAR(50);

-- Down
ALTER TABLE existing_table DROP COLUMN new_field;
```

**Rollback Strategy:**
[How to safely roll back if needed]

### Data Access Layer

**Repository Pattern:**
```[LANGUAGE]
[Show example of how data access will be structured]

// Example for TypeScript/NestJS:
@Injectable()
export class EntityRepository {
  constructor(@InjectRepository(Entity) private repo: Repository<Entity>) {}

  async findAll(): Promise<Entity[]> {
    return this.repo.find();
  }

  async findById(id: number): Promise<Entity | null> {
    return this.repo.findOne({ where: { id } });
  }

  async create(data: CreateEntityDto): Promise<Entity> {
    const entity = this.repo.create(data);
    return this.repo.save(entity);
  }
}
```

**Query Optimization:**
- Use eager loading for [relationships]
- Use pagination for [large datasets]
- Cache [frequently accessed data]
- [Other optimizations]

---

## API Design

### Endpoints Overview

| Method | Path | Purpose | Auth Required |
|--------|------|---------|---------------|
| GET | `/api/v1/resource` | List resources | Yes |
| GET | `/api/v1/resource/:id` | Get single resource | Yes |
| POST | `/api/v1/resource` | Create resource | Yes |
| PUT | `/api/v1/resource/:id` | Update resource | Yes |
| DELETE | `/api/v1/resource/:id` | Delete resource | Yes |

### Request/Response Flow

**Example: Create Resource**

**Request:**
```http
POST /api/v1/resource
Content-Type: application/json
Authorization: Bearer {token}

{
  "name": "Example",
  "value": 123
}
```

**Validation:**
1. Validate JWT token
2. Check user permissions
3. Validate request body schema
4. Check business rules

**Processing:**
1. Create entity in database
2. Trigger any side effects
3. Format response

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Example",
    "value": 123,
    "createdAt": "2024-01-01T00:00:00Z"
  }
}
```

### Error Handling

**Standard Error Response:**
```json
{
  "success": false,
  "error": "Error message",
  "code": "ERROR_CODE",
  "details": ["Detailed error 1", "Detailed error 2"]
}
```

**Error Codes:**
- `VALIDATION_ERROR`: Invalid input (400)
- `UNAUTHORIZED`: Authentication failed (401)
- `FORBIDDEN`: Insufficient permissions (403)
- `NOT_FOUND`: Resource not found (404)
- `CONFLICT`: Duplicate or conflict (409)
- `INTERNAL_ERROR`: Server error (500)

---

## Implementation Phases

### Phase 0: Preparation

**Duration:** [X hours/days]

**Goals:**
- Set up project structure
- Install dependencies
- Configure tools
- Create initial files

**Tasks:**
- [ ] Create feature branch
- [ ] Set up directory structure
- [ ] Install new dependencies (if any)
- [ ] Configure test environment
- [ ] [Other setup tasks]

**Deliverables:**
- Project structure ready
- Dependencies installed
- Tests can run (even if empty)

---

### Phase 1: Foundation

**Duration:** [X hours/days]

**Goals:**
- Implement core infrastructure
- Set up database schema
- Create base classes/modules

**Tasks:**
- [ ] Run database migrations
- [ ] Create entity models
- [ ] Create repositories
- [ ] Set up basic validation
- [ ] Create DTOs (Data Transfer Objects)
- [ ] [Other foundation tasks]

**Deliverables:**
- Database schema in place
- Core models defined
- Data access layer working

**Dependencies:**
- Phase 0 complete

---

### Phase 2: User Story [1] - [Story Name]

**Duration:** [X hours/days]

**Goals:**
- Implement first user story (usually P1)
- Get one complete vertical slice working

**Tasks:**
- [ ] Implement API endpoint(s)
- [ ] Add business logic
- [ ] Write unit tests
- [ ] Write integration tests
- [ ] Update documentation
- [ ] [Other tasks from tasks.md]

**Deliverables:**
- User story 1 acceptance criteria met
- Tests passing with coverage
- Feature independently testable

**Dependencies:**
- Phase 1 complete

---

### Phase 3: User Story [2] - [Story Name]

**Duration:** [X hours/days]

**Goals:**
- Implement second user story

[Same structure as Phase 2]

---

### Phase N: Integration & Testing

**Duration:** [X hours/days]

**Goals:**
- Ensure all stories work together
- Complete end-to-end testing
- Performance testing
- Security review

**Tasks:**
- [ ] Run full test suite
- [ ] Verify coverage meets thresholds
- [ ] Test all user journeys
- [ ] Load testing (if needed)
- [ ] Security scanning
- [ ] Fix any issues found

**Deliverables:**
- All tests passing
- Coverage above thresholds
- No critical security issues

---

### Phase N+1: Documentation & Cleanup

**Duration:** [X hours/days]

**Goals:**
- Complete all documentation
- Clean up code
- Prepare for merge

**Tasks:**
- [ ] Update README.md
- [ ] Add inline documentation
- [ ] Update API documentation
- [ ] Remove debug code
- [ ] Clean up comments
- [ ] Verify constitution compliance

**Deliverables:**
- Documentation complete
- Code clean and production-ready
- Ready for code review

---

## Testing Strategy

### Unit Tests

**Scope:** Test individual functions and methods in isolation

**Coverage Targets:** [From constitution]
- Statements: [X]%
- Branches: [X]%
- Functions: [X]%
- Lines: [X]%

**Key Areas to Test:**
- Business logic validation
- Input validation
- Edge cases
- Error handling
- [Feature-specific logic]

**Mocking Strategy:**
- Mock database calls
- Mock external APIs
- Mock file system
- [Other dependencies to mock]

**Example Test Structure:**
```[LANGUAGE]
describe('EntityService', () => {
  describe('create', () => {
    it('should create entity with valid data', async () => {
      // Arrange
      const mockRepo = { save: jest.fn() };
      const service = new EntityService(mockRepo);

      // Act
      const result = await service.create({ name: 'Test' });

      // Assert
      expect(mockRepo.save).toHaveBeenCalledWith({ name: 'Test' });
      expect(result).toBeDefined();
    });

    it('should throw error with invalid data', async () => {
      // Test error case
    });
  });
});
```

---

### Integration Tests

**Scope:** Test how components work together

**Key Scenarios:**
- Full API endpoint workflows
- Database operations with real DB
- Authentication flows
- [Critical integrations]

**Test Environment:**
- Use test database
- Seed test data
- Clean up after each test

**Example Integration Test:**
```[LANGUAGE]
describe('POST /api/v1/resource', () => {
  beforeAll(async () => {
    // Set up test database
  });

  afterEach(async () => {
    // Clean up test data
  });

  it('should create resource when authenticated', async () => {
    const response = await request(app)
      .post('/api/v1/resource')
      .set('Authorization', `Bearer ${token}`)
      .send({ name: 'Test' });

    expect(response.status).toBe(201);
    expect(response.body.success).toBe(true);
  });
});
```

---

### End-to-End Tests (if applicable)

**Scope:** Test complete user journeys

**Scenarios:**
- [Complete workflow 1]
- [Complete workflow 2]
- [Error recovery]

**Tools:** [Playwright / Cypress / Selenium / etc.]

---

### Performance Tests

**Load Testing:**
- Target: [N] concurrent users
- Response time: < [X]ms for [Y]% of requests
- Tool: [Artillery / k6 / JMeter / etc.]

**Database Performance:**
- Query optimization
- Index effectiveness
- Connection pooling

---

## Security Considerations

### Authentication & Authorization

**Authentication:**
- Mechanism: [JWT / OAuth / etc.]
- Token storage: [Where and how]
- Token expiry: [Duration]
- Refresh strategy: [How]

**Authorization:**
- Role checking at controller level
- Permission validation in business logic
- Resource ownership verification
- [Other auth checks]

### Input Validation

**Strategy:**
- Validate all user input
- Use DTO validation ([class-validator / Joi / etc.])
- Sanitize before database queries
- Encode before rendering

**Validation Rules:**
- [Field 1]: [Rules]
- [Field 2]: [Rules]
- [Custom validation logic]

### Data Protection

**Sensitive Data:**
- Passwords: Hashed with [bcrypt / argon2]
- PII: Encrypted at rest
- Tokens: Stored securely
- [Other sensitive data handling]

**SQL Injection Prevention:**
- Use ORM parameterized queries
- Never concatenate SQL strings
- Validate all inputs

**XSS Prevention:**
- Sanitize user input
- Encode output
- Use Content Security Policy

---

## Risks & Mitigation

### Risk 1: [Risk Description]

**Probability:** [Low / Medium / High]

**Impact:** [Low / Medium / High]

**Mitigation Strategy:**
[How to reduce probability or impact]

**Contingency Plan:**
[What to do if it happens]

---

### Risk 2: [Risk Description]

[Same structure]

---

## Performance Considerations

### Expected Load

- **Users:** [N] concurrent users
- **Requests:** [N] requests per second
- **Data Volume:** [N] records initially, growing to [M]
- **Response Time:** [X]ms target

### Optimization Strategy

**Database:**
- Add indexes on [fields]
- Use pagination for large result sets
- Cache frequently accessed data
- [Other optimizations]

**API:**
- Response compression
- Rate limiting
- Caching strategy
- [Other optimizations]

**Code:**
- Avoid N+1 queries
- Use eager loading where appropriate
- Optimize expensive operations
- [Other optimizations]

---

## Rollback Plan

### How to Roll Back

**If discovered during deployment:**
1. Stop deployment immediately
2. Roll back database migrations
3. Revert to previous code version
4. Verify system is stable
5. Investigate issue

**If discovered in production:**
1. Assess severity
2. If critical: immediate rollback
3. If minor: log issue, fix in next release
4. Notify stakeholders

### Safe Rollback Requirements

- All migrations have `down` scripts
- No destructive schema changes without backup
- Feature flags for large features
- [Other safety measures]

---

## Monitoring & Observability

### Metrics to Track

**Application Metrics:**
- Request count per endpoint
- Response times (avg, p50, p95, p99)
- Error rates
- [Feature-specific metrics]

**Business Metrics:**
- Feature usage
- User adoption
- Success rate
- [KPIs from spec.md]

### Logging

**What to Log:**
- Request/response for all API calls
- Errors with stack traces
- [Important business events]
- User actions (with PII redacted)

**Log Levels:**
- ERROR: Failures and exceptions
- WARN: Unexpected conditions
- INFO: Important events
- DEBUG: Detailed troubleshooting info

**Log Format:**
```json
{
  "timestamp": "2024-01-01T00:00:00Z",
  "level": "INFO",
  "service": "api",
  "endpoint": "/api/v1/resource",
  "method": "POST",
  "userId": 123,
  "duration": 45,
  "message": "Resource created successfully"
}
```

### Alerts

**Alert Conditions:**
- Error rate > [X]%
- Response time > [Y]ms for [Z] minutes
- [Critical business metric threshold]
- [Database connection issues]

---

## Dependencies & Prerequisites

### External Dependencies

**Must be complete before starting:**
- [ ] [Dependency 1]: [Status]
- [ ] [Dependency 2]: [Status]

**Must be complete before launching:**
- [ ] [Dependency 3]: [Status]

### Team Dependencies

**Needs input from:**
- [Team/Person]: [What] - [Status]

**Needs approval from:**
- [Team/Person]: [What] - [Status]

---

## Timeline Estimate

| Phase | Duration | Start Date | End Date |
|-------|----------|------------|----------|
| Phase 0: Preparation | [X days] | [DATE] | [DATE] |
| Phase 1: Foundation | [X days] | [DATE] | [DATE] |
| Phase 2: Story 1 | [X days] | [DATE] | [DATE] |
| Phase 3: Story 2 | [X days] | [DATE] | [DATE] |
| Phase N: Integration | [X days] | [DATE] | [DATE] |
| Phase N+1: Documentation | [X days] | [DATE] | [DATE] |
| **Total** | **[X days]** | **[DATE]** | **[DATE]** |

**Note:** This is a rough estimate. Actual timeline may vary based on complexity discovered during implementation.

---

## Open Questions

1. **Question:** [What needs clarification?]
   **Impact:** [Why it matters]
   **Resolution:** [TBD / Answered: ...]

2. **Question:** [Another question]
   [Same structure]

---

## References

**Related Documentation:**
- Specification: `spec.md` in this directory
- Tasks: `tasks.md` in this directory
- Constitution: `.specify/memory/constitution.md`
- [Other relevant docs]

**Technical References:**
- [Framework documentation]
- [Library documentation]
- [API specifications]
- [Design patterns]

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | [DATE] | [AUTHOR] | Initial plan |
| 1.1 | [DATE] | [AUTHOR] | [Changes made] |

---

## Approval

- [ ] **Tech Lead:** [Name] - [Date]
- [ ] **Architect:** [Name] - [Date]
- [ ] **Security Review:** [Name] - [Date] (if needed)
- [ ] **Ready for Implementation:** Yes/No

---

**Next Steps:**
1. Get plan approved
2. Break down into tasks (tasks.md)
3. Begin Phase 0: Preparation
