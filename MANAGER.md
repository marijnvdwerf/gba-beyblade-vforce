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
  a worktree. Learnings files are per-function; the skill is not — only
  fold in repeatable, generic patterns, never function names or one-offs — an agent whose worktree is gone cannot be resumed. If it
  happens anyway, recreating the worktree at the same path revives it.
- Merging: commit in the worktree, `git merge` into main, take the delete
  on dump-file modify/delete conflicts, `clang-format -i` the touched src
  files, run `compare`, `tools/update-expected`.
- Review in bulk: when agents say they are done (or are stuck — ask
  proactively, before they sink hours), spawn ONE **opus-4.8** reviewer per
  round over ALL current worktrees' C diffs together, so style/types stay
  consistent across TUs. It reads C only (`git diff main...<branch> -- src`; shape and field
  types only, no rename proposals — sub_*/unkNN names stay; it must not read
  asm) that writes the most natural C for each function to
  `docs/learnings/review-<scope>.md`; send the decomp agent that path as its
  new goal and let it try to simplify while keeping the match. Reviewer
  output is shape advice only: any layout claim it makes (embedded array vs
  pointer, field widths) must be checked by the decomp agent against the asm
  before adopting. Only then
  review/merge.
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
- `HANDOVER.md` is the living state file for the next session (active
  agents, merged work, stuck points, next candidates). Update it on every
  merge, every agent start/finish, and every change of plan.
