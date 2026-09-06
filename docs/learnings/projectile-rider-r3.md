# Projectile and rider round 3

## sub_804C34C (0x0804C34C)

Matched with direct typed field stores to `ProjectileSystem::unk10`, `unk14`, and `unk18`. The target is four instructions with no trailing pool bytes beyond the dump alignment.

## sub_804C354 (0x0804C354)

Matched with direct typed field stores to `ProjectileSystem::unk1C`, `unk20`, and `unk24`. The target is four instructions with no trailing pool bytes beyond the dump alignment.

## sub_805749C (0x0805749C)

Matched with a direct indexed read from `byte_807D7C0`. The existing `unk8` return and `unk32` index produce the byte load and the target's literal pool word exactly.

## sub_804C0C0 (0x0804C0C0)

Matched with a `RiderTemp` field at offset `0x3C4` typed as `SpriteEntry*`, plus the existing halfword field at `0x3CC`. The function sets bit 2, frees the optional sprite, and clears the pointer. The target instruction sequence and register usage match exactly.

## sub_804C118 (0x0804C118)

Matched with the signed `RiderTemp::unk424` field, the existing item-bit helpers, and a direct `getItem` call. The explicit shifted result test preserves the target's `lsl #24`; repeated field reads preserve the two `ldrsh` instructions. The full instruction sequence and pool word match exactly.

## sub_804C3D4 (0x0804C3D4)

Matched with a shared 0x30-byte `ProjectileTemplate` record and the typed `ProjectileEntry` destination. Staged signed coordinate values and `dx`/`dy` locals preserve the target's arithmetic order across the trail calls. The complete instruction sequence matches exactly.
