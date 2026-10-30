# Superpower Light

[한국어](README.ko.md)

Superpower Light is an independent, MIT-licensed derivative of [obra/superpowers](https://github.com/obra/superpowers). It contains 14 revised skills for coding agents, with narrower activation criteria and workflows sized to the uncertainty and impact of the work.

The changes live in the skill instructions, references, prompts, and helper scripts themselves. This is more than a separate preferences file layered over the original skills.

## What changes

| Work | Default approach |
| --- | --- |
| Clear text, style, or small UI change | Read the relevant context, edit, and verify. |
| Ordinary feature with understood requirements | Give a short chat plan and implement in the current workspace. |
| Unclear design or significant security, data, compatibility, or concurrency risk | Resolve material decisions, add the necessary plan, and use independent review. |
| Failure with an uncertain cause | Reproduce and investigate before choosing a fix. |
| Long-running work or a handoff | Keep a useful recovery record when needed. |

Plans, worktrees, review agents, and test-first implementation remain useful tools. They are selected for the task instead of being an automatic chain of requirements.

- Reuse prior authorization; a skill does not grant permission to create branches, commit, push, merge, or publish.
- Ask about unresolved decisions that materially change behavior, scope, or risk after checking available context.
- Match verification to the change and the project's requirements. Reuse valid results for unchanged code.
- Assess review findings immediately. A retry limit does not turn an unresolved important defect into completed work.
- Preserve useful regression tests. Temporary artifact cleanup follows user and project instructions; this public version has no blanket rule to delete new test files.

## Support and requirements

The revised workflows have primarily been exercised with local Codex. This repository is a collection of skills, not an official Codex plugin or marketplace package. Compatibility with other agent hosts has not been validated; retained host reference documents are not a compatibility guarantee.

Installation needs Python 3.8 or newer; the clone command below also needs Git. Individual optional helpers may need Git, Bash, Node.js, or Graphviz. Install only the tools needed for the features you use.

## Install

Review the repository and any existing skills first, then run:

```bash
git clone https://github.com/qkrwoghd04/superpower-light.git
cd superpower-light
python3 scripts/install.py --dry-run
python3 scripts/install.py
```

The default destination is `$CODEX_HOME/skills` when `CODEX_HOME` is set, otherwise `~/.codex/skills`. The installer copies all 14 skill folders as siblings so their relative references work, and preserves `LICENSE` and `NOTICE` in each installed folder.

To choose a different parent skills directory:

```bash
python3 scripts/install.py --dest /path/to/skills --dry-run
python3 scripts/install.py --dest /path/to/skills
```

`--dry-run` previews the operation without installing files. Start a new Codex chat after installation to load the installed skills.

### Existing Superpowers installations

The original skill names are intentionally retained. Do not install the original and this derivative side by side under the same discoverable names.

The installer refuses to overwrite any existing destination skill folder. With the default destination, it also checks for conflicting names in the known `~/.codex/skills` and `~/.agents/skills` locations. There is no force option. Other project or plugin discovery locations may still need your inspection; `--dest` is not a way to make duplicate names safe.

With the owner's permission, move conflicting copies to a backup **outside all skill discovery directories**, inspect the dry run again, and then install. Merely renaming a folder inside a discovery directory can leave it discoverable. Do not delete existing skills automatically.

Updates follow the same approach: review the changes, move the installed copies to an external backup with permission, and install the new version. To roll back, move this installation out of discovery and restore your own backup, preserving any later local edits.

## Use

`using-superpowers` is explicitly invoked in Codex through `agents/openai.yaml` with `allow_implicit_invocation: false`. It selects a suitable workflow; invoking it does not request all 14 skills.

```text
$using-superpowers Help me choose a workflow for adding invite expiry.
```

Other skills keep normal matching with narrower descriptions. You can also name a relevant skill directly:

```text
$systematic-debugging Investigate why this test fails intermittently.
```

No global preferences file is required. Your project's instructions, explicit requests, and the host's permission controls still apply.

## Included skills

| Skill | Use |
| --- | --- |
| [using-superpowers](skills/using-superpowers/SKILL.md) | Explicit workflow selection. |
| [brainstorming](skills/brainstorming/SKILL.md) | Unresolved requirements and consequential design choices. |
| [writing-plans](skills/writing-plans/SKILL.md) | Detailed plans when complexity, resumption, or handoff needs them. |
| [executing-plans](skills/executing-plans/SKILL.md) | Direct execution of agreed work in the current session. |
| [subagent-driven-development](skills/subagent-driven-development/SKILL.md) | Delegation when it improves progress or confidence. |
| [dispatching-parallel-agents](skills/dispatching-parallel-agents/SKILL.md) | Independent work with clear ownership boundaries. |
| [systematic-debugging](skills/systematic-debugging/SKILL.md) | Investigation of failures with uncertain causes. |
| [test-driven-development](skills/test-driven-development/SKILL.md) | Failure-first checks for suitable logic changes and bug fixes. |
| [requesting-code-review](skills/requesting-code-review/SKILL.md) | Independent review where requested or warranted by risk. |
| [receiving-code-review](skills/receiving-code-review/SKILL.md) | Evidence-based assessment of review feedback. |
| [verification-before-completion](skills/verification-before-completion/SKILL.md) | Evidence that supports the actual completion claim. |
| [using-git-worktrees](skills/using-git-worktrees/SKILL.md) | Preparation of requested or already authorized isolation. |
| [finishing-a-development-branch](skills/finishing-a-development-branch/SKILL.md) | Authorized integration and cleanup with known ownership. |
| [writing-skills](skills/writing-skills/SKILL.md) | Creation and maintenance of reusable agent skills. |

The review helper supports both committed ranges and current working-tree snapshots, including staged, unstaged, and relevant nonignored untracked files. Review does not require a commit or a new plan file; the helpers are optional.

## Optional visual companion

Brainstorming includes an optional browser companion for visual choices. It is not started by installation or by every brainstorming task. Start it only after the user approves that use.

The bundled branding uses text and does not fetch the upstream logo. The Node.js service defaults to loopback and uses a session key for HTTP and WebSocket access. See the [visual companion guide](skills/brainstorming/visual-companion.md) before starting it, especially if changing its network binding. Keep the session URL and key private.

## Validation and limitations

Development included targeted behavioral scenarios and temporary Git/script fixtures. The complete development harness is not shipped as a reproducible public test suite. These checks do not establish compatibility with every host or replace the checks required by your project.

The instructions are shorter and less prescriptive than the audited source version. No token, cost, speed, or quality improvement is promised.

## Attribution and license

Based on [obra/superpowers](https://github.com/obra/superpowers), with independent modifications maintained in this repository. This project is not an official upstream release.

Distributed under the [MIT License](LICENSE). See [NOTICE](NOTICE) for upstream attribution and the scope of the derivative work.
