# Event listener matching

## Functions

`deallocEventListeners` at `0x0805420C` matches naturally with direct typed
accesses to `GameData` fields at `0xCA0`, `0xCA4`, and `0xCA8`. The deallocator
conditionally frees the block, then clears all three fields.

`initEventListeners` at `0x080540EC` is implemented in `src/event.c` with the
caller-proven `u16` level ID, a shared `LevelGeometryAddresses` layout, and a
GNU VLA `s32 listenerIds[maxListeners]`. The VLA is important: it produces the
original split stack frame (`0x11c` fixed bytes followed by `0x80` dynamic
bytes), while a plain fixed local array allocates one `0x19c` frame. A moving
`s32 *` cursor is required for agbcc to emit the target `stmia` listener store;
indexed array syntax emits address arithmetic and `str` instead.

The geometry table pointer is at `LevelGeometryAddresses.unk0`; the listener
loop bound is the signed `s32` at offset `0x8` of that table. Treating the
pointer as `unk8` produces the wrong load (`[geometry + 8]`) and changes the
loop shape.

## Register-allocation findings

The VLA version matches the fixed/dynamic stack layout, helper-call ordering,
geometry loads, listener cursor, signed limit comparison, allocation, copy,
and final stores. The current agbcc output still allocates the zero/count value
to `r6` and the `0x20` maximum to `sl`, while the reference allocates them to
`sl` and `r6`, respectively. Declaration order, nested scopes, assignment
order, a guarded `do/while`, and separate cursor/base pointer variants were
tried; they changed liveness or loop shape but did not produce the swap.

A `const s32 maxListeners = 0x20` bound constant-propagates away the live
maximum register, and using literal `0x20` in the comparison produces immediate
comparisons rather than the reference's register comparison. Neither is a
match. The natural VLA remains preferable to retaining `__builtin_alloca`.

The final `.greg` report for the best natural draft gives pseudo register 31
(the listener count) `refs = 14`, `live_length = 184`, and pseudo register 32
(the maximum) `refs = 5`, `live_length = 114`. Thus the maximum is behind the
count by 9 references and has a shorter live range; this explains why the
current allocator gives count `r6` and maximum `sl`, opposite the reference.
Additional probes tried an unsigned count or maximum, explicit versus postfix
increment, reversed maximum comparison, combined declarations, VLA bound
forms (`maxListeners`, `maxListeners * 1`, and an assignment in the bound),
inner scopes, swapped local roles, direct byte-count shifts, and extra
 declaration permutations. None flipped the allocation without changing
instructions beyond the target. The explicit `listenerCount = listenerCount + 1`
form did reproduce the target's separate `mov r2, #1; add sl, r2` shape, but not
its register assignment.

## General lessons

- A VLA whose bound is a local integer can be the source of a deliberate
  second stack adjustment in agbcc output.
- A moving pointer (`*cursor++ = value`) is the natural source form for Thumb
  `stmia`; an indexed store is not equivalent for matching.
- Struct field placement matters even when only one field is used: the geometry
  table pointer at offset zero determines both the load sequence and register
  liveness.
- Signed loop bounds are evidenced by `ble`/`blt`; keep the table count and
  listener count signed where those branches require it.
