---
name: test-driven-development
description: Use a failing behavior test to guide non-trivial logic changes or reproducible bug fixes, or when the user or project requires TDD.
---

# Test-Driven Development

A meaningful failing test can expose an incorrect assumption before implementation and establish that the test detects the intended bug. Use it where that evidence is useful.

## Select the verification

- New logic, branching behavior, parsers, authorization, or a reproducible bug: prefer a focused behavior test that fails for the expected reason before the fix.
- Refactoring with existing coverage: use the relevant existing tests to establish preserved behavior; add a test for an uncovered risk rather than requiring a failure for an intentional no-behavior change.
- Wording, styles, generated output, documentation, configuration, or a throwaway experiment: use appropriate visual, interaction, structural, or project checks. Do not create tests that merely mirror the edit.
- Follow explicit project testing requirements and user choices. If the environment prevents a check, explain exactly what remains unverified.

Read [writing-good-tests.md](writing-good-tests.md) when designing assertions, mocks, or test helpers. Preserve existing tests and user changes.

## Red, green, refactor

1. State the observable behavior and derive the expected result independently of the implementation.
2. Write or select a focused test. Run it and confirm it fails because of the target behavior, not an unrelated setup error.
3. Implement the smallest complete fix. Run the relevant check and inspect its output.
4. Refactor only where the change needs it, keeping the affected behavior verified.

A test that already passes is information: it may document correct existing behavior, expose a mistaken bug report, or fail to cover the intended regression. Determine which; do not force a failure by changing a correct expectation.

If implementation already exists, do not delete it merely to enforce test ordering. Add a meaningful regression or characterization check. When proof that a regression test detects the defect is needed, compare against the pre-fix behavior in an isolated copy or a controlled test seam; protect current user changes. Report honestly if a test was added after implementation.

## Test the contract

Exercise real behavior with independently derived expected values. Doubles are useful at external or expensive boundaries; verify their arguments or call counts when those interactions are the contract. Avoid assertions that only prove a mock exists, repeat implementation logic, or count coverage without detecting a defect.

Cover meaningful boundaries and failure cases. A function does not require its own test if its behavior is already exercised through a stable interface.

## Verify the final result

Run checks appropriate to the affected behavior and the project's required validation. Run a full suite when broad impact, shared infrastructure, integration risk, or project policy warrants it; do not require it for every small isolated edit. Distinguish pre-existing or unrelated failures from regressions and report them without silently expanding the task.

Reuse successful evidence while the relevant code, inputs, and environment are unchanged. New edits, failures, or credible uncovered risks warrant further checks. Passing tests establish the tested behavior, not every possible requirement.

Retain existing and newly added regression tests by default. Remove only explicitly temporary test artifacts when the user or project requests cleanup; a `.test` filename alone does not make a test temporary. Inspect the final diff after cleanup and rerun affected checks. Explain material coverage gaps: removed artifacts do not provide ongoing regression protection.

For completion reporting, follow [verification-before-completion](../verification-before-completion/SKILL.md): state what ran, the result, and any relevant limitation. Never claim a red/green cycle that was not observed.
