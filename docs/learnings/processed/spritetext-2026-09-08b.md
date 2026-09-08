# Sprite text matching notes

## sub_8061D54 (0x08061D54)

Matched in `src/spritetext.c`; target size is 0x14 bytes. The function returns
`SpriteTextCleanup.unk14.prev->x` when `unk14.count` is nonzero and returns zero
when the block is empty. The `SpriteTextBlock` and `SpriteEntry` fields provide
word loads at offsets +0x1C, +0x14, and +0x08, matching the target.

The source condition is written as `if (text->unk14.count == 0) return 0;`
followed by the nonempty return so the target's `beq` branch skips directly to
`mov r0, #0`; the opposite condition introduced a two-byte longer body and a
first divergence at +0x06. No signedness or temporary beyond the pointer
parameter was required; `unk32` is retained for the word return.

The function diff is instruction-identical and
`cmake --build build --target compare` passes after formatting. The assembly dump
was removed.

## sub_8061E44 (0x08061E44)

Matched in `src/spritetext.c`; target size is 0x14 bytes. The function returns
`SpriteTextCleanup.unk14.prev->y` when `unk14.count` is nonzero and returns zero
when the block is empty. The target uses the same word-sized block count and
`SpriteEntry` coordinate access as the adjacent x-coordinate helper, with the
coordinate field at +0x0C.

The source condition is written as `if (text->unk14.count == 0) return 0;`
followed by the nonempty return, reproducing the target `beq` to the zero arm,
then loads at +0x14 and +0x0C. No signedness or temporary beyond the pointer
parameter was required; `unk32` is retained for the word return.

The function diff is instruction-identical and
`cmake --build build --target compare` passes after formatting. The assembly dump
was removed.

## sub_8061E08 (0x08061E08)

Matched in `src/spritetext.c`; target size is 0x3C bytes. For a nonempty text
block it starts at `unk14.next`, reads that sprite's x coordinate, and when the
width table `unk20` exists adds `(unk24[4] - unk20[sprite->frame.word]) << 8`.
It then adds the signed spacing byte `unk29` (existing `s8` field; evidence in
sub_8061E08: `ldrb` at +0x2C followed by `lsl #24; asr #24` at +0x2E/+0x30);
an empty block returns zero.

The `frame.word` access is required by the target `ldrh` at sprite offset +0x18;
using the low-byte view would imply the wrong load width. The final accumulation
is kept as `x += text->unk29; return x;`, which produces the target's separate
`add r3,r0` and `mov r0,r3`. Returning the expression directly removed that
copy and shortened the branch target by two bytes, with the first divergence at
+0x32. No casts, raw offsets, or extra aliases are used.

The function diff is instruction-identical and
`cmake --build build --target compare` passes after formatting. The assembly dump
was removed.
