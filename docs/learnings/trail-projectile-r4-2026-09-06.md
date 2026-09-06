# Trail and projectile round 4

## sub_804ABD8 (0x0804ABD8)

Matched with direct assignments to `UnkTrail::unk10`, `unk14`, `unk18`, and `unk1C`. The four word stores and return instruction are byte-identical to the target.

## sub_804C464 (0x0804C464)

Matched with a signed count load, a typed `ProjectileEntry` cursor, and `while (count-- != 0)`. Each iteration clears `ProjectileEntry::trailDelay`; typed pointer increment emits the target 0x34-byte stride. The complete instruction sequence is byte-identical.
