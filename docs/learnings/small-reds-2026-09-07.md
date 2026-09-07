# Small red matches

## sub_80517E8 (0x080517E8)

The target uses an explicit conditional return: `bne` to `return 1`, otherwise `return 0`. A direct boolean return compiled to a shift/mask sequence, while the explicit branch matched exactly. `LevelState.unk0` is accessed with `ldrh`, so no signedness change was justified.

## sub_8059FF8 (0x08059FF8)

The five-argument `void` helper writes four consecutive word arguments through the destination pointer. Direct indexed stores match the target's `ldr` of the fifth stack argument and four `str` instructions exactly; no extra temporary is required.

## sub_8062318 (0x08062318)

The target normalizes the second argument with `lsl #24; lsr #24`, proving an 8-bit formal or equivalent ABI narrowing. A typed `unk8` parameter and direct `SpriteTextCleanup.unk2B` byte store reproduce the null check, offset materialization, and `strb` exactly. The controlled `unk32` formal with the unchanged byte store diverges at offset `0x0`: the target has `lsl r1, #24; lsr r1, #24`, while the alternative begins with `cmp r0, #0`. The `unk32` formal with an `unk8 value` local assigned from `arg1` before the null check has no instruction divergence and reproduces the target exactly. The final source remains the simpler `unk8` formal. The TU needed `ASM_ZEROPAD` after the final function: without it, agbcc emitted a trailing `0xC046` where the baseline has two zero bytes.

## GetPointAtSplineIndex (0x0805DBC0)

A local `unk32* offsets = spline->pointIndices` is required to keep the `spline + 0x20` base in `r2` before the point-count check; using the indexed member directly allocated a separate `r3` and shifted the CFG. The target's `bge` proves signed indices, so the public prototype and definition use `s32` for both indices. The final typed array lookup matches without raw offset arithmetic.
