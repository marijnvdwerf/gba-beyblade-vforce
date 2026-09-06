# Trail and projectile round 4

## sub_804ABD8 (0x0804ABD8)

Matched with direct assignments to `UnkTrail::unk10`, `unk14`, `unk18`, and `unk1C`. The four word stores and return instruction are byte-identical to the target.

## sub_804C464 (0x0804C464)

Matched with a signed count load, a typed `ProjectileEntry` cursor, and `while (count-- != 0)`. Each iteration clears `ProjectileEntry::trailDelay`; typed pointer increment emits the target 0x34-byte stride. The complete instruction sequence is byte-identical.

## sub_804AB64 (0x0804AB64)

Matched by typing the resource header as `SpriteTrailSheet` with an 8-byte `SpriteTrailFrame` array and extending `SpriteTrailEntry` with the accessed halfword fields. Staging the frame-array pointer before adding the index emits the target address formation (`ldr`, `add #0x20`, scaled index, `add`). The complete instruction sequence is byte-identical.

## sub_804AB88 (0x0804AB88)

Matched with signed `s32` coordinate inputs and an `unk32` return. The selected wide `indexValue` is assigned to a signed `s16 index` after the branch, then used directly as `index + 0x80`; this preserves the target's single halfword normalization without transcribing a cast. Signed `tableValue`, unary negation for the magnitude, and subtraction by `0x100` reproduce the natural wrap arithmetic and the target literal-pool sequence.

| Question | Result |
| --- | --- |
| Fold the single-use `sprite` alias in `sub_804AB64` | Not byte-identical; alias retained. |
| Replace the selected wide index with a direct `s16 index` in each branch | Not byte-identical; branch-local normalization was emitted. A separate `indexValue` followed by one `s16 index` assignment is byte-identical. |
| Replace the explicit wrap cast/literal with signed subtraction by `0x100` | Byte-identical; natural form retained. |
