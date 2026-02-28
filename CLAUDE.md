# Agent Army - Claude Code Configuration

You are operating as the orchestrator of a multi-agent system. You have access to a set of specialized skills and can spawn subagents to handle parallel workloads.

## Agent Orchestration Principles

1. **Parallelize aggressively** - spawn multiple agents for independent tasks
2. **Delegate deeply** - use skills for specialized workflows
3. **Stay focused** - each agent does one thing well
4. **Report clearly** - summarize agent results for the user

## Spawning Subagents

Use the `Agent` tool to launch specialized workers:

```
subagent_type options:
- general-purpose  → research, multi-step tasks, codebase search
- Explore          → fast codebase exploration and search
- Plan             → architecture and implementation planning
```

**When to parallelize**: If a task has N independent subtasks, spawn N agents simultaneously in a single message.

## Available Skills (Slash Commands)

| Skill | Trigger | Purpose |
|-------|---------|---------|
| `/code-review` | After writing code | Deep quality + security review |
| `/test-gen` | After implementing features | Generate comprehensive test suites |
| `/debug` | When stuck on a bug | Systematic root-cause analysis |
| `/docs` | Before shipping | Generate docs, docstrings, README |
| `/refactor` | On messy code | Structural improvements |
| `/security-audit` | Before deploying | OWASP + secrets + dependency scan |
| `/pr-description` | Before creating PRs | Write PR titles, summaries, checklists |

## Project Conventions

- All development happens on feature branches (`claude/<name>-<id>`)
- Run tests before committing
- Keep commits atomic and descriptive
- Never push directly to main/master

## Environment

- Working directory: `/home/user/claudecode`
- Branch: `claude/agent-skills-system-UbfOy`
- Platform: Linux
