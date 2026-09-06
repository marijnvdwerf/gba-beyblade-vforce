# Trail and projectile round 4

## sub_804ABD8 (0x0804ABD8)

Matched with direct assignments to `UnkTrail::unk10`, `unk14`, `unk18`, and `unk1C`. The four word stores and return instruction are byte-identical to the target.

## sub_804C464 (0x0804C464)

Matched with a signed count load, a typed `ProjectileEntry` cursor, and `while (count-- != 0)`. Each iteration clears `ProjectileEntry::trailDelay`; typed pointer increment emits the target 0x34-byte stride. The complete instruction sequence is byte-identical.

## sub_804AB64 (0x0804AB64)

Matched by typing the resource header as `SpriteTrailSheet` with an 8-byte `SpriteTrailFrame` array and extending `SpriteTrailEntry` with the accessed halfword fields. Staging the frame-array pointer before adding the index emits the target address formation (`ldr`, `add #0x20`, scaled index, `add`). The complete instruction sequence is byte-identical.

## sub_804AB88 (0x0804AB88)

Matched with signed `s32` coordinate inputs and an `unk32` return. The table lookup uses the signed halfword-normalized index `(s16)index + 0x80`; preserving separate `value`, `magnitude`, `index`, and `tableValue` locals reproduces the branch and literal-pool sequence exactly. The complete instruction sequence and pool bytes are byte-identical.
