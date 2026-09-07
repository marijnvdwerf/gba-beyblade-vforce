# Cast-removal pass — 2026-09-07

Scope: active casts matching `(s8|u8|s16|u16|s32|u32|unk8|unk16|unk32)` in reachable source. Casts in `#if 0`, `include_asm.h`, and RAM-only placeholders were excluded unless a RAM placeholder's declaration was upgraded to the type proven by an active use. Each source experiment was followed by a build, a symbol diff where applicable, and `cmake --build build --target compare`. The comparison passed after every restored or accepted experiment.

## Declaration corrections

| Location | Correction | Evidence and result |
|---|---|---|
| `src/ram.h`, `GameData.unkC24` at `0xC24` | `u16` to `s16` | The music-state consumers compare the field with `-1`; direct reads in `sub_804AE8C` (`0x0804AE8C`), `sub_804AECC` (`0x0804AECC`), and `sub_804AF5C` (`0x0804AF5C`) match after the declaration correction. The initialization sentinels in `initGame` and `initGameLoop` use `|= -1`. |
| `src/ram3.c`, `_unk3005E20` at `0x03005E20` | `void*` to `unk8*`; matching extern in `src/sound.c` | `Sound_8062BA8` stores the second pointer from the SFX table and later treats it as byte-stream data. Removing the integer cast while using `unk8*` produced an exact function diff and a passing ROM comparison. |
| `src/keystate.c`, `_unk3005DA8` | `void*` to `unk32` | The value is an integer timer/reference point. Removing the cast in `sub_805AB44` (`0x0805AB44`) after correcting the declaration retained the target output. |
| `src/backup.h`, `sub_8065AA0` and `sub_8065BD4` | data argument `u32` to `void*` | The active battery caller passes a `BackupBlock*`; changing the helper declarations to pointer-compatible prototypes allowed removal of the caller's pointer-to-integer cast without changing the ABI or ROM. Parked implementations were not edited. |
| `src/levelrow.c`, `sub_804A280` (`0x0804A280`) | index `s32` to `unk32` | This related declaration correction preserves the unsigned table-index expression without adding a cast. The function remained exact. |

## Removed casts and equivalent source corrections

| Function/address | File and expression | Decision and evidence |
|---|---|---|
| `sub_8046468` / `0x08046468` | `src/festate.c`, `mode = (unk8)arg2` | Removed. The destination/local declaration already supplies the byte width; exact diff and compare passed. |
| `sub_8046A0C` / `0x08046A0C` | `src/festate.c`, `(s16)(-(_unk30004B8 >> 8) + 0x10)` | Removed. The call prototype and destination preserve the required narrowing; exact diff and compare passed. |
| `sub_8049018` / `0x08049018` | `src/frontend.c`, two `(unk32)-65536` initializers | Removed. The assignment destinations are word-sized and the literal already has the required representation; exact diff and compare passed. |
| `sub_8049264` / `0x08049264` | `src/frontend.c`, `_gameData->unkC26 = (unk16)-1` | Removed after the field was declared `s16`; the assignment emits the same halfword store. |
| `initGameLoop` | `src/gameinit.c`, `initLevelEnvironmentActors((u16)levelId)` | Removed. The helper's parameter prototype supplies the narrowing at the call boundary. |
| `initGameLoop` | `src/gameinit.c`, `levelIdCopy = (u16)levelId` | Removed. `levelIdCopy` is already declared at the required width. |
| `initCollisionData` | `src/gameinit.c`, `(unk16)GetLevelDescriptionNo()` | Removed. The `levelNo` declaration and downstream indexed use preserve the target conversion. |
| `initCollisionData` | `src/gameinit.c`, `getLevelMetadata((unk16)getSomeLevelID())` | Removed. The callee prototype supplies the required argument width. |
| `sub_8052978` / `0x08052978` | `src/gameloop.c`, `_unk3000C08 = (unk32)-2` | Removed. The global is word-sized and the literal representation is unchanged. |
| `getLineMetaobjectByTypeAndId` | `src/geometry.c`, `key = (u16)id` | Removed. `key` is `u16`, so the assignment performs the same narrowing; exact diff and compare passed. |
| `sub_804F05C` / `0x0804F05C` | `src/hud.c`, two `(s16)` coordinate arguments | Removed. The coordinate helper's prototype and arithmetic produce the target argument width. |
| `sub_805AB44` / `0x0805AB44` | `src/keystate.c`, `(unk32)_unk3005DA8` | Removed with the `_unk3005DA8` declaration correction above. |
| `sub_804AD74` / `0x0804AD74` | `src/music.c`, `_unk3000F1C = (s16)lower` | Removed. The global is a signed halfword and the assignment naturally emits the target store. |
| `sub_804AE8C` / `0x0804AE8C` and `sub_804AECC` / `0x0804AECC` | `src/music.c`, explicit `(s16)` reads of `GameData.unkC24` | Removed with the `s16` field correction. |
| `sub_804AF5C` / `0x0804AF5C` | `src/music.c`, `(s16)_gameData->unkC26` | Removed. `unkC26` is already `s16`; the function diff and full compare passed. |
| `sub_80574D0` | `src/battery.c`, `(unk32)data` passed to `sub_8065AA0` | Removed after changing the helper prototype to `void*`; the caller and helper remain pointer-compatible. |
| `sub_80657EC` / `0x080657EC` | `src/spritestring.c`, `(u8)value` entry normalization and `(u8)flags` store | Removed. The parameter and byte field/store shape already produce the target. |
| `sub_8065760` / `0x08065760` | `src/spritestring.c`, `count = (u16)maxCount` | Removed. `count` is `u16`; exact diff and compare passed. |
| `sub_80434EC` / `0x080434EC` | `src/menuobject.c`, `count != (unk32)-1` | Removed. `count` is already word-sized and the sentinel literal is unchanged. |
| `sub_804374C` / `0x0804374C` | `src/menuobject.c`, two `sub_805B210(...) != (unk32)-1` tests | Removed. The return type is word-sized and the comparison representation is unchanged. |
| `Sound_80629F0` / `0x080629F0` | `src/sound.c`, `Sound_8062910(var1, arg0, (unk32)arg1)` | Removed. `arg1` is already `unk32`; the function diff was exact and the ROM comparison passed. |
| `Sound_8062BA8` / `0x08062BA8` | `src/sound.c`, `(unk32)(*_unk3005E14->var08)[arg0][1]` | Removed with `_unk3005E20` corrected to `unk8*`. The direct pointer assignment was byte-identical. |
| File-scope `FIXED_16_16` macro | `src/sound.c`, outer `(unk32)` around floating-point initializers | Removed. The destination is `u32`; all MIDI table bytes remained exact and the full comparison passed. |

## Retained casts

| Function/address | File and cast | Evidence |
|---|---|---|
| `sub_8049FF8` / `0x08049FF8` | `src/background.c`, `(unk8)state->transition.value` | Retained. Other consumers of the same storage use signed-byte loads (`ldrsb`), while this comparison needs the target's unsigned-byte load (`ldrb`) before comparing with `0x40`. Changing the cast or global field type would break the established signed consumers. |
| `sub_80491E0` / `0x080491E0` | `src/frontend.c`, `(unk32)value >> 31` | Retained. Without the cast, agbcc emits `asr r3, #31`; the target is `lsr r3, #31`. This is a genuine unsigned shift view. |
| `newCollisionDataRam` / `0x0805B938` | `src/geometry.c`, `i < (s16)count` | Retained. The target normalizes `count` with `lsl #16; lsr #16` and uses a signed loop comparison. Removing the cast changes the loop and fails the ROM comparison. |
| `sub_804A110` / `0x0804A110` | `src/levelrow.c`, both `(s16)sub_80491E0(...)` results | Retained. Each target call is followed by `lsl #16; asr #16`; removing either cast changes the first divergent instruction and fails compare. |
| `sub_804AD74` / `0x0804AD74` | `src/music.c`, both `(unk16)lower` arguments to `sub_804AFD4` | Retained. The target emits unsigned halfword normalization before each call (`lsl #16; lsr #16`). Removing either cast changes the caller. |
| `sub_8050114` / `0x08050114` | `src/riderstate.c`, `(s16)(prefix.unk2 ^ prefix.unk4)` | Retained. The target has `ldrh`, `eor`, `lsl #16`, `asr #16`; removing the cast removes the required signed halfword normalization. |
| `showString` / `0x080614BC` | `src/spritetext.c`, three `u16` casts on `advance - width[ch]`, `advance + offset`, and `x + advance` | Retained. Each produces the target's `lsl #16; lsr #16` normalization. Independent removal of each cast caused instruction and layout differences. |
| `sub_80610EC` / `0x080610EC` | `src/sprite.c`, `(u32)spriteEntry->unk10 >> 30` | Retained. Removing it changes the target `lsr #30` to `asr #30`; `SpriteEntry.unk10` remains signed for its other users. |
| `sub_8061110` / `0x08061110` | `src/sprite.c`, `(u32)spriteEntry->unk10 >> 30` | Retained for the same signed-field/unsigned-shift evidence; independent removal changes `lsr #30` to `asr #30`. |
| `memset` / `0x08067A8C` | `src/libc.c`, `*s++ = (unk8)c` | Retained. `c` is `s32`; removing the cast changes the byte-mask/store sequence and fails compare. |
| `sub_805A53C` / `0x0805A53C` | `src/memory.c`, `(unk32)current->address` | Retained. This is an explicit pointer-to-integer conversion used for address arithmetic; removing it produces an incompatible pointer/integer expression and warning. |
| `newSpriteTrail` / `0x0804A838` | `src/trail.c`, three `(unk32)arg0` conversions | Retained. `arg0` is a pointer set to `NULL`, but replacing the conversions with integer zero changes agbcc's allocation/register behavior and ROM output. |
| `sub_804A504` / `0x0804A504` | `src/tutorial.c`, `(unk32)_gameData->tutorial.unk104` | Retained. The pointer is deliberately converted to an integer for the branchless nonzero test `((0 - value) | value) >> 31`; the conversion is part of the proven expression shape. |

## Excluded parked casts

Casts in `#if 0` implementations were left untouched, including the parked drafts in `actor.c`, `rider.c`, `riderphysics.c`, `particle.c`, `iconmenu.c`, `sound.c`, `spritetext.c`, `gameinit.c`, and `gameloop.c`. No header field was added solely to satisfy a parked draft.

## Verification

The final source state was built with `cmake --build build --target compare`; the `rom-matches` test passed. Generated `expected` and `tools/diff/node_modules` remain untracked and were not staged.
