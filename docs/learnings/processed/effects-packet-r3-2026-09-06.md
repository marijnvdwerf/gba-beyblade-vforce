# Effects and packet matching notes (2026-09-06)

This note records measured source-shape and type results for the seven functions assigned in this pass. All seven are matched; none is parked, so there are no parked-function step tables to preserve. The baseline for each experiment was the already matching implementation, and each question below was built separately.

## `sub_80556C4` (`0x80556C4`, `src/effects.c`)

The function is a single halfword-width store of zero to `GameData->projectileSystem.unk7A`. The direct typed field access

```c
_gameData->projectileSystem.unk7A = 0;
```

matches the dump. The owning declaration belongs in `src/effects.h` because `riderphysics.c` calls the function.

## `sub_8043960` (`0x8043960`, `src/packet.c`)

The function calls `sub_804393C(arg0)` and stores its byte result at packet offset `0x3`. The earlier `FrontendSubobjectWord` union hypothesis was retracted: `FrontendSubobject` is a separate 0x88-byte display-record layout, and its `unk0` field is restored to a plain `unk32`. The packet functions use the distinct `Packet` type from `src/packet.h`.

`Packet` is measured as 16 bytes and exposes only the fields proven by this pass: `unk0`, `unk1`, the low-nibble bitfield `unk2_0 : 4`, checksum byte `unk3`, and payload `unk4[12]`. The cross-translation-unit prototype is in `src/packet.h`.

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

The function compares the packet checksum byte at offset `0x3` with `sub_804393C(arg0)`, then compares the low nibble at offset `0x2` with `arg1`; on failure it calls `sub_80603E8` and returns zero. The `unk2_0 : 4` bitfield is required: it emits the target `ldrb`, `lsl #28`, `lsr #28` extraction, whereas an ordinary scalar mask emitted `and #15`. The checksum access is `arg0->unk3` on the distinct `Packet` layout. `sub_80603E8` is defined by `multiplayer.c`; its prototype is owned by `src/multiplayer.h`, which `packet.c` includes.

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

The packet buffers are now represented in `GameData` as `Packet unk15C4` at `0x15C4` and `Packet unk15D4[4]` at `0x15D4`; the preceding padding shrinks from `0x98` to `0x88`, preserving all following offsets. `frontend.c` uses `&data->unk15D4[0]` and `&data->unk15C4` for `sub_806014C`; the parked `gameloop.c` draft uses the corresponding typed addresses and packet indexing. The five background display-record address expressions were reverted because those records are unrelated to packet storage.
