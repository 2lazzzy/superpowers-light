---
name: writing-plans
description: Write an actionable plan for complex multi-step implementation, resumption, or handoff, or when the user explicitly requests a detailed plan.
---

# Writing Plans

A plan records decisions and dependencies the implementer cannot safely infer. It is not a transcript of code that has yet to be written.

## Choose the right depth

For a clear small change, use a short plan in chat. Write a plan file when dependencies, risk, a long-running task, handoff, or the user warrants a durable artifact. Follow the project's existing location; `docs/superpowers/plans/YYYY-MM-DD-<feature-name>.md` is a fallback convention. Creating a plan does not authorize a commit or a worktree.

Read relevant code, user/project instructions, and any approved design. Reuse existing decisions. If a consequential requirement is unresolved, identify it before dependent work; do not manufacture a separate brainstorming phase for a complete specification.

## Build an implementable plan

Include what matters for this change:

- Goal, scope, constraints, and the source of the requirements.
- Meaningful tasks with the affected files, intended behavior, and dependencies.
- Shared interfaces or exact values where separate workers would otherwise disagree.
- Observable acceptance criteria, important failure cases, and the checks that establish them.
- Material assumptions, risks, and any decision that still belongs to the user.

Group setup, configuration, and documentation with the deliverable they support. Split tasks when they produce independently verifiable outcomes or have different ownership. Follow the existing project structure; do not add an unrelated refactor to make a plan look cleaner.

Use signatures or representative test cases where they resolve ambiguity. Do not prewrite every implementation body, prescribe one test per function, or repeat the same code across tasks. Include only applicable sections.

An ordinary task can be this short:

```markdown
### Show the saved filter on return
- Update the existing filter state and view using the current persistence helper.
- Preserve the current behavior when no saved filter exists.
- Check a saved value, an absent value, and an invalid stored value.
- Verify the affected UI interaction and relevant type/test checks.
```

For non-trivial logic or a reproducible bug, a useful task may include a failing behavior check before implementation. For formatting, documentation, or configuration, select the relevant validation instead of requiring a fabricated red/green test. Plan to retain regression tests, including new tests. Remove only explicitly temporary test artifacts when the user or project requests cleanup.

## Check the plan once

Confirm that each requirement has an implementing task, dependencies and interfaces agree, acceptance checks match the behavior, and no step expands the scope without reason. Distinguish real failure modes from speculative features. An already adequate plan does not need repeated review or extra sections to reach a template size.

## Execute or hand off

Preserve the user's chosen execution method and existing approvals. Default to direct execution in the current session using [executing-plans](../executing-plans/SKILL.md). Use [subagent-driven-development](../subagent-driven-development/SKILL.md) when independent tasks, risk, or an explicit request justify that workflow. Review effort should match the change, not the number of plan steps.

If the user asked for a plan only, deliver it and stop. If implementation is already authorized and material decisions are settled, state the approach and continue; do not ask for approval of the same scope again. Request a decision only when it changes scope, behavior, risk, or authorization.

Git steps belong in the plan only when requested or included in an agreed workflow. A template must not silently add branch creation, commits, pushes, or merges.
