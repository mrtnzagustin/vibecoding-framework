# [NNN] [Feature Name] – Product Requirements Document (PRD)

**Feature Number:** [NNN]
**Feature Name:** [Feature Name]
**Created:** [DATE]
**Status:** Draft | In Progress | Complete
**Owner:** [Your name or AI session]

---

## Overview

### Summary

[1-2 sentence description of what this feature does and why it matters]

### Related Spec-Kit Files

- **Spec:** `specs/[NNN]-[feature-name]/spec.md` (WHAT & WHY)
- **Plan:** `specs/[NNN]-[feature-name]/plan.md` (HOW - architecture)
- **Tasks:** `specs/[NNN]-[feature-name]/tasks.md` (High-level milestones)

**Note:** This PRD elaborates on the spec/plan with implementation details. If conflicts arise, the spec wins.

---

## Context & Problem

### Background

[Explain the current state. What exists today? What's missing?]

### Problem Statement

[What specific problem does this feature solve? Who experiences this problem?]

### User Pain Points

- **Pain point 1:** [Describe]
- **Pain point 2:** [Describe]
- **Pain point 3:** [Describe]

---

## Goals & Non-Goals

### Goals

What this feature **will** accomplish:

1. [Goal 1 - specific, measurable]
2. [Goal 2 - specific, measurable]
3. [Goal 3 - specific, measurable]

### Non-Goals

What this feature **will not** do (to prevent scope creep):

1. [Non-goal 1]
2. [Non-goal 2]
3. [Non-goal 3]

---

## User Stories & Scenarios

### Primary User Stories

#### Story 1: [Title]

**As a** [user type]
**I want** [capability]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

**Edge Cases:**
- [Edge case 1 and how to handle it]
- [Edge case 2 and how to handle it]

---

#### Story 2: [Title]

**As a** [user type]
**I want** [capability]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Edge Cases:**
- [Edge case 1 and how to handle it]

---

### Secondary User Stories

[Optional: less critical stories that might be deferred]

---

## Detailed Requirements

### Functional Requirements

| ID | Requirement | Priority | Status |
|----|-------------|----------|--------|
| F1 | [Functional requirement 1] | Must Have | ⬜ Not Started |
| F2 | [Functional requirement 2] | Must Have | ⬜ Not Started |
| F3 | [Functional requirement 3] | Should Have | ⬜ Not Started |
| F4 | [Functional requirement 4] | Nice to Have | ⬜ Not Started |

**Status Key:** ⬜ Not Started | 🟡 In Progress | ✅ Complete | ❌ Blocked

---

### Non-Functional Requirements

| ID | Requirement | Target | Status |
|----|-------------|--------|--------|
| NF1 | **Performance:** [e.g., API response < 200ms] | < 200ms | ⬜ Not Started |
| NF2 | **Security:** [e.g., All data encrypted at rest] | Required | ⬜ Not Started |
| NF3 | **Reliability:** [e.g., 99.9% uptime] | 99.9% | ⬜ Not Started |
| NF4 | **Usability:** [e.g., Accessible (WCAG AA)] | WCAG AA | ⬜ Not Started |

---

## User Experience & UI

### User Flow

```
[Describe the user journey step-by-step]

1. User lands on [page/screen]
2. User clicks [action]
3. System performs [operation]
4. User sees [result]
5. [etc.]
```

### UI Components

- **Component 1:** [Description, behavior, state management]
- **Component 2:** [Description, behavior, state management]
- **Component 3:** [Description, behavior, state management]

### UI States

- **Loading:** [How it looks/behaves]
- **Success:** [How it looks/behaves]
- **Error:** [How it looks/behaves]
- **Empty:** [How it looks/behaves]

---

## Technical Details

### Data Models

#### Model 1: [Name]

```
[Pseudo-schema or example structure]

{
  id: string (UUID)
  name: string (required, max 255 chars)
  createdAt: timestamp
  updatedAt: timestamp
  ...
}
```

**Validation Rules:**
- [Rule 1]
- [Rule 2]

---

#### Model 2: [Name]

[Same format as above]

---

### API Contracts

#### Endpoint 1: [Name]

**Method:** `POST`
**Path:** `/api/v1/[resource]`
**Auth:** Required (Bearer token)

**Request:**
```json
{
  "field1": "value1",
  "field2": "value2"
}
```

**Response (Success - 200):**
```json
{
  "id": "uuid",
  "field1": "value1",
  "createdAt": "2025-01-07T12:00:00Z"
}
```

**Response (Error - 400):**
```json
{
  "error": "Invalid field1",
  "details": { "field1": "Must be at least 3 characters" }
}
```

**Error Cases:**
- `400 Bad Request`: Invalid input
- `401 Unauthorized`: Missing or invalid token
- `409 Conflict`: Resource already exists
- `500 Internal Server Error`: Server error

---

#### Endpoint 2: [Name]

[Same format as above]

---

### External Dependencies

| Dependency | Purpose | Version | Fallback Strategy |
|------------|---------|---------|-------------------|
| [Library/API 1] | [What it does] | v1.2.3 | [What happens if it fails] |
| [Library/API 2] | [What it does] | v2.0.0 | [What happens if it fails] |

---

### Configuration & Environment

| Variable | Description | Default | Required? |
|----------|-------------|---------|-----------|
| `FEATURE_ENABLED` | Enable this feature | `false` | Yes |
| `API_TIMEOUT` | Timeout for external API | `5000ms` | No |

---

## Testing Strategy

### Unit Tests

- [ ] Test [component/function 1]
- [ ] Test [component/function 2]
- [ ] Test [component/function 3]
- [ ] Test edge case: [description]
- [ ] Test error handling: [description]

### Integration Tests

- [ ] Test [integration point 1]
- [ ] Test [integration point 2]
- [ ] Test end-to-end flow: [description]

### Manual Testing Checklist

- [ ] Test in [browser/environment 1]
- [ ] Test in [browser/environment 2]
- [ ] Test with [user role 1]
- [ ] Test with [user role 2]
- [ ] Test error states
- [ ] Test loading states
- [ ] Test edge cases

---

## Risks & Open Questions

### Risks

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| [Risk 1] | High | Medium | [How to mitigate] |
| [Risk 2] | Medium | High | [How to mitigate] |

### Open Questions

1. **Q:** [Question 1]
   **A:** [Answer or "TBD"]

2. **Q:** [Question 2]
   **A:** [Answer or "TBD"]

---

## Success Metrics

### Definition of Done

- [ ] All functional requirements (F1-FN) marked complete
- [ ] All acceptance criteria met
- [ ] Tests passing (unit, integration, e2e)
- [ ] Code reviewed and approved
- [ ] Documentation updated
- [ ] No critical bugs
- [ ] Performance targets met

### Key Performance Indicators (KPIs)

- **KPI 1:** [Metric to track success]
- **KPI 2:** [Metric to track success]
- **KPI 3:** [Metric to track success]

### Acceptance Criteria Summary

[Restate the most important acceptance criteria that define success]

---

## Implementation Notes

### Discoveries

[Add notes as you implement. What did you learn? What changed?]

- **[Date]:** [Discovery or insight]
- **[Date]:** [Discovery or insight]

### Deviations from Plan

[Document when implementation diverges from original plan]

- **[What changed]:** [Why it changed]
- **[What changed]:** [Why it changed]

### Follow-Up Items

[Things to address post-launch]

- [ ] [Follow-up item 1]
- [ ] [Follow-up item 2]

---

## Changelog

- **v1.0** ([DATE]) – Initial PRD created
- **v1.1** ([DATE]) – [What changed]

---

## Resources

- **Spec:** `specs/[NNN]-[feature-name]/spec.md`
- **Plan:** `specs/[NNN]-[feature-name]/plan.md`
- **Tasks:** `ai-dev/[NNN]-[feature-name]/tasks.md`
- **Related Issues:** [Links to GitHub issues, Jira tickets, etc.]
- **Design Mocks:** [Links to Figma, Sketch, etc.]

---

**Remember:** This PRD is a working document. Update it as implementation reveals new insights, but keep `specs/` as the ultimate source of truth.
