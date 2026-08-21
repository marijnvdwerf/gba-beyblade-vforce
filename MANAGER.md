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
- Agent lifecycle: **match → review → merge → debrief → remove worktree**.
  Always ask for a learnings write-up (`docs/learnings/<function>.md`,
  plus a proposed `.claude/skills/agbcc/SKILL.md` patch) *before* removing
  a worktree — an agent whose worktree is gone cannot be resumed. If it
  happens anyway, recreating the worktree at the same path revives it.
- Merging: commit in the worktree, `git merge` into main, take the delete
  on dump-file modify/delete conflicts, run `compare`, `tools/update-expected`.
- Review matched code before merging; "matches" is not "done". If the
  natural shape doesn't match, the agent must show what diverged.
- Read the target asm yourself when an agent stalls — reload patterns,
  branch opcodes and literal reuse usually name the source shape. Send
  concrete C, not adjectives.
- Parallel agents: one file per worktree; ping all for status with one
  message each; relay findings between them via a shared file
  (`docs/learnings/review-<date>.md`), not by pasting.
- `-g` is in the build (verified byte-neutral); `diff.ts` shows source
  lines and no match %; `.word` rows differing only in symbol display are
  noise — `compare` is the authority.
