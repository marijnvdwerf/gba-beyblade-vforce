# backup.c (Nintendo EEPROM_V122 library) — compiler/flags, 2026-09-15

## Finding

`src/backup.c` is Nintendo's prebuilt EEPROM library (ROM string `EEPROM_V122`;
same code as zeldaret/tmc `src/eeprom.c`, V124). It was not built with the
game's `old_agbcc -O2`. The measured match is pret's **new `agbcc` with
`-O1 -fprologue-bugfix`** (tmc builds `eeprom.o` with `agbcc -O1`). Set per
source file in `cmake/gba.cmake`.

## DMA3Copy (0x8065970) — evidence

Target shape: loop exit test duplicated ahead of the loop, with the guard's
address formed as `add r1, #2` from the `REG_DMA3CNT` register (reload
move2add, because the guard's address got the same hard reg), plus `and`/`orr`
results tied to the loaded-value register instead of the mask register.

| compiler / flags                     | natural `while` source result |
|--------------------------------------|-------------------------------|
| old_agbcc -O2 (every loop spelling, if+do/while, casts, temps) | 25–37 diff lines: exit test not duplicated/crossjumped, `ands r3, r4` tie |
| old_agbcc -O1                        | 4 lines: only `orrs r3, r4` vs target `orrs r4, r3` (no temp type/order variant fixed it) |
| agbcc -O1                            | DMA3Copy exact, but every leaf gains `push {lr}` |
| agbcc -O1 -fprologue-bugfix          | whole TU size-exact; DMA3Copy exact (plain form and tmc's `u32 temp` form both) |

No dead code or loop tricks are needed: `while (*(vu16*)REG_DMA3CNT_H & 0x8000) {}`.

## Other functions re-shaped under the new flags

- onTimer2Overflow: the O2-era `value << 16` staging becomes `if (--_unk_3000DAA == 0)`.
- writeToBatteryBackup: the O2-era split loads become tmc's
  `for (i = 0; i < 4; i++) if (*data++ != *bufferPtr++) { ...; break; }`.
- initBatteryBackup, sub_806586C, sub_806592C, sub_8065BD4 unchanged and exact.

The parked drafts (sub_80658A4, sub_80659F0, sub_8065AA0) were written against
O2; retry them under these flags, starting from tmc's EEPROMRead/EEPROMWrite shapes
(V122 uses the timer wait instead of V124's VCOUNT loop).

## Remaining functions (same session) — all matched under agbcc -O1 -fprologue-bugfix

- sub_806592C = pokeemerald StopFlashTimer: `*_batteryBackupTimer_REG++ = 0; *_batteryBackupTimer_REG-- = 0;`
  with a plain `unk16*` global (the store-back after each step is what `global++` emits).
- sub_80658A4 = StartFlashTimer: `const unk16* config`, `_unk_3000DAA = *config++;
  *reg++ = *config++; *reg-- = *config++;`. The target's `add r0, #2` staging rules out
  struct fields (they would give `[r0, #2]`/`[r0, #4]`), so `TimerConfig` became `unk16[]`.
- sub_80659F0 (tmc EEPROMRead) / sub_8065AA0 (EEPROMWrite, V122 timer wait):
  **byte-required pointer init** — target `add rD, (w<<1), sp` operand order needs
  `(plus ptr (plus (ashift w 1) C))` then `(plus ptr 1)`. Typed forms tried (all 1–4 diff
  lines, sp-first `add`): `buffer + w + 1`, `&buffer[w + 1]`, `buffer + w; ptr++`,
  `ptr = buffer; ptr += w; ptr += 1`, `w + buffer + 1`, casts of w. Only byte stepping matches:
  `ptr = buffer; ptr = (unk16*)((unk8*)ptr + ((w << 1) + 1)); ptr = (unk16*)((unk8*)ptr + 1);`
  (0x83 for the write). tmc needed the same (`(u8*)ptr += ...; ((u8*)ptr)++`).
- sub_8065AA0 wait loop: with `& 1` in both tests, CSE reuses the loop's HImode `1` in the
  timeout arm (target materializes a fresh `mov r1, #1` after the ldrh). Measured: arm test
  `(*(vu16*)0x0D000000 % 2) == 0` matches (unsigned `% 2` → unshortened SImode and); using
  `% 2` in the loop condition too gives 12 diff lines. `~x & 1` = 11, `(unk32)x & 1`, `1u`,
  `1L`, `!= 1`, loop shape variants (while(1)/for/do/continue) = 12.

## Controlled compiler-shape pass (2026-09-15)

All entries below were tested one change at a time under the selected
`agbcc -O1 -fprologue-bugfix` flags, rebuilt, diffed, and checked with the ROM
compare target.

### EEPROM pointer construction

The exact shipped form in both `sub_80659F0` and `sub_8065AA0` is:

```
ptr = buffer;
(unk8*)ptr += ((_unk_3005E9C->unk8 << 1) + displacement);
((unk8*)ptr)++;
```

where `displacement` is `1` for the read and `0x83` for the write. The
following alternatives were each rejected by a full function diff:

| candidate | result |
|---|---|
| `ptr = buffer + w + 1` / `buffer + w + 0x42` | not exact; address formation and operand order differ |
| `ptr = &buffer[w + 1]` / `&buffer[w + 0x42]` | not exact; introduces a separate indexed add |
| `ptr = buffer + w; ptr++` (with the corresponding write displacement) | not exact; pointer-address operand order differs |
| explicit `const unk8 *bytes` cursor, then cast to `unk16 *` | not exact; changes stack/register setup and function layout |
| direct initialization `ptr = (unk16*)((unk8*)buffer + (...))`, then byte increment | not exact; removes the target's staged `ptr = buffer` address-tree order |
| lvalue-cast form above | exact for both functions; shipped |

The dead-looking `ptr = buffer` assignment was therefore retained: folding it
changes both target functions even when the byte-domain cast is preserved.

### Timeout status test

Replacing the timeout-arm `(*(vu16*)0x0D000000 % 2) == 0` with the canonical
`(*(vu16*)0x0D000000 & 1) == 0` was not exact. The first changed region is the
status-arm constant/register setup: `& 1` reuses the loop's HImode one and
changes the branch layout, while the target materializes the fresh SImode
`and` produced by `% 2`. The `% 2` arm remains; `% 2` in the loop condition
was already measured non-matching.

### Interrupt-state temporary

Removing `ime` and attempting a direct restore expression does not preserve the
function. The direct form rereads `REG_IME` instead of retaining the saved
state, drops the target's saved register and callee-saved push, and changes the
function layout. The `ime` local remains because its lifetime spans the DMA
sequence.

### Timer-register representation

`lib/agb/include/agb/memory_map.h` defines individual `REG_TM0CNT[_L/_H]`
through `REG_TM3CNT[_L/_H]` macros, but no named timer-register array or
indexed register representation. No legal named-array spelling exists to test;
the pre-existing `REG_TM0CNT + _batteryBackupTimer * 4` V122 source shape is
left unchanged. The repeated `0x0D000000` EEPROM accesses are also left
unchanged under the explicit manager decision recorded in the review.
