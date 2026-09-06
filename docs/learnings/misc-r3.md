# Miscellaneous round 3

## sub_805DCFC (0x0805DCFC)

The function returns a spline line record from the variable-length line area following a spline's point-index array. `GeometrySplineLine` is a 0x10-byte record with only `unkC` currently named because that is the field used by its caller. The index parameter and count local must be signed to emit the target's `bge`; using `unk32` produced `bhs` at the bounds check. The matched source uses `&spline->pointIndices[count]` as the dynamic line-area base and typed indexing for the 0x10-byte records.


## sub_80658A4 (0x080658A4)

The function was parked after natural C variants remained near-misses. Its semantics are timer interrupt setup: save REG_IME, disable interrupts, clear the selected timer's high halfword, request and enable the selected timer interrupt, clear the completion flag, copy three configuration halfwords into the timer registers while temporarily storing the high-halfword address, then restore REG_IME to 1. The parameter must be a halfword pointer because the target advances it by 2 bytes. The cleanest parked draft uses a typed timer pointer and a typed REG_IF pointer. The first non-relocation instruction divergence was at 0x12: the target keeps the shared zero in r6 while the draft allocates it in r5; the later mask block also differs in lifetime and register allocation. The target mask sequence is ldrb r1, mov r2, add r7,r2, lsl r7,r1, mov r1,r7, whereas the draft emits mov r1,r2, ldrb r7, lsl r1,r7. Tried variants included staged and direct mask expressions, shared constant locals, timer-index locals and pointer aliases, direct versus aliased interrupt registers, declaration-order permutations, and halfword-width experiments; no natural variant reached an exact match.

## sub_805EF18 (0x0805EF18)

Matched as a row renderer using the two camera tables at offsets 0x364 and 0x368. The indexed entries are separate row pointers: keeping table bases (`tableA`/`tableB`) distinct from indexed rows (`rowA`/`rowB`) reproduces the target's r9/r7 row registers and the target's address-calculation order. The count uses `while (count-- != 0)` to preserve the target's pre-body countdown test. The destination remains an integer address (`unk32`) because this function only advances and forwards it; the real call sites provide the buffer address. The target's callback is the imported function pointer `__sub_87576D8`, called with the two row pointers, coordinates, width, destination, and the second row pointer.

## printTime (0x08061A18)

Matched as a millisecond timer formatter. The argument is split into whole seconds with `Div(arg1, 1000)` and a millisecond remainder divided by 10 for the displayed fraction. Whole seconds are split into minutes and seconds with `DivRem`/`Div` by 60. The result and mode locals are byte-sized; retaining the original `arg2` for the final fraction call preserves the target's stack-backed mode reload. The target normalizes the accumulated byte result after the colon and decimal separator calls, which follows from the byte local and `&=` expression. `Str_8755B84`, `Str_8755B88`, and `Str_8755B8C` are the colon, zero, and decimal separator strings.
