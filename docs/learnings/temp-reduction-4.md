# Temporary reduction pass 4

This pass tested whether apparently redundant locals could be removed from five already-matched functions without changing the agbcc output. The ROM compare remained the authority for every probe.

## `sub_8054FE0`

No locals were removed. The `zero` local preserves the shared zero value used for both sprite clears. `actorContainer` preserves the initial container load and address materialization. Separate `actorCount` and `nodeCount` locals preserve the two independent countdown loops and their register allocation. The `actor` and `node` cursors are distinct moving pointers, and `object` remains live across the actor sprite cleanup path.

Removing `actorContainer` and using `_gameData->unkC7C->slots` directly changed the initial load schedule and failed the ROM compare.

## `GetSplineAtIndex`

No locals were removed. `count` and `limit` intentionally hold separate copies of the spline count. Removing `limit` and using `index < count` changed the target's separate count-copy instruction and failed the ROM compare. The `spline` initial pointer and moving cursor also remain distinct.

## `getLineMetaobjectByTypeAndId`

No locals were removed. `count` and `limit` preserve the target's loop setup and saved-register allocation. Removing `limit` changed the prologue and normalized-key register placement. Removing `key` and comparing against `(unk16)id` directly also failed the ROM compare, so the narrowed key value is a real source temporary rather than a removable expression.

## `showString`

Removed `mode_value` successfully. Passing `mode` directly to `sub_8061168` produced identical instructions and ROM bytes.

The following locals remain necessary for the matched shape:

- `text_width`: moving `sub_8064F38(text)` into the resize call changed call scheduling, register allocation, branches, and literal-pool placement.
- `offset`: removing the signed offset temporary changed the target `add r0, r5, r0` shape.
- `count`: removing the cached block count changed load scheduling and register allocation.
- The remaining pointer, flag, cursor, width, and result locals preserve values live across calls or the target's loop/dataflow shape.

The duplicate child branches are retained because merging them changes the target instruction shape.

## `printf`

There are no locals to remove. The empty variadic definition is required to emit the ABI argument-save prologue and matching epilogue.

## Result

Only `mode_value` was removable. All other tested reductions either changed the generated instructions or failed the full ROM SHA1 comparison. No artificial register allocation, inline assembly, raw offset cast, or union was used.
