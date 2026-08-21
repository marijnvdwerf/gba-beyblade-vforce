# ASM_ZEROPAD — what it is and isn't

Source: research agent, session 2 (manager-condensed).

`ASM_ZEROPAD` (`src/common.h:76`) is `asm(".align 2, 0\n")`. Nine uses:
main.c (after nullsub_37, onTimer1Overflow), bios.c (after DivRem,
VBlankIntrWait), layer.c (after sub_8058A28), sound.c (after Sound_8062AB8,
Sound_8062AD4, and at EOF), libc.c (EOF).

## agbcc baseline

- agbcc emits `.align 2,0` *before* every function, so the 2-byte gap after a
  Thumb function ending at a 2-mod-4 address is zero-filled by the compiler
  itself whenever another function follows in the same TU.
- The assembler rounds the *end* of `.text` to 4 with `C0 46` (Thumb nop).
- Linker-created gaps between output sections / input objects are zero-filled;
  in this project every `.text` input object is already 4-aligned and
  contiguous (no gaps at any TU boundary).

## Verdict

- The 7 mid-TU uses are no-ops: assembling the generated .s with those lines
  removed gives byte-identical objects. They are NOT evidence of an original
  TU boundary. Safe to delete (verify with `compare`).
- The 2 EOF uses (sound.c, libc.c) are needed: they turn the assembler's
  `C0 46` end fill into `00 00`. They show the original object ended with zero
  fill there, but not that the source was split at that point.
- Do not infer historical TU splits from ASM_ZEROPAD alone.
