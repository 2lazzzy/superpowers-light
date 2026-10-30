# Writing Good Tests

Read this when designing assertions, mocks, or test helpers. A useful test
catches a plausible defect in observable behavior, rather than merely
confirming the current source text.

## Derive expectations independently

Name the production defect the test should detect. Use hand-checked values
and fixtures rather than computing the expected value with the same code
being tested.

```typescript
// This compares the implementation with itself.
expect(buildSearchQuery({ tag: 'urgent' })).toBe(
  buildSearchQuery({ tag: 'urgent' })
);

// This checks the required output independently.
expect(buildSearchQuery({ tag: 'urgent' })).toBe('tag:"urgent"');
```

Exact values are appropriate when they are the public contract. Avoid
locking incidental wording, private structure, or constants without a
behavioral reason. For a retry policy, check the actual retry behavior
rather than only asserting the constant's value.

For scripts, assert outputs, side effects, and exit status on controlled
inputs. For configuration, parsing and schema checks are useful. For
agent instructions, use representative decisions when behavior changes;
mechanical edits may need only syntax or link checks. See
[writing-skills](../writing-skills/SKILL.md) for proportional evaluation.

## Exercise the real contract

Prefer real behavior. Use faithful doubles at external, expensive, or
unavailable boundaries when they make the test reliable. Assertions on
arguments, call counts, or ordering are valid when the interaction itself
is part of the production contract. A mock's existence or its configured
return value alone does not establish that contract.

```typescript
// Useful: production code sends the tenant boundary to its data dependency.
expect(repository.find).toHaveBeenCalledWith({ tenantId: 'tenant-a' });

// Insufficient alone: a fake UI element exists because the test rendered it.
expect(screen.getByTestId('sidebar-mock')).toBeInTheDocument();
```

Understand relevant side effects before replacing a dependency. Mocking a
whole operation can accidentally remove the cache or file write that the
tested behavior relies on. Include required payload structure and model
missing, malformed, and optional values deliberately.

Keep test-only cleanup in test utilities. Production resource lifecycle
methods belong in production when the class owns that lifecycle. If mock
setup becomes more complex than the behavior, consider a focused
integration test instead.

## Establish that the check is meaningful

For a new behavior or bug fix, observe a failure for the intended reason
when feasible. A setup error is not the desired red phase. A passing
characterization test of existing behavior can still be useful; do not
force it to fail by changing a correct expectation.

Ask whether a wrong branch, argument, missing state change, or missing
validation would be detected. If the check can never expose the relevant
defect, improve its input or assertions. Do not add one test per function
when stable-interface tests already cover the behavior.

If code predates the test, keep the code. To establish regression sensitivity,
use an isolated pre-fix copy or a controlled seam without risking current
user changes. Report the actual sequence honestly.

## Retention and final state

Preserve existing and newly added regression tests by default. Remove only
explicitly temporary test artifacts when the user or project requests cleanup;
a `.test` filename alone does not make a test temporary. Inspect the resulting
diff and rerun checks whose validity cleanup changes. Removed artifacts do not
provide ongoing regression protection; disclose a material remaining gap.

Run required project checks and checks proportionate to the change.
Reuse results while the relevant state remains unchanged. Report unrelated
failures separately; do not silently expand the implementation to fix them.
