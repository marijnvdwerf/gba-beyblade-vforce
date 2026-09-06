# Effects and packet matching notes (2026-09-06)

This note records measured source-shape and type results for the seven functions assigned in this pass. All seven are matched; none is parked, so there are no parked-function step tables to preserve. The baseline for each experiment was the already matching implementation, and each question below was built separately.

## `sub_80556C4` (`0x80556C4`, `src/effects.c`)

The function is a single halfword-width store of zero to `GameData->projectileSystem.unk7A`. The direct typed field access

```c
_gameData->projectileSystem.unk7A = 0;
```

matches the dump. The owning declaration belongs in `src/effects.h` because `riderphysics.c` calls the function.

## `sub_8043960` (`0x8043960`, `src/packet.c`)

The function calls `sub_804393C(arg0)` and stores its byte result at packet offset `0x3`. The packet's first word is a proven width-punned storage location: `background.c` passes the address of the word view, while this function writes an individual byte. The final representation is therefore a union retaining `word` and a byte-field struct view, rather than a second `bytes[4]` array representation.

The measured final union arm is:

```c
struct {
    unk8 unk0;
    unk8 unk1;
    unk8 unk2_0 : 4;
    unk8 unk3;
} fields;
```

With only `unk2_0 : 4` (no `unk2_4` field), `unk3` lands at offset `0x3` under agbcc and emits the target `strb [r4, #3]`. The extra `unk2_4 : 4` was unnecessary and was removed. The cross-translation-unit prototype is in `src/packet.h`.

## `sub_805589C` (`0x805589C`, `src/effects.c`)

The function takes the address of the projectile system and calls `sub_804C464`. The typed implementation

```c
sub_804C464(&_gameData->projectileSystem);
```

matches. The helper prototype is declared in `src/projectile.h`.

## `sub_804A504` (`0x804A504`, `src/tutorial.c`)

The target uses branchless sign propagation (`neg`, `orr`, `lsr #31`) on the tutorial slot value. Direct nonzero tests and Boolean forms generated `cmp/beq/mov` for the full-width value and did not match. The measured matching source is the approved arithmetic form:

```c
// TODO: fakematch???
value = (unk32)_gameData->tutorial.unk104;
return ((0 - value) | value) >> 31;
```

This is an artificial source shape retained by explicit ruling; it is matched rather than parked. `TutorialData.unk104` remains a `TutorialEntry*`, as required by its other call sites.

## `sub_804F824` (`0x804F824`, `src/hud.c`)

The function clamps its signed argument to `[0, 0xFFFF]` and stores it to the halfword field `GameData->levelHud.unk12A`. The `GameData* base` local is required for the target address materialization.

The required alias-fold question was tested by replacing `base->levelHud.unk12A` with `_gameData->levelHud.unk12A`. That build added a second `_gameData` load after the clamp, changed the literal-pool ordering, and did not match. The `base` alias is retained.

## `sub_8043970` (`0x8043970`, `src/packet.c`)

The function compares the packet checksum byte at offset `0x3` with `sub_804393C(arg0)`, then compares the low nibble at offset `0x2` with `arg1`; on failure it calls `sub_80603E8` and returns zero. The `unk2_0 : 4` bitfield is required: it emits the target `ldrb`, `lsl #28`, `lsr #28` extraction, whereas an ordinary scalar mask emitted `and #15`.

The checksum access uses `arg0->unk0.fields.unk3`, sharing the measured union layout with `sub_8043960`. `sub_80603E8` is defined by `multiplayer.c`; its prototype is now owned by `src/multiplayer.h`, which `packet.c` includes.

## `sub_805582C` (`0x805582C`, `src/effects.c`)

The function retains separate `GameData* gameData`, `ProjectileSystem* effect`, `Actor* base`, `const unk8* resource`, `unk32 velocityX`, and `unk32 velocityY` locals. This lifetime shape produces the target saved `r8/r9` registers, resource pointer in `r7`, and fifth argument reload at `sp + 0x20`.

Each required fold was tested independently from the matching baseline:

| Question | Change tested | Result |
| --- | --- | --- |
| `velocityX` | Pass `arg2` directly to `sub_804C354` | Failed: allocator swapped the `r8`/`r9` roles at entry and final call. |
| `velocityY` | Pass `arg3` directly to `sub_804C354` | Failed: allocator swapped the `r8`/`r9` roles at entry. |
| `resource` | Pass `_8078e88` directly to `sub_804C3D4` | Failed: removed the `r8`/`r9`-preserving save shape and moved literal loads/stack arguments. |
| duplicated `sub_804C3D4` arms | Select an actor once and issue one call | Failed: changed the branch layout and removed the target duplicate call arm. |
| HUD `base` alias | Tested under `sub_804F824`; see that section | Failed as described above. |

The duplicated `if (arg1 != NULL)`/fallback call arms and all three single-use aliases are therefore retained because their measured lifetimes reproduce the target. The final `sub_805582C` implementation keeps the two coordinate-source arms, calls `sub_804C34C` with the base actor, and calls `sub_804C354` with the two velocity locals and the incoming stack argument.

## Review-only prototype and ownership fixes

`sub_80556C4` is declared in `effects.h`, `sub_8043960` is declared in `packet.h`, and `sub_80603E8` is declared in `multiplayer.h` rather than locally in `packet.c`. These changes do not alter the matched function bytes.
