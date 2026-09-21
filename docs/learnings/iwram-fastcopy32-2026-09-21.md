# fastMemoryCopyARM — 2026-09-21

Matched at 0x03007034 (132 bytes). The zero-length check and odd-word-size
error path and byte-to-word conversion remain C. The inline assembly copies
the one-word and two-word remainders, and copies four words per iteration.
The existing compiler flags and public header signature are unchanged.
No register declarations, temporary aliases, or speculative Copy2/Copy4
structs remain.

The shared off_807D96C callback declaration is now variadic: this routine
passes the byte count to the existing %i diagnostic string. The previously
matched halfword helpers still compile identically, proven by the full ROM
comparison. Its declaration remains local to iwram.c.

## Constraint measurements

With count, source, and destination all read/write, the first difference is
+0x0C: the compiler emits the source and destination copies before the count
test. The exact legacy form has count as output `=r` with a tied input `0`,
and source/destination as input-only `r`, with r0–r3, cc, memory clobbers.
This yields the target count test before both pointer copies and preserves
the error-call register order, literal pool, and common epilogue.

As with fastMemoryCopy16ARM, the pointer operands are post-incremented but
not declared outputs. They are unused after this block, and the emitted
function is byte-identical, but the constraints understate modifications
under the GCC extended-asm contract. Declaring both pointers read/write was
reverted: the first divergence was fastMemoryCopyARM +0x0C, where the pointer
copies moved ahead of the count test, and the full US SHA1 changed.
The function is marked
`// TODO: fakematch?`. Revisit the constraints before inlining it or adding
subsequent pointer uses. Inline assembly was explicitly authorized by the
user; no register declarations are used.

The function uses parameters directly, so there are no local aliases to
fold. Scratch comparisons are /tmp/copy32-correct.c and
/tmp/copy32-legacy.c, with corresponding compiler assembly output.

The standalone dump is removed after the US ROM matched. Both US and EU
full-ROM SHA1 checks pass with the installed compiler.

## Reducing the inline assembly

The initial shift folds into C exactly: `bytes /= sizeof(unk32)` produces
the target `mov ip, ip, lsr #2`. Retained, with US/EU SHA1 verification.

A larger split leaves remainder handling in one asm block, then expresses
the second shift, zero test, decrement, and loop branch in C. With correctly
read/write pointer operands, the entire transfer body matches, but the
first difference is +0x0C: the source and destination copies precede the
entry count test. While, for, guarded do/while, a separate block-count
local, and typed/void cursor aliases all retain that entry-order mismatch.
Post-decrement in the loop condition also changes the loop to sub/cmn and
moves the literal pool.

Moving the one-word remainder to C chooses r3 rather than r0 for the
load/store. A C `if` around the two-word transfer asm introduces a branch
instead of the target's predicated transfers. Those larger rewrites are
not retained; this is evidence for the measured residual, not proof that
no more C can ever match. Scratch sources: /tmp/copy32-morec-blocks.c,
/tmp/copy32-morec-loop.c, and /tmp/copy32-loop-{do,for,post,countalias,typed,void}.c.
