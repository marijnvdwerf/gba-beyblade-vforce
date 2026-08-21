# Review round 3

## Worktree 1: agent-ae45fd5c (geometry, spritetext, rider, animevent + headers)

### sub_805E50C (geometry.c)

Fine as is. Three-word store into a unk32 array.

### sub_805E514 (geometry.c)

Fine as is. Note the out-of-order stores (0, 1, 3, 2) -- presumably matching-required.

### sub_8061228 (spritetext.c)

Fine as is.

### sub_804B4A4 (rider.c)

Fine as is. Clean struct field access, no casts, guard-before-dealloc pattern is correct.

### newPolyTable (animevent.c)

Fine as is. One minor observation: the `printf` extern strings are `const u8[]`
but printf expects `const char*`. agbcc will silently convert, so not blocking,
but if any other TU declares these as `const char[]`, unify to one type.

### PolyTable (common.h)

Fine as is. Size 0x18 matches the old `unk8 unkB88[0x18]` in GameData.

### SpriteTextCleanup refinement (common.h)

Fine as is. The split of `unk0[0x14]` into `unk0[0xA]` + `unk16 unkA` +
`unkC[0x8]` is proven by sub_8061228 writing `arg0->unkA = 0` (16-bit store at
offset 0xA).

### RiderBase (common.h) -- needs extension

RiderBase is 0x424 bytes, but the rider element size is 0x428 (RiderBlock on
main). sub_80538C0 iterates `_gameData->unk430 + 1` riders and passes
`_gameData` itself (a GameData\*) for i==0, then `&_gameData->unk42C[i-1]`
(RiderBlock\*, 0x428-byte elements) for the rest. The struct that both
sub_804B4A4 and initRider/processRiderMetadata operate on is 0x428 bytes. Extend
RiderBase by 4 pad bytes so it matches the array element size, and replace
RiderBlock with it:

```c
typedef struct RiderBase {
    unk8 unk0[0x238];
    unk8 unk238[4];
    unk8 unk23C[0xC0];
    unk8 unk2FC[4];
    unk8 unk300[0xC4];
    unk32 unk3C4;
    unk8 unk3C8[0x20];
    unk8 unk3E8;
    unk8 unk3E9[3];
    unk8 unk3EC[0x34];
    struct AllocatedBlock* unk420;
    unk8 pad424[4];
} RiderBase; /* 0x428 bytes -- replaces RiderBlock */
```

Then GameData:

```c
typedef struct GameData {
    /* bytes 0x000-0x427 overlap with the rider layout (GameData IS rider 0).
       Fields below are game-specific overlays within the rider footprint. */
    unk8 pad0[0x200];
    void* unk200;          /* 0x200 -- initRiders stores geometry line ptr */
    unk8 pad204[0x30];
    s32 unk234;            /* 0x234 */
    unk8 pad238[0x196];
    unk16 unk3CE;          /* 0x3CE -- used by initRiders */
    unk8 pad3D0[0x58];
    AllocatedBlock* unk428;
    RiderBase* unk42C;     /* array of secondary riders */
    s32 unk430;
    ...
};
```

Hypothesis: unk200 and unk3CE are only proven as GameData fields (accessed via
`_gameData->` in initRiders, never via a secondary-rider pointer). They may not
exist in secondary riders. Verify against asm before relying on them in
RiderBase.

### gameloop.c `&_gameData->unkB88`

Fine as is. Correct address-of for the now-typed PolyTable field.

---

## Worktree 2: agent-a75112df (temp-reduction)

### sub_8053F0C (gameinit.c)

Removed `gameData = _gameData` local from all four switch cases. Simpler and
more readable. Must verify matching -- if agbcc loads the global once per case
body via CSE this will match; if it emits multiple loads it will not. The
previous review (round 2, sub_804F800) noted that agbcc does CSE single-path
globals on its own, and each case here returns immediately, so this should be
fine. Verdict: improvement, verify asm.

### sub_8055CB8 (collision.c)

Removed `(void*)` casts from function-pointer arguments to sub_805E50C. Since
sub_805E50C takes `unk32` parameters (worktree 1), function pointers convert
implicitly. Cleaner. Fine as is.

### sub_804FEE8 (levelhud.c)

Changed `if (*status != 0)` to `if (base->levelHudStatus != 0)` but left
`*status = 0` unchanged. This is half-done -- the read goes through the struct,
the write still goes through the pointer. Either remove `status` entirely (both
read and write through `base->levelHudStatus`) or leave both through `status`.
Proposed fix -- remove the `status` local completely:

```c
void sub_804FEE8(void)
{
    GameData* base;
    SpriteTextCleanup* hud;

    base = _gameData;
    hud = &base->levelHud0;
    if (base->levelHudStatus != 0) {
        sub_8061228(hud);
        sub_8061228(&base->levelHud1);
        sub_8050584(&base->levelHudMotion0);
        sub_8050584(&base->levelHudMotion1);
        base->levelHudStatus = 0;
    }
    sub_8061204(hud);
    sub_8061204(&base->levelHud1);
    sub_8061204(&base->levelHud2);
    sub_8061204(&base->levelHud3);
}
```

If this doesn't match (the status pointer forces a register allocation
difference), the original fully-through-pointer version is better than the
inconsistent mix.

---

## Worktree 3: agent-aa2a820a (gameinit.c initRiders) -- brief

### initRiders (gameinit.c)

Mostly clean. Issues:

1. **`rider = _gameData;`** -- rider is `void*`, but `_gameData` is `GameData*`.
   This works but means `initRider(rider, ...)` receives a GameData\* as void\*.
   Since GameData's first 0x428 bytes ARE the rider, this is correct. Fine as is.

2. **GeometryAddresses vs LevelGeometryAddresses** -- this worktree defines
   `GeometryAddresses` in common.h; worktrees 5 and 6 independently define
   `LevelGeometryAddresses` with different field names and types for the same
   struct. This must be unified before merge; see Headers section below.

3. **ActiveLevelDescription extended** -- adds `pad1C[0x10]` + `unk32 unk2C`.
   Worktree 7 replaces ActiveLevelDescription entirely with a union inside
   LevelDescription. These conflict; see Headers section.

4. **`getLevelGeometryAddresses` signature** -- takes `GeometryAddresses*` here,
   but `LevelGeometryAddresses*, unk32` in worktree 5 and
   `LevelGeometryAddresses*, void*` in worktree 6. The second argument differs:
   this worktree omits it entirely, worktree 5 passes an unk32, worktree 6
   passes void\*. At most one is correct. Verify against asm.

### GameData fields (ram.h)

Adds `void* unk200` at 0x200 and `unk16 unk3CE` at 0x3CE. Both are inside the
rider footprint and only proven via `_gameData->` access. Fine for GameData, but
must not be added to RiderBase without asm proof for secondary riders.

RiderBlock gets `void* unk200` added. This is speculative -- unk200 is only
proven for the primary rider (GameData). Hypothesis needing verification.

---

## Worktree 4: agent-abfd0d6e (frontend.c) -- brief

### sub_8049264 (frontend.c)

1. `sub_8050384((UnkMotion *)_unk3000650.unk458)` -- cast on field read. If
   unk458 is really an UnkMotion, declare `UnkMotion unk458` in FrontendState
   instead of `unk8 unk458[0xC]`.

Otherwise fine as is.

### sub_8049458 (frontend.c)

Several issues:

1. **`value` is undeclared.** Line `value = _unk3000650.unk586;` uses a
   variable that is never declared. This will not compile.

2. **`*(unk8 *)&_unk3000BFD = 0;`** -- cast-and-offset on a global. If only the
   low byte is being zeroed, declare `_unk3000BFD` as `unk8[2]` or `unk8` in the
   extern and ram.c, not `u16`.

3. **`(s8)state->unk585 == 0`** -- cast on field read. If sign extension matters,
   declare unk585 as `s8` in FrontendState.

4. **`state = (FrontendState *)&_unk3000650;`** -- unnecessary cast.
   `_unk3000650` is already `FrontendState` (the extern was changed in
   unsorted.h). Just `state = &_unk3000650;`.

5. **`sub_804A280((unk8 *)&_unk3000650)` / `sub_80434EC((unk8 *)state)`** --
   repeated casts. These are fine while callee prototypes still take `unk8*`, but
   once the callees are decompiled they should take `FrontendState*`.

6. **Unk3000650 struct still defined** in common.h alongside FrontendState. The
   old struct should be removed once all users are migrated; until then, both
   coexist without collision since the extern changed type.

### FrontendState (common.h)

The struct looks reasonable. `s16 unk464` -- is signedness proven? `unk8 unk584`,
`unk585`, `unk586` are used with arithmetic and sign-cast, so widths need
verification.

---

## Worktree 5: agent-afd8a5b8 (collectable.c) -- brief

### initCollectables (collectable.c)

Several style-guide violations:

1. **`source = (unk8*)state + 0x10;`** -- cast-and-offset. `state` is `unk32`
   (from sub_8051734 which actually returns `LevelState*` per the gamestate
   worktree). This should be a typed struct field access. Hypothesis: the +0x10
   accesses `LevelState.unk10`, so write `&state->unk10` with `state` typed as
   `LevelState*`. Verify return type of sub_8051734 against asm.

2. **`while (line < *(s32*)(metadata.unk0 + 8))`** -- cast-and-offset. The
   event.c worktree (worktree 6) types unk0 as `LevelGeometryTable*` with field
   `s32 unk8`. Use that typing: `metadata.unk0->unk8`.

3. **`geometryAddr = metadata.unkC + (line << 5)`** -- pointer arithmetic with
   stride 0x20. This indexes an array of 0x20-byte records. Declare a struct for
   that record type and use array indexing.

4. **LevelGeometryAddresses** -- different name/layout from worktrees 3 and 6.
   See Headers section.

### CollectableData (common.h, ram.h)

Size 0x108 at offset 0x12F4, ending at 0x13FC. Matches the pad arithmetic. Fine.

---

## Worktree 6: agent-af74d788 (event.c) -- brief

### initEventListeners (event.c)

1. **VLA**: `s32 listenerIds[maxListeners]` where `maxListeners` is a local
   variable is a C99 VLA. agbcc is C90. Use the literal: `s32 listenerIds[0x20]`.

2. **Initializers on declarations**: `void* geometryData = loadLevelGeometry(...)` 
   etc. -- these are at the top of the function, so C90 allows them as long as
   no statements precede them. However, mixing declared-with-initializer and
   plain declarations in the same block is fragile with agbcc. Safer to declare
   then assign.

3. **`(const char*)Str_8729658`** -- cast on read. Matching necessity if printf
   prototype expects `const char*` and string is `const u8[]`. Acceptable.

4. **LevelGeometryAddresses** conflicts with worktrees 3 and 5; see Headers.

### deallocEventListeners (event.c)

Fine as is. Clean guard-dealloc-null pattern.

### GameData fields (ram.h)

Adds unkCA0 (`AllocatedBlock*`), unkCA4 (`void*`), unkCA8 (`unk32`) inside the
padC70 region. Sizes and offsets check out.

---

## Worktree 7: agent-a317654fa (gamestate.c cleanup) -- brief

### Decompiled functions

sub_8051640, getSomeLevelID, getLevelDescription2, getLevelDescription,
sub_8051720, sub_8051734, sub_8051744, sub_805176C, GetLevelDescriptionNo,
sub_80518F0 -- all fine as is. Clean, minimal code.

### CurrentGameState.unk0 as s8

Needs proof. initGameLoop assigns `_currentGameState->unk0 =
_currentGameState->unk6C4` (unk16 to s8). If the asm does `strb` without sign
extension on read, unk8 is sufficient. Only use s8 if `ldsb` proves it.

### CurrentGameState.unk6E8 as unk8

Round 2 proposed `unk16` for the `*(unk16*)&unk6E8` cast in sub_80510FC. This
worktree splits it into two individual bytes (`unk8 unk6E8; unk8 unk6E9`). The
sub_805176C return `_currentGameState->unk6E8` (single byte) is clean. But
sub_80510FC's `_currentGameState->unk6E8 = 0` now writes a single byte where the
old code wrote 16 bits. Verify that the asm truly stores only 1 byte (strb); if
it stores 2 bytes (strh), the round-2 unk16 approach was correct.

### LevelDescription union approach

The `LevelDescriptionUnkC` union replacing ActiveLevelDescription is creative but
the field names inside `LevelDescriptionActiveFields` use absolute
LevelDescription offsets (`padC`, `unk11`, `pad12`, `unk18`) rather than offsets
within the sub-struct (pad0, unk5, pad6, unkC). This is unconventional. The
naming works for cross-referencing with the old ActiveLevelDescription layout but
violates the "unk + hex offset within struct" convention. Not blocking.

### LevelDescription.pad2C[0xA4]

Makes sizeof(LevelDescription) = 0xD0, which is the array stride for
`LevelDescriptions[]`. This is needed for getLevelDescription/getLevelDescription2
indexing. Fine.

---

## Headers: unified layouts

### LevelGeometryAddresses (CRITICAL -- three incompatible definitions)

Worktrees 3, 5, and 6 each define a "geometry addresses" struct with different
names and field types. They describe the same runtime object. Proposed unified
definition based on the most-typed version (worktree 6 for unk0, worktree 3 for
points/lines):

```c
typedef struct LevelGeometryTable {
    unk8 pad0[8];
    s32 unk8;
} LevelGeometryTable;

typedef struct LevelGeometryAddresses {
    LevelGeometryTable* unk0;   /* wt6: typed; wt5: unk8*; wt3: pad */
    void* unk4;                 /* wt3: GeometryPoint* points */
    void* unk8;
    void* unkC;                 /* wt3: GeometryLine* lines */
    void* unk10;
    void* spline[0x40];         /* 0x14-0x113 */
    void* metadata;             /* 0x114 */
    u16 lineCount;              /* 0x118 -- wt6 names it lineCount */
} LevelGeometryAddresses;       /* 0x11A, pads to 0x11C */
```

Worktree 3 should adopt this name and layout, replacing `GeometryAddresses`.
Field types that worktree 3 uses (`GeometryPoint*`, `GeometryLine*`) can be
obtained by casting unk4/unkC at the call site, or by upgrading the struct fields
once all users agree. For now, `void*` is the safe default.

The `getLevelGeometryAddresses` prototype also differs across worktrees (1 arg vs
2 args). Verify against asm.

### RiderBase / RiderBlock / GameData head

See worktree 1 section above. Summary:

- Extend RiderBase to 0x428 bytes (add pad424[4]).
- Delete RiderBlock; typedef or replace with RiderBase.
- GameData.unk42C becomes `RiderBase*`.
- GameData's first 0x428 bytes remain individually declared because game-specific
  fields (unk200, unk234, unk3CE) overlay the rider footprint and are not proven
  to exist in secondary riders.
- sub_80538C0 passes `_gameData` as rider 0 (GameData\* to void\*) and
  `&_gameData->unk42C[i-1]` (RiderBase\*) for others. sub_804B4A4 takes
  `RiderBase*`. The implicit cast of GameData\* to RiderBase\* in sub_80538C0 is
  safe because GameData begins with the rider layout, but sub_80538C0's `rider`
  variable should stay `void*` (matching the current code) since GameData and
  RiderBase are not type-compatible.

### PolyTable (common.h)

Only worktree 1 defines it. No conflicts. Adopt as-is.

### SpriteTextCleanup (common.h)

Only worktree 1 refines it. No conflicts. Adopt the refined version.

### LevelDescription / ActiveLevelDescription

Two incompatible approaches:

- **Worktree 3** extends ActiveLevelDescription with unk2C.
- **Worktree 7** replaces ActiveLevelDescription entirely: getLevelDescription2
  now returns `LevelDescription*`, and the unkC region uses a union with
  `LevelDescriptionActiveFields`.

Worktree 7's approach is structurally better (one struct, not two overlapping
views of the same data). Adopt worktree 7's LevelDescription layout and union.
Then add `unk2C` from worktree 3 by splitting `pad2C[0xA4]`:

```c
typedef struct LevelDescription {
    unk8 unk0;
    unk8 pad1[3];
    s32 unk4;
    s32 unk8;
    LevelDescriptionUnkC unkC;
    unk8 unk1C;
    unk8 unk1D[3];
    s32 unk20;
    s32 unk24;
    s32 unk28;
    unk32 unk2C;           /* from worktree 3 (initRiders) */
    unk8 pad30[0xA0];
} LevelDescription; /* 0xD0 */
```

Worktree 3's `getLevelDescription2()` return type changes from
`ActiveLevelDescription*` to `LevelDescription*` (matching worktree 7), and
`levelDescription->unk2C` stays valid.

### CurrentGameState

Worktree 7 is the only one touching this. Adopt its changes: `s8 unk0`
(if asm-verified), `LevelState unk4[0x38]`, `unk6AB`, split unk6E8.

### GameData overlaps between worktrees

The padC70 region (0xC70-0xF50) is split by two worktrees:
- Worktree 6 carves out unkCA0/unkCA4/unkCA8 (0xCA0-0xCAC).
- Main already has levelHud fields from 0xF50 onward.

No overlap. Both can merge cleanly.

The pad12F2 region:
- Worktree 5 adds CollectableData at 0x12F4 (splits pad12F2 into 2 + struct).
- No other worktree touches this.

The pad238 region (0x238-0x428):
- Worktree 3 adds unk3CE at 0x3CE and unk200 at 0x200.
- No other worktree touches these offsets in GameData (worktree 1's RiderBase
  defines the same offsets but in a separate struct, not in GameData).

Merge order matters: worktree 3's GameData changes to pad0 (split at 0x200) and
pad238 (split at 0x3CE) must come before worktree 1's unkB88 change (different
region, but same struct definition).

---

## Merge conflicts to expect

1. **common.h: LevelGeometryAddresses** -- CONFLICT. Three worktrees (3, 5, 6)
   add incompatible struct definitions at different locations in common.h. Manual
   resolution required: adopt a single unified definition (see Headers above),
   update all three worktrees' code to use it.

2. **common.h: LevelDescription/ActiveLevelDescription** -- CONFLICT. Worktree 3
   extends ActiveLevelDescription; worktree 7 replaces it with a union inside
   LevelDescription. Manual resolution: adopt worktree 7's union approach, port
   worktree 3's unk2C into LevelDescription.

3. **common.h: struct insertion order** -- Worktrees 1, 3, 4, 5 all insert new
   structs into common.h at different points. Git will likely conflict on context
   lines. Manual resolution straightforward.

4. **ram.h: GameData struct** -- CONFLICT. Worktrees 1, 3, 5, 6 all modify
   different regions of GameData. Worktree 3 changes the head (pad0 split,
   pad238 split, RiderBlock\* to typed pointer). Worktree 1 changes unkB88.
   Worktree 5 changes pad12F2. Worktree 6 changes padC70. These are
   non-overlapping edits within the same struct, but git will conflict on context
   lines. Merge one at a time with manual verification.

5. **ram.h: RiderBlock** -- Worktree 1 does not touch RiderBlock; worktree 3
   adds fields to it. Once RiderBase replaces RiderBlock (see Headers), both
   worktrees need updating.

6. **gameinit.c: extern declarations and getLevelDescription2 return type** --
   Worktrees 2, 3, and 7 all modify gameinit.c. Worktree 7 changes
   `ActiveLevelDescription*` to `LevelDescription*` for getLevelDescription2;
   worktree 3 adds new externs near the same location. Likely context conflict.

7. **unsorted.h: _unk3000650 type** -- Worktree 4 changes the extern from
   `Unk3000650` to `FrontendState`. No other worktree touches this. Clean merge.

8. **gamestate.c** -- Only worktree 7 touches this. Clean merge.

9. **collision.c** -- Worktree 2 changes sub_8055CB8. No other worktree touches
   collision.c. Clean merge.

**Recommended merge order**: worktree 7 (gamestate cleanup -- foundational type
changes) first, then worktree 1 (RiderBase/PolyTable), then worktree 3
(initRiders -- needs manual LevelDescription/GeometryAddresses reconciliation),
then worktree 6 (event.c), then worktree 5 (collectable.c -- needs
GeometryAddresses fix), then worktree 2 (temp-reduction), then worktree 4
(frontend.c -- independent).
