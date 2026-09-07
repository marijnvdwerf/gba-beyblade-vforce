# Level-select matching observations

## sub_8041078 (0x08041078)

The matched implementation uses `LevelSelectSpriteData` records with fields at offsets 0, 4, 8, and C; the record size is 0x10 bytes. The six record values were emitted by the field-wise assembler rewrite in `asm/data12.s`, and the table bytes remained identical under `compare`. No temporary beyond the loop index and per-iteration sprite/data pointers was required by the matched output.

## sub_8041324 (0x08041324)

A wide `unk32` parameter is required. With `unk8`, agbcc emitted byte normalization at entry and did not match; with `unk32`, the six-call loop matched exactly. No byte-required temporary remained.

## sub_8041344 (0x08041344)

The target loads `state->rows[1]` before byte-normalizing the argument (`ldr r0, [r5,#8]` at +4, then `lsl r4,r1,#24` and `lsr r4,#24` at +6/+8), and reuses the normalized value in both calls.

Three natural forms were built one at a time:

- A: `unk32 arg1`, passing `arg1` directly to both calls. First divergence was an extra `mov r4,r1` at current +4; current +6 was `lsl r4,#24` instead of target `lsl r4,r1,#24`.
- B: `unk8 arg1`, passing `arg1` directly. First divergence was target `ldr r0,[r5,#8]` at +4 versus current `lsl r4,r1,#24` at +4; current moved the row load to +8.
- C: `unk32 arg1`, with `u8 color = arg1` passed to both calls. First divergence was the same as B: target row load at +4 versus current byte normalization at +4.

All three forms diverged. The previously tested `(unk8)(arg1 + 0)` form matches but is a compiler-steering lever, so `sub_8041344` remains parked with the best natural C draft under `#if 0` and its assembly dump restored.

## sub_8041364 (0x08041364)

The natural ascending loop `for (i = 0; i <= 5; i++)` followed by the null check and cleanup matched exactly. No byte-required temporary remained beyond the loop index and the typed state pointer.
