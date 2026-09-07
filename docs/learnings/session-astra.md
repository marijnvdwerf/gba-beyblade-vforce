# GetLineIndexOfType — matched 2026-09-07

Address: `0x0805E83C`; translation unit: `src/geometry.c`.

The mainLoop callgraph includes this function. The three calls in initRiders
use types 0x86/0x99 and a halfword start index, and test the signed word return
against -1 or zero. The target signed comparisons prove the signed line count;
the byte type and halfword index retain the existing unk8/unk16 declarations.
The existing GeometryLine.unkF field and 0x20-byte layout needed no changes.
The m2c draft confirmed the cursor scan but incorrectly inferred a halfword
return; caller evidence establishes s32.

## Controlled experiments

Offsets below are relative to the function. Instruction size excludes padding.

| Change | First divergence | Size delta |
| --- | --- | --- |
| Enable original parked draft, cached count | +0x08: normalized index in r3 instead of r2; missing count copy | -2 bytes |
| Remove count local; use addresses->unk0->lineCount in loop test | +0x08: index/scratch r2 and r3 swapped | 0 |
| Separate startIndex argument and index local, assign index before pointer | +0x08: same swap | 0 |
| Initialize pointer from startIndex instead of index | +0x08: same swap | 0 |
| Move index = startIndex after pointer initialization | None | 0 |
| Format and compare without explicit end padding | Instructions match; ROM SHA1 differs | 0 |
| Restore file-scope zero alignment | None; full ROM SHA1 matches | 0 |

The allocation dump for the direct-bound version showed the initial scaled
offset locally allocated to r2, excluding the live running index from r2.
Keeping the starting index alive through pointer initialization and only then
assigning the running index recovers the original allocation. The separate
running index is byte-required: folding it into the parameter is the tested
second row. The cursor is reused for the field read and increment; there are
no single-use cached aliases to retain. Removing the count cache also restores
the target copy of the bound after the first comparison.

Final source:

```c
s32 GetLineIndexOfType(LevelGeometryAddresses* addresses, unk8 type, unk16 startIndex)
{
    unk16 index;
    GeometryLine* line;

    line = addresses->unkC + startIndex;
    index = startIndex;
    for (; index < addresses->unk0->lineCount; line++, index++) {
        if (line->unkF == type) {
            return index;
        }
    }
    return -1;
}
```

The function ends the translation unit, so file-scope `asm(".align 2, 0\n");`
preserves the original dump zero padding rather than Thumb NOP padding.
`cmake --build build --target compare` passes with SHA1
`cd527c8c24e20e33913fc45199e64b3e6138a6e5`.
