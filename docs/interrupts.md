# Interrupt dispatch

## Boot, installation, and dispatch

1. `main` writes the address of `intr_main` to `0x03007FFC` (`asm/crt0.s:50-60`; literal at `asm/crt0.s:170-171`). The BIOS interrupt entry therefore enters `intr_main`.
2. `intr_main` reads `REG_IE/REG_IF` through `REG_IME` at `0x04000200`, finds the first set interrupt bit, and dispatches through `_unk3000DF0 + 4 * slot` (`asm/crt0.s:99-168`). The table address is the literal at `asm/crt0.s:180-181`.
3. `mainLoop` calls `InitStuff_SetDispStat(0x8)` before enabling interrupts (`src/main.c:23-29`). `InitStuff_SetDispStat` disables interrupts, writes `REG_STAT`, and copies 14 words from `Unk_872CAF4` to `_unk3000DF0` (`src/irq.c:22-31`). The destination is the 14-entry IWRAM table declared in `src/ram2.c:3` (type declaration in `src/ram.h:353`).

## ROM source table

`Unk_872CAF4` is the 14-word source table (`src/strings3.c:5-20`):

| Slot | Handler |
| ---: | --- |
| 0 | `onVBlank` |
| 1 | `nullsub_37` |
| 2–3 | `nullsub_31` |
| 4 | `onTimer1Overflow` |
| 5–13 | `nullsub_31` |

`onVBlank` is implemented in `src/main.c:73-78`. `onTimer1Overflow` forwards to `Sound_onTimer1Overflow` at `src/main.c:84-87`; the callee is implemented in `src/sound.c:380`.

## Dynamic re-installs

- `sub_806586C` returns `onTimer2Overflow` through its ISR output pointer (`src/backup.c:37-45`). The backup setup installs that handler in `_unk3000DF0[5]`; `onTimer2Overflow` is C at `src/backup.c:24-35`.
- The multiplayer setup writes `_unk3000DF0[7] = onSerialCommunication`, then `_unk3000DF0[6] = __sub_8757D24`, and enables the corresponding interrupts (`src/multiplayer.c:248-265`; the live function is `asm/dump/8057b80-debug/806014c.s`).
- `sub_8757D24` later stores `__sub_8757E4C` into slot 6 (`asm/arm2.s:1825-1847`). It calls `sub_8757CD0` (`asm/arm2.s:1825-1830`).
- `onSerialCommunication` later stores `__sub_8757FCC` into slot 7 (`asm/dump/8057b80-debug/8060454-onSerialCommunication.s:43-50`).
- The ROM cells `__sub_8757CD0`, `__sub_8757D24`, `__sub_8757E4C`, and `__sub_8757FCC` point to their code labels (`asm/data8.s:2012-2022`).

## Handler implementation status

`onVBlank`, `onTimer1Overflow`, `Sound_onTimer1Overflow`, and `onTimer2Overflow` are C implementations. `onSerialCommunication` remains a Thumb dump at `asm/dump/8057b80-debug/8060454-onSerialCommunication.s`. `sub_8757D24`, `sub_8757CD0`, `sub_8757E4C`, and `sub_8757FCC` remain ARM assembly in `asm/arm2.s` (at `1735`, `1765`, `1863`, and `1984`, respectively).
