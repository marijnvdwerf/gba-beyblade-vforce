# Initialization functions

## `initCollectables`

`initCollectables` was matched in `src/collectable.c` using typed overlays for
`GameData`, collectable entries, and level geometry. The important register
allocation was preserved by keeping the cached `GameData` pointer, the
collectable-data pointer, and the level-state pointer live across the geometry
queries.

## `initTutorialManagement`

`initTutorialManagement` was matched in `src/tutorial.c`. `GameData` now exposes
the collectable and tutorial regions through shared typed layouts while keeping
the original offsets and total size. The tutorial region is followed by the
original amount of padding so later `GameData` fields remain at their fixed
addresses.

## `initMultiPlayer`

A semantic draft was developed but is currently disabled under `#if 0` in
`src/multiplayer.c`; the original assembly is restored directly below it.

The first divergent instruction in the draft was at function offset `0x0E`:

```text
target:  mov r8, r1
 draft:  adds r5, r1, #0
```

This is the compiler materialization of the second parameter for the first
packet-size calculation, represented by the C statement:

```c
temp_r0 = arg1 * arg0;
```

In the target, `r8` holds the second parameter (`arg1`, the packet-size value),
while `r5` holds the narrowed third parameter (`arg2`, the multiplayer mode /
serial-control value). In the draft, those two values were allocated in the
opposite registers: `r5` held `arg1` and `r8` held `arg2`. Subsequent arithmetic
and packet-pointer instructions consequently diverged as well.
