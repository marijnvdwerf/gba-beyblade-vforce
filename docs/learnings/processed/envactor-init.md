# `initLevelEnvironmentActors` matching notes

## Status

`initLevelEnvironmentActors` at `0x08054768` is parked as a semantic C draft under
`#if 0`; the active build still uses
`asm/dump/804a388-tutorial/8054768-initLevelEnvironmentActors.s`. The draft is not
an exact match and must not be enabled without further work.

## Proven from the dump

- The function is Thumb code with the entry save sequence
  `push {r4, r5, r6, r7, lr}`, `mov r7, r10`, `mov r6, r9`, `mov r5, r8`,
  and `push {r5, r6, r7}`.
- The stack adjustment is `0x268` bytes. A draft that retained one additional
  long-lived value generated a `0x26c` frame; this is a useful diagnostic for
  register/lifetime experiments.
- The actor record stride is `0xC4`. The line-object stride is `0x4C`, proven by
  the allocation calculation (`lineCount * 0x4C`) and by the actor-loop
  multiplication before indexing the line-object allocation.
- The actor position stores in the initialization loop are at slot offsets
  `+0x4`, `+0x8`, and `+0xC`.
- The point table entries use an 8-byte stride: a halfword line index at entry
  offset `+0`, followed by a geometry-line pointer at `+4`.
- The point-initialization loop uses a guarded pre-test followed by a
  bottom-tested `do/while` shape. Its target entry is:
  `index = 0; load geometry pointer; load line count; compare; branch to exit;
  materialize the geometry pointer; body; increment; compare; branch back`.
- The target point loop keeps the geometry-address pointer in `r6` and the
  computed `GeometryLine*` in `r4`.
- The target actor loop uses stack slots at approximately `sp+0x25c`,
  `sp+0x260`, and `sp+0x264` for its geometry-pointer/sprite-id/actor-state
  values. The draft instead retained an extra selected-lines base or other
  long-lived value and used a slot through `sp+0x268`.
- The allocation clear is an indirect call through `__fastMemoryClearARM` and
  clears the line-object, effect, and point regions after allocation.

## Layout facts kept canonical

Only layouts used by currently matching C remain in `src/common.h` and `src/ram.h`.
`EnvironmentObject` is the canonical 0x4C-byte type with its sprite field at
`+4` and `pad8[0x44]`; this is also the stride used by the matching code. The
`EnvironmentActorSlot` and `EnvironmentNode` definitions in the canonical
headers retain only the fields required by matching functions. The speculative
actor configuration/state/meta types, the position union, and the fully typed
allocation draft are not canonical declarations.

The `GameData` callback region remains in the main-branch form. The decompilation
attempt did not establish a complete callback structure that is needed by a
currently matching function, so no speculative callback layout was added to the
canonical headers.

## Draft signature and call-site facts

The only C caller supplies a level as `u16`, so the draft signature is:

```c
void initLevelEnvironmentActors(u16 level);
```

The draft modeled the allocation sequence, metadata scan, point table setup,
actor setup, sprite/effect metadata lookup, and cleanup overlay semantically.
The actor position/sprite overlap was deliberately not promoted to a canonical
union: the exact cross-function proof requires matching pointer and coordinate
stores/loads at the same `+4` storage location, and the parked draft is not a
match.

## Experiments and findings

1. Replaced the dump with a typed C draft and used `m2c` only as a semantic
   starting point.
2. Recovered the caller-pinned `u16` signature.
3. Added typed geometry, actor, line-object, effect, and point accesses instead
   of raw offset arithmetic.
4. Corrected actor x/y/z offsets from `+8/+C/+10` to `+4/+8/+C`.
5. Tested the pointer/coordinate overlap at actor slot `+4`; it improved the
   draft but remains a hypothesis and is now confined to the parked draft.
6. Switched the clear call to the project `__fastMemoryClearARM` declaration,
   producing the correct indirect-call form.
7. Reordered the metadata scan and reused the metadata-result temporary to match
   the target call/branch sequence.
8. Tested actor-config cursor versus indexed selected-line storage. The target
   loads the actor config, prepares the selected-line index calculation, then
   performs the cursor store; several source orderings changed this sequence by
   two instructions.
9. Tested `for`, `while`, explicit guarded `if` plus `do/while`, and declaration
   scope changes for the point loop. The compiler repeatedly rotated the loop or
   assigned `r4`/`r6` opposite to the target.
10. A separate point-geometry alias produced the target point-loop register
    roles (`r6` geometry and `r4` line), but introduced an extra frame/local
    slot and disturbed earlier allocation/register layout.
11. Tested selected-line pointers, direct line-object indexing, nested locals,
    declaration-order changes, and volatile storage. None removed the actor-loop
    extra slot while preserving the target instruction order.
12. Restored the dump, verified the ROM, and parked the draft rather than
    committing speculative structures or an artificial matching shape.

## Remaining mismatch

The first unresolved area is the point-loop register/lifetime shape. After that,
the actor-loop selected-line address calculation and the lifetime of the
selected-lines base must be recovered. The observed `0x26c` versus `0x268` frame
is the strongest clue: one draft local is being kept alive where the original
source recomputed an address or reloaded a value. The final authority remains:

```sh
cmake --build build --target compare
```
