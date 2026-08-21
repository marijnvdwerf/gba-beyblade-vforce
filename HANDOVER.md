# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it whenever something changes.

Last updated: 2026-08-21 (session 1).

## How to work

- You are a manager. Do research/decomp via subagents (`model: gpt-5.6-luna`,
  Agent tool only, every prompt says "Do not spawn subagents"). Decomp agents
  use `subagent_type: decompiler` with `isolation: worktree`, one source file
  per agent. Prompts follow `~/.claude/skills/prompting-codex/SKILL.md`.
- Agent lifecycle: match → review → merge → debrief → remove worktree.
  Ask for `docs/learnings/<function>.md` before removing a worktree; an agent
  whose worktree is gone can be revived by recreating the worktree at the
  same path (`git worktree add .claude/worktrees/agent-<id> -b
  worktree-agent-<id> HEAD`) and sending it a message.
- Merge recipe: `git -C <wt> add -A src asm && git -C <wt> commit`, then
  `git merge <branch>` on main; modify/delete conflicts on dump files → take
  the delete (`git rm`); `cmake --build build --target compare`;
  `tools/update-expected`; commit; later remove worktree + branch.
- Before merging, read the C yourself. "Matches" ≠ done: compiler-shaped code
  (hand-written loop rotation, `block = &global` dances, per-use casts) goes
  back for a cleanup pass. If the natural shape cannot match, the agent must
  show what diverged, and that goes into the learnings file.
- When an agent stalls, read the target dump yourself (`asm/dump/...`, or
  `git show <rev>:asm/dump/...` if already deleted) and send concrete C.
  Things that paid off: reload patterns after `strb` = char-typed fields
  (aliasing), `bls/bhi` = unsigned params, `b .Ltest` at loop start =
  top-tested `while`, `r0 = n; n--; cmp r0` = `while (n-- != 0)`,
  `n-2 … cmp #-1` = `while (n--)`, fresh `mov #0` = literal NULL, `Str_*`
  right after a function = inline literals, independent `cmp #-1` after
  each store = chained/sequential assignments.
- Agents occasionally edit the *main* checkout instead of their worktree.
  Check `git status` on main periodically; revert strays, tell the agent to
  `pwd` before every command.
- Status pings: one short SendMessage per agent ("2-3 lines, then continue").
  Cross-agent findings go in a shared file (`docs/learnings/review-<date>.md`)
  and agents get the path + heading, not pasted text.
- Skill hygiene: `.claude/skills/agbcc/SKILL.md` takes only generic,
  repeatable patterns — no function names. Per-function detail lives in
  `docs/learnings/`.

## Tooling (all on main)

- Build/verify: `cmake --build build --target compare` (SHA1 = truth).
  C is built with `-g` (verified byte-neutral on main and raw-decomp).
- `bun run tools/diff/diff.ts <sym>` — instruction diff with C line numbers;
  no match % any more. `.word` rows differing only in symbol display are
  relocation noise.
- `uv run tools/callgraph.py [root]` — C-only call tree, 🔴 = not in C.
- `uv run tools/asm-annotated.py src/<f>.c <fn> [--all-passes]` — agbcc asm
  + `.lreg`/`.greg` (and `.loop` …) dumps for the current C.
- `uv run tools/worklist.py` — functions called from C but still asm.
- `expected/` is a flat copy of `build/` (`tools/update-expected`).
- `raw-decomp` worktree (`.claude/worktrees/raw-decomp`, 709 C functions vs
  main's ~215) is a read-only reference; never merge it wholesale.

## State at last update

Main: `9ed9bdc` + later merges; clean; compare passing.

Merged this session: SpriteVRamFree (sprite.c, loops as `while (n--)`; sprite worktree closed),
sub_806306C (actorheap.c, ActorBlock fields named), sub_805A53C +
getValidAllocatedBlock (memory.c).

Active worktrees / agents (id → file → status):

| worktree | file | done (uncommitted, in worktree) | in progress / notes |
|---|---|---|---|
| agent-abb23f448b7c48bf5 | memory.c | (merged) | debrief in progress → remove worktree after `docs/learnings/memory-allocator.md` exists |
| agent-aee513f785706f4b3 | gameinit.c | initGame, initGameLoop | experiment pending: unkC24/unkC26 as `s16` + `\|= 0xFFFF` to avoid `(s16)` casts in music.c; then sub_8053B94, closeGame |
| agent-a358a3f24f8bdfae8 | keystate.c | — | updateKeyState: I read the asm — loop bit tests are `> 0` (`ble`), not `!= 0`; hint sent with full shape (u16 i for-loop, plain struct access, literal 1, reload `_unk3000E30[0]` each use) |

Skipped (no C caller): sub_8062EFC (actorheap.c).

Parked (attempted, not matched — see docs/learnings/): sub_8060E8C and
freeSpriteVramLocation (sprite.c; the agent's earlier "match" relied on
register pinning and was discarded), sub_8057A7C (system.c orphan).

## Next candidates

Direct `mainLoop` callees still in asm (types pinned by C call sites):
gameLoop (927 lines), initGameLoop, updateKeyState, sub_8049458,
sub_8053B94, initMultiPlayer, sub_8049264, initGame ✅, initGameLoop ✅, closeGame,
sub_8055CB8. Full reachable-graph report was only in an agent transcript;
regenerate with `tools/callgraph.py mainLoop` + `tools/worklist.py`.

## Open questions for the user

- None pending.

## Session housekeeping

- A persistent 55-minute keepalive Monitor ticks while agents run (keeps the
  prompt cache warm). Stop it with TaskStop once all agents are done and the
  session winds down. Each tick: check `git status` on main for stray agent
  edits, update this file if anything changed.
