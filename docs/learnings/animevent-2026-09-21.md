# Animation event matching — 2026-09-21

## sub_805FE68 (0x0805FE68): matched

Regenerated the m2c draft and activated the typed bucket traversal. No C callers
were found; the explicit requested symbol retains its data-pointer/halfword
interface. No shared record types changed.

The target snapshots bucket->head and row->next using ldrh, but prints and tests
the original link fields using ldrsh. A wide unk32 index assigned through unk16
conversions, then interpreted as s16 for the entry test and array subscript,
reproduces this distinction. The loop is guarded do-while, with its bottom test
reading row->next directly. A narrow index lets agbcc merge that test with the
snapshot, changing the required load and normalization sequence.

The stored links remain s16 for their established signed users. The two explicit
unsigned field-read conversions are retained matching exceptions; no register,
volatile, artificial-scope, or inline-assembly techniques are used.

### Fold checks

Every valid candidate was checked against the full US SHA1. The exact symbol is
0x68 bytes.

| Trial | Result |
| --- | --- |
| Default unk32 index instead of s32 | Exact; retained |
| Fold bucket pointer into indexed data accesses | +4 bytes; first divergence +0x08: base load precedes index scaling; retained pointer |
| Remove unsigned head conversion | Same size; first divergence +0x0E: signed-load setup replaces ldrh; retained conversion |
| Remove unsigned next conversion | Same size; first divergence +0x44: signed-load setup replaces ldrh; retained conversion |

The row pointer snapshots the current record across the debug call and remains
needed after index is updated. Naively substituting the updated index in its
bottom test changes semantics, so that diagnostic is excluded as fold evidence.
The earlier narrow-index, top-tested loop, and early-return variants did not
match. No artificial instructions were retained from those trials.

Final formatted source passes both enforced US and EU ROM SHA1 comparisons.
The original assembly dump is deleted.

## sub_805FCEC (0x0805FCEC): matched

Replaced the parked insertion draft with C and removed the dump. No C callers
were found; the explicit requested function keeps its data-pointer and two
unsigned-halfword parameters, and returns a signed halfword. No shared types or
headers changed. The exact symbol is 0x92 bytes.

The counter post-increment is captured as signed rowIndex for addressing, then
copied to unsigned index for link stores and the return. A signed s32 bucketIndex
preserves the signed bitset shift and separate bucket addressing. The previous
sentinel is staged through unk16 prev; the final sentinel through s32 next.
The latter retains the target's final sign-extension pair before complementing.
These staging shapes are measured matching exceptions, flagged with the user's
TODO: fakematch? comment. No register, asm, or volatile levers are used.

### Fold checks

Each fold was checked with the full US ROM SHA1; rejected trials restored the
matching source. Accepted: remove the redundant rowIndex cast, move next to
function scope (remove the bare block), combine its conversion and complement,
and default prev from s16 to unk16.

| Tested fold | Size delta | First divergence |
| --- | --- | --- |
| next into row->next assignment | -4 | +0x1E: index r6 instead of r5; also loses final sign-extension pair |
| prev into row->prev assignment, preserving narrow conversion | 0 | +0x08: data pointer r4 instead of r3 |
| tail into indexed next store | 0 | +0x64: address-add operands reversed |
| unsigned index into signed rowIndex uses | 0 | +0x1E: index r6 instead of r5 |
| rowIndex into counter assignment to index | 0 | +0x1E: index r6 instead of r5 |
| bucketIndex into repeated signed argument expressions | -10 | +0x02: different saved high register |
| bucket into repeated indexed accesses | +28 | +0x02: saves r10 instead of r9 |
| row into repeated indexed accesses | +24 | +0x0E: argument r8 instead of ip |

The direct-expression draft was four bytes short with swapped row/index
registers. Adding the wide next temporary restored all instruction shapes;
narrow prev staging corrected the data/bucket allocation, and distinct signed
rowIndex and unsigned index corrected the final row/index allocation. These
locals are required by the tested forms, not proven impossible to remove.

Final formatted source passes both enforced US and EU ROM SHA1 comparisons.

## sub_805FAE8 (0x0805FAE8): matched

Activated the typed callback traversal and deleted the assembly dump. No C
callers were found. The six-argument interface distinguishes the fifth word
(callback payload at sp+0x20) from the sixth halfword (bucket index at sp+0x24).
The existing scratch record, dispatch-data and callback types now live in
animevent.h with the function declaration. Only the evidenced eight-byte record
stride, data pointer at +8, word at +0x10 and callback at +0x28 are represented;
untouched storage stays padding. Existing shared layouts did not change.

The parked draft matches after changing the loop's terminal else arm from
node = NULL to break. Preserve the positive next != -1 arm followed by else
break: an early if (next == -1) break followed by the advance is not equivalent
for agbcc's block layout. The compiler shares the initial and loop successor
address calculations, producing the target's apparently irreducible assembly
without any source goto. This resolves the previous parking note; no artificial
scope, casts, duplicate aliases, register declarations, or asm are needed.

### Fold checks

The exact symbol is 0x78 bytes. Each trial used the full US ROM SHA1 and restored
the matching source on failure.

| Tested reduction | Size delta | First divergence |
| --- | --- | --- |
| Fold record into callback argument | 0 | +0x30: count increment starts before record address calculation |
| Fold bucket into indexed head accesses | 0 | +0x1A: node initialization moves before bucket-index scaling |
| Flatten terminal else-break into early break | +4 | +0x2C: initial branch target changes, successor setup no longer shared |

Retained record and bucket temporaries are required by these tested forms. The
node is the evolving list cursor and count is the accumulated result.

Final formatted source passes both enforced US and EU ROM SHA1 comparisons.
