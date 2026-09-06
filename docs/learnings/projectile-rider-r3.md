# Projectile and rider round 3

## sub_804C34C (0x0804C34C)

Matched with direct typed field stores to `ProjectileSystem::unk10`, `unk14`, and `unk18`. The target is four instructions with no trailing pool bytes beyond the dump alignment.

## sub_804C354 (0x0804C354)

Matched with direct typed field stores to `ProjectileSystem::unk1C`, `unk20`, and `unk24`. The target is four instructions with no trailing pool bytes beyond the dump alignment.

## sub_805749C (0x0805749C)

Matched with a direct indexed read from `byte_807D7C0`. The existing `unk8` return and `unk32` index produce the byte load and the target's literal pool word exactly.
