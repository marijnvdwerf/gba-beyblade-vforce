# Cast-removal pass — 2026-09-07

Scope: active, reachable C code only. Casts in `#if 0` drafts and in
`include_asm.h` were not edited. Every source experiment was compiled and
followed by `cmake --build build --target compare`; the ROM comparison is the
final authority. A compiler diagnostic by itself was not treated as evidence
for retaining a cast: pointer and declaration alternatives were tested where
that question arose.

## Declaration corrections

| Location | Final declaration | Evidence |
|---|---|---|
| `src/ram.h`, `GameData.unkC24` at offset `0xC24` | `s16` (layout unchanged) | `sub_804AE8C` loads the field with `ldrsh` at `0x0804AE98` and compares it with `-1` at `0x0804AE9E`; `sub_804AECC` uses `ldrsh` at `0x0804AED6` and compares at `0x0804AEDC`. `initGame` reads the same location with `ldrh` at `0x080532E6`, applies `orr` at `0x080532E8`, and writes with `strh` at `0x080532EA`. The mixed unsigned initialization access and signed consumers are consistent with a signed halfword field. |
| `src/ram3.c` and `src/sound.h`, `_unk3005E20` at `0x03005E20` | `unk8*`, with the extern owned by `sound.h` | `Sound_8062BA8` stores the SFX table's byte-stream pointer directly. Removing the assignment's integer cast with this declaration produced an exact function diff and a passing ROM comparison. `ram3.c` remains the sole definition. |
| `src/keystate.c`, `_unk3005DA8` | `unk32` | `sub_805AB44` now subtracts the global directly from the word timer value; the declaration correction and cast removal produced the target bytes. The active assignments in the recording path remain separately typed as required by their existing source. |
| `src/backup.h`, battery helper data parameters | `unk16*` for `sub_8065AA0`, `writeToBatteryBackup`, and `sub_8065BD4` | The active helper implementation reads halfwords, and the concrete halfword-buffer declaration preserves the target ABI and loop. The earlier integer/`void*` declarations were replaced with this concrete type. |
| `src/levelrow.c`, `sub_804A280` index | `unk32` | The table index is naturally word-sized in the matched function; changing the declaration removed the cast without changing its instruction stream. |

The signed sentinel source was also normalized in `src/gameinit.c`:

```
_gameData->unkC24 |= -1;
_gameData->unkC28 = -1;
_gameData->unkC2C = -1;
_gameData->unkC26 |= -1;
```

The corresponding redundant casts in initialization and music callers were
removed only after their existing declarations supplied the same conversion.

## Casts removed with matching output

The following changes were individually built and compared, and their final
forms are present in the source.

| Function or expression | File | Change |
|---|---|---|
| `sub_8046468` (`0x08046468`) | `src/festate.c` | Removed `(unk8)arg2` when assigning the already-byte-sized `mode`. |
| `sub_8046A0C` (`0x08046A0C`) | `src/festate.c` | Removed the redundant `(s16)` around the coordinate expression passed to the typed helper. |
| `sub_8049018` (`0x08049018`) | `src/frontend.c` | Removed casts around the word-sized `-65536` initializers. |
| `sub_8049264` (`0x08049264`) | `src/frontend.c` | Removed `(unk16)-1` after the destination field was typed as a signed halfword. |
| `initGameLoop` | `src/gameinit.c` | Removed `(u16)` from `initLevelEnvironmentActors(levelId)` and from the already-`u16` `levelIdCopy` assignment. |
| `initCollisionData` | `src/gameinit.c` | Removed the casts around `GetLevelDescriptionNo()` and `getSomeLevelID()`; the declarations and callee prototype provide the required widths. |
| `sub_8052978` (`0x08052978`) | `src/gameloop.c` | Removed `(unk32)` from the word-sized `-2` assignment. |
| `getLineMetaobjectByTypeAndId` | `src/geometry.c` | Removed `(u16)id` when assigning to the `u16` key local. |
| `sub_804F05C` (`0x0804F05C`) | `src/hud.c` | Removed both `(s16)` coordinate-argument casts; the helper declaration and arithmetic emit the same narrowing. |
| `sub_805AB44` (`0x0805AB44`) | `src/keystate.c` | Removed `(unk32)_unk3005DA8` after declaring the global as `unk32`. |
| `sub_804AD74` (`0x0804AD74`) | `src/music.c` | Removed `(s16)lower` on the global assignment after the destination was typed `s16`; the two call-site `(unk16)lower` casts remain. |
| `sub_804AE8C`, `sub_804AECC`, `sub_804AF5C` | `src/music.c` | Removed explicit signed-halfword field-read casts after the `GameData` declaration correction. |
| `sub_80657EC` (`0x080657EC`) | `src/spritestring.c` | Removed the redundant `(u8)` parameter normalization and byte-field assignment cast. |
| `sub_8065760` (`0x08065760`) | `src/spritestring.c` | Removed `(u16)maxCount` when assigning to the `u16` local. |
| `sub_80434EC`, `sub_804374C` | `src/menuobject.c` | Removed redundant `(unk32)-1` sentinel casts from word comparisons. |
| `Sound_80629F0` (`0x080629F0`) | `src/sound.c` | Removed `(unk32)arg1` from the already-word-sized helper argument. |
| `Sound_8062BA8` (`0x08062BA8`) | `src/sound.c` | Removed the pointer-to-integer cast when assigning the byte-stream pointer to `_unk3005E20`. |
| `FIXED_16_16` | `src/sound.c` | Removed the outer `(unk32)` around floating-point table initializers; the `u32` MIDI table bytes remained identical. |
| `memset` (`0x08067A8C`) | `src/libc.c` | Changed `*s++ = (unk8)c` to `*s++ = c`. The no-cast output is exact, including the target mask/build sequence (`and r4,r0` at relative `0x18`, then `lsl`, `orr`, `lsl`, `orr`) and the byte loop's `strb` at relative `0x42`. |
| `sub_805A53C` (`0x0805A53C`) | `src/memory.c` | Changed the `address` local from `unk32` to `unk8*`, used `address = current->address`, and expressed `firstGap = address - base`. The pointer-typed version matched exactly; no pointer-to-integer cast remains in this path. |
| `sub_8065BD4` (`0x08065BD4`) | `src/backup.c` | Changed the data parameter from the old integer form to `unk16*` and removed the redundant cast at the `writeToBatteryBackup` call. |

The two HUD/menu lifetime questions were also tested. Folding
`text2 = &state->text2` into the following `sub_8061844` call changed address
materialization order and did not match, so the alias remains. Inlining
`sub_8043720(object) | 0x80000000` into `sub_80490CC` changed the generated
instruction layout, so the staged `next` local remains. Both folded variants
were restored and the restoration compare passed.

## Casts retained by measured code generation

These casts remain in live source because the target operation or a tested
alternative requires them. The cited addresses are target ROM addresses unless
noted as function-relative offsets.

| Function | Cast | Evidence and failed alternative |
|---|---|---|
| `sub_8049FF8` (`0x08049FF8`) | `(unk8)state->transition.value` | The target loads the comparison byte with `ldrb` at `0x0804A0C8` and compares it with `0x40` at `0x0804A0CA`. Other uses of this storage require signed-byte loads, so changing the shared field type would not preserve all consumers. |
| `sub_80491E0` (`0x080491E0`) | `(unk32)value >> 31` | The target uses logical `lsrs r3,r2,#31` at `0x080491E2`. Removing the cast produces an arithmetic shift (`asr`), so the cast is the required unsigned view. |
| `newCollisionDataRam` (`0x0805B938`) | `(s16)count` | The target count normalization is `lsl r2,#16` at `0x0805B942` followed by `lsr r6,r2,#16` at `0x0805B944`; removing the cast changed the loop conversion/compare and failed the ROM comparison. |
| `sub_804A110` (`0x0804A110`) | both `(s16)sub_80491E0(...)` results | The first result has `lsl r0,#16` at `0x0804A1BC` and `asr r5,r0,#16` at `0x0804A1BE`. The second has `lsl r0,#16` at `0x0804A1D2` and `asr r2,r0,#16` at `0x0804A1D4`. Removing either cast removes the required signed normalization. |
| `sub_804AD74` (`0x0804AD74`) | both `(unk16)lower` call arguments | Each call requires unsigned halfword normalization (`lsl #16; lsr #16`) before `sub_804AFD4`; removing either cast changed the caller's instruction stream. |
| `sub_8050114` (`0x08050114`) | `(s16)(arg0->prefix.unk2 ^ arg0->prefix.unk4)` | The target performs `lsl #16` at `0x0805011C` and `asr #16` at `0x0805011E`. The analogous checksum expression in `sub_805024C` is already cast-free and remains so. |
| `showString` (`0x080614BC`) | three `u16` narrowing casts | The casts on `advance - width[ch]`, `advance + offset`, and `x + advance` each produce required `lsl #16; lsr #16` normalization. Removing any one changed instructions/layout and failed compare. |
| `sub_80610EC` (`0x080610EC`) | `(u32)spriteEntry->unk10` | Removing it changes the target `lsr r0,#30` at `0x080610F8` to `asr #30`. The field remains signed/unknown for other users, so this local unsigned shift view is required. |
| `sub_8061110` (`0x08061110`) | `(u32)spriteEntry->unk10` | Removing it changes the target `lsr r1,#30` at `0x0806111C` to `asr #30`, independently of the first function. |
| `sub_804A504` (`0x0804A504`) | `(unk32)_gameData->tutorial.unk104` | The target sequence is `ldr r1,[r0]` at `0x0804A510`, `neg r0,r1` at `0x0804A514`, `orr r0,r0,r1` at `0x0804A516`, and `lsr r0,#31` at `0x0804A518`. The pointer-to-integer conversion is part of the branchless nonzero test and the existing `// TODO: fakematch???` source shape was retained. A no-cast attempt could not form the integer expression; the instruction sequence, not that diagnostic, is the evidence for the final decision. |
| `newSpriteTrail` (`0x0804A838`) | `sprites->unkC = (unk32)arg0` | `SpriteTrailEntry.unkC` is a halfword field and the target writes it with `strh` at `0x0804A8C6` from the existing zero register (`mov r4,#0` at `0x0804A8B8`). Replacing the source with integer zero introduced a new `mov r0,#0` and changed the `strh` source at relative `0x8E`; assigning the pointer directly is not a declaration correction for a halfword field. |
| `newSpriteTrail` (`0x0804A838`) | the three `(unk32)arg0` arguments to `LoadSpriteSheet` | The target stores the existing zero in the three stack argument slots at `0x0804A8D0`, `0x0804A8D2`, and `0x0804A8D4`. Replacing any one cast with integer zero introduced `mov r7,#0` and changed that store's source register. A local prototype experiment independently retyped each trailing parameter as `const void*` and removed its cast; all three local variants passed compare and the function diff, but that prototype is artificial and cannot be made global: other callers pass numeric values, including `1` and the `ch` character index. The shared `sprite.h` declaration therefore remains all `unk32`, and the casts remain at this pointer-as-numeric API boundary. |
| `sub_80574D0` (`0x080574D0`) | both `(unk16*)data` calls | `data` is an array of eight-byte `BackupBlock` records, while the battery helpers consume four halfwords. Retyping both helper declarations temporarily to `BackupBlock*` and removing the caller casts left `sub_80574D0` instruction-identical. It did not provide a valid project-wide declaration: `writeToBatteryBackup`'s body reads four halfwords and advances by two bytes. With its parameter changed to `BackupBlock*`, the first divergence was in the prologue: the target has `mov r4,r1` at relative `0x04`, `lsl r0,#16` at `0x06`, and `lsr r1,r0,#16` at `0x08`; adapted variants delayed/omitted the data-pointer move and used the normalized sector in `r2`. An indexed `BackupBlock` access also changed the loop by introducing scaled-index arithmetic instead of the target's `ldrh`/`add #2` cursor sequence. The declarations and casts were restored to `unk16*`; diagnostics were not used as the reason to retain them. |

## Explicitly tested trail declaration variants

The shared declaration is currently:

```
void LoadSpriteSheet(SpriteEntry*, const void*, unk32, unk32, unk32,
    unk32, unk32, unk32);
```

For each of the final three parameters, a local-only prototype was tested by
macro-renaming the declaration from `sprite.h`, declaring that one parameter as
`const void*`, and removing exactly one `(unk32)arg0` cast. The first, second,
and third trailing-parameter variants all produced an instruction-identical
`newSpriteTrail` and passed the full ROM comparison. They were all restored.
This proves that each individual conversion is codegen-redundant in an
isolated prototype, but not that the shared API parameter is a pointer: other
reachable callers pass numeric metadata (and `showString` passes `ch` in the
last slot). No local prototype or overload remains in the final source.

## Battery declaration experiment

The two casts in `battery.c` were not left solely because an incompatible-pointer
message was emitted. The following declaration/body experiment was performed.

1. Change the helper declarations to `BackupBlock*` and remove both casts in
   `sub_80574D0`. That caller remains instruction-identical and the full ROM
   comparison passes.
2. Change `writeToBatteryBackup` to `BackupBlock*` and adapt its body to retain
   the four halfword comparisons. The target's prologue diverges at relative
   `0x04` (`mov r4,r1`), and the normalized sector/pointer register assignment
   differs. Using `data->...` indexing additionally changes the target cursor
   loop (`ldrh`, `add #2`, `add #2`) to scaled-index address arithmetic.
3. Restore the concrete `unk16*` declarations and both casts. The restoration
   compare passes.

`BackupBlock` remains the honest eight-byte record type used by save-state code;
no speculative halfword-view field or duplicate overlay structure was added.

## Excluded code

Casts in parked `#if 0` implementations were intentionally left untouched,
including the drafts in `actor.c`, `rider.c`, `riderphysics.c`, `particle.c`,
`iconmenu.c`, `sound.c`, `spritetext.c`, `gameinit.c`, and `gameloop.c`. No
header field was added solely for a parked draft. No source comments were added
for match justification.

## Verification

The final restoration after the trail declaration experiments was verified with
`cmake --build build --target compare`; the `rom-matches` test passed. The final
source compare result is the expected baseline SHA1:

```
cd527c8c24e20e33913fc45199e64b3e6138a6e5
```

Generated `expected` and `tools/diff/node_modules` remain untracked and were
not staged.
