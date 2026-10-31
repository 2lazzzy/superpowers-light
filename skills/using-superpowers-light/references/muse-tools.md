# Muse Tool Mapping

Skills speak in actions ("dispatch a subagent", "create a todo", "read a file"). On Muse these resolve to the tools below.

| Action skills request | Muse equivalent |
|----------------------|----------------|
| Read a file | `read_file` |
| Read multiple files | `read_file` (call multiple times) or `search` |
| Create a new file | `write_file` |
| Edit a file | `edit_file` |
| Run a shell command | `bash` |
| Search file contents | `search` |
| Find files by name | `search` with `glob` |
| Fetch a URL | `web_fetch` |
| Search the web | `web_search` |
| Invoke a skill | `read_file` on `skills/<name>/SKILL.md` or native skill tool |
| Dispatch a subagent (`Subagent (general-purpose):` template) | `subagent_spawn` with prompt filling |
| Task tracking ("create a todo", "mark complete") | `write_todos` or `bash` task file |
| Ask the user a question | `request_user_input` |

## Instructions file

When a skill mentions "your instructions file", on Muse this is **`CLAUDE.md`** or **`AGENTS.md`** in the project root. Muse loads these hierarchically where configured.

## Skill invocation

Use the installed skill loader when available, or read the selected skill's `SKILL.md` from its actual installation location. Do not assume this repository installs a session-start hook. `using-superpowers-light` remains an explicitly requested workflow selector; other skills are selected when their scope applies.

## Subagent dispatch

Use `subagent_spawn` to delegate work to isolated subagents. Fill prompt templates (e.g., `implementer-prompt.md`, `task-reviewer-prompt.md`) before dispatching. If no subagent tool is available, do the work inline rather than inventing tool calls.

## Task tracking

Use `write_todos` when task tracking helps and the tool is available. A short checklist in chat is enough for small work. Maintain a durable task file only when the task needs one or the user/project requests it; do not create one just to satisfy a tool mapping.
