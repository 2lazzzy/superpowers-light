---
name: systematic-debugging
description: Use when a bug, test failure, build failure, or unexpected behavior has an uncertain cause, recurs, or spans interacting components.
---

# Systematic Debugging

Use evidence to distinguish the cause from its symptoms, then verify the smallest justified fix. A known, well-supported cause in a small change needs a focused fix and relevant verification, not a new investigation ceremony.

## Investigate the uncertainty

1. Read the actual error, failing behavior, and relevant context. Separate observations from assumptions.
2. Reproduce when feasible; record the trigger and expected behavior. If reproduction is unreliable, gather discriminating evidence rather than guessing.
3. Inspect relevant changes, configuration, and working examples. Trace invalid data back toward its source; read [root-cause-tracing.md](root-cause-tracing.md) when a deep call chain obscures it.
4. For a multi-component failure, inspect the boundaries implicated by the evidence. Add temporary diagnostics only where existing logs are insufficient; redact credentials and private payloads.

These are investigation tools, not four mandatory phases for every issue. Stop expanding the investigation when the evidence supports the proposed change and its risks are understood.

## Test a hypothesis

State the suspected cause and what observation would support or disprove it. Change one relevant variable at a time when that helps isolate causality. A failed experiment is evidence: update the hypothesis instead of stacking unrelated fixes.

Repeated failures call for a review of assumptions, reproduction, observability, environment, and coupling. They do not prove an architectural defect after any fixed number of attempts. Seek a design decision only when evidence indicates a scope, compatibility, authorization, or architectural choice that the current request does not settle.

## Fix and verify

- Prefer a failing automated reproduction for new logic or a bug fix when practical. Existing tests, a focused script, or a repeatable manual reproduction can supply appropriate evidence. Do not require a new test framework for a small change.
- Apply the smallest coherent correction; avoid unrelated cleanup.
- Recheck the original symptom and affected behavior, plus project-required checks. Report what was actually verified and what remains uncertain.
- Remove temporary diagnostics that are no longer useful. Preserve existing and newly added regression tests by default. Remove explicitly temporary test artifacts only when the user or project requests cleanup; then inspect the final changes and rerun checks affected by removal. Removed artifacts do not provide ongoing regression protection.

Use `verification-before-completion` when it helps assess the completion claim; its purpose is evidence, not repeating already-valid checks.

## Incidents and external causes

During an incident, an authorized rollback, feature disablement, or other reversible mitigation may restore service before the full cause is known. Choose it using available evidence and the incident procedure, verify its effect, and distinguish mitigation from a confirmed root-cause fix. A suspected timeout does not by itself justify retries on non-idempotent operations.

If investigation points to an external or intermittent cause, record the evidence and limits. Add bounded handling or monitoring when justified; do not claim certainty or keep investigating indefinitely without a useful next experiment.

## Supporting techniques

- [defense-in-depth.md](defense-in-depth.md): validation at meaningful trust or side-effect boundaries.
- [condition-based-waiting.md](condition-based-waiting.md): observe completion rather than guessing delays.
- [find-polluter.sh](find-polluter.sh): run matched test files sequentially to identify a newly created path. Read its usage first and use a disposable test environment; it executes the project's test command.
