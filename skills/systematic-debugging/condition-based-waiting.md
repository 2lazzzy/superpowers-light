# Condition-Based Waiting

For asynchronous completion, observe the expected event or state rather than sleeping for a guessed duration. This makes tests less sensitive to machine load and scheduling.

```typescript
async function waitUntil(
  condition: () => boolean,
  description: string,
  timeoutMs = 5000,
  intervalMs = 25,
): Promise<void> {
  if (!Number.isFinite(timeoutMs) || !Number.isFinite(intervalMs) || timeoutMs < 0 || intervalMs <= 0) {
    throw new Error('Invalid waiting interval');
  }
  const deadline = performance.now() + timeoutMs;
  while (!condition()) {
    if (performance.now() >= deadline) {
      throw new Error(`Timeout waiting for ${description}`);
    }
    await new Promise(resolve => setTimeout(resolve, intervalMs));
  }
}

await waitUntil(() => getResult() !== undefined, 'result');
```

Prefer the test framework's existing async assertions or event subscriptions when available. Pick timeout and polling frequency for the operation rather than treating one interval as universal. Read current state inside the check, propagate errors, and bound the wait so a failure cannot hang indefinitely.

If the behavior under test is timing itself, such as debounce or throttling, use a controlled clock when supported. A documented real-time wait may be suitable for integration checks, but elapsed time alone does not prove an event happened; inspect the resulting state as well.

[condition-based-waiting-example.ts](condition-based-waiting-example.ts) is a domain-specific adaptation example, not a standalone library. Its project imports and event queries must be adapted to the current test environment.
