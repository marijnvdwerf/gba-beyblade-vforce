# spritetext/festate matching notes (2026-09-08)

## sub_8061880 (0x08061880, target 80 bytes)

Matched exactly in `src/spritetext.c`. The function keeps the public `s16`
parameter view used by `sub_8052B24`, loads `SpriteTextCleanup.ptr2C`, and uses
one `SpriteEntry *` local. The non-null path adds `SpriteEntry.oam_attr_2`
and `SpriteEntry.var16`; the null path adds `0x100` to the incoming signed
coordinates. The helper declaration is `sub_8061684(SpriteTextCleanup *,
unk16, unk16)`, matching its entry halfword normalization.

The final source uses no explicit narrowing casts or conversion assignments.
With `s16` formals, agbcc emits the target entry `lsl`/`lsr` normalizations,
the target null-path `lsl`/`asr` signed arithmetic, and the final halfword
argument normalization. Replacing the formals with `unk16` removed the target
`mov r3, r0` and changed the null-path register and normalization sequence.
The earlier explicit `unk16` assignments were unnecessary once the helper's
measured narrow declaration was used; removing them preserved every target
instruction. The function diff is instruction-identical.

## initBBCollectionSprite (0x08046F2C, target 272 bytes)

Matched exactly in `src/festate.c`. The function obtains the selected
`BeybladeData`, refreshes or allocates the two collection sprites, loads the
common collection sprite sheet, then loads either the decompressed selected
blade sheet or the fallback sheet and copies the corresponding palette. It
finishes by storing the signed blade index into the second sprite's frame.

`BeybladeData` was extended in `src/beyblade.h` only at the accessed offsets:
`palette` at +0x28 and `spriteSheet` at +0x2C, with +0x30 padding retained so
its fixed 0x34-byte table stride is unchanged. The first draft accidentally
reduced the type to 0x30 bytes; that changed `getBeybladeData0` indexing and
shifted the IWRAM load address by four bytes. Restoring `pad30[4]` returned
the full ROM to the baseline while leaving the target function unchanged.

The target uses `0x1000` for the collection sprite x coordinate and
`(void *)OBJ_PLTT` for both palette copies. `state->unk35` is kept in a signed
`s32 category` because the entry `ldrsb` and signed category branch match that
field's existing `s8` declaration. The fallback frame expression is written
without an explicit cast as a nested assignment to a narrow local:
`frame = category - 1`, where `frame` is `unk16`. This emits the target
`lsl`/`lsr` normalization immediately before the final stack store. The
coordinator-requested standalone-assignment trial (`frame = category - 1;`
followed by `LoadSpriteSheet(..., frame)`) did not match: its first divergence
was at function offset `0x5A`, where the target reloads `state->unk0` into `r4`
but the trial reloads it into `r5`; in the fallback arm the trial then computes
and normalizes `frame` at `0xB0` before materializing the sheet literal, while
the target materializes the literal at `0xB0` and computes `frame` at `0xC4`.
Using `category - 1` directly with the existing wide `LoadSpriteSheet` view
removed the four target normalization bytes.

`LoadSpriteSheet` remains declared with a wide `unk32` final parameter in
`src/sprite.h`. Although its callee narrows that stack argument internally,
changing the shared declaration to `unk16` altered dependent callers and
produced a nonmatching full ROM (expected SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e9`, current
`2664bab1650e820ed350adc182969cd5f2c7b8e9`). Restoring the wide declaration
and retaining the nested narrow local assignment leaves `initBBCollectionSprite`
instruction-identical and restores the full-ROM SHA1.

The `initBBCollectionSprite` diff is instruction-identical and
`cmake --build build --target compare` passes. Both assembly dumps were
removed.
