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

Matched with the signed `RiderTemp::unk424` field, the existing item-bit helpers, and a direct `getItem` call. The `unk8` return declaration of `sub_80570D4` causes the target's caller-side `lsl #24` normalization without an explicit source shift; repeated field reads preserve the two `ldrsh` instructions. The full instruction sequence and pool word match exactly.

## sub_804C3D4 (0x0804C3D4)

Matched with a shared 0x30-byte `ProjectileTemplate` record and the typed `ProjectileEntry` destination. Staged signed coordinate values and `dx`/`dy` locals preserve the target's arithmetic order across the trail calls. The complete instruction sequence matches exactly.

## sub_804AB50 prototype fixup

The shared `trail.h` declaration for `sub_804AB50` uses a wide `unk16` parameter, and `trail.c` narrows it into a local `u8` before applying the low-nibble mask. This preserves the target `sub_804AB50` body while allowing `sub_804C3D4` to pass its `ldrh` result directly. The measured `u8` header variant inserted `lsl #24` / `lsr #24` in `sub_804C3D4` and failed the ROM compare; a function-pointer cast was also tested and rejected because it emitted an indirect call. The only C caller is `sub_804C3D4`.


## Temporary fold probes

- Folding `dx` directly into `sub_804ABD8` failed the full ROM comparison; the `dx` local was restored.
- Folding `dy` directly into `sub_804ABD8` failed the full ROM comparison; the `dy` local was restored.
- Folding `trail.c`'s `value` into `(u8)arg1 & 0xF` failed the full ROM comparison; the `u8 value` local was restored.
