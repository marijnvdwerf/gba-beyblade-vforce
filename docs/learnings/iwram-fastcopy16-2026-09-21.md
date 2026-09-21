# fastMemoryCopy16ARM — 2026-09-21

## Result

Matched at 0x0300711C after the user explicitly allowed inline assembly.
The zero/odd-length guards and error callback remain C; the five-instruction
copy loop is inline assembly. The existing compiler flags are unchanged,
and there are no register declarations or header changes.

The implementation reproduces all 96 bytes and all relocations. Both US
and EU full-ROM SHA1 checks pass. Source and destination aliases both fold
away without changing the bytes; the final asm uses the void-pointer
parameters directly. The assembly dump is removed.

The target's register allocation and literal pool are strong evidence of an
original inline-assembly body, not proof of the original source.

### Retained constraint caveat

The byte-required legacy operand form describes count as an output with a
tied input, but describes the two post-incremented pointers as input-only.
Neither pointer is used afterward, and the emitted function is verified
byte-identical. This nevertheless understates the pointer modifications in
the GCC extended-asm contract. Declaring both pointers read/write was
reverted: the first divergence was fastMemoryCopy16ARM +0x0C, where the
pointer copies moved ahead of the count test, and the full US SHA1 changed.
The function is marked `// TODO: fakematch?`.
It should not be assumed safe to inline or extend with subsequent pointer
uses without revisiting the constraints and rechecking the ROM.

Declaring all three operands read/write changes the register roles with
typed cursor locals (count r4, source lr, destination ip). Using parameters
directly restores the roles but moves the two pointer copies before the
count test, first differing at +0x0C. Early-clobber constraints, output/input
operand permutations, separate output variables, and a separate shift block
do not restore the exact sequence. These unsuccessful alternatives were
confined to /tmp. The user's permission for asm allows retaining the
measured legacy form rather than leaving this function parked.

## Measurements

The ordinary C draft first differs at +0x04: it saves only fp/ip/lr/pc rather
than r4/fp/ip/lr/pc. It retains source/destination/count in r0/r1/r2, loads the
halfword through r3, duplicates the epilogue, and places the callback address
before the message address in the final literal pool. The target uses
r4/lr/ip, loads the halfword through r0, and puts its pool between the error
branch and the copy loop.

| Probe | Result |
| --- | --- |
| Separate count local; positive outer guard | Same plain-C residual |
| Signed halfword pointers; typed parameters; staged halfword value | Same plain-C residual |
| Unprototyped/variadic/const callback; integer callback cast | Same plain-C residual |
| Pointer aliases folded into typed parameters | Same plain-C residual |
| while loop | Adds a shifted-count zero check; not a match |
| Byte-count decrement by two | Removes the required right shift; not a match |
| O1/O2/O3/Os and ordinary optimization-pass toggles | No match |
| Disable prologue scheduling | Moves frame setup; does not recover register allocation |
| Diagnostic register locals at O0/O1/O2 | No match |
| Diagnostic asm with all three operands read/write | Right structure; wrong register roles |
| Diagnostic asm for just the copy instruction pair, C loop | Right roles; wrong entry order |
| Diagnostic asm for whole loop, count read/write, pointers input-only | Exact bytes and relocations |

The final diagnostic retains the draft's C zero and odd-length tests and
callback. Its assembly body shifts the count, copies one halfword using r0,
and decrements/branches on the count. The count is output operand `=r` with a
tied input `0`; source and destination are input operands `r`. The clobber
list is r0, r1, r2, r3, cc, memory. These constraints reproduce the otherwise
unexplained relocation pool order, prologue, entry scheduling, and shared
return in addition to the loop. Mutated pointer operands are unused after
the block; see the retained constraint caveat above.

Artifacts: `/tmp/copy16-inline-diagnostic-countout.c` and `.s`,
`/tmp/copy16-target.o`, `/tmp/copy16-diagnostic.o`. Independently assembled
`.text` bytes are identical (96 bytes). Relocations on both objects:

- +0x34: R_ARM_V4BX
- +0x3C: R_ARM_ABS32 Str_8756798
- +0x40: R_ARM_ABS32 off_807D96C
- +0x5C: R_ARM_V4BX

The dump has an existing incorrect `arm_func_end fastMemoryCopyARM`; only
the scratch assembly copy corrected it to assemble independently. The
project dump was removed after the ROM matched. The generic function diff tool failed to pair the target symbol with the
C candidate, so this investigation used compiler dumps and independently
assembled object comparisons.

The neighboring word-copy routine clobbers r0–r3 in its block transfer, and
has exactly the same source/destination/count register roles. The clear
routines use a different scratch set and keep count in r3. That supports a
shared inline-assembly memory-primitive implementation rather than a single
missing TU-wide register-allocation flag.

Final validation uses the installed compiler with the retained inline-asm implementation.
