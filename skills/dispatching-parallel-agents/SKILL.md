---
name: dispatching-parallel-agents
description: Use when two or more independent investigations or implementation tasks can proceed concurrently without conflicting edits, shared mutable resources, or sequential dependencies.
---

# Dispatching Parallel Agents

Parallelize independent problem domains when the saved time or independent perspective outweighs coordination cost. Different test files are a clue, not proof of different root causes.

## Establish independence

Identify what each task reads and changes, including shared dependencies, generated outputs, the Git index, test services, and configuration. Investigate related failures together until their relationship is clear. Shared read-only context is fine; conflicting mutations require ownership boundaries or sequencing.

Give each agent:

- The concrete question or intended behavior, relevant evidence, and necessary project context.
- Its owned files/resources and any interfaces shared with other workers.
- Constraints and authorization: no unrelated changes and no Git mutations unless the task already authorizes them.
- Expected report: result or root cause, changes, checks and outcomes, unresolved concerns, and handoff needs.

Use isolated context when supported and pass only what the task needs. Batch trivial repeated changes rather than creating an agent for each file. Model selection follows host capabilities and user preferences; file count alone does not indicate risk.

## Dispatch and integrate

Dispatch independent work without waiting for the preceding worker to finish. Actual concurrency depends on the tool's asynchronous behavior and available slots, not the number of calls in one message. While workers run, do useful independent work and provide brief updates; avoid busy polling and long silent waits.

Read returned evidence, inspect meaningful changes, and reconcile overlaps before accepting results. Preserve user changes. Verify the combined behavior with the relevant tests, static checks, build, or other checks required by the project and the changes. A full test suite is appropriate when integration risk or project policy calls for it; research-only tasks do not require one.

Judge objections on evidence as they arise. Correct real important defects before completion; do not downgrade an issue merely because another worker owns it. Reuse valid checks for unchanged code and repeat only for changes, failures, or new concerns.

For new logic and bugs, reproduce a failure first when feasible. Preserve existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup, then inspect the final changes and run any affected checks. Report limitations accurately.
