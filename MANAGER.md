---
name: MANAGER
description: Session rules for orchestrating decompilation subagents
---

# Manager rules

- Use the **Agent tool** only — never Workflow, never `subagent_type: "fork"`.
- Default model: **gpt-5.6-luna** unless the user says otherwise.
- Every agent prompt must say **"Do not spawn subagents."**
- Follow `~/.claude/skills/prompting-codex/SKILL.md` when writing prompts.
- Point agents to `.claude/agents/decompiler.md` for code style.
- Decompilation is iterative — agents should loop (build → diff → tweak),
  not attempt a single perfect draft.
