# Review round 2: small-leaves + gamestate worktrees

## Small-leaves worktree (agent-a881d11bac4e70a49)

### emptyBeybladeActorData (beyblade.c)

`zero` local and `do { ... } while (count >= 0)` countdown are unnecessary
compiler-shaped artifacts. The `zero` temp exists only to put 0 in a register
once, but agbcc will CSE that itself. The countdown is a `for` loop. Also
`BeybladeActorData.block` is a pointer to `AllocatedBlock` (proven by
`deallocBeybladeActorData` calling `deallocateBlock` on it) but is typed `unk32`
-- it should be `AllocatedBlock*` so the NULL/zero tests use `NULL` and
`deallocateBlock` needs no cast.

```c
void emptyBeybladeActorData(void)
{
    BeybladeActorData* record;
    s32 i;

    record = _gameData->actorData;
    _gameData->unk12F0 = 0xE;
    for (i = 0; i < 0x3C; i++) {
        record->block = NULL;
        record->unk4 = 0;
        record++;
    }
}
```

If the for-loop doesn't match, fall back to the do-while but drop `zero`:

```c
    i = 0x3B;
    do {
        record->block = NULL;
        record->unk4 = 0;
        record++;
        i--;
    } while (i >= 0);
```

And change `BeybladeActorData`:

```c
typedef struct BeybladeActorData {
    AllocatedBlock* block;
    unk8 unk4;
    unk8 pad5[3];
} BeybladeActorData;
```

### deallocBeybladeActorData (beyblade.c)

Same `zero`/countdown issues. Also the cast `(AllocatedBlock*)record->block`
disappears once `block` is typed as `AllocatedBlock*`.

```c
void deallocBeybladeActorData(void)
{
    BeybladeActorData* record;
    s32 i;

    record = _gameData->actorData;
    for (i = 0; i < 0x3C; i++) {
        if (record->block != NULL) {
            deallocateBlock(record->block);
            record->block = NULL;
        }
        record++;
    }
}
```

### sub_8055CB8 (collision.c)

The `(void*)((unk32)fn + 1)` Thumb-bit hacks violate the style guide (no
cast-and-offset arithmetic). The `+1` is the linker's job for Thumb function
pointers -- pass the function name directly. If the callee expects `void*` for
callback slots, cast the function pointer to `void*` without the arithmetic.

Also `withBoundingAreaCount[2]` is declared but only `[0]` is used. The extern
should match the ram.c definition (which was changed to `unk32[2]` -- fine), but
only index 0 is touched here, which is just normal array access.

```c
void sub_8055CB8(void)
{
    withBoundingAreaCount[0] = 0;
    sub_805E50C(
        _unk3000FC0,
        (void*)def_94_0_8055CFC,
        (void*)def_94_4_AddWithBoundingAreaMessage,
        (void*)def_94_8_collision_8055F2C);
    sub_805E514(_unk3000FD0, 0, 0, 0, 0);
}
```

If dropping the `+1` breaks the match, the Thumb bit really is baked into the
ROM literal and you need it -- but in that case use a comment explaining why,
because bare `+1` on a function pointer reads as a bug.

### sub_804F800 (hud.c)

The `base = _gameData` pointer dance exists only so the compiler loads the global
once. agbcc will do this CSE on its own for a single-path function. Write
directly:

```c
void sub_804F800(s32 arg0)
{
    if (arg0 < 0) {
        arg0 = 0;
    }
    if (arg0 > 5) {
        arg0 = 5;
    }
    _gameData->unk107C = arg0;
}
```

If this doesn't match (multiple loads of `_gameData`), the `base` local is
acceptable as a matching-required artifact.

### sub_804FEE8 (levelhud.c)

Same `base = _gameData` pointer dance, plus `status = &base->levelHudStatus`
dereference through a separate local. Try the direct form first:

```c
void sub_804FEE8(void)
{
    if (_gameData->levelHudStatus != 0) {
        sub_8061228(&_gameData->levelHud0);
        sub_8061228(&_gameData->levelHud1);
        sub_8050584(&_gameData->levelHudMotion0);
        sub_8050584(&_gameData->levelHudMotion1);
        _gameData->levelHudStatus = 0;
    }
    sub_8061204(&_gameData->levelHud0);
    sub_8061204(&_gameData->levelHud1);
    sub_8061204(&_gameData->levelHud2);
    sub_8061204(&_gameData->levelHud3);
}
```

If this doesn't match, the `base` local is acceptable, but `status` (a pointer
to a unk32 field used only for one read and one write) is still an unnecessary
indirection -- use `base->levelHudStatus` directly.

### sub_8061204 (spritetext.c)

Fine as is.

### sub_805BA3C (geometry.c)

Fine as is.

### deallocateQuadTree (geometry.c)

The `block = (unk32)arg0->block24` cast to unk32 followed by
`deallocateBlock((AllocatedBlock*)block)` is the exact pattern the style guide
forbids. The fields are already typed `AllocatedBlock*`, so use them directly:

```c
void deallocateQuadTree(QuadTree* arg0)
{
    if (arg0->block24 != NULL) {
        deallocateBlock(arg0->block24);
    }
    arg0->block24 = NULL;
    if (arg0->block28 != NULL) {
        deallocateBlock(arg0->block28);
    }
    arg0->block28 = NULL;
}
```

### sub_804A72C (tutorial.c)

Fine as is (one-line setter).

---

## Gamestate worktree (agent-ac63df09e61e128fe)

Note: the first review (review-gamestate.md) already covered naming and
structural feedback. This review focuses on what remains unnatural after that
pass.

### sub_80510FC (gamestate.c)

The previous review proposed renaming `index`/`offset`/`value`/`flag` to
`i`/`j`/`tableVal`/`found`. Those renames are still not applied in the worktree
code. The current variable names `index`, `offset`, `value`, `flag` are fine
alternatives, but `offset` is misleading for the second loop since it's a byte
stride, not an index -- `j` is clearer. The rest of the function is
matching-shaped and acceptable.

One type issue: `state->unk4 = description->unk4` -- the gamestate worktree
added `unk4` as `s32` to LevelDescription, replacing the old `unk8 unk0[8]`.
The old field `unk0[8]` spanned bytes 0-7, and the new split into `pad0[4]` +
`unk4` is fine only if unk4 at offset 4 really is s32 (proven by the assignment
to `LevelState.unk4` which is also `s32`). This looks correct.

The `_currentGameState->unk6E8 = 0` line -- the gamestate worktree changed the
field from `unk8 unk6E8[2]` to `CurrentGameStateUnk6E8` (typedef for `unk16`).
This makes the assignment compile and is cleaner than the first review's
`*(unk16 *)` cast suggestion. Fine as is.

### sub_8051640

Fine as is.

### getLevelDescription2

Fine as is.

### getLevelDescription

Fine as is.

### sub_8051720

Fine as is.

### sub_8051734

Fine as is.

### sub_8051744

The increment-inside-the-if from the previous review is still present. The
previous review proposed moving the increment out. Apply that fix:

```c
unk32 sub_8051744(void)
{
    s32 index;
    LevelState* state;

    index = 0;
    do {
        state = sub_8051720(index);
        if ((state->unk0 & 1) == 0) {
            return 0;
        }
        index++;
    } while (index <= 0x37);
    return 1;
}
```

### sub_805176C

The `*(unk8 *)&_currentGameState->unk6E8` cast is forced by the field now being
`unk16` but the function returning only the low byte. This is acceptable --
it's a width-narrowing read, and there's no cleaner way without a union.

Fine as is.

### GetLevelDescriptionNo

The previous review proposed removing the `descriptions` local. The worktree
still has it. The two-local version is acceptable if the single-local form
doesn't match.

Fine as is.

### sub_80518F0

Fine as is.

---

## Headers -- convergence targets

### common.h

The two worktrees make independent edits to common.h:

**LevelState**: gamestate adds `unk8`, `unkC`, `unk10`, `unk14`. Small-leaves
does not touch it. The gamestate version should be adopted -- the fields are
proven by sub_80510FC assignments.

```c
typedef struct LevelState {
    unk16 unk0;
    unk16 unk2;
    s32 unk4;
    s32 unk8;
    struct LevelDescription* unkC;
    unk32 unk10;
    unk32 unk14;
} LevelState;
```

**LevelDescription**: gamestate splits `unk0[8]` into `pad0[4]` + `s32 unk4`.
Small-leaves leaves it as `unk0[8]`. Adopt the gamestate version.

```c
typedef struct LevelDescription {
    unk8 pad0[4];
    s32 unk4;
    s32 unk8;
    unk8 unkC[0x10];
    unk8 unk1C;
    unk8 unk1D[3];
    s32 unk20;
    s32 unk24;
    s32 unk28;
} LevelDescription;
```

**ActiveLevelDescription**: gamestate splits `pad0[0x11]` into `unk0` +
`pad1[0x10]`. Small-leaves leaves it. Adopt the gamestate version -- it's needed
for `GetLevelDescriptionNo` returning `desc->unk0`.

```c
typedef struct ActiveLevelDescription {
    unk8 unk0;
    unk8 pad1[0x10];
    unk8 unk11;
    unk8 pad12[6];
    unk32 unk18;
} ActiveLevelDescription;
```

**SpriteTextCleanup**: only in small-leaves. Adopt as-is (gamestate doesn't
touch this area).

**Unk80516E0**: only in gamestate. Adopt as-is.

### ram.h

**GameData layout**: both worktrees modify the `padC70[0x9A8]` region. The
small-leaves worktree is the one that actually breaks it down (levelHud fields,
unk107C, actorData, unk12F0, unk13FC). Gamestate only adds `unk1638` usage which
is already in main. Adopt the small-leaves layout for the C70-1618 range.

**GameData.unk65C / unk7A4**: small-leaves replaces `unk65C[4]` with
`GeometryAddressTable unk65C` and `unk7A4[0x6C]` with `QuadTree unk7A4`.
Gamestate doesn't touch these. Adopt small-leaves.

**BeybladeActorData**: only in small-leaves. Adopt, but fix the `block` field
type to `AllocatedBlock*` (see review above).

**GeometryAddressTable / QuadTree**: only in small-leaves. Adopt as-is.

**CurrentGameState.unk6E8**: gamestate changes `unk8 unk6E8[2]` to
`CurrentGameStateUnk6E8 unk6E8` (a `unk16` typedef). Small-leaves doesn't touch
CurrentGameState. Adopt the gamestate version.

**Externs**: small-leaves adds `_unk3000FC0[16]` and `_unk3000FD0[16]`.
Gamestate doesn't add externs. No conflict.

**motion.h include**: small-leaves adds `#include "motion.h"` to ram.h.
Gamestate doesn't. Adopt from small-leaves -- needed for
`UnkMotion levelHudMotion0/1` fields.

### ram.c

Small-leaves changes `u8 withBoundingAreaCount[8]` to
`unk32 withBoundingAreaCount[2]`. Gamestate doesn't touch ram.c. No conflict.

---

## Merge conflicts to expect

1. **common.h: LevelState struct** -- gamestate adds fields, small-leaves
   doesn't. Clean merge (adjacent-line additions only from one side).

2. **common.h: SpriteTextCleanup insertion** -- small-leaves inserts a new
   struct between UnkSpriteText and LevelState. Gamestate doesn't touch that
   spot. Clean merge if the struct is added before the LevelState block.

3. **common.h: LevelDescription / ActiveLevelDescription** -- gamestate changes
   fields, small-leaves doesn't. Clean merge.

4. **common.h: Unk80516E0** -- gamestate inserts between LevelState and
   ActiveLevelDescription. Small-leaves doesn't. Clean merge.

5. **ram.h: GameData struct** -- CONFLICT. Both worktrees modify the same
   region. Small-leaves replaces `unk65C[4]` and `unk7A4[0x6C]` with typed
   structs AND breaks down `padC70[0x9A8]` into fine-grained fields. Gamestate
   doesn't touch GameData but the hunk context will differ. Git should
   auto-merge since the gamestate diff for GameData is empty, but verify.

6. **ram.h: CurrentGameState.unk6E8** -- gamestate changes the field type.
   Small-leaves doesn't touch CurrentGameState. Clean merge.

7. **ram.h: includes** -- small-leaves adds `#include "motion.h"`. Gamestate
   doesn't change includes. Clean merge.

8. **ram.h: new typedefs before GameData** -- small-leaves adds
   GeometryAddressTable, QuadTree, BeybladeActorData between the includes and
   GameData. Gamestate adds CurrentGameStateUnk6E8 typedef between
   CurrentGameStateTail and CurrentGameState. No overlap -- different locations.
   Clean merge.

**Overall**: no true conflicts expected. All changes are to non-overlapping
regions. The only risk is git context-line confusion in the GameData struct if
both diffs touch nearby padding fields, but the actual edits are disjoint.
