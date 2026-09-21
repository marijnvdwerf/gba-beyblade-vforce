# sub_805A93C: matched with an explicit fakematch — 2026-09-21

The function now matches with the installed old_agbcc, and the original dump is
removed. This resolves the parked register-allocation residual documented in
keystate-2026-09-21.md. No header, shared-type, ABI, or compiler-option changes
are retained. The source is marked `// TODO: fakematch?` under the user's
allowance for light matching compromises; register declarations and asm remain
excluded.

## Instrumented evidence

Cloned pret/agbcc into /tmp/agbcc-regalloc-debug and added opt-in flow-reference,
local/global allocation, conflict/preference, and pre/post-reload traces.
The debug compiler was built with OLD_COMPILER and host debug symbols. The
installed compiler, instrumented compiler with tracing off, and instrumented
compiler with tracing on produce identical loadable sections and relocatable
disassembly for both the parked draft and the final matching TU. The final ROM
checks use the installed compiler, not the instrumented one.

The allocator sorts by the truncated integer value of
`floor_log2(refs) * refs / live_length * 10000 * size`.

| Value | Draft refs / lifetime / score | Matching refs / lifetime / score |
| --- | --- | --- |
| Index | 14 / 32 / 13125 | 14 / 36 / 11666 |
| Source | 4 / 35 / 2285 | 8 / 37 / 6486 |
| Count | 5 / 25 / 4000 | 5 / 27 / 3703 |
| Destination | 4 / 34 / 2352 | 4 / 36 / 2222 |

The draft allocates index r4, count r5, destination r6, source r7. The matching
form allocates index r4, source r5, count r6, destination r7. The trace proves
these choices come from global allocation, with no copy preference changing
them and no subsequent reload reassignment.

## Exact compromise

Inside the loop, after staging the destination record:

```c
input = &arg2[i];
arg1 = (arg1 + i) - i;
sub_805A930(input, &arg1[i].unk0);
```

The source pointer expression is deliberately redundant. Flow analysis counts
its use and definition, adding four weighted references in the loop. The
combine dump then contains a source-register self-copy (`set p23 p23`), while
allocation still sees the increased reference count. The final machine code
contains no pointer round-trip instructions. Staging input first preserves the
target's destination-address calculation before the source-address calculation.
This is an allocation workaround, not a claim that the original source had
this redundant expression. It is semantically neutral on the same valid arrays
already required by the original indexed access.

An initial matching variant saved the source base, advanced the source pointer,
copied the selected row and restored the base before the call. The fold pass
removed both source temporaries, then combined the advance/restore into the
single expression above. All accepted/rejected folds used full US SHA1 checks.

| Fold | Result |
| --- | --- |
| Row temporary into indexed source access after restore | Exact; removed |
| Saved source base into inverse pointer update | Exact; removed |
| Combine pointer increment/decrement | Exact; retained |
| Count into explicitly narrowed arg3 | +2 bytes; first divergence +0x06 adds mov r6,r3; restored |
| Input into direct destination call argument | Same 0x46-byte size; first divergence +0x26 computes source address first; restored |
| Remove redundant source expression | Same size; first divergence +0x02 uses source r7 rather than r5; restored |

Final formatted source passes the enforced US and EU ROM SHA1 checks.
