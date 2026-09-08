# Collision matching notes

## def_94_0_8055CFC (0x8055CFC)

- The exact instruction stream matches with both `unk32` and `unk8` return types for `def_94_0_8055CFC`; the non-void type is required for the null-path `mov r0,#0`, but the return width is not distinguishable in the generated code. The final callback declarations use `unk8`, matching the filter callback.
- `Actor::unkB4` is an owner-dependent union at the same four-byte offset: rider actors use `rider` as a `RiderBase*` (`src/rider.c:49`), while environment actors use `lineIndex` as a signed geometry-line index (`src/envactor.c:153`, read during cleanup at `src/envactor.c:426`, rendering at `src/gameloop.c:437-450`, and event save/restore at `src/event.c:218-229`). The collision callback therefore uses `actor->unkB4.rider` without a cast, and environment users select `.lineIndex` without changing the layout.
- Generic actor initialization clears `Actor::unkB4` through `.lineIndex` (`src/actor.c:86`); the resulting ROM passed the byte-identical compare. The member choice is semantically neutral for the zero value and preserves the target store.
- `if (rider == NULL) return 0;` is byte-required: it produces `bne` to the body followed by `mov r0,#0` and a branch to the epilogue. A `void` early return instead emits `beq` to the epilogue and first diverges at 0x1A.
- `collisionMask` is `unk16`; entry normalization is `lsl r3,#16` / `lsr r3,#16`. The two mask tests use the normalized argument and its copied value as in the target.
- No local temporary beyond the rider pointer is byte-required. Both calls pass masks `collisionMask & 0x90` / `collisionMask & 9` and stack arguments `0x40` / `0` in target order.
- `ActorCollisionResponse` was tested with both `unk32` and `unk8` returns; the final response callback uses `unk8`. `ActorCollisionOverlap`, `sub_8056B54`, and `def_94_4_AddWithBoundingAreaMessage` remain `void` because the overlap slot provides no return-width evidence. `def_94_0_8055CFC`, `sub_805CEB8`, and `initLevelEnvironmentActors` remained instruction-identical.
- `cmake --build build --target compare` passed after replacing the dump and formatting the touched files.


## Matched 2026-09-08

The enabled implementation now matches the full ROM SHA1, and the assembly dump
has been removed. Earlier attempts are documented in `docs/learnings/processed/sub_80413FC-levelselect.md`.

The final changes that resolved the residual were:

- Compute the selected level ID once before searching; only store the index on a
  found element.
- Initialize the layer with `-_3000030.value`, allowing reuse of the positive
  scroll constant through `neg` instead of a separate literal pool entry.
- Express each sprite position adjustment directly in the compound assignment.
  The later folding sweep below also removes both clock-result locals.
- Compare the signed packet selection byte directly with the signed selected
  index. Unsigned casts remove a target register copy and perturb later allocation.
- Use packet bitfield assignments for the low/high nibbles. Correct
  `sub_8043970` to return `u8`, as required by its callers.
- Preserve the repeated multiplayer predicate calls and their original logic.
- Fetch the level state, then the description, before scheduling the offline
  transition. Give this description its own block-local variable.
- Include `sub_80490F8(9)` in the multiplayer confirmation path as well as the
  offline fallback; the original shares the tail of these paths.

Verification: `cmake --build build --target compare` passes with the C function.
The pre-refresh object diff's callback pool entry (`sub_8049DE0 + 1` versus the
Thumb symbol relocation) is resolved correctly by the linker.


## Temporary folding sweep

Each trial changed one staging site or local on top of the last matching source.
Each candidate was built and checked with `cmake --build build --target compare`;
failed candidates were reverted before the next trial. Symbol sizes and first
object-diff rows were measured before reverting. The target size is `0xAA4`.

| Trial | ROM match | Size delta | First differing offset |
| --- | --- | --- | --- |
| firstSprite | Fail; reverted | +0x4 | `+0xEC` |
| secondSprite | Fail; reverted | 0 | `+0x132` |
| sinResult _unk300005C | Pass; retained | 0 | — |
| sinResult _unk3000060 | Pass; retained | 0 | — |
| desc site 8 | Pass; retained | 0 | — |
| desc site 7 | Pass; retained | 0 | — |
| desc site 6 | Pass; retained | 0 | — |
| desc site 5 | Pass; retained | 0 | — |
| desc site 4 | Pass; retained | 0 | — |
| desc site 3 | Pass; retained | 0 | — |
| desc site 2 | Pass; retained | 0 | — |
| desc site 1 | Pass; retained | 0 | — |
| next ternary | Pass; retained | 0 | — |
| ks 5 | Fail; reverted | 0 | `+0x5E8` |
| ks 4 | Fail; reverted | 0 | `+0x6E0` |
| levelState | Fail; reverted | -0x4 | `+0x984` |
| selectedDesc | Fail; reverted | -0x4 | `+0x984` |
| baseData | Fail; reverted | +0x3C | `+0x2` |
| playerData | Fail; reverted | +0x54 | `+0xC` |
| levelId in loop | Fail; reverted | -0x14 | `+0xD0` |
| scrollDelta recomputed | Fail; reverted | +0x4 | `+0x338` |
| ptr replaced by count indexing | Fail; reverted | +0x8 | `+0xD0` |

Description sites are numbered in source order: five display/update calls in
case 1, followed by left navigation, right navigation, and remote selection in
case 2. All eight staging assignments fold; both `desc` declarations disappear.
Both `sinResult` declarations and the `next` declaration also disappear.

Retained locals and the limits of these tests:

- `firstSprite` and `secondSprite`: storing allocation results directly into the
  globals changes allocation/register order (the first trial also adds 4 bytes).
- `ks`: direct calls inside the short-circuit predicate alter when the helper is
  called and change register allocation. The existing local preserves the call
  before the predicate.
- `levelState` and `selectedDesc`: fetching inside the final condition changes
  call order relative to the transition helpers and removes 4 bytes.
- `baseData` and `playerData`: direct expressions add 60 and 84 bytes respectively;
  they also re-evaluate global data or the multiplayer helper across calls.
- `levelId`: folding into the loop repeats helper calls, changes loop behavior,
  and removes 20 bytes. It is a loop-invariant snapshot, not redundant staging.
- `scrollDelta`: recomputing after the layer-update call changes the snapshot
  semantics and adds 4 bytes.
- `ptr`: using the global count as the list subscript adds 8 bytes. The cursor and
  `i` remain actual loop state; `i` also supplies the selected index on a match.

The failed folds above are not claimed to be semantically interchangeable merely
because they inline an expression. The retained locals preserve evaluation timing
as well as target code generation.

The separate transition byte checks also reproduce the full ROM without a cast.
Final verification after formatting: full ROM SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e5` passes; `git diff --check` passes.


## collectionListFrontendHandler (0x080427E4)

Matched in C, size `0xA04`. The full ROM SHA1 passes. Reachability was verified
with `uv run tools/callgraph.py mainLoop`: the callback is reached through the
frontend ROM handler table. The dispatcher supplies the state and command in
r0/r1; the handler does not use r2. A fresh m2c draft was generated from the dump
and checked against the parked C draft and every target instruction.

### Semantic corrections

- Both transition bytes gate only the blend/preview update, not the rest of
  case 1. Their separate byte checks reproduce the target halfword load.
- The blend writes are `REG_BLDCNT`/`REG_BLDALPHA`, with `0x10 - blend`, not
  the draft's BG affine registers and XOR. `sub_80439A0` receives `state->unk140`.
- The detail font's arguments are x=0x70, y=0x28, capacity=0x70, final argument=0x10.
- Preview sprite loading follows the allocation/reset/deletion branch and uses
  argument 5 = 1 and a halfword selection read for its frame.
- The downward list update runs when scroll <= -0xF00; it does not return early.
  Its final clamp updates only the two scroll globals, not the row index.
- Row sprites use vertical scroll plus row position for y, not horizontal scroll.
- Cursor oscillation samples the signed sine table at `0x40 + phase`, where
  `phase` is the byte-narrowed `(clock >> 7) * 0x20` (eight positions). The
  original parked draft used the clock itself as a signed halfword displacement.

### Layout, types, and shared users

`CollectionListData` is one shared header definition: five 0x30-byte text records
at +0, five sprite pointers at +0xF0, and the detail text record at +0x104. Its
size is 0x134. The allocation size now uses `sizeof(CollectionListData)`.
All associated RAM placeholders were upgraded in place, with shared externs in
`src/collection.h`; their addresses and byte extents stay unchanged.

`CollectionSelection` overlays a signed word with two unknown-sign halfwords.
This is a proven differing-width access: target `+0x8A` stores the initial value
with `str r5, [r0]`, while `+0x478` reads the same `_unk3000114` address with
`ldrh r0, [r0]` before the preview's `LoadSpriteSheet` call. Navigation also
loads/stores the word and uses signed `bgt` for the 0x6B upper bound.

Signed evidence: the horizontal and vertical scroll differences use `asr #2`;
row positions use `asr #8`; `_unk3000100`, `_unk300010C`, `_unk3000110`, selection,
and blend bounds use signed comparisons. Loop i and slot use signed bounds.
The initial icon frame is `unk16`: a word-sized local loses the target's
`add r0, #1; mov r2, r0` at +0x192/+0x194. The field accesses and raw bitwise
operations do not justify inventing signed types elsewhere.

`getDecompressorData` and `DecompressorState.source` now accept const input,
consistent with `sub_8057094`'s ROM asset result. The source is stored and read,
never written. All active users of the source field are `sub_8055C4C` and
`getDecompressorData`; both were individually diffed with zero differing rows.
The new collection caller is exact too. The SDK's `LZ77UnCompWram(void*, void*)`
prototype requires `(void*)source` at that API boundary; the SDK was not edited.

### Matching shapes and temporary sweep

The first enabled semantic correction draft differed at +0x4C. A shared loop i
and case-local lifetimes, plus assigning `collectionData` while initializing the
font pointer, fixed the initialization allocation/load ordering. A 16-bit initial
frame closed +0x192. A separate block-local horizontal scroll delta closed +0x496.
Staging targetY before subtracting current scroll fixed +0x57A: putting the whole
formula in one expression reassociates the subtractions and reorders global loads.
Separate sprite lifetimes initially fixed +0x67E; those aliases then folded away.
Writing `-scroll + origin` and `verticalScroll + rowPosition` closed +0x7FE.
Cursor x uses `-scroll + 0x2600 + sine`; rowY stages the selection's 0xF00 scaling.

Each fold below was tested on top of the last matching source using the full-ROM
compare. Failed variants were reverted. First differences are object-diff rows,
including downstream literal-pool displacements. Target symbol size is 0xA04.

| Fold | ROM match | Size delta | First differing offset |
| --- | --- | --- | --- |
| allocationSize | Fail; reverted | -0x4 | `+0x2A` |
| firstSprite | Fail; reverted | 0 | `+0x1F4` |
| secondSprite | Fail; reverted | 0 | `+0x21E` |
| initial frame | Fail; reverted | -0x4 | `+0x192` |
| decompressed | Pass; retained | 0 | — |
| targetY | Fail; reverted | 0 | `+0x57A` |
| row frame 2 | Pass; retained | 0 | — |
| rowY | Fail; reverted | 0 | `+0x8B4` |
| clock | Pass; retained | 0 | — |
| phase mask instead of cast | Fail; reverted | +0x4 | `+0x7CC` |
| row frame 1 | Pass; retained | 0 | — |
| phase local instead of cast | Fail; reverted | 0 | `+0x896` |
| sprite alias 3 | Pass; retained | 0 | — |
| sprite alias 2 | Pass; retained | 0 | — |
| sprite alias 1 | Pass; retained | 0 | — |
| y derived from i | Fail; reverted | +0x4 | `+0x7CC` |
| scroll derived from i | Fail; reverted | +0x4 | `+0x7CC` |
| scrollDelta recomputed | Fail; reverted | +0x4 | `+0x44A` |
| slot repeated index expression | Fail; reverted | +0x84 | `+0x2` |

The allocation-size local, both initial allocation-result locals, initial frame,
targetY, rowY, scrollDelta, and the row/scroll induction values remain because the
measured folds change bytes. `collectionData` is a reused typed record pointer
needed to derive the three member addresses from an otherwise void allocation;
folding that pointer would require a cast or an additional allocation view.
`i` and `slot` are loop/index state; repeating slot's expression changes both
its snapshot across calls and register pressure. Recomputing scrollDelta after
the layer call similarly changes snapshot timing, not just temporary count.

Remaining cast flag: the cursor expression retains
`(unk8)((sub_8057C40() >> 7) * 0x20)`. This is value narrowing, not a struct-field
cast. A byte local moves `asr #7` to +0x896, before the target's sprite/scroll
loads; a mask spelling adds 4 bytes. The target's `asr #7; lsl #29; lsr #23`
sequence is reproduced by narrowing then scaling the table index. The SDK const
bridge above and named hardware-address casts also remain. There are no new
struct-field read/write casts, raw struct offsets, volatile matching levers,
gotos, forced registers, or source comments.

Final checks: zero instruction-diff rows for collectionListFrontendHandler,
getDecompressorData, and sub_8055C4C; full-ROM SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e5` passes after formatting.
The assembly dump was removed; the existing file-tail ASM_ZEROPAD is retained.

## sub_8052B24 (0x08052B24)

Matched `src/results.c`: size `0x794`, stack frame `0xD0`. Both compiled
call sites are in `mainLoop`; the callgraph includes the function. The m2c
output was used only as a semantic draft. The older parked analysis in
`docs/learnings/results-2026-09-08.md` does not describe this final source.

### Layout and semantic corrections

- The stack contains the font at +0x28, a **0x38-byte** MenuState at +0x58,
  and three independent FrontendResource objects at +0x90/+0x98/+0xA0.
  The former MenuState declaration incorrectly included the following
  frontend-only objects. Those members now belong to FrontendState directly,
  at unchanged absolute offsets: menu +0x4B0, object-items +0x520, block +0x524,
  timer +0x528, cleanup +0x52C, motion +0x55C. Existing frontend users were
  updated to use these fields. The target compiler verified these offsets,
  MenuState's size, and the later +0x578/+0x584 members.
- GameData +0x870 is a SpriteTextCleanup passed by address at 0x08052BD4;
  +0x8A0 is cleared by `strh` at 0x08052BE2. These replace padding, preserving
  the next existing font at +0x8A8. No scratch global or pointer casts remain.
- The target passes a complete 0x428-byte RiderBase from the GameData array to
  sub_804C0C0. RiderTemp duplicated that same storage; its fields at +0x3C4,
  +0x3CC and +0x424 already exist in RiderBase. Removed the duplicate type and
  made the +4 pointer self-typed. The established sub_804C118 consumer proves
  the signed +0x424 view; the combined declaration preserves its original
  sign extension. Existing rider functions retain their bytes.
- Menu resource arguments and their stored fields are pointers to ROM data,
  so sub_805AD24 now accepts typed const pointers. The callback uses the
  existing MenuStateCallback signature; its unused indices are signed to
  match that declaration. No callback-address arithmetic is needed.
- Network exchange uses the freshly addressed local packet; acknowledgements
  use the saved local packet, not the remote rider packet.
- Both menu-item loops visit `objectCount` entries with signed `while (count--)`.
  Cursor animation is inside the nonempty-menu branch. Each navigation key
  test reloads the input after calls that can change it.
- Collection-bit updates capture GameData before getLevelDescription2, then
  update the bitset directly. This gives the target r4 base, r1 countdown,
  r3 bitset address and r2 accumulator without hand-written load/store staging.

### Matching experiments

Removing the callback local fixed the first instruction difference at +0x22:
that local had forced an additional spill register during the menu call. The
allocation dump identified its stack-argument store as the spill trigger.
Giving the animation phase its own menu pointer recovered the initial r8
menu-address lifetime and the later r7 phase lifetime. Restoring the sequence
comparison's equality-first source shape then matched through +0x4AA.
Reusing the movement delta for sub_80491E0's result matched the item loops.

Cursor coordinates need separately staged getter results and current
coordinates. Reusing one getter-result local across all four calculations
adds `mov r1,r0` after each call; separate left/right x/y locals remove those
moves. Loading the sine sample into `offset` before multiplying by two is
also required by this tested form: folding it changes `ldrsh r1` to
`ldrsh r0` at +0x53C.

### Folding sweep

Used the installed decomp-fold-temps runner with the full build-and-ROM
comparison as its acceptance check. Every rejected trial restored the last
passing source; compiler failures were not treated as matching evidence.

| Trial | Result / first divergence |
| --- | --- |
| Make sequence, timer and phase byte locals; remove three narrowing casts | Exact |
| Remove selection casts | Exact |
| Fold tableLanguage into getLanguage indexing | Exact |
| Fold table base into combined index | +4 bytes; first pool displacement +0x9C |
| Fold table base while keeping pointer-plus-index grouping | Same size; removes table-base load +0xE6 |
| Inline language query in menu initialization | Same size; moves menu-address setup to +0x124 |
| Remove initialization-only menu alias | Exact |
| Remove phase menu alias | Same size; removes `mov r7,r9` at +0x4A2 |
| Inline LevelDescription result into count load | Exact |
| Fold captured GameData pointer | Same size; loses pre-call base load at +0x474 |
| Fold cached sequence keys | Exact |
| Fold saved local packet | +0x18 bytes; first difference +0x14 |
| Inline sine load into multiply | Same size; first register change +0x53C |
| Fold current-coordinate staging, keeping separate getter locals | Same size; first register/pool difference +0x530 |
| Inline getter results but keep `(current = coordinate)` inside subtraction | Exact, **rejected as source cleanup**: current otherwise becomes a dead assignment |
| Remove movement argument's `(s16)` | Size 0x790, frame 0xD4; first difference +0xA |

Retained separate getter locals rather than the artificial assignment-expression
variant. Remaining locals include actual loop/animation state, moving item
pointers, the saved packet, and the measured language/table/menu/GameData
lifetimes above. The remaining numeric cast is
`sub_8061824(&item->text, (s16)delta, 0)`; it is not a struct-field cast.
The coordinate staging and separate sine load/multiply are measured source
requirements of the tested forms, not claims that no cleaner match can exist.

### sub_8061824: reverted signature experiment

The repository already declares this function with s32 arguments in its header
but defines it with s16 arguments. Changing the header to s16 made the new
caller exact, but swapped two argument-setup instructions in sub_804A110 at
0x0804A1BE and 0x0804A1C0. A wide-argument definition with internal narrowing
also reproduced all bytes. That does **not** prove the original signature.
After the user's review, restored the existing declaration and definition,
and retained explicit narrowing only in the new caller. There is no final
change to sub_8061824 or its header. The existing signature inconsistency
remains a separate investigation, not a finding resolved by this match.

### Verification

The full ROM matches SHA1 `cd527c8c24e20e33913fc45199e64b3e6138a6e5` after
formatting. Fifteen target-compiler layout assertions passed. The four
remaining textual function-diff rows are relocation display differences
(two string-table offsets, the callback Thumb address and a menu table);
the resolved ROM bytes are exact. Removed the matched assembly dump.

Instruction diffs for 109 compiled C functions in the affected frontend, menu,
rider, rider-physics and game-loop translation units found zero differing
symbols before refreshing expected/.


## sub_805CEB8 — matched collision traversal

Matched at 0x0805CEB8 in src/geometry.c, reachable through sub_804B8F0
in the mainLoop callgraph. The instruction body is 0x546 bytes, followed
by two alignment bytes; the next function starts at 0x0805D400. Stack is
0x60 bytes. The fifth argument is the array of nullable object-offset pairs,
not an extra callback argument. The return value is always zero.

### Corrections and shared types

The parked draft used a fifth response-callback argument (&callbackDone),
swept X bounds too early, and a loop continue that could bypass increment.
The target's first X overlap uses the unswept actor bounds. Swept X bounds
are computed after the vertical response and reread the actor fields because
the filter callback may change them. Negative vertical responses update the
lower broad Y bound. The four horizontal cases have deliberately different
object-offset and 0x80 adjustments, reproduced from the target.

Actor bounds A8/AA/AC/AE are s16: this function uses ldsh at all four
offsets before shifting by eight. Existing actor_80585F8 only stores them
with strh and remains exact. The other textual Actor-bound user in initRider
is parked; the similarly named fields in other structs were not changed.
Actor.unk50 is a word load, not the parked scratch layout's halfword.
GeometryLine.unkD is a byte read (ldrb) used in signed multiplication and
arithmetic right shift by seven. GeometryLine stays 0x20 bytes; Actor's
layout is unchanged. No union or alternate layout was introduced.

ActorCollisionFunctions describes the three function pointers at offsets
0/4/8 of Actor.callbacks.unk4. The response callback receives four arguments;
the overlap callback receives three. call_rider_94_8 normalizes its fourth
argument to a halfword and its callback result to a byte. The shared table
replaces the void-pointer array local in initLevelEnvironmentActors.
sub_805E50C retains generic pointer inputs and initializes that table through
a typed local. Instruction diffs for that initializer, actor_80585F8, and
initLevelEnvironmentActors are unchanged, and the whole ROM comparison passes.

### Matching and folding

Loading all four scaled endpoint coordinates before testing raw coordinates
reproduced the opening 0xE4 bytes and corrected the frame from 92 to 96 bytes.
The remaining match came from assigning the lower broad bound before the upper
one, declaring that spilled lower bound before the X bounds, and completing
the initial X minimum before loading the positive bound. Separate initial and
swept X locals keep the two phases' lifetimes distinct.

Removed both X-offset staging locals, both callback aliases, magnitude
staging, and all four field-pointer aliases. Also simplified the duplicated
loop entry test to a for loop and replaced an empty if/else with the positive
overlap condition. No casts, raw offsets, artificial blocks, or rule exceptions
remain in this function.

The four field aliases initially looked individually necessary. Removing them
in reverse declaration order (yPositiveField, xPositiveField, yNegativeField,
xNegativeField) was exact at every step. Retesting rejected candidates after
accepted folds was essential. The final complete sweep retained the following
locals in the tested forms; these are measured results, not impossibility claims.

| Tested fold | Size delta from 0x546 | First divergent instruction |
| --- | ---: | --- |
| initialMaxX | +14 bytes | `0x00000144->ldr       r1, [sp, #36] → 0x00000144->ldr       r0, [sp, #36]` |
| initialMinX | -16 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #92` |
| object | -2 bytes | `0x00000042    ldr       r4, [sp, #128] → ` |
| point0 | +10 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #104` |
| point0X | +0 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #100` |
| point0Y | -2 bytes | `0x00000028    str       r2, [sp, #72] → 0x00000028    str       r2, [sp, #68]` |
| point1 | +10 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #104` |
| point1X | -4 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #100` |
| point1Y | -22 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #92` |
| reuse-y-start | +0 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #92` |
| share-x-bounds | -2 bytes | `0x0000002e    ldr       r4, [sp, #20] → 0x0000002e    ldr       r0, [sp, #20]` |
| yMargin | -2 bytes | `0x00000028    str       r2, [sp, #72] → 0x00000028    str       r2, [sp, #68]` |
| yNegativeOffset | -6 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #92` |
| yPositiveOffset | -4 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #92` |
| yStart | +8 bytes | `0x0000000a    sub       sp, #96 → 0x0000000a    sub       sp, #100` |

The line pointer and saved motion/offset values survive callbacks and cannot
be replaced by fresh reads without potentially changing which line or motion
is used. Bounds, masks, callbackDone, and the loop index are evolving algorithm
state. Endpoint aliases and precomputed coordinates, Y offsets/margin/start,
and initial X bounds remain because the tested folds above change bytes.

Removed the matched assembly dump. Final clang-format and full ROM SHA1
comparison pass: cd527c8c24e20e33913fc45199e64b3e6138a6e5.


## sub_805D650 — matched spline movement

Matched 0x0805D650 in src/geometry.c, reachable from sub_80584B8 under
mainLoop. Body size 0x51A plus two alignment bytes. The function advances
Actor.unk88 along a spline, adjusts movement at segment boundaries, optionally
switches splines, reverses or detaches at endpoints, and dispatches callbacks.
The existing compiled caller supplies Actor* and ignores the return value.

### Stack and flags

The target reserves a 76-byte fixed frame, then 80 bytes for four 20-byte
SplineConnection records. A local capacity initialized to four and a VLA
reproduce both reservations and the saved/restored stack pointer. A fixed-size
array changes the prologue and function body; final fixed-capacity trial is
0x4C6 bytes versus 0x51A, first difference +0xA (144 versus 76 fixed bytes).

The first draft scoped the VLA inside an anonymous block. The user explicitly
rejected anonymous blocks. Removed that block by initializing index, nextPoint,
and capacity in their declarations and declaring the VLA at function scope.
This is byte-identical. No anonymous blocks remain, and they must not be used
as a matching technique in subsequent work. Moving the VLA declaration to the
old connections-pointer declaration position also removed that alias exactly.

SplineMotionFlags uses four unk8 one-bit fields. Four independent zero stores
produce the target's repeated masks while leaving irrelevant upper bits alone.
Using unk32 bitfield bases instead produced shift/sign tests at +0x22A, +0x3FE,
and +0x416 and changed allocation beginning +0x1E4. Byte bitfields fix those
differences. Direct truth tests match; explicit == 1 tests are unnecessary.

### Shared layout and prototype evidence

Actor.unk80 now points to LevelGeometryAddresses. Actor.unk88 is s32: the
entry loads it and performs asr #18, and later interpolation uses asr #8.
The new unk8 field Actor.unk8C is loaded with ldrb and compared with 1/2.
GeometrySplineLine remains 16 bytes: unk0 is s8 (ldsb in boundary comparison,
with ldrb/lsl/asr at the first test), unk8 is s16 (ldsh), and unkC retains its
existing signed word declaration. Untouched bytes remain padding.

SplineConnection is 20 bytes, proven by sub_805DBF0's output stride. The matched
consumer accesses point index +4, spline index +8 and line pointers +C/+10;
+0 is left as padding because this function does not use it. Its scratch array
capacity is passed as four to sub_805DBF0, which receives the point index as
its fifth argument. The caller tests its low byte, reflected in the declaration;
the helper's internal counter is halfword-sized and the helper remains assembly.
sub_805E068 also receives a fifth argument, the signed segment fraction shifted
right by eight. sub_805D610 takes Actor* and its result is unused.

ActorSplineCallbacks defines function slots +8 and +C. The first receives five
arguments, the second three. Actor.callbacks.unk0 becomes void*: existing
environment initialization stores an integer-word callback/configuration table
there, while this path interprets it through typed ActorSplineCallbacks locals.
The environment table's final word is selectedCount, so it was not retyped as a
universal function pointer. No speculative union or function-pointer cast was
introduced. Both callback-table locals remain necessary in the tested form:
merging them changes the table load at +0x44C from r0 to r2.

One pointer cast remains:
`(GeometrySplineLine*)&spline->pointIndices[spline->pointCount]`.
It locates the typed line array immediately after the variable-length index
array, using the same packed-layout expression as existing sub_805DCFC. It is
not a numeric cast on a field read or raw byte-offset dereference. This packed
array boundary is the remaining cast to flag for review; no cast is used to
hide signedness or an unknown callback signature.

### Folding results

Removed currentAngle, then nextAngle; the latter failed before the former
was removed and passed on retest. Removed Y/Z staging, position, the scratch
pointer alias, and the anonymous scope. Early pointIndices and Y/Z experiments
had invalid textual substitutions; those compile failures were discarded and
rerun correctly, and are not evidence that the locals are necessary.

| Final tested reduction | Size delta | First difference |
| --- | ---: | --- |
| Fold pointIndices into spline->pointIndices | -16 bytes | +0xA: fixed frame 72 instead of 76 |
| Use fixed capacity four | -84 bytes | +0xA: fixed frame 144 instead of 76 |
| Fold interpolation result into conditional call/test | +4 bytes | Extra cmp at +0x492 |
| Merge callback table locals | 0 | +0x44C: table load r2 instead of r0 |
| Reuse nextPoint for endpoint callbackPoint | 0 | +0x350: sub r0,#1 instead of sub r4,r0,#1 |

The saved index, spline, line-array pointer, movement values and previous
position span calls or actor mutations; rereading those sources would change
semantics. The remaining branch-selected pointers, bounds, angle and flags
are working algorithm state. The retained locals above are required by the
specific tested folds, not claims that no other source form can match.

### Verification

Full ROM comparison passes after clang-format, with SHA1
cd527c8c24e20e33913fc45199e64b3e6138a6e5. Target instruction diff has zero
changed rows. Existing sub_805C3BC, sub_805DCFC, sub_80584B8 and
initLevelEnvironmentActors have unchanged instruction diffs after shared type
changes. Removed the assembly dump and refreshed expected only after a passing
full ROM comparison. The new match remains uncommitted; the preceding
sub_805CEB8 work was committed separately as 6155415c at the user's request.

## sub_80561EC — not matched; typed draft preserved

The target remains assembly and the best C draft is parked immediately above
its `INCLUDE_ASM` in `src/collision.c`. The dump is intentionally retained.
All draft-only layouts and helper declarations remain inside the bare `#if 0`
block; no shared header fields or active caller declarations were changed.

### Result and remaining mismatch

The selected draft has the target's 132-byte stack frame, argument roles
(actor r4, geometry r6, line r5), and point aliases (point0 r8, point1 r9).
Its first instruction divergence is function offset `+0x36`:

- target: `lsl r3, r1, #5`
- draft: `lsl r7, r1, #5`

The target keeps the minimum X in r3 and minimum Y in r2 while spilling the
maximum X/Y values at `sp+0x78` and `sp+0x7c`. The draft assigns those minimum
values differently. The target then loads the raw line byte into r1, masks
bit 3 in r0, and stores the raw byte at `sp+0x80`; the draft uses a different
load/mask/store register order. In the case 0x80 and 0x92 calls, the target
materializes result-buffer addresses in r7 (`sp+0x28` and `sp+0x50`), while
the draft uses r3. The remaining residue is allocation and lifetime shaping,
not an unresolved instruction-level operation.

Three 40-byte collision-result records are required by the target at
`sp+0x00`, `sp+0x28`, and `sp+0x50`; maximum X/Y and the cached flag follow at
`sp+0x78`, `sp+0x7c`, and `sp+0x80`. The line record accesses offsets +8, +D,
+F, +10, +11, and +16. The rider accesses +0x68, +0xf4, +0x1c0, and +0x1c3;
the actor accesses +4, +8, +c, +0x48, and +0xb4. These are represented only
by scratch types in the parked draft.

### Measured step table

Each row is one natural source-layout experiment. Instruction offsets and
registers below are from the generated object diff; failed candidates were
restored before the next trial.

| Change | Frame / early allocation | Measured result |
| --- | --- | --- |
| Three independent result records plus scalar max/flag locals | 128 bytes; argument roles varied | First divergence at `+0x0a`; cached flag stayed in a register |
| Aggregate result records, max X/Y, scalar flag (`CollisionScratchDraft`) | 132 bytes; actor r4, geometry r6, line r5; point0/point1 r8/r9 | First divergence moved to `+0x36`; minimum X was r7 instead of target r3 |
| Same aggregate with `flags[4]` | 132 bytes, but early allocator and flag sequence worsened | Did not improve the `+0x36` residue or raw-byte placement |
| Separate tail `CollisionBoundsDraft` after result records | 132 bytes, but argument roles became actor r5, geometry r6, line r4 | Rejected because the target preserves actor r4 and line r5 |
| Array-backed three-record aggregate | 132 bytes and point aliases unchanged | No improvement over named aggregate fields |
| Signed/unsigned flag locals and packed raw/bitfield wrappers | Frame/register placement changed between trials | No variant produced target `ldrb r1; mov r0,#8; and r0,r1; strb r1` |
| Result-pointer alias variants | Target helper buffers remained r7; draft remained r3 in the best frame-132 source | No natural alias spelling removed this residue |
| Canonical shared Actor/line/rider layouts | Shared users changed or argument allocation regressed | Not retained; draft-only fields stay inside `#if 0` |

The target's explicit zero return in case 0x8c is retained in the draft, while
other fall-through paths leave the return value unspecified. The existing
active caller still uses its original three-word declaration and ignores the
return value.

### Final state

`cmake --build build --target compare` passes with the original assembly active.
This verifies that parking the draft preserves the ROM; it is not an exact C
match. The function is parked because the remaining differences are
allocation-only after the 132-byte/r8-r9 layout was reached.
