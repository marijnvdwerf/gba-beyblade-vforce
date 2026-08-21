# Review: frontend.c decompilation drafts

Agent worktree: `.claude/worktrees/agent-abfd0d6e5324a3e17`

## sub_8049264 -- frontend state init

**Verdict:** The agent's draft preserves the raw-decomp's `base + offset`
pointer-arithmetic pattern verbatim, adds inner scopes to introduce a second
offset variable, and declares a `FrontendState` struct it never actually uses.
The inner-scope trick likely causes the register divergence: agbcc sees two
live `u32` offset variables instead of one being reassigned. The struct belongs
in the header, but the function body should use it for field access.

**Type fix vs raw-decomp:** The agent corrected the raw-decomp's unk16 at
0x588 to unk32 and changed the 0x58E write to 0x58C. This is backed by
evidence from `StoreFunction` (unk32 at 0x588) and `sub_8049330` (unk32 at
0x58C), so the agent's field types are more likely correct. Verify against asm:
look for `str` (word) vs `strh` (halfword) at those offsets.

**Proposed natural C:**

```c
void sub_8049264(void)
{
    _gameData->unkC26 = (u16)-1;

    _unk3000650.unk4 = 0;
    _unk3000650.unkC = 0;
    sub_804924C(7);
    _unk3000650.unk0 = (u32)-1;
    _unk3000650.unk8 = (u32)-1;
    _unk3000650.unk7C = 0;
    sub_8050384(_unk3000650.unk458);
    _unk3000650.unk424 = 0;
    _unk3000650.unk470 = 0;
    _unk3000650.unk474 = 0;
    _unk3000650.unk481 = 0;
    _unk3000650.unk580 = 0;
    _unk3000650.unk57C = 0;
    _unk3000650.unk578 = 0;
    _unk3000650.unk80 = 0;
    _unk3000650.unk7F = 0;
    _unk3000650.unk584 = 0;
    _unk3000650.unk585 = 0;
    _unk3000650.unk586 = 0;
    _unk3000650.unk588 = 0;
    _unk3000650.unk58C = 0;
    _unk3000650.unk81 = 0;
    _unk3000650.unk5A8 = 0;
}
```

This won't match as-is -- agbcc almost certainly loads the struct base into a
register once and does offset stores. If direct field access doesn't match,
fall back to `base = (unk8 *)&_unk3000650` but with a single `u32 offset`
variable (no inner scopes, no second offset variable). The key register
allocation constraint is that the compiler sees one offset live at a time.

**If the `base` pattern is needed**, the version closest to matching is the
raw-decomp's flat sequence with one `offset` variable. The agent's inner
scopes with `offset2` split what should be one variable into two, forcing the
compiler to allocate a second register:

```c
void sub_8049264(void)
{
    unk8 *base;
    unk8 *ptr;
    unk8 *ptr2;
    u32 offset;

    _gameData->unkC26 = (u16)-1;
    base = (unk8 *)&_unk3000650;
    *(unk32 *)(base + 4) = 0;
    *(unk32 *)(base + 0xC) = 0;
    sub_804924C(7);
    *(unk32 *)base = (u32)-1;
    *(unk32 *)(base + 8) = (u32)-1;
    *(unk8 *)(base + 0x7C) = 0;
    sub_8050384(base + 0x458);
    offset = 0x424;
    *(unk32 *)(base + offset) = 0;
    *(unk32 *)(base + 0x470) = 0;
    *(unk16 *)(base + 0x474) = 0;
    offset += 0x5D;
    *(unk8 *)(base + offset) = 0;       /* 0x481 */
    ptr2 = base + 0x578;
    offset += 0xFB;
    ptr = base + offset;                 /* 0x57C */
    offset += 4;
    *(unk32 *)(base + offset) = 0;       /* 0x580 */
    *(unk32 *)ptr = 0;                   /* 0x57C */
    *(unk32 *)ptr2 = 0;                  /* 0x578 */
    *(unk8 *)(base + 0x80) = 0;
    *(unk8 *)(base + 0x7F) = 0;
    offset = 0x584;
    *(unk8 *)(base + offset) = 0;        /* 0x584 */
    offset += 1;
    *(unk8 *)(base + offset) = 0;        /* 0x585 */
    offset += 1;
    *(unk8 *)(base + offset) = 0;        /* 0x586 */
    offset += 2;
    *(unk32 *)(base + offset) = 0;       /* 0x588 -- CHECK: str or strh? */
    offset += 4;
    *(unk32 *)(base + offset) = 0;       /* 0x58C */
    *(unk8 *)(base + 0x81) = 0;
    *(unk32 *)(base + 0x5A8) = 0;
}
```

**Note on the 0x588 area:** The raw-decomp wrote `unk16` at 0x588 then
`unk32` at 0x58E. The agent wrote `unk32` at 0x588 then `unk32` at 0x58C.
Cross-referencing `StoreFunction` (stores unk32 at 0x588) and `sub_8049330`
(stores unk32 at 0x58C), the agent's field layout is correct. The raw-decomp's
`offset += 6` arithmetic was wrong -- it should be `offset += 4` to reach
0x58C. **Verify with the asm** whether offset 0x588 uses `str` (4 bytes) or
`strh` (2 bytes).

### Header/type suggestions

The `FrontendState` struct the agent added to `common.h` should replace
`Unk3000650` (or extend it -- `Unk3000650` currently only covers 0x54 bytes
but the real struct is 0x5AC+). The struct field types need adjustment:

- `unk588` should be typed as a function pointer (`void (*)(unk32, unk32)`)
  based on `sub_8049344`'s usage.
- `unk58C` likewise (see `sub_8049330`).
- `unkB4` is a `void *` to some vtable-like structure (offsets +0x10, +0x14
  are function pointers in `sub_8049344`).
- `unk0`, `unk4`, `unk8`, `unkC`, `unk10` should remain unk32 (first five
  words, confirmed by existing `Unk3000650` and accessor functions).

Declare `sub_8050384` in `unsorted.h` rather than as a local forward
declaration in `frontend.c`.

## sub_8049458

**Verdict:** Not attempted by the agent. Still `INCLUDE_ASM` in the worktree.
No draft to review. Called every frame from `mainLoop`'s inner `do...while`,
so it is likely the frontend tick/update function. Suggest decompiling after
sub_8049264 matches.
