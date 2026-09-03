# Leaves N4

## sub_8065AA0 (0x08065AA0)

Parked with the semantic draft in `src/backup.c` immediately above the assembly inclusion. The draft uses a 0xA4-byte halfword buffer, expands four input halfwords into sixteen serial bits each, prepends the sector command bits, performs the DMA transfer, starts the timer configuration, polls the backup status bit and timeout flag, then calls `sub_806592C`.

The first tested draft matched the stack frame, argument normalization, most loop operations, DMA call, polling operations, and epilogue semantically, but did not match register allocation or CFG layout. Its first divergence was the prologue save mask: the draft saved `r6` because agbcc retained the address of `_unk_3005E9C` across the function, while the target saves only `r4`, `r5`, and `lr`. The target separately materializes `_unk_3005E9C` at the initial sector check, buffer setup, sector-bit loop, and DMA count expression. The draft also schedules the outer byte-loop increment before the inner loop, whereas the target increments it after the inner loop.

Step table:

| Change | Result |
| --- | --- |
| Initial typed-pointer draft with separate result local | Extra `r6` save; global address cached; first code mismatch at prologue. |
| Reused `sector` for the status result | Removed the separate result pseudo but `r6` remained; status result moved to the expected semantic variable. |
| Direct global accesses instead of a function-wide config alias | Target-like source expressions, but agbcc still cached the global address in `r6`. |
| Volatile pointer and opaque `const void *` experiments | Did not remove the saved `r6`; reverted because they weakened the proven global type. |
| Nested `while`, `do/while`, and canonical nested `for` loop forms | All retained a pre-inner outer increment or otherwise differed from the target bottom increment. |
| Scoped config alias for buffer setup | No improvement; draft retained the saved global-address register. |

No struct fields were added for this parked function. The fixed RAM global `_unk_3005E9C` was restored to its existing `void *` placeholder declaration/definition after experiments; the typed `BatteryBackupConfig` declaration remains in `backup.h` for existing matched users. The final ROM compare passed with the function still assembled from `asm/dump/8064f38/8065aa0.s`.

## initEventListeners (0x080540EC)

Parked with the semantic draft in `src/event.c` immediately above the assembly inclusion. The draft normalizes the level ID, loads geometry and metadata, clears the three event-listener globals, collects line indices whose metadata contains a type-7 object, allocates and copies the resulting index list, stores the allocation and count, and calls `SetRiderGlobal(0)`.

The target uses a signed listener count in `sl`, a signed maximum of `0x20` in `r6`, and signed loop comparisons. The best draft matches the frame, level calls, geometry traversal, signed loop branches, warning control flow, allocation, copy, global stores, and epilogue semantically, but agbcc assigns the listener count to `r6` and the maximum to `r10`. It therefore emits an extra `mov` before each global count store and differs at the first counter initialization. The target also uses the listener-count guard followed by a do-while line walk; a regular for loop emitted an extra entry comparison and an unsigned bottom branch.

Step table:

| Change | Result |
| --- | --- |
| `s32` listener count and maximum, declaration-order variations | Produced signed warning and guard branches but retained count in `r6` and maximum in `r10`. |
| Inner `for` changed to a do-while under the listener-count guard | Removed the extra loop-entry comparison and matched the signed bottom-loop shape. |
| Signed loop index | Changed the bottom geometry-line branch from unsigned to signed `blt`, matching the target. |
| Fixed-size 32-entry array | Changed the frame shape and introduced a larger prologue frame; reverted. |
| Scoped maximum/VLA and nested declaration experiments | Preserved the unwanted register roles or changed frame/address layout; reverted. |

No new struct fields were added for this parked function. The dump remains `asm/dump/804a388-tutorial/80540ec-initEventListeners.s`.
