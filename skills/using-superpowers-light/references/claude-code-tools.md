# Claude Code Tool Notes

Use the tools, model choices, and delegation capabilities actually available in the current session. Tool names and nesting limits can vary by version or installation; a platform example is not permission to change configuration.

For a selected skill, use the installed skill loader or read its `SKILL.md`. Do not assume this repository installs a session-start hook or automatically invokes `using-superpowers-light`.

## Optional orchestration

If the user requests a delegated coordinator and the runtime supports it, give that coordinator the settled requirements, actual workspace, authorized actions, and useful validation evidence. Use the model policy already chosen for the session; do not hardcode a model tier or nesting depth from this reference.

Delegate independent work and meaningful review, keeping dependent work sequential. Preserve the skill's scope and authorization rules. The coordinator should return concrete changes, decisions, verification, and material limitations. If nested delegation is unavailable, continue using the authorized tools available to the current session.

Task tracking should match the work. Use a short in-chat plan for small changes, and a durable plan or task list when complexity, resumption, or a handoff makes it useful.
