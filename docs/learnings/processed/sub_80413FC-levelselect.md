# sub_80413FC (level select handler) — learnings

0xAA4-byte function. Got to 0xA98 (12 bytes / 6 instructions away) with
80% instruction match before parking. Natural C, no hacks, proper types.

## What worked

### `-fno-rerun-cse-after-loop` fixes state→r10 spill (but breaks counting loop)
With `-O2`, the CSE rerun pass causes `FrontendState*` parameter to get
`STACK_REG` preference, spilling it to stack instead of r10. Disabling the
pass fixes state allocation but changes the counting loop register from r0
to r1 for the ldrsb result. Plain `-O2` with the final source code actually
produces state→r10 naturally — the source changes (proper types, removed
casts, flattened scopes) changed the pseudo graph enough.

### `isMultiplayer()` returns `u16`
Proven by `lsl #16; lsr #16` masking in the prologue. Was `u8`.

### `while (*ptr++ != -1)` generates `ldrsb`
The `*ptr++` in a while condition generates `mov r0, #0; ldrsb r0, [r2, r0]`
(signed byte load with zero-register offset). The `s8 val = *ptr; ptr++;`
pattern generates `ldrb + lsl #24 + asr #24` instead. The post-increment
in the condition is key.

### agbcc CAN generate `ldrsb` for signed byte loads
Earlier assumption that agbcc never generates `ldrsb` was WRONG. It does
when:
- The signed value is used in a function call argument (not just returned)
- The dereference is in a loop condition (`while (*ptr++ != -1)`)
- The struct field access uses a register offset ≥ the `ldrb` immediate
  range (but offset 29 = 0x1D IS within ldrb range, and ldrsb is still used)

The compiler chooses `ldrsb` (4 bytes: mov+ldrsb) over `ldrb+lsl+asr`
(6 bytes) when the destination register differs from the base register.
When dest == base (e.g. `ldr r0, [r0]`), it uses `ldrb+shifts`.

### `Unk_874CC3C[(sinResult & 0x1FE) / 2]` generates optimal code
The `/ 2 * 2` (from s16 element scaling) cancels, producing just the
`& 0x1FE` byte mask. `(sinResult >> 1) & 0xFF` does NOT cancel (generates
`asr; and; lsl` = 3 extra instructions).

### Unrolled loops match, `for` loops don't
The `sub_804A0E0(0..5)` and `sub_8062318(rows[0..5], 1)` calls are 6
individual statements, not a loop. The compiler's loop generates
`stmia`/`ldmia` patterns that don't match the target's individual
`str r0, [r4, #offset]` pattern.

### `sprite = allocSprite(0); _global = sprite;` vs `_global = allocSprite(0);`
With the temp: compiler stores result in `sprite` register, then loads
global address inline for the store. Without temp: compiler pre-loads
global address into a callee-saved register before the call, stores
immediately after. The target uses inline loads (no pre-load).

### `_unk300005C->x += delta + sinVal - scroll` matches better than separate `pos` variable
The `+=` form keeps the position value in the sprite struct field and
only computes the adjustment. The `pos = sprite->x; sprite->x = pos + ...`
form creates a separate `pos` temporary that changes the expression tree.

## Real bugs found by reading the diff

### Wrong struct field offsets in LevelDescription
`ld->unk1C` (offset 0x1C) should be `ld->unk10` (offset 0x10). Target
accesses `ldrb r0, [r4, #16]` not `[r4, #28]`. Similarly,
`getLevelDescription2()->unk20` should be `->unk14` (target: `ldr r0, [r0, #20]`).

### Missing `sub_80490F8(9)` fallback call
In the offline level confirmation path (unk300005A == 1), when the level
playability check doesn't trigger the special `StoreLevelVar14` path,
the target calls `sub_80490F8(9)`. My code was missing this call entirely.
This was ~6 bytes of size difference.

### Wrong return types
- `sub_8043970` returns `u8` (proven by `lsl #24; cmp #0` masking), was `s32`
- `sub_80517E8` returns `u8` (same pattern), was `s32`
- `sub_805137C` returns `s32` (no masking on result), was `u8`

### Wrong `(s8)` cast on count comparison
`_3000038.unk1D < (s8)(_unk3000078 - 1)` — the `(s8)` cast on the count
generates extra sign-extension. Target compares without sign-extending
the count value: just `sub r0, #1; cmp`.

## Unsolved: counting loop ptr→r1 vs target r2

The counting loop at `.L80414D4` loads `_unk3000074` into r0, dereferences
into r2, then loads `_unk3000078` into r1. My compiler always dereferences
into r1 (the next available register after r0).

Tested and failed:
- All variable names (`ptr`, `p`, `_p`, `list`, 20+ others)
- All pointer types (`s8*`, `unk8*`, `void*`, `const s8*`)
- Declaration order, scope boundaries, block scoping
- `countPtr` caching, `ppList` indirection, struct-based access
- `-Os`, `-fno-strength-reduce`, `-fno-expensive-optimizations`, 15+ flag combos
- `for`, `while`, `do/while`, comma operator, index-based loops

The allocator assigns r1 to the indirect load result deterministically.
The target's r2 suggests the target compiler has different register
preference ordering for indirect loads, possibly influenced by the
pseudo graph across the entire function in ways that source-level
changes cannot replicate with old_agbcc.

## Struct changes made

### CurrentGameState
Split `pad544[0x160]` to expose:
- `unk5A4[0x40]`, `unk5E4[0x40]`, `unk624[0x40]`, `unk664[0x40]` — level ID lists (s8 arrays)
- `unk6A5`, `unk6A6`, `unk6A7[2]`, `unk6A9` — individual byte fields

### GameData  
Split `pad153C[0x98]` to expose:
- `unk15C0` (s16) — stored via `strh` from `(s8)playerData[5]`
- `unk15C2[2]` — padding
- `unk15C4[0x10]` — base multiplayer sync data

### LevelDescription
Split `padC[5]` and `pad12[6]` to expose:
- `unk10` (u8) — level playability flag, accessed with `ldrb [r4, #16]`
- `unk14` (s32) — level variable, passed to `StoreLevelVar14`

### LevelSelectState (_3000038)
32-byte struct at 0x3000038:
- `void* unk0` — resource pointer (freed in case 7)
- `SpriteTextCleanup* rows[6]` — offsets 0x04-0x18
- `s8 unk1D` — selected level index (proven signed by `ldsb`)
- `unk8 unk1E` — state flag

### FrontendTransition
`*(unk16*)&state->transition` reads both `s8 value` and `s8 unk585` as
a halfword. This is a proven width pun (`ldrh` at the struct start).
C90 doesn't support anonymous unions, so the cast stays.
