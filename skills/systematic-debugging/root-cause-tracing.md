# Root Cause Tracing

Use this technique when an error appears far from the code that supplied the invalid input or state.

1. Record the observed failure and the value or state at that point.
2. Find the caller and determine where that value came from.
3. Trace further only as needed to explain the trigger and identify a justified correction.
4. Check the intended contract and other relevant callers before changing it.

For example, a filesystem operation unexpectedly runs in the source checkout. Its directory argument is empty because a test reads a fixture before setup completes. Correct the fixture lifecycle and validate the directory at the meaningful operation boundary; do not merely change the failing command's working directory without understanding its caller.

## Diagnostics

Use existing logs and stack traces first. When they are insufficient, add focused temporary instrumentation before the implicated operation. Log safe identifiers and state, not credentials, tokens, or private payloads. Remove instrumentation after it has served its purpose unless ongoing diagnostics are justified.

If tracing reaches an unavailable external component, record the evidence and uncertainty. A bounded workaround or authorized incident mitigation may still be appropriate; distinguish that from a confirmed root-cause fix.

## Finding a test that creates a path

The sequential helper is useful when tests unexpectedly create a particular file or directory:

```bash
bash ./find-polluter.sh 'unexpected-directory' 'src/**/*.test.ts'
```

Run it from the test project in a disposable fixture or otherwise authorized test environment. It defaults to `npm test -- FILE`; provide another runner after `--` when appropriate:

```bash
bash ./find-polluter.sh 'unexpected-directory' 'src/**/*.test.ts' -- npx vitest run
```

The pattern follows `find -path` matching, with an additional match omitting `**/` for files directly under the base directory. It is not a full shell globstar engine. The helper adds each matched file as the final command argument. Confirm that the project's runner actually selects that file.

Exit 0 means all matched invocations passed without creating the path. Exit 1 means the path appeared. Exit 2 means the result is inconclusive, such as an existing target, no matched files, discovery failure, or a failed test invocation. The helper never deletes the target or existing tests.

Running tests separately may miss order-dependent interactions. If all individual runs are clean but a suite still fails, investigate the suite order and shared state; do not claim the whole suite is clean from this helper alone.
