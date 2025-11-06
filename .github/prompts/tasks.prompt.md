# /speckit.tasks

You are helping me create a **task breakdown** for implementing this feature.

## Instructions

Follow these rules:
- **Focus on concrete, actionable steps**
- Use the template from `.specify/templates/tasks-template.md`
- Reference both `spec.md` and `plan.md` for this feature
- Break work into:
  - Setup tasks (environment, dependencies)
  - Foundation tasks (shared infrastructure)
  - User story tasks (one section per story from spec.md)
  - Testing tasks (unit, integration, E2E)
  - Documentation tasks
- Each task should be:
  - Small enough to complete in a few hours
  - Independently verifiable
  - Clearly described with acceptance criteria

## Output

Return only the completed `tasks.md` content, formatted in Markdown with checkboxes.

## Context

- The spec.md and plan.md for this feature should already exist
- Order tasks logically (dependencies first)
- Mark which tasks can be done in parallel
- Include testing tasks alongside implementation tasks
- Add a release checklist at the end
