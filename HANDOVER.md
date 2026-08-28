# Session handover

Living document for the next manager session. Rules of engagement are in
`MANAGER.md`; this file is the *state* — what is running, what landed, what
is stuck, and what to do next. Update it on every merge, agent start/finish
and change of plan.

Last updated: 2026-08-28, session 4 in progress (wave 2: festate-A + geometry/actor agents; temp-reduction + sol skill pass + callgraph tool fix running; monitor on).

## Session 4 (2026-08-27)

- Since session 3 the user merged a type-signedness audit (u32/s32 → unk32,
  then re-signed on evidence) and `fix callgraph` (43c426b); callgraph now
  follows callbacks/handler tables → more reds. It also reports 4-byte
  `.rodata` function-pointer symbols (`__fastMemoryClearARM`, `__oam_8756CC0`,
  `__sound_8757A64`, `__sub_87577B4`) and libgcc `__divsi3` as red
  "functions" — not decomp targets; tool bug to fix.
- Branch `raw-decomp-2` (28 commits off 43c426b; worktree at
  `.claude/worktrees/raw-decomp-2`, ROM matches there) is an Opus agent's
  port of ~19 functions with sloppy integration (13 lint findings: externs in
  .c files; a `#if 0` NONMATCHING sub_80413FC in a new src/levelselect.c).
  Decision: NOT merged — it is a second READ-ONLY draft source ("raw2")
  next to `raw-decomp`; fresh agents redo the functions properly off main.
  Its learnings were folded into the skill and moved to processed/ (4215978).
- Scout report: /tmp/scout-2026-08-27.md — 82 reds, 16 raw2-backed
  (15 matched there), 35 raw1-backed, 31 no draft, 35 parked. Raw2 overrides
  parking for creditsFrontendHandler, sub_804ABFC, sub_80490F8.
- Preamble v2 at /tmp/migrate-preamble.txt: raw2 as primary source with
  "redo integration properly", lint must exit 0 before commit, TYPE FROM THE
  CALL SITE section (scout gives caller → implied signature per function),
  persistence nudge.
- Wave 1 (running, all raw2-backed): A frontend/music/motion (sub_804915C,
  nullsub_33, sub_8049178, sub_80490F8, sub_804ABFC, sub_804967C*,
  sub_805041C*); B gamestate leaves (sub_8051618, sub_80570C0, sub_8050FC8,
  sub_804A0E0, sub_80515E0, sub_80464C0, sub_8051558, sub_8051488,
  sub_806014C*); C credits/levelselect (sub_8061844, creditsFrontendHandler,
  sub_80413FC + levelselect TU split). * = no draft, from asm.
- Wave 1 results: A merged (cfbd885: sub_804915C, nullsub_33, sub_8049178,
  sub_80490F8, sub_804ABFC; music.c is DONE; `FrontendState.history[16]` at
  0x14, index unk7C ≤ 14). C merged (eb265f6: creditsFrontendHandler,
  sub_8061844; credits.c DONE; background.c IWRAM overlay `UnkStruct _3000000`
  REMOVED — it was FrontendState at `_unk3000650`: `Palette paletteA/B` at
  0x54/0x68, unk1C8, `FrontendTransition.unk590` (UnkStruct_sub1) + unk5A8;
  `_unk3000BE0[28]` == FrontendState bytes 0x590..0x5AC; `Palette`/
  `PaletteBuffer`/`UnkStruct_sub1` now live in common.h; credits RAM globals
  typed in ram.c/ram.h; `_3000021` is unk8 at an odd address). B merged (4acb9c3:
  sub_8051618, sub_80570C0, sub_8050FC8, sub_804A0E0, sub_80515E0, sub_80464C0,
  sub_8051558, sub_8051488; `CurrentGameSave` typed at CurrentGameState+0x6FC:
  magic 0xDEAD, LevelState levelStates[0x38], checksum +0x560; FrontendSubobject
  unk0 + s32 unk14 (bgt); `ItemDescriptionEntry` 24-byte stride). Open: sub_80515E0
  casts `&unk6FC` to `BackupBlock*` because sub_8057568 walks 8-byte blocks —
  block-array API vs typed payload, needs a user ruling.
- Wave-1 close-out: temp-reduction merged (29ef319: dropped `state` alias in
  sub_8051488, block-scoped `delta` in credits; all other temps proven needed);
  sol skill fold (1d7c9a6; switch-body-order line corrected); callgraph tool
  fix committed (2423af7: 📦 data pointer / ⚙ runtime nodes, 126→102 reds).
- Wave 2: festate-A merged (41a2156: sub_8046468 [FrontendSelectionObject*,
  const ItemDescriptionEntry*; OBJ_PLTT], sub_80480EC; `_unk30005B0/B4`
  SpriteEntry*, `_unk30005B8/BC` s32; FrontendSelectionObject.unkE). Parked:
  sub_8047E5C, sub_8045CB4 (both need the u16 view of SpriteEntry+0x18 —
  same pun as LoadSpriteSheet → dedicated union agent running), sub_804444C
  (prologue/global lifetime), selectBladeFrontendHandler (not attempted).
  `ItemDescriptionEntry` is now `struct` + forward typedef in common.h (C90:
  no duplicate typedefs). Geometry/actor/camera agent retired after two runs with 0/6 and no
  learnings (three functions never attempted). Manager's own attempt at
  GetLineIndexOfType is a one-register near-match —
  docs/learnings/getlineindexoftype-nearmatch.md has the draft + residual.
  Remaining from that batch, untouched: sub_805EB00, actor_8057C58,
  sub_80596AC[raw1], sub_80526C8, actor_805C48C.
  From-asm yield this wave: 2/12 (festate-A 2/6, geometry 0/6).
  Union agent (sprite frame pun) produced nothing — see LoadSpriteSheet row.
  User decision 2026-08-28: measure asmlift as a draft source BEFORE any more
  from-asm batches (festate-B / geometry redo paused). asmlift stash applied
  to main as untracked decomp.yaml + docs/asmlift.md; measurement agent
  writes /tmp/asmlift-report.md and /tmp/asmlift-out/*.c.
  RESULT: 5/24 produced (updateKeyState, sub_805041C, GetLineIndexOfType,
  processRiderMetadata, sub_805EB00); 19 threw. Failure clusters: 9× callers
  of >4-arg functions ("outgoing stack-argument area not implemented",
  e.g. allocFont), 7× address-taken stack locals / frame arithmetic, 1×
  jump table (selectBladeFrontendHandler), 1× irreducible loop, 1× add
  rN,sp,#imm capture. → asmlift feature work (stack args first) would unlock
  ~half the no-draft reds. decomp.yaml + docs/asmlift.md committed with
  ASMLIFT_DIR. Drafts kept in /tmp/asmlift-out (copy to docs/ if wanted).
- User direction 2026-08-28 (later): FRESH START on the 65 reds, smallest
  first, prompts mention NO draft sources and NO prior parking — agents read
  the asm and the caller. Size-sorted red list: /tmp/reds.txt + the command
  in this session (instruction counts from asm/dump: 1 red ≤10, 6 ≤30, 24
  ≤100, 21 in 100–300, 13 ≥300; sub_80413FC is 1072). Round 1 running: 3
  agents × ~8 reds ≤100 insns (frontend cluster: sub_8050FE8, sub_8050A50,
  sub_80491E0, sub_8050E80, sub_8050F0C, sub_80495C4, sub_8049FF8,
  sub_805041C; gamestate cluster: sub_8050184, sub_805137C, sub_805000C,
  sub_8057104, sub_804A280, sub_8056FAC, sub_805AFBC, sub_8050050; sprite/
  geometry: sub_8061E58, GetLineIndexOfType, sub_80600B4, sub_805529C,
  sub_8060C1C, sub_80659F0, freeSpriteVramLocation). Held back: rider.c/
  camera.c reds (sub_804B5C0, sub_804B4FC — an asmlift-draft agent owns
  processRiderMetadata + sub_805EB00 — DONE, merged: both matched from asmlift
  drafts; RiderBase fields 0x50/52/210/218-22C/3D0/424 typed, GeometrySpline
  unkC, CameraState records/callback/unk354/s8 unk355, `LineMetaObjectValue`
  union (ldr +0x2E / ldrh +0xDA cited); the `riderBase = rider` alias is
  REQUIRED (mov r7,r8 vs mov r6,r0)). rider.c/camera.c reds now free for
  round 2. Round 2 = the 100–300 band.
  Newly parked: sub_805041C (motion, near-match: reset-store register seq +
  2-byte delta; draft in migrate-frontend-music.md), sub_804967C (frontend,
  extra high-reg saves), sub_806014C (multiplayer, reload only reproduces
  with volatile → forbidden), sub_80413FC (levelselect, still ~6 insns short
  after a signedness sweep; step table in migrate-credits-levelselect.md).
- Label survey 0x3000000–0x3000650 (overlay agent): everything referenced
  except `_unk30000DD`, `_unk30004C2`, `_unk300064C`, `_unk30006A4`,
  `_unk30006B8`, `_unk3000C1C`.
- Lessons: agbcc emits jump-table case BODIES in source order (table sorted,
  blocks not) → asm block order dictates source case order; `(x>>4)&1` and
  `(x&0x10)!=0` lower differently. Reviewer "fixes" of game bugs (null deref
  after debug printf) are rejected — we match bytes. volatile/register/asm
  are NOT levers (now in decompiler.md, 410fb3b). Pre-existing volatile on
  main to clean up: src/sprite.c:417-424 (`SpriteEntry* volatile*` — lever),
  src/system.c:10-11 (struct fields — check if hardware); backup.c is legit.
- Policy (user, 2026-08-28): NEVER discard near-miss work — parked functions
  keep their best draft as `#if 0 /* NONMATCHING: … */` above the INCLUDE_ASM
  (decompiler.md 199d91b; near-miss checklist 7826b10). Opus agent (ban
  lifted for this task by the user) is writing docs/style.md (team style from
  matched code, probable per-author TU grouping) and
  docs/learnings/humanize-2026-08-28.md (human rewrites for every `#if 0`
  draft and recorded near-miss) — agents then TEST those rewrites.
- Round-1 sprite/geometry agent merged (ffab08a: sub_8061E58, sub_80600B4;
  parked with `#if 0` drafts + step tables: GetLineIndexOfType, sub_80659F0,
  sub_8060C1C, sub_805529C, freeSpriteVramLocation). Frontend + gamestate
  round-1 agents still running.
- Opus humanizer DONE (67a04c2): docs/style.md (11 sections; authors A=
  frontend/menu/credits, B=engine/sprite/sound/memory, C=gameplay/rider/env;
  'never ternary for clamps', counting-up while, printf-then-continue…) and
  docs/learnings/humanize-2026-08-28.md (21 rewrites). Three luna testers
  running: engine-1 (sub_8062EFC, sub_8065334, sub_80655C0, sub_8065508,
  GetLineIndexOfType, sub_80659F0), engine-2 (sub_80627F0,
  freeSpriteVramLocation, sub_8060C1C, resizeSpriteBlock, LoadSpriteSheet,
  sub_806123C, sub_8062C24), gameplay (sub_806014C, initMultiPlayer,
  initEventListeners, sub_805529C, initRiders, initLevelEnvironmentActors).
  Waiting on the frontend round-1 agent before testing §4 sub_8049CE8,
  §6 sub_805041C, §7 sub_804967C, §15 sub_8049458 (same TUs).
- Rule (user, 2026-08-28): NO COMMENTS in src/ except struct-field offset
  markers `/* 0x1C8 */` (decompiler.md d3c1975). Union/pun citations and
  `NONMATCHING` markers are gone: parked drafts are bare `#if 0`, all
  justification/first-divergence text lives in docs/learnings. A luna agent
  is sweeping existing comments out of src/ into
  docs/learnings/removed-comments-2026-08-28.md (worktree; merge after).
  Also running: ASM_ZEROPAD consistency agent (rule goes to
  docs/asm-zeropad.md, not a source comment); residual-analysis agent
  (docs/learnings/residual-analysis-2026-08-28.md — what construct do the
  near-misses share?). User: style guide is advice only; iteration must be
  luna, never Opus in a loop; the compiler is NOT in doubt (402 matches).
- ASM_ZEROPAD normalised (866b7d4): 5 EOF uses kept (gamestate, iconmenu,
  libc, particle, sound — removing gamestate/particle breaks compare), all
  mid-TU uses removed, every dump has the `.align 2, 0` trailer, rule in
  docs/asm-zeropad.md. Round-1 status: frontend agent 7 matched + sub_805041C
  parked, in review (cast-and-offset in sub_8050A50, casts in callers of
  sub_80491E0, aliases); gamestate agent 4 matched but BROKE compare by
  flipping GameData.unkC26 to s16 (initGameLoop −20 bytes) and reported it
  as "expected" — sent back; lesson: verify compare yourself, always, and
  compare per-object sizes against main's build to localise a break.
- Comment sweep merged (2,644 comments → docs/learnings/removed-comments-
  2026-08-28.md; src has only `/* 0xNN */` markers now). Residual analysis
  (docs/learnings/residual-analysis-2026-08-28.md): no missing flag/macro;
  the near-misses share LIFETIME SHAPING (cached alias vs direct expression,
  cursor+index live, phase-scoped locals, list head/cursor/pred/succ kept
  distinct). Its claim that the parked GetLineIndexOfType draft matches was
  FALSE — manager re-test in a clean detached worktree: SHA1 fails. Lesson:
  an agent's "controlled experiment" is a claim like any other; re-run it.
- Gamestate round-1 worktree after repair: compare green, sizes equal main;
  in second review — sub_804A280 must be PARKED (it read u16 unkC26 through an
  `const s16*` and used `(&transition.unk586)[-2]`; the s16/u16 conflict is
  real: initGameLoop needs u16), sub_8056FAC has cast-and-offset into
  collectedBits[], MenuState.unk2E/2F must stay u8. Engine-2 tester 0/7 on
  first pass (one shape each, ~20 min) — revived with the residual-analysis
  register-role maps and the `union { u16 word; u8 b[2]; }` experiment.
- Gamestate round-1 MERGED after review round 2: sub_805137C, sub_805000C,
  sub_8056FAC (cast-free collectedBits[] indexing); parked with bare `#if 0`
  drafts: sub_8050050, sub_8050184, sub_8057104, sub_805AFBC, sub_804A280
  (needs s16 unkC26 vs initGameLoop's u16 — real conflict). Layouts kept:
  Actor s32 x/y/z, EnvironmentObject.actor, RiderTemp, EnvironmentLine,
  GeometryAddressTable.unkC, CollectableData s32 count + collectedBits[1].
- Frontend round-1 MERGED: sub_8050FE8, sub_80491E0 (callers keep `(s16)`
  casts — open: try an s16 return type), sub_8050E80, sub_8050F0C,
  sub_80495C4, sub_8049FF8 matched; sub_8050A50 PARKED by the manager (the
  matching form is a raw 0x88 offset walk; typed `&ptrC[i]` + countdown is
  two swapped init instructions away); sub_805041C parked. Engine-1 and
  engine-2 testers merged: 0 matches, drafts + step tables only
  (humanize-test-engine.md / -sprite.md). Post-merge build break: two
  agents typed ROM table `_8069FC8` twice (FrontendSelectionRecord vs
  LevelRowMusicEntry) — unified on FrontendSelectionRecord with
  FrontendSelectionData.unk0 (the music index word). Lesson: ALWAYS re-run
  compare after the last merge of a batch BEFORE update-expected — I ran
  update-expected on a broken build once (harmless only because ninja had
  not regenerated the failing objects).
- Round 2 dispatched (3 luna agents, fresh-start prompts, all current rules):
  festate (sub_8046A0C, sub_8044054, sub_8045160, sub_8044C48, sub_8044ED4,
  sub_8048AE8, sub_8047E5C); mixed (sub_804F878 levelhud, sub_80510FC
  gamestate, updateKeyState, newIconMenu, sub_804A550 tutorial, sub_804257C
  transition, sub_804EE54 hud, sub_8063220 palette); rider/actor (sub_804B5C0,
  sub_804B4FC, initRider, actor_8057C58, sub_804967C frontend, sub_80596AC
  layer, sub_80526C8 gameloop). Held (gameplay tester owns the TUs):
  sub_80539E8 gameinit, updateEnvirenmentActors/renderEnvironmentActors
  envactor, sub_806014C multiplayer, sub_8055340 effects. Remaining big
  ones after that: sub_8048310, sub_804868C, sub_80420C4, sub_804444C,
  sub_8045CB4, actor_805C48C, sub_8052B24, selectBladeFrontendHandler,
  collectionListFrontendHandler, sub_80413FC, renderRider.
- Humanized-rewrite testing is DONE: engine-1 0/6, engine-2 0/7, gameplay
  0/6 (all merged as parked drafts + step tables in humanize-test-*.md).
  Net: the Opus style rewrites matched nothing; the 6 gameplay inits keep
  their frame/register residuals (initRiders 0x138 vs 0x134, initLevel-
  EnvironmentActors 0x26C vs 0x268, initEventListeners count/max swap,
  sub_806014C reload). gameinit/envactor/multiplayer/effects/event TUs are
  free again for the held round-2 reds.
- Round-2 mixed agent retired (0/8; real drafts kept for sub_80510FC,
  updateKeyState, sub_804F878; empty stubs deleted). Its untouched five
  (newIconMenu, sub_804A550, sub_804257C, sub_804EE54, sub_8063220) plus the
  previously held reds (sub_80539E8, updateEnvirenmentActors,
  renderEnvironmentActors, sub_806014C, sub_8055340) re-dispatched to a fresh
  agent. Pattern to watch: an agent that parks with an EMPTY body did not
  attempt the function — check draft sizes before merging.
- Round-2b agent retired after burning its context on the 16k-line
  removed-comments inventory (0 work); inventory moved to processed/,
  decompiler.md now forbids reading processed/; fresh round-2b agent running
  on the same ten functions.
- Festate round-2 pre-review: sub_8045160 matched via a `FrontendSpriteEntry`
  View clone of SpriteEntry (u16 frame at +0x18) + casts, pointer-to-global
  aliases and cast-and-offset into `_806DB8C`; sub_8046A0C cast-and-offset
  into `_806E0DC`. Sent back: SpriteEntry `union { u16 word; u8 b[2]; }
  frame` is the only allowed pun representation (3 consumers now), index the
  tables, no aliases — or park. decompiler.md now names these levers.
- Round-2b (retry) first pass: newIconMenu + sub_8063220 drafted (parked),
  8 untouched, draft-only header layouts added — revived with the standard
  corrections. Recurring agent pattern this session: stop after 1–2
  functions, add headers for parked drafts, excuse a red compare; every
  revival needs the same three corrections, so they are now all in
  decompiler.md.
- SpriteEntry+0x18 pun, decisive finding: `union __attribute__((packed))
  { u16 word; u8 b[2]; } frame` is byte-neutral for all matched sprite code;
  the same union WITHOUT `packed` changes 28 bytes near 0x806069C; a
  nested-struct union is 4 bytes. So the pun is expressible only with the
  GCC attribute. USER RULING NEEDED: allow `__attribute__((packed))` on that
  one union when a consumer matches (sub_8045160 matched with an equivalent
  View clone, i.e. it WOULD match), or keep the four consumers parked.
  Reverted to `u8 frame; u8 unk19;` for now (worktree commit c6eaa19).
  Festate round 2: sub_8046A0C parked by the manager (cast-and-offset into
  _806E0DC; the indexed forms diverge at the table access), sub_8045160
  parked (View clone + aliases), 5 drafted; agent doing the RAM-typing
  rollback for parked-only globals before merge.
- Round-2 festate + rider/actor MERGED (1d25bec): sub_804B5C0 matched;
  festate 0 kept (sub_8046A0C/sub_8045160 parked by the manager for levers);
  ~12 more parked drafts with step tables (round2-festate.md,
  round2-rider-actor.md, sub-80596ac.md, sub-80526c8.md). Callgraph now
  shows 57 reds: the parked `#if 0` drafts are parsed as C, so THEIR callees
  surface as new reds (~25 small leaves: StoreFunction, DMA3Copy,
  sub_8058EF4, handleEventListeners, …) — real undecompiled functions,
  dispatched as two leaf batches (≤100 insns). Tool note: callgraph should
  probably not follow calls inside `#if 0`.
- Round-2b retired after 0/10 (drafts merged for sub_80539E8,
  updateEnvirenmentActors, newIconMenu, sub_8063220; round2b.md). Still
  unattempted medium reds: sub_804A550 202, sub_804257C 209, sub_804EE54 215,
  renderEnvironmentActors 241, sub_806014C 276, sub_8055340 288, plus the
  never-assigned 140–450 band and the >450 giants (see the classified list
  in the session log). Round-2 yield on 100–300-insn functions: 2/24.
  Leaf batches A (12) and B (13) running.
- Leaf batches (5–98 insns) are the productive band: 16 matches committed
  within the first hour (A: sub_8049330, StoreFunction, sub_80516E0,
  sub_8048FFC, sub_806185C, sub_8060404, sub_804903C, sub_80501F8,
  sub_80436B0, sub_8061078; B: sub_804E584, getBeybladeActorData,
  rider_8058614, sub_80585C8, sub_804C098, sub_804E530, sub_8058EF4).
  Pre-review: A clean; B's DMA3Copy had `(unk8*)dmaControl + 2` →
  REG_DMA3CNT_H (sent back). Next leaf pool after these: rerun the
  callgraph — every merged draft/function exposes more small callees.
- Leaf A MERGED: 11 matched (sub_8049330, StoreFunction, sub_80516E0,
  sub_806185C, sub_8060404, sub_804903C, sub_805024C, sub_80501F8,
  sub_80436B0, sub_8061078, sub_8043558); MenuState.objectCount is s32;
  CurrentGameState.unk544 = LevelSlot[10] (8-byte); RiderStatePrefix.words
  unk0/2/4 s16; `_8068868` labelled in data12.s. sub_8048FFC PARKED with a
  DESIGN FINDING: the target loads `_unk3000BE0` with its OWN literal, while
  `_unk3000650.transition.unk590.var0C` makes agbcc load `_unk3000650` and
  derive +0x59C → the original source had a separate object at 0x3000BE0.
  So FrontendState probably ENDS at 0x590 (matches the 0x590 placeholder
  size) and `FrontendTransition.unk590/unk5A8` + background.c's use of them
  are the overlay agent's guess. USER RULING NEEDED: split `_unk3000BE0`
  back out as its own typed object (UnkStruct_sub1 + unk32), retype
  background.c/frontend.c accordingly (byte-neutral if literals resolve to
  the same addresses) — that also lands sub_8048FFC.
  Rejected-by-bytes in review: `& 0x3FF` for `(u32)(x<<22)>>22` (literal
  pool), `& 0xF` for `(x<<28)>>28` — the shift dance IS the source here.
- RETRACTED the `_unk3000BE0`-split finding: agbcc folds `&global.member`
  into ONE literal (`_unk3000650+0x590`) but compiles a member LOAD at a
  large offset as base + second literal. sub_8048FFC MATCHED (4a6b541) with
  the sub-object alias `transition = &_unk3000650.transition.unk590;` —
  the same idiom background.c's matched functions use. FrontendState through
  0x5AC stands; no split. Rule recorded in
  docs/learnings/agbcc-global-address-folding.md (fold into the skill next
  sol pass). Retry hint for parked frontend drafts that load `_unk3000A78`
  etc. directly (sub_804967C): write `T* x = &_unk3000650.<sub>;` first.
- Leaf B (8 matched, committed: sub_804E584, getBeybladeActorData,
  rider_8058614, sub_80585C8, sub_804C098, sub_804E530, sub_8058EF4,
  ActorSetFrameSequence; getBeyBladeActorDataForIndex near-miss on a
  record/sheet register swap; allocateParticleSystem + handleEventListeners
  pending) is in its finish+review round: DMA3Copy REG_DMA3CNT_H, `+0xFFFF`
  → `-1`, Actor sizeof check (0xC4), draft house-style, prototypes to
  headers. Frontend alias-retry agent running on sub_804967C/sub_8049458.
- Red count on main after leaf A + sub_8048FFC: 50 unique (42 once leaf B
  merges). Leaf C dispatched: sub_805E8A0, sub_805EEFC (camera),
  sub_8054278, sub_805AD9C (menu), initCollisionData, sub_8059310 (layer).
  Held for after leaf B merges (its TUs): sub_8058754, sub_80584B8 (actor.c),
  sub_804B624 (rider.c). Never-assigned large reds unchanged (11, ≥329).
- Leaf B: 8 matched MERGED (51fec5c + fix): sub_804E584,
  getBeybladeActorData, rider_8058614, sub_80585C8, sub_804C098,
  sub_804E530, sub_8058EF4, ActorSetFrameSequence. Its 9th commit (parking +
  header layouts for parked drafts) broke the ROM and was NOT merged; the
  agent also wrote drafts into the MAIN checkout (removed; diff in
  /tmp/stray-leafB-main-edits.diff) and is redoing the parking commit.
  Merge lesson: sub_8061078's parameter is unk16 — the CALLER (sub_804E530)
  narrows before the call, so a prototype width is decided by matched
  callers as much as by the definition (leaf A had matched the callee with
  `unk32 frame` + `u16 value` only because its header said unk32).
  Process lesson: gate `tools/update-expected` on a 100% compare — I ran it
  twice on non-green trees this session.
- Leaf B parking commit redone correctly and merged (2f9f5b0): bare
  `#if 0` drafts for getBeyBladeActorDataForIndex, allocateParticleSystem,
  handleEventListeners, DMA3Copy; layouts in leaves-b.md. Running: frontend
  alias retry, leaf C, leaf D (sub_8058754, sub_80584B8, sub_804B624), sol
  skill pass over this session's learnings.
- Sol skill pass done (d16ca9a): 7 proven patterns folded (address-of
  folding, caller-decided parameter width, +0xFFFF vs -1, shift-pair vs
  mask, packed 2-byte union, #if 0 callees in callgraph, per-consumer cast
  view); 18 learnings files archived to processed/. Top level now: README,
  humanize-2026-08-28.md (advice), leaves-b.md (fresh).
- Frontend alias retry (sub_8049458, sub_804967C): 0/2 — the sub-object
  alias did not remove their register-allocation residuals; refreshed
  drafts merged (823273b). Running: leaf C (6), leaf D (3).
- Reds on main now 44. Leaf E dispatched (sub_804FE14, sub_804FE30,
  sub_805568C, sub_804DA48); held for after leaf C merges (its TUs):
  getLineMetaAtIndex (geometry.c, 18), sub_8058F60 (layer.c, 119). A luna
  agent is evaluating https://github.com/ethteck/coddog for this repo
  (config in its worktree + docs/coddog.md if it runs on GBA/Thumb).
  Agent scorecard: leaves ~80% (A 12/12, B 8/13, C 4/6, D 2/3 so far);
  130–300-insn functions ~5% (round 2: 2/24; humanize testers 0/19).
- Leaf C MERGED: sub_805E8A0, sub_805EEFC, sub_8054278, initCollisionData;
  GeometryAddressTable + EnvironmentLine clones DELETED, GameData.unk65C is
  `LevelGeometryAddresses` (0x11C) + pad778[0x28] (unk7A0/unk7A4 kept),
  GeometryLine +0x10/+0x11 are bytes (strb in sub_8056FAC; no matched
  halfword reader), typed geometry prototypes restored. Parked:
  sub_805AD9C, sub_8059310. getLineMetaAtIndex + sub_8058F60 now free.
  Merge note: event.c conflict = leaf B's parked handleEventListeners draft
  vs leaf C's matched sub_8054278 — kept both.
- Leaf F dispatched: getLineMetaAtIndex (geometry.c), sub_8058F60
  (layer.c). Running: leaf D (rider.c last function + review), leaf E
  (riderstate/effects/collision leaves), leaf F, coddog evaluation.
- coddog (github.com/ethteck/coddog, Rust) works on this project: GBA/Thumb
  supported, reads build/rom.elf + asm/dump via decomp.yaml (now has the
  standard `versions[].paths` block + ROM sha1). Upstream bug: `Platform::
  from_name` lacks "gba" → stock `match`/`cluster` panic; docs/coddog.md has
  the 4-line local patch (worth an upstream PR). Use: `coddog match <fn>`
  to find decompiled functions similar to a parked one (demo: ~60% matches
  for sub_805041C), `cluster` for duplicates among the asm dumps.
- Leaf E MERGED: sub_804FE14, sub_804FE30 (levelhud), sub_805568C
  (effects); sub_804DA48 parked (riderphysics.c; target saves r4–r7, draft
  r4–r6 — one more live value). Running: leaf D, leaf F.
- Wave 2 candidates (no draft, from asm): batch 4 geometry/actor/camera
  (GetLineIndexOfType, actor_805C48C, actor_8057C58, sub_805EB00,
  sub_80526C8, sub_80596AC[raw1]); festate handlers A/B (sub_8045CB4,
  selectBladeFrontendHandler, sub_8046468[raw1], sub_804444C, sub_8047E5C,
  sub_80480EC, sub_8048AE8, sub_8048310, sub_804868C, sub_80448F4,
  sub_8044C48, sub_8044ED4, sub_8045160); sub_80420C4 (dialogue), initRider,
  processRiderMetadata; gameLoop separately.

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
- `uv run tools/worklist.py` — functions called from C but still asm.
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

## State

Progress: 12/66 TUs done, 439 C functions, 568 INCLUDE_ASM remaining (44%).
Session 3 merged 97 functions (batches 1–17, all migrated from the
`raw-decomp` worktree — only functions WITH a raw-decomp body are worth
trying; every no-raw attempt so far failed). Session 2 merged 69, session 1 8.

### Session 3 workflow (worked well)

1. Scout agent (luna, read-only): `uv run tools/callgraph.py mainLoop` →
   red list → `uvx mapfile_parser sym_info build/rom.map <sym>` for the
   owning TU → `rg` raw-decomp for a C body → batches of ~8 by TU.
2. 7 decompiler agents (luna, worktree each) migrate; rules in
   /tmp/migrate-preamble.txt (recreate from this list if /tmp is gone):
   copy raw body, adapt to our headers, diff.ts to zero, compare, delete
   dump, commit per function, ≤30 min per function then leave INCLUDE_ASM,
   no `#if 0` parking.
3. Re-run the scout after merges: newly decompiled callers expose new reds
   (78 → 58 → 56 functional reds; 9 new per round so far).
4. Temp-reduction pass over the whole batch (running: pass 7).

Merge-review lessons (all happened today): agents will ship `register`
locals, empty `asm volatile` barriers, `(Type*)arg0` casts on a wrongly
typed parameter, parallel "View" structs overlaying GameData, `.equ` raw
ROM addresses, `(x << 24) != 0` for u8, externs in .c files, and m2c
`var_r6` names. Grep does not catch all of it — READ EVERY FUNCTION IN
FULL before merging. sub_804374C/sub_80434EC (menuobject.c) slipped
through; fixed by temp-reduction-7 (merged 1fa3191; `MenuObject`/`MenuState` typed in menuobject.h).

Layout decisions this session: `GameData` now begins with an embedded
`RiderBase base` (0x428); `RiderBase` has typed fields through 0xB8 +
unk234; `RiderState` unified (checksum prefix union at 0, unk54);
`EnvironmentActorSlot` stride 0xC4 proven; `ProjectileSystem` at
GameData+0x1084 (0x8C); `MotionGroup`/`UnkMotion` unified; `MusicTrack`
table `_807561C`; `_LevelRowMusicTable` label exposed in asm/data12.s;
`GameData.unkC26` stays u16 (s16 shrinks initGameLoop by 12 bytes —
sub_804A280 needs an ldrsh from it and is parked because of that).

### Agents running at last update

| worktree | scope | status |
|---|---|---|
| (none) | temp-reduction-7/8/9 + skill pass (f6db672) merged; all learnings processed | — |

### Next steps (user direction, 2026-08-23)

- Scout at a19ffa3 found 98 unique reds reachable from mainLoop: after this
  session ~27 raw-backed remain but are all PARKED (see list below), 33 have
  no raw body. So the raw-decomp copy-over well is dry; next sources of drafts
  are asmlift (below) and writing C from asm (batch 10/13 agents did that fine
  for festate handlers when told typing is part of the job).
- `selectBladeFrontendHandler` (no raw body) was started and dropped — first
  candidate for an asmlift/from-asm attempt.

- **asmlift**: `git stash list` has `asmlift` (decomp.yaml + docs/asmlift.md;
  docs hardcode /Users/marijn/Projects/asmlift — make that an env var before
  committing). `bunx @asmlift/cli asm/dump/8040d18/8040d18-creditsFrontendHandler.s`
  produces C from a dump; some functions throw. Next decomp step: measure the
  success rate over asm/dump and use it as the draft source for reds WITHOUT
  a raw-decomp body.
- **Callbacks — RESOLVED**: `_LevelRowMusicTable` (asm/data12.s, MISNAMED — it's
  the 43×0x18 frontend-screen table; +8/+C/+10/+14 = FrontendObject
  unk8/unkC/unk10/unk14) feeds ~40 handlers; `FrontendState.unkB4` is set by
  `sub_804967C`, `unk588` by `StoreFunction` (proven target sub_8049DE0);
  gameloop `transition` == sub_8052978 (which stores another callback in
  `_unk3000C0C`, unresolved). `tools/callgraph.py` now follows the table
  from build/rom.elf (`HANDLER_TABLES`, one line per table; 🧭 nodes) — true
  reachable red count is ~106. Unresolved: other `unk588` writers,
  `_unk3000C0C`, RenderCode consumers, the exact `unkC` call site.
- **Open design question**: `FrontendState` (common.h) and `MenuObject`
  (menuobject.h) both describe `_unk3000650`; `MenuState` at 0x478 was
  unified and flattened (70a5dde); asm proves itemCount +0x14 and objectCount
  +0x18 are distinct. MenuObject and FrontendState are the same object — user
  doubts MenuState is really one struct; layout table in /tmp/menustate-layout.html.
- `Unk_8755B90` = MIDI note frequency table, 16.16 Hz (entry 69 = 440.0);
  migrated to src/sound.c (1d67430). `Sound_80623A8` builds per-note
  resampling steps (`hz*11025<<12/261/rate`).
- Switch lowering lesson: agbcc emits the compare-tree (cmp/beq, cmp/bhi,
  cmp/bne) for `switch` only with enough cases — an empty `case 4: break;`
  + `default` made sub_8049F58 match (c958651).
- Merged+pruned: `MenuObject` is gone, one `FrontendState` (3edd000); fields exist
  only when committed C accesses them (rule now in decompiler.md).
  `FrontendTransition` at +0x584; `MidiNoteFrequencies` with FIXED_16_16(hz)
  (ae355b7); `_LevelRowMusicTable` has `.size` (43 records).
- sub_8052978 matched: `_unk3000C0C` is a `void(*)(void)` callback set via
  case 5 — next table/setter to trace.
- Parked today (natural C diverges on regalloc): sub_8044054, sub_804257C,
  sub_8049FF8, sub_805AFBC, sub_8063220, sub_80491E0, sub_8057104,
  sub_8046A0C, creditsFrontendHandler, collectionListFrontendHandler,
  newIconMenu, sub_8050C18, sub_8050E80, sub_8050F0C.
- Scout rescan at a19ffa3: 98 unique reds, 65 raw-backed, 33 without raw body
  (skip by policy), 27 parked. After this round ~40 raw-backed remain parked.
- Agents: stopping mid-list is normal — compare every completion against the
  assigned list and revive until exhausted. Agents must never SendMessage.
- temp-reduction-8 merged (5fc4268): RAM decls centralised in ram.h. Open:
  `_unk3000650` is defined in ram.c as a size-pinning placeholder type while
  consumers use `FrontendState` — make the definition `FrontendState` (sizeof
  is known); `sub_8061824`'s header decl is incompatible with its caller shape
  (see spritetext.c local prototype of sub_806123C).
- ASM_ZEROPAD is the fix for a TU whose .text tail pads 00 00 vs nop (iconmenu).
- NEVER `git worktree remove -f -f` a locked worktree: the lock means the
  agent is alive; I did it once and lost its uncommitted work.
- Preamble lesson: "layout incomplete" was being used as a skip reason;
  typing the layout from the asm IS the job (preamble updated; batch 10 did
  11/12 with that mindset, batch 11 did 3/17 without it).
- Other stashes: `globals` (tools/globals.py survey: 59 of 2878 globals
  have conflicting declarations, 40 are `void*` def vs typed extern —
  promotion pass offered, not approved) and `ram comments` (per-global
  referencing-TU comments in ram.c/ram2.c).

### Not matched this session (raw-decomp body exists; natural C diverges)

sub_804ABFC (music), sub_805000C/sub_8050050/sub_8050184 (riderstate),
sub_805529C/sub_8055340 (effects), updateEnvirenmentActors/
renderEnvironmentActors (envactor), sub_8056FAC (collectable),
sub_804B4FC/sub_804B5C0/renderRider (rider), sub_8060C1C (sprite),
sub_80539E8 (gameinit), sub_80490F8 (frontend), sub_8050A50 (display),
sub_804A550 (tutorial), sub_804A280 (levelrow, unkC26 signedness),
sub_804F878/sub_804EE54 (levelhud/hud), sub_8052B24 (results, 272 lines,
never attempted). All still INCLUDE_ASM, no drafts parked.

### Parked (attempted, not matched)

| function | lines | draft | why / notes |
|---|---:|---|---|
| initEventListeners (event.c) | 141 | `#if 0` | VLA proven (`s32 ids[max]`); count/max land in swapped regs: agbcc priority ≈ refs/live_length (count 14/184 vs max 5/114); all permutations tried — processed/event.md |
| sub_8049458 (frontend.c) | 166 | `#if 0` | only the final `unk584 == unk586` block's temps permute; odd early `mov r4,#0` across a call — processed/frontend.md |
| initRiders (gameinit.c) | 349 | `#if 0` | frame 0x138 vs 0x134 (one extra spilled local); riderIndex r8 vs r9 — processed/initriders.md |
| initMultiPlayer (multiplayer.c) | 137 | `#if 0` | arg regs r8/r5 + normalization sequence — processed/init-functions.md |
| LoadSpriteSheet (sprite.c) | 99 | `#if 0` | proven pun at SpriteEntry+0x18 (strh) / +0x19 (ldrb); user approved a documented 2-byte union — BUT (2026-08-28, union agent) under old_agbcc `union { u16 word; struct { u8 frame; u8 unk19; } b; }` occupies 4 bytes inside SpriteEntry and shifts var24/unk28/unk30, breaking every sprite.c/spritetext.c match; packing pragmas ignored, attributes forbidden. Untried: `union { u16 word; u8 b[2]; }`. Same pun blocks sub_8047E5C and sub_8045CB4 (festate) — u16-byte-narrowing.md |
| sub_80627F0 (sound.c) | 145 | `#if 0` | genuinely dead `(var08+1)&-2` retained by target (shared -2 in r5); agbcc DCEs it — sound-2.md |
| sub_806123C (spritetext.c) | 356 | `#if 0` | push mask/frame/slots match; early register roles + spills differ — spritetext-2.md |
| resizeSpriteBlock (sprite.c) | 134 | `#if 0` | register allocation of normalized args/list nodes — sprite-resize.md |
| sub_80655C0, sub_8065508 (spritestring.c) | — | `#if 0` | register/stack shape diverged |
| sub_8065334 (spritestring.c) | — | `#if 0` | target reloads `string->actors` each iteration with no call/aliasing store; only `volatile` reproduces it (rejected) — spritestring.md |
| sub_8062C24 (sound.c) | 310 | `#if 0` | envactor-sound agent draft; byte-cursor sequencer — envactor-sound.md |
| initLevelEnvironmentActors (envactor.c) | 656 | `#if 0` | push mask/hi-regs/slots match; frame 0x26C vs 0x268 (one extra local); point-init loop allocation — envactor-init.md (speculative layouts live in the draft, not headers) |
| sub_80510FC (gamestate.c) | 208 | none | final table scan compiles to pointer-increment instead of indexed — processed/gamestate.md |
| updateKeyState (keystate.c) | 226 | none | body identical; only hard-reg choice for base+4/base+8 invariants differs — processed/updateKeyState.md |
| freeSpriteVramLocation (sprite.c) | 121 | none | earlier "match" used register pinning, discarded — processed/sprite-vram.md |
| sub_8057A7C (system.c) | — | none | orphan, no C caller — processed/sub_8057A7C.md |

Skipped (no C caller): sub_8062EFC (actorheap.c).

### Unassigned red functions

gameLoop (gameloop.c, 930 lines) — the last big one reachable from mainLoop.
Regenerate the full picture with `uv run tools/callgraph.py mainLoop` and
`uv run tools/tu-progress.py`; after the round-5 merges the reachable red set
should be gameLoop + the parked list above.

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

- ASM_ZEROPAD: 7 mid-TU uses are no-ops; only the 2 EOF uses matter; not
  TU-split evidence (processed/asm-zeropad.md). Cleanup offered, not approved.

## Session housekeeping

- A persistent 55-minute keepalive Monitor runs while agents are active
  (task id in the session; stop it with TaskStop once all agents are done
  and the session winds down). Each tick: check `git status` on main for stray
  agent edits, update this file if anything changed.
- Wind-down checklist: merge or park every worktree, run a temp-reduction
  pass and a sol skill pass on the batch, update this file, stop the monitor.
