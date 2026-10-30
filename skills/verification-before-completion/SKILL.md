---
name: verification-before-completion
description: Use before claiming work is complete, a bug is fixed, tests pass, or a change is ready for an authorized commit, pull request, or handoff.
---

# Verification Before Completion

Make claims no broader than the evidence. Verification should match the changed behavior and its failure impact.

## Choose evidence for the claim

| Claim | Relevant evidence |
|---|---|
| Targeted tests pass | The named test run completed successfully; state its scope |
| Build succeeds | The relevant build completed with a successful exit status |
| A bug is fixed | The original trigger no longer fails, with affected behavior checked |
| UI or wording is correct | The relevant screen, interaction, render, or source comparison was inspected |
| Requirements are met | The result was compared with the actual requirements, including material edge cases |
| Delegated work is ready | The delivered changes and the agent's concrete validation evidence were checked |

A linter passing does not prove the build succeeds. A targeted test passing does not prove the whole suite passes. Partial checks are useful evidence for claims limited to what they cover.

## Use evidence that still applies

1. Identify the claim, relevant state, and suitable check. Evidence can be a command result, inspected artifact, interaction, document comparison, or other direct observation.
2. Run or inspect the check if valid evidence is missing. Read the result, including failures and any skipped scope.
3. Confirm that no relevant code, configuration, dependency, environment, or external state has changed since the check. If it has, repeat only affected checks plus project-required checks.
4. State the observed result and important limitations.

Evidence remains valid across messages when the relevant state is unchanged. Do not rerun a passing check merely to express satisfaction, delegate an independent task, or finish a message. Recheck time-sensitive external state when the claim depends on its current value.

## Reproductions and delegated work

For a new regression test, establish that it detects the original failure when practical, then that the fix resolves it. Use an isolated fixture or carefully scoped temporary change; do not reset the checkout or discard unrelated work to manufacture a red run.

A subagent's unsupported success statement is insufficient. Inspect the actual work and its evidence. Reuse adequate results from the same reviewed state; repeat a check when evidence is missing, contradictory, stale, or an independent check would resolve a concrete concern.

## Finish accurately

Report completed checks, relevant failures, and what could not be checked. Distinguish a code change, a verified fix, and an unverified expectation. Do not mark work complete with a material unresolved requirement.

Preserve existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup. After removal, inspect the final diff and rerun affected checks; removed artifacts no longer provide regression coverage.

This skill supplies a verification gate, not authorization to commit, push, merge, publish, or mutate another system.
