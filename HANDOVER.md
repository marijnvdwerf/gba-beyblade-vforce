# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it on every merge, agent start/finish
and change of plan.

Last updated: 2026-09-07 17:19, session 8 — Round 6 waves 1–2 merged (591 C / 416 asm / 59%, 15 TUs).

## Session 8 (2026-09-07)

Cycle per user: decomp agent → manager glances at incoming code → review
agent (report in /tmp) → revive decomp agent to apply → manager reads + merges.
Keepalive monitor ON (55 min). Luna only; every prompt says no subagents.

- **Round 5-A** (running): one luna decompiler in its own worktree from
  45c6ad0d, using branch `raw-decomp-3` (user's 8 matched functions +
  parked GetLineIndexOfType, written against looser rules) as a muse only —
  re-deriving sub_8050A50, sub_805AD9C, sub_8057104, sub_804A280,
  sub_804DA48, sub_805AD24, sub_805AFBC, sub_8056EC0 in house style (no
  ptrC cast-and-offset, no `(s16)` field casts, RiderBase* params, unk<HEX>
  MenuState names, folded temps). Learnings → docs/learnings/round5-style-2026-09-07.md.
- Round 5-A rulings (user, 2026-09-07): sub_8050A50 keeps the raw-decomp-3
  shape (`unk8* ptrC`, `offset += sizeof(DisplayRecord)`, cast at the call)
  — user-accepted for this function. sub_805AFBC: no gotos/labels and no
  bare `{}` block; start from efc48e10's while loop. A "compare broke" is not
  evidence: retyping a field (GameData.unkC26 u16→s16) requires diffing every
  user and reading their target asm.
- 5-A must, before reporting done, copy raw-decomp-3's two learnings files
  verbatim into its worktree and commit its own learnings file, so 5-B starts
  from a committed record (user).
- **Round 5-A done** (11:00): 8/8 matched, 9 commits + learnings commit
  3b486000 on `worktree-agent-ad85dfd4f5be25cbb`; agent hit the main-checkout
  editing bug once (stray diff saved to /tmp, reverted).
- **Round 5-B done + MERGED** (fast-forward, compare green, baseline
  refreshed; Totals: 14 TUs done / 66, 454 asm remaining, 553 C functions, 55%). Same worktree, fresh luna: temps
  + signedness + unkC26. 4 compaction stops revived. Results: unkC26 → s16
  everywhere, sub_804A280 cast-free, initGame/initGameLoop `|= -1`
  (target ldrh/orr/strh); sub_805AD24 arg3 → unk32; sub_805AFBC step/old →
  unk32, return unk32, no goto/block; sub_804DA48 radius + x0..z1 stay s32
  (unk32 flips blt→blo / asr→lsr); sub_8056EC0 gameData alias folds,
  geometry alias byte-required; LevelState.unk10[2] proven two-word bitset;
  MenuState fields unk0/4/28/34. Review (luna, 2nd try — 1st died "prompt
  too long"; give reviewers an explicit read list) found 5 blocking, all
  resolved. Learnings: round5-style-2026-09-07.md (+ verbatim raw-decomp-3
  copies). Worktree removed.
- Process lessons: a luna agent edited the MAIN checkout for 25 min (diff
  empty in worktree) — give agents the absolute worktree path in the prompt;
  "compare broke" is not evidence — retyping a field means diffing every
  user; tell agents to REPORT when only a rule-breaking shape matches.
- **raw-decomp-4 (running, 12:41→)**: user branch with 12 more matched
  functions on top of raw-decomp-3 (f9d014b6 GetLineIndexOfType …
  9dfd30f7 initLevelEnvironmentActors, incl. gameLoop and dialogue
  sub_80420C4). Luna agent rebasing `--onto main f9d014b6~1` in
  `.claude/worktrees/raw-decomp-4` with compare per commit. Plan (user):
  review agent on the rebased branch → luna fix agent on the same branch →
  manager read → merge. No re-derivation round needed (quality is higher).
- raw-decomp-4 rebased (12 commits on main, compare green, 12:50). Review
  took two luna reviewers (first died "prompt too long" after 13 findings —
  the 1022-line session-astra.md learnings + tool schemas; split by file
  slice): 17 BLOCKING / 3 QUESTIONS in /tmp/review-raw-decomp-4.md. Fix
  agent (luna, 13:15→) on the branch itself: unkF field, s32 return, header
  prototypes (~30 local decls), unevidenced s8/s16/s32, three if-shape
  questions, then the design items — envactor Container/Slot + Meta view
  structs, gameloop `Packet*`→`RiderState*` casts, sub_804B4FC signature
  conflict — canonical form attempted then reported. User ruling on those
  three still open.
- **Cast-removal branch MERGED** (14:55, fast-forward, compare green, baseline
  refreshed; worktree removed). Was `worktree-agent-af09d3dab57679a18` (luna,
  32 commits): unkC24 → s16; ~15 casts absorbed into declarations,
  ~12 kept with cited codegen; learnings cast-removal-2026-09-07.md. Reviewer
  reviewed 13:50 (8 BLOCKING / 2 Q, mostly missing instruction evidence
  for kept casts; battery `void*` params; extern in sound.c). Agent
  reviving through repeated compaction stops (4 so far); most fixes in,
  learnings rewrite + battery/trail retype tests pending. Rule restated to
  it: a compiler diagnostic is not evidence — retype the declaration.
- **raw-decomp-4 MERGED** (15:40, fast-forward 9e801057; compare green, lint
  0, baseline refreshed, worktree removed; branch kept as the user's).
  +11 functions incl. gameLoop, dialogue sub_80420C4,
  initLevelEnvironmentActors, initQuadTreeNode, sub_805BDBC,
  allocateDynamicBoundingAreas, GetLineIndexOfType, sub_804CB08/D110/DAA0/E090.
  Fix agent resolved 17 review findings + 9 from the manager read (rider.h
  prototypes after `#endif`; dead `timer` lever → unkC6C s16 `|= -1`;
  EnvironmentActorContainer wrapper → `Actor*`). Retained with measured
  evidence: KEYINPUT `(unk16)` casts, `(unk8)` sine-table index, `(unk16)angle`,
  s8 oldDirection/fade locals. Learnings: raw-decomp-4-2026-09-07.md (1100+
  lines — reviewers must not read it whole).
- **Rulings (user, 2026-09-07)**: `Packet` is a union of PacketTransport (wire
  bytes) and RiderStateData (`typedef Packet RiderState`) — proven pun, the
  payload IS the rider state. `LineMetaObjectValue` union carries typed
  payload members (config/data/transform/offset) instead of view structs.
  GameData.unk434 is `CameraState` (geometry at unk434.geometry, offset checks
  kept). GameData.unkC24/unkC26/unkC6C/unkC6E are s16 (`|= -1` init).
- **Tooling**: `tools/todo.py` replaced worklist.py (TSV tu/size/name of 🔴/🟡
  reachable functions, `--color red|yellow`). callgraph.py now ends with a
  `⚠ unresolved indirect calls` section (6 local-pointer sites today:
  gameLoop transition, initQuadTreeNode /
  renderActor / sub_80581B8 callback, renderRider positionFunc, sub_8059310
  copy) — when a new one appears, add a CALLBACKS/HANDLER_TABLES entry.
  `_8078990` event-handler table (30 entries, 17 unique targets, all still
  asm: processMetadata_1..10/default, nullsub_14/15/42) is now modelled
  (37e34117) — a new red pool for a future round.
- Reviewer note: luna reviewers overflow on big diffs/learnings — always give
  an explicit read list, split by file group, forbid processed/ and SKILL.md.
- Pending: skill-fold pass over round5-style / cast-removal / raw-decomp-4
  learnings; raw-decomp-3 reference worktree still checked out (remove when
  the user says).
- Skill fold merged (0424b186: 8 added / 4 revised; 5 learnings archived).
  decompiler.md got a "Working in a worktree (manager protocol)" section
  (8668b222) — prompts are now just the function list. MERGE CAVEAT: the
  four R6 wave-1 branches contain the pre-amend commit 8735e006 (had a
  homedir path); merge them with `git rebase --onto main 8735e006 <branch>`
  (from the main checkout), not a plain merge.
- **Round 6 wave 1 MERGED** (16:15; +27 functions: teletype 5 → dc09c4b9,
  R6-4 → a1527557, R6-3 → de0debb1, event.c 13 → 48d36928; all rebased onto
  main dropping 8735e006; compare green, baseline refreshed). Rulings:
  sparse literal `switch (event->id)` (not if-chains); BGControl bitfield
  over BGxCNT read via one cast in sub_8059CB4 (GetBGLayerCntPtr stays
  vu16*); EffectSprites record for _unk3000080; variable-size ActorSequence
  walk keeps a byte cursor with per-use view casts (loop-top view adds r7)
  — `// TODO: reduce casts` on actor_80580C0 (fca7d248). Teletype unkBA
  bitfields measured and rejected (ldrb vs ldrh). Three agents edited the
  MAIN checkout this round despite the protocol line (diffs in /tmp,
  reverted) — consider a hook or read-only src/ on main.
  Still running: teletype agent (worktree recreated from dc09c4b9;
  sub_8063CF4 done, sub_8063E18 296 in progress, sub_8063F84 372 next);
  R6-5 tutorial sub_804A378 (16). Remaining <100 reds after these: only
  asm/arm*.s ARM routines. Next pool: reds 100–300 via todo.py.
- **Round 6 wave 2 merged**: sub_804A378 (83c1f079), collectable
  sub_8056E2C + effects sub_8055914 (59073da6; collectable.c DONE).
  Rulings: agents get NO prior-history pointers in prompts (user killed two
  agents that had them; relaunched clean); a search loop whose target tests
  the element before the bound is `while (elem != x && i < n)` — read the
  asm before offering a "park" fallback; `zero`/`vramN` literal temps are
  levers (write literals); flat `unkNN` fields stay flat without stride
  evidence; TalkingHead.unk18/unk20 are `const unk8*`. Merge recipe now:
  `bash -o pipefail -c '… && …'` — `| tail` masked failures twice and a
  branch was deleted after a failed ff (recovered from the reflog hash).
- **Running (17:19)**: teletype (sub_8063E18 constructor near-miss: signed
  descending clear loop, then sub_8063F84); event.c R6-6 (processMetadata_2/
  _1/_4/_5 + Actor.unkB0 retype incl. rider.c Thumb-bit stores); riderphysics
  sub_804D8D8 (allocator-rank residual r4/r8/r9/sl, checkpointed); levelselect
  sub_80413FC giant (checkpoint 2dfdfaec, first divergence 0xBA, −24 bytes;
  LevelDescription padE[4] bug sent back). Reviews for these still owed.
- Round 6 plan was: reds <100 bytes, 3 per agent, one active agent per TU: R6-1 event.c processMetadata_3/_6/_10; R6-2
  teletype.c sub_8063F64/806415C/806417C; R6-3 actor sub_8058390 +
  beyblade GetTalkingHead + display sub_8050894; R6-4 effects sub_8055C30 +
  layer sub_8059CB4 + tutorial sub_804A364. Wave 2 queue: event.c _9/_C/_E
  → _8/_A/default → _D + nullsub_14/15/42; teletype sub_8064188/8063F5C.
  Excluded: asm/arm1.s render_00/06, arm2.s sub_8757CD0 (ARM, no C TU).
- Never commit homedir paths (user, 2026-09-07); pre-existing:
  decomp.yaml:31 and docs/asmlift.md:8 default ASMLIFT_DIR to one.

## Session 7 (2026-09-06)

State at close: main green, **545 C / 462 asm / 54%**, 14/66 TUs done;
baseline refreshed; no agents running; no monitors running. Worktrees: only
the kept Opus one (`agent-aa3bb15346941d4ce`) + raw-decomp references.
Net: +40 C functions over two rounds.

- **Round 3** (29 draft-less reds, 6 luna agents): 23 matched, 6 parked
  (sub_804DFF4 discarded load, sub_804E090 second mask register,
  sub_80658A4, sub_8056EC0 base+4 cursor, sub_804A908 r7/r8/r9 prologue;
  sub_805DCFC unparked under an accepted layout).
- **Round 4** (18 reds, 6 agents): 16 matched — trail ×3 + projectile
  (R4-1), packet checksum/beyblade/riderphysics/gameinit/levelhud (R4-2),
  riderphysics 2/3 (R4-3), iconmenu + geometry (R4-4), 3 tiny leaves (R4-6);
  parked: sub_804D754 (16-byte target-only `cmp #1/bls; cmp #0x400/bne;
  r0=-1` block with a dead result), renderActor (entry `mov r5,r0` vs
  `mov r4,r0` allocator rank), sub_80420C4 dialogue giant (R4-5: first
  divergence moved 0x1D8 → 0x226 in ~50 builds; best draft parked, worth a
  fresh agent).
- **Process.** One `review` agent per finished branch, prompt = branch +
  assignment list, findings in `/tmp/review-<branch>.md`; the decomp agent
  fixes from that file; then the manager reads the whole diff. Reviewers
  missed real levers four times ((s32) casts before `>> 5`, `(s16)` on a
  local, `__attribute__((packed))` in a draft, draft-only typedefs in
  common.h) and the user caught two fakematches in progress (sub_804E154
  `zero` temp + field-alias pointer; `<< 24` truth tests in dialogue) — read
  in-progress worktrees, not just finished ones. Learnings files are dated
  `<scope>-<date>.md`; parked drafts must be house-style too (real types,
  scratch structs/`extern`s inside the `#if 0`, no Thumb-bit arithmetic).
- **Types decided.** `Packet` (packet.h, 16 bytes, `s8 unk4[12]` payload,
  `unk2_0/unk2_4` nibbles, `unk3` checksum) at `GameData.unk15C4` /
  `unk15D4[4]`; `FrontendState.unkB8/unk140` are 0x88 display records (not
  packets — the union that conflated them was rejected). `ProjectileTemplate`
  (0x30), `SpriteTrailSheet/Frame`, `GeometrySplineLine` (0x10, accepted
  overlay), `CameraState.unk364/unk368` pointer tables, `RiderTemp.unk3C4`
  `SpriteEntry*`, `s16 RiderBase.unk1EE/unk1F2/unk424`, `Actor* GameData.unk658`.
- sub_804A504 kept as `((0 - v) | v) >> 31` with `// TODO: fakematch???`
  (user, one-off). sub_804C3D4 needs sub_804AB50's parameter `unk16` with a
  `u8` local (caller must not narrow; original likely had no prototype).
- Luna agents hit the compaction stop ~10 times; a one-line revive always
  worked. R4-3/R4-4/R4-5 each ran 350–400 tool calls before parking.

### Next session

1. **Round 5 pool** — 15 draft-less leaves exposed by Round 4's parked
   drafts (callgraph follows `#if 0` calls): teletype sub_8063F5C 5,
   sub_806417C 8, sub_8064188 8, sub_806415C 15, sub_8063F64 15,
   sub_8063E18 138, sub_8063F84 170; effects sub_8055C30 14, sub_8055914 63,
   sub_805599C 199; beyblade GetTalkingHead 9, tutorial sub_804A364 8,
   display sub_8050894 10, layer sub_8059CB4 11, actor sub_8058390 38.
   Matching sub_8063F5C/806417C/8064188/8059CB4/8058390 also unblocks the
   parked dialogue and renderActor drafts — retry those after.
2. riderphysics large (sub_804D8D8 173, sub_804DDF8 189, RiderAI_804C8F0
   228) still deferred by the user; riderphysics/geometry/collision have too
   many parked drafts to keep piling on.
3. Giants (≥440, 11): dialogue sub_80420C4 is the only one attempted (parked
   at 0x226). Others untried.
4. Debt carried: BGLayer/Struct3000CA0 `var00`/`field_C` rename; `&_spritesFree`
   ruling; frontend unk588/unkC callback signature; `tools/unused-fields.py`
   decision; DisplayRecord/BGLayer TODO in layer.h.

## Session 6 (2026-09-05/06)

State at close: main green, **505 C / 502 asm / 50%**, 13/66 TUs done;
baseline refreshed; no agents running; keepalive monitor left ON (user).
Worktrees: only the kept Opus one (`agent-aa3bb15346941d4ce`) + raw-decomp
references. Net: +45 C functions, 0 levers merged, `docs/learnings/` folded
(top level = README + processed/).

### What happened

- **Bitfields.** User's branch `decomp/sub_8050050` matched three parked
  riderstate functions with C bitfields; a luna cleanup made the layout
  cast/attribute-free. The skill's "shift pair IS the source" line was wrong
  and is rewritten with the measured lowering table (reads, writes, `|=`/`&=`,
  `mov #16; neg` preserve mask, `s16 : 4; s16 x : 12` ↔ `lsl #16; asr #20`).
  Naming `unk<BYTEHEX>_<BITDEC>`; bitfields go directly in the struct (a
  wrapper union is 4 bytes). riderstate.c DONE.
- **Round 1** (7 luna agents on the 30 draft-less reds): 11 matched — A
  tutorial/hud 3/3, B festate 5/5 (best festate yield ever), C allocQuadTree,
  F rider_vs_rider_collision; D/E/G 0 (parked drafts). Then A round 2: hud
  helpers 3/3; B round 2 on festate 329–463: 0/4 (as history predicts).
- **Round 2** (40 new reds exposed by the merges, avg 123 insns, 10 agents):
  22 matched — R2-1 5/5, R2-2 4/6, R2-3 4/4, R2-4 4/4, R2-5 2/2, R2-6 2/4,
  R2-7 2/3, R2-8 3/3, R2-9 3/4, R2-10 0/5 (geometry). Leaves ≤130 insns
  remain the ~80% band; 300+ stays ~0.
- **Process changes.** `review` agent (`.claude/agents/review.md`): read-only
  luna reviewer, writes `/tmp/review-<branch>.md`, one-line report; flags
  levers, header pollution, foldable temps, `REG_x + N`. Manager reads every C
  diff in full before merging (drifted mid-session, corrected). `skill-fold`
  agent (`.claude/agents/skill-fold.md`, sol) does the bible update; first run
  merged fb8919a8 (7 added / 14 revised, 19 files archived). Attribution
  trailers off (`attribution` block, project + global settings).
  `decompiler.md`: effort high; named registers only; fold byte-identical
  temps; no draft-only header fields — a parked draft declares a scratch
  struct inside its own `#if 0`.
- **Tooling fixes.** diff.ts scanned `expected/` from the repo root and
  `Bun.Glob` does not descend into symlinks → broken in every worktree
  (c64911dc). `tools/update-expected` is a no-op when `expected` is a symlink
  (0b4b41a9). Agents still rm/replace/delete the symlink by hand — the
  keepalive relinks; watch it.

### Lessons

- Luna agents stop at context compaction ("text-only restriction") — every
  long grind needs a revive message; after ~450 tool calls they loop
  (B, R2-2) → retire and hand the branch to a fresh agent.
- >7 concurrent luna sessions → provider 429s (two outages; resume via
  SendMessage, no work lost).
- `git worktree remove --force` on a live worktree discards uncommitted
  work (R2-2's partial fixes) — check status first.
- Two rules that conflicted (typed drafts vs no speculative fields) were
  resolved by the in-block scratch struct.
- Leads not yet acted on: `isMultiplayer()` may return a halfword (target
  normalizes 16 bits in sub_804868C); `Actor+0xA0` ActorRenderState,
  DisplayRecord 0x40/0x44, nullsub_12 returning its arg (E's evidence, in
  processed/envactor-gameloop-effects-2026-09-05.md).

### Next session

1. **Round 3 pool (14 reds, 13 ≤123 insns)** — three batches: projectile
   (sub_804C34C 6, sub_804C354 6, sub_804C3D4 72) + beyblade sub_805749C 6 +
   packet (sub_8043960 9, sub_8043970 24); spritetext printTime 27 + actor
   renderActor 27 + backup sub_80658A4 55 + iconmenu sub_8050DF8 63;
   gamestate sub_80513AC 87 + festate (sub_804423C 97, sub_8044314 123) +
   trail sub_804A908 272. Re-run the callgraph after merging — each merge
   exposes more leaves.
2. Debt: BGLayer/Struct3000CA0 legacy `var00`/`field_C` names (176 hits in
   layer.c) → rename pass to `unk<HEX>`; DisplayRecord/BGLayer TODO.
3. Proposed `tools/unused-fields.py` (libclang over compile_commands.json;
   must treat `#if 0` scratch structs as legitimate) — user undecided.
4. Giants (≥440, 8 of them) still unassigned; historical yield ~0.
5. Carried: `&_spritesFree` scalar-alias ruling; frontend unk588/unkC
   callback signature; `out.json` on main.

Prompt archives: /tmp/agent-prompts-2026-09-05.md (this session's 40
Agent prompts), /tmp/learnings-prompts.md (72 fold/learnings prompts across
134 sessions). Round brief: /tmp/brief-2026-09-05.md.

## Standing rulings (all sessions, consolidated)

- A user instruction is a decision for that case, not a rule. Do not
  generalise one-off calls into standing rulings; only add a ruling here
  when the user explicitly says it is one.
- Bytes are the only truth: `compare` after every change; never
  `update-expected` on a red tree; merges from the main checkout only.
- Levers are rejected even when they match: `volatile`/`register`/`asm`,
  attributes (sole exception: `__attribute__((packed))` on the SpriteEntry
  +0x18 `frame` union — measured required), cast-and-offset, casts on field
  reads/writes, View/overlay structs, scalar-global alias pointers, `.word`
  edits, raw addresses / `REG_x + N` (use SDK names), `(unk32)nullptr` args.
- Record aliases (`&_table[i]`, `&_big.sub`) are source; scalar-global aliases
  are not (`&_spritesFree` still open).
- Types: `unk8/16/32` default; sign only on evidence (asr/ldrsh/ldrsb/signed
  branch/call site); widths decided by matched callers too; bitfields
  `unk<BYTEHEX>_<BITDEC>` directly in the struct; unions only for proven puns.
- Headers: one typedef per layout, in the owning TU's header; fields exist
  only when committed C accesses them; a parked draft declares any extra
  layout as a scratch struct INSIDE its `#if 0`; RAM decls live in ram.h,
  placeholders upgraded in place (same size/address).
- Source: no comments except `/* 0xNN */`; temps that fold byte-identically
  are removed; write literals, not shift-spelled constants; case bodies in
  asm block order.
- Parked functions: never discarded; best draft as bare `#if 0` above the
  untouched `INCLUDE_ASM`, house-style with proper record types; dump kept.
  No learnings for failures (one-line first divergence).
- Accepted layouts: allocQuadTree carves a raw block with `unk8*` + casts;
  sub_805DCFC reaches the line records after `GeometrySpline.pointIndices[count]`
  via `(GeometrySplineLine*)&spline->pointIndices[count]` (user, 2026-09-06);
  `typedef BGLayer DisplayRecord` (TODO in layer.h); CurrentGameSave starts
  with `BackupBlock block0`; GameData.levelHud is a nested LevelHudData;
  FrontendState through 0x5AC (no `_unk3000BE0` split).
- Agents: luna for decomp/review, sol for skill folds, haiku for lookups;
  Opus ban stands (lifted only ad hoc by the user); ≤7 concurrent luna
  sessions (429s beyond); every prompt says "Do not spawn subagents".

## How to work

- You are a manager. All research/decomp goes through subagents
  (`model: gpt-5.6-luna`, Agent tool only, every prompt says "Do not spawn
  subagents"). Decomp agents: `subagent_type: decompiler`,
  `isolation: worktree`, one TU (or one small cluster of leaves) per agent.
  Prompts follow `~/.claude/skills/prompting-codex/SKILL.md`.
- NO Anthropic-model subagents (opus/sonnet/fable) until the user says so
  (standing order from 2026-08-21); use gpt-5.6-luna for reviews.
- Lifecycle: match → **bulk review** (one reviewer per round — luna for now
  over all current worktrees' C diffs; C only, no asm; shape + field types
  only, no renames; any layout claim is a hypothesis the agent verifies
  against asm) → agent simplifies → **my own read of the diff** → merge →
  temp-reduction pass over the batch → sol skill pass → remove worktree.
  Ask agents proactively (before they burn hours) whether they want a
  natural-C draft; when one stalls, read the dump yourself and send concrete
  C — this resolved most stalls this session.
- Agents must commit in their worktree after every matched function (rule
  is in `.claude/agents/decompiler.md`; older agents may still refuse — then
  `git -C <wt> add -A src asm docs && git -C <wt> commit` yourself).
  Learnings (`docs/learnings/<scope>.md`) are written inside the worktree and
  arrive via the merge.
- Merge recipe, ALWAYS from the main checkout (`pwd` first; never from a
  shell cd'd into a worktree — that merges the branch into itself and then
  `worktree remove` pulls the rug): `git merge <branch>`; resolve header
  conflicts (common.h/ram.h accrue parallel typedefs — unify, keep sizeof);
  `clang-format -i` touched src; `cmake --build build --target compare`;
  `tools/update-expected`; commit with explicit paths; `git worktree remove
  --force <wt>`; `git branch -D <branch>`.
- NEVER `git commit -a`: it sweeps concurrent agents' in-progress edits on
  main (tool files, skill) into unrelated commits. Stage paths explicitly.
- Agents sometimes edit the main checkout instead of their worktree. On every
  keepalive tick: `git status --short | grep -v '^??'` on main; if dirty, save
  the diff to /tmp, `git checkout` the files, tell the agent to `pwd`.
- Verify every agent claim yourself before merging: compare in its worktree,
  read the C. "Matches" is not "done": house rules (typed fields, no
  cast-and-offset, no casts on field reads, no m2c names, no raw ROM
  addresses, full prototypes) are enforced at merge time.
- Skill maintenance is batched: do not hand-edit
  `.claude/skills/agbcc/SKILL.md`. Periodically run a **gpt-5.6-sol** agent
  that folds the top-level `docs/learnings/*.md` into the skill and `git mv`s
  them to `docs/learnings/processed/` (the permission classifier may block
  `git mv` for agents — do the move yourself then). Review its diff.
- Temp-reduction pass after every merged batch (done: passes 1–5;
  all notes archived; docs/learnings top level is empty except README).
- Tool-building agents (`general-purpose`, luna) work on main and don't
  commit; review and commit their files explicitly.

## Tooling (all on main)

- `cmake --build build --target compare` — SHA1 is the only truth. C is built
  with `-g` (byte-neutral).
- `bun run tools/diff/diff.ts <sym>` — instruction diff with C line numbers.
  `.word` rows differing only in symbol display are relocation noise. The
  hook forbids piping its output through grep/head.
- `uv run tools/callgraph.py [root]` — tree-sitter C call tree; 🔴 = not in
  C; `#if 0` drafts count as not decompiled; `asm()` is not a call.
- `uv run tools/tu-progress.py [--asm-lines] [--all]` — per-TU INCLUDE_ASM
  remaining vs C count, done TUs green, totals line.
- `uv run tools/asm-annotated.py src/<f>.c <fn> [--all-passes]` — agbcc asm
  plus `.lreg`/`.greg` dumps for the current C (allocator priority ≈
  refs / live_length is readable there).
- `uv run tools/todo.py [--color red|yellow]` — functions reachable from mainLoop still not matched, with sizes.
- `uv run tools/lint.py src/*.c` — lint (first check: prototypes for functions
  defined in another TU → belong in that TU's header); exit 1 on findings.
  Header pass (c5146ca..bac86d6) done: lint exits 0; every cross-TU prototype
  lives in the defining TU's header (new: display/levelrow/menuobject/
  multiplayer/riderphysics/particle/animevent/camera/frontend/... .h).
  Rules: no conditional-prototype macros; the *definition's* signature wins;
  fix callers by typing their variables/fields, never by casting. Side-fixes
  found: sub_8060CDC/resizeSpriteBlock take `SpriteTextBlock*`; RiderBase has
  `Actor unk238/unk2FC`, `SpriteEntry* unk3C4`, `ParticleSystem unk3EC`.
- `expected/` is a flat copy of `build/` (`tools/update-expected`).
- `raw-decomp` worktree (`.claude/worktrees/raw-decomp`, ~700 C functions) is
  a read-only reference with different headers; never merge it wholesale.

### Header conventions decided in session 2

- `LevelGeometryAddresses`/`LevelGeometryTable` (common.h) + `src/geometry.h`
  prototypes are canonical; fully typed (GeometryPoint s32 x/y/z, GeometryLine
  0x20, GeometrySpline, LineMetadata/LineMetaObject, LevelDesign[]).
- `RiderBase` (0x428) is the rider layout; GameData begins with it;
  `GameData.unk42C` is `RiderBase*`.
- `LevelDescription` is 0xD0 and indexed (`LevelDescriptions[i]`), has
  `LineMetadata** metadata` at 0x2C; ActiveLevelDescription no longer exists.
- `SpriteEntry` layout lives in src/sprite.h (shared by sprite.c and
  spritetext.c). showString keeps value-less `return;` for the NULL/empty
  paths (asm falls through with r0 = tested value) and a duplicated if/else
  (collapsing diverges).
- `CurrentGameState`: `s8 unk0`, `LevelState unk4[0x38]`, bytes unk6E8/unk6E9.
- `GameData` sub-structs: collectables (0x12F4), tutorial, levelHud0–3 +
  motions, PolyTable unkB88, unkCA0/CA4/CA8 event listeners.
- `LevelGeometryTable.count` is a documented union (s16 splineCount /
  unk32 splineCountWord): ldrsh in getLevelGeometryAddresses, ldr in
  GetSplineAtIndex.
- Unions only for asm-proven width puns (strh/ldrb on the same bytes), with a
  comment citing both instructions. No casts on field reads. Raw-offset blobs
  with offset tables may use `(unk8*)base + offset`; fixed-stride tables are
  arrays. Variable-size records advance a byte cursor.

## Open questions for the user

- `&_spritesFree` scalar alias (resizeSpriteBlock) — keep open.
- Frontend `unk588` / `unkB4->unkC` callback signature conflict.
- `tools/unused-fields.py` (libclang) — build it?
- ASM_ZEROPAD mid-TU no-op cleanup — offered, not approved.

Older session logs (3–5, verbatim): docs/handover-archive/sessions-3-5.md.
