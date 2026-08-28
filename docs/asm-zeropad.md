# `ASM_ZEROPAD`

`ASM_ZEROPAD` emits `.align 2, 0`, forcing the assembler to fill the
translation unit's `.text` tail with zero bytes instead of its default Thumb
`nop` fill (`00 46`). Use it only when the matching object has `00 00` tail
padding after its final function. It is not needed between functions: agbcc
already emits zero-filled alignment before the next function, so a mid-TU use
is byte-neutral.

To determine whether a use is needed, inspect the bytes after the final
function in the expected `.text` section of that TU (or compare the linked ROM
bytes). Keep `ASM_ZEROPAD` when those tail bytes are `00 00`; remove it when it
is between functions or when the TU has no zero-filled tail requirement. The
same rule is represented in asm dumps by a final:

```asm
.align 2, 0 @ Don't pad with nop.
```
