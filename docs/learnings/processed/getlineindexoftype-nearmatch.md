# GetLineIndexOfType (geometry.c) — near-match, manager attempt 2026-08-28

Target: asm/dump/8057b80-debug/805e83c-GetLineIndexOfType.s (15 insns).

Draft (body instruction-identical; only register roles differ):

```c
s32 GetLineIndexOfType(LevelGeometryAddresses* geometry, u8 type, u16 index)
{
    GeometryLine* line;
    s32 count;

    line = &geometry->unkC[index];
    count = geometry->unk0->lineCount;
    for (; index < count; line++, index++) {
        if (line->unkF == type) {
            return index;
        }
    }
    return -1;
}
```

Header: `s32 GetLineIndexOfType(LevelGeometryAddresses*, u8, u16);` and
GeometryLine `pad9[0xD]` → `pad9[6]; unk8 unkF; pad10[6]` (ldrb [r1,#0xF]).

Proven: u8 type (lsl/lsr #24), u16 index used as the loop variable
(lsl/lsr #16 after the increment), line pointer computed before the count
compare, `unk0->lineCount` (s32, signed bge/blt), `line++` before `index++`
in the increment (order of `add r1,#0x20` vs the add/narrow), return -1.

Residual: target keeps `index` in r2 (`lsr r2, r2, #16`) and copies `count`
into r3 (`add r3, r0, #0`) AFTER the entry compare `cmp r2, r0`; draft
narrows index into r3 and loads count straight into r2 with no copy. Tried:
`for` vs explicit entry test + `do/while` (identical output). Untried:
`unk32` parameters assigned to narrow locals; a `while` with the count
expression in the entry test and a local only in the loop; `count` typed
`s32` vs `int`.
