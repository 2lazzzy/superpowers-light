# Validation at Meaningful Boundaries

Add protection where independently reachable inputs, trust changes, or side effects justify it. Repeating the same check at every internal function is not automatically safer and can obscure the actual contract.

After tracing invalid data:

- Correct its origin when that origin is in scope.
- Validate at the public or trust boundary that owns the contract.
- Guard a dangerous side effect when callers can bypass earlier validation.
- Add diagnostics only when they provide useful ongoing evidence.

Verify that each added check catches a relevant failure. Logging helps diagnosis; it does not make an invalid operation impossible.

## Example: restrict an operation to an existing temporary directory

Resolve real paths to account for symlinks and use path-component containment rather than a string prefix. A sibling such as `/tmp-other` must not pass a `/tmp` check.

```typescript
import { realpathSync, statSync } from 'node:fs';
import { isAbsolute, relative, sep } from 'node:path';

function requireChildDirectory(directory: string, tempRoot: string): string {
  if (!directory.trim() || !tempRoot.trim()) {
    throw new Error('Both directory and temporary root are required');
  }
  const root = realpathSync(tempRoot);
  const target = realpathSync(directory);
  const childPath = relative(root, target);
  if (!childPath || childPath === '..' || childPath.startsWith(`..${sep}`) || isAbsolute(childPath)) {
    throw new Error('Expected a child directory of the temporary root');
  }
  if (!statSync(target).isDirectory()) {
    throw new Error('Expected an existing directory');
  }
  return target;
}
```

Use the returned canonical path for the operation. This checks existing directories and deliberately rejects the temporary root itself. It is a test-environment guard, not a race-proof security sandbox: if an attacker can replace directories between validation and use, stronger filesystem controls are needed.
