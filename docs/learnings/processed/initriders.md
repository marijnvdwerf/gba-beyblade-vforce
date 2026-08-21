# `initRiders` matching notes

`initRiders` remains assembly-backed. Its semantic draft is kept under `#if 0` immediately above the `INCLUDE_ASM` in `src/gameinit.c`; the dump is intentionally retained.

## Frame-size evidence

The target allocates `0x134` bytes after the saved-register area:

```text
add sp, sp, #0xfffffecc
```

The natural C drafts consistently allocated `0x138` bytes:

```text
add sp, sp, #-0x138
```

The extra word was associated with the geometry/local lifetime cluster. In the target, the long-lived values are effectively the rider index in `r9`, the primary line index in `sl`, the current line address in `r8`, and the three coordinates in `r7`, `r6`, and `r4`. The initialized flag and the optional multiplayer-line address occupy stack slots.

## First divergence

In the best semantically corrected natural draft, the first instruction difference occurs immediately after initializing the `initialized` flag:

```text
target:  mov r9, r0
 draft:  mov r8, r0
```

The statement is the initialization of `riderIndex` to zero. The same allocation mismatch later causes the line index and coordinate pseudos to receive different registers, and the draft retains the `0x138` frame.

The corrected draft also preserves the value returned by `loadLevelGeometry` as the second argument to `getLevelGeometryAddresses`; passing `NULL` was semantically incorrect because the target carries the successful load return in `r1` into that call.

## Shapes tried

- Cached ordinary line and point pointers: produced an extra live geometry value and retained the `0x138` frame.
- Rematerialized ordinary line and point addresses from `geometry.unkC[lineIndex]` and `geometry.unk4[...]`: removed explicit cached pointers but still produced `0x138`; the compiler spilled a coordinate/line-offset value.
- Scoped `x`, `y`, `z`, and line-type locals inside the loop: changed stack-slot placement but did not reduce the frame or reproduce the target allocation.
- Reordered scalar declarations: changed individual assignments in some variants but did not reach the target register coloring.
- Kept the optional multiplayer line as an index while preserving the primary line index: corrected the metadata/iteration semantics but introduced a separate spill and still produced `0x138`.
- Kept the optional multiplayer line as a pointer with a scoped lookup index: reproduced the target's optional-line stack-slot behavior more closely, but the rider-index/coordinate coloring still differed.
- Passed the successful `loadLevelGeometry` result to `getLevelGeometryAddresses`: removed an incorrect `mov r1, #0` and matched the target call shape, but did not resolve register allocation.

## Next experiment

If resumed, compare the compiler's pseudo-lifetime graph for the target-like six-value set against the natural typed source, focusing on how the optional multiplayer-line conditional preserves the primary line index while keeping the current line address available after calls. Any further source reshaping should remain semantic rather than using register declarations or inline assembly.
