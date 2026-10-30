# Skill Discovery and Structure

Use this reference when editing names, descriptions, frontmatter, or how a skill exposes supporting material.

## Metadata

Keep required `name` and `description` fields, and preserve supported optional metadata unless the task changes it. Use a lowercase name with letters, digits, and hyphens that matches the directory; keep it within the target runtime's limit (normally 64 characters). Keep the description concise and within the runtime's limit (normally 1024 characters for the description itself, not all frontmatter).

The description should make clear what the skill helps do and when it applies. Include an exclusion when it prevents a likely false trigger. Avoid dumping the workflow or adding broad phrases such as “every task.” Example:

```yaml
name: systematic-debugging
description: Use when a bug or unexpected behavior has an uncertain cause, recurs, or spans interacting components.
```

Trigger changes can affect behavior even if only one line changes. Check a representative matching request and a nearby request that should use a simpler path. Do not turn metadata-only edits into mandatory multi-agent experiments.

Preserve an existing explicit-only invocation policy. Change invocation mode only when requested; sensitive side effects should have an authorization condition rather than silently disabling discovery. Where supported, invocation metadata belongs in the runtime's policy file, such as `agents/openai.yaml`.

## Useful structure

A small skill can be self-contained. A larger one should expose its purpose, scope, and important decisions first, then link to conditional references where needed. There is no mandatory heading set or word count.

Use a short example when it resolves ambiguity. Put runnable helpers in a clear location, explain their side effects, and invoke them through their interpreter when executable bits may be unavailable.

## References and size

- Keep each rule in one maintained place; avoid contradictory restatements in templates and examples.
- Link to resources using paths relative to the skill, with a sentence explaining when to read them.
- Do not load unrelated references or cascade into other skills just because they are named.
- Name a genuinely relevant companion skill and the condition for using it. Do not describe every dependency as mandatory.
- Prefer concise, relevant instructions over copied manuals, repeated warnings, or token-count targets.

Validate frontmatter, referenced file existence, and the intended routing. Syntax checks alone do not prove that a behavioral change is correct.
