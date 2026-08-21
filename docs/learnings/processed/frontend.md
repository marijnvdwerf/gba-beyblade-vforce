#Frontend matching notes

## `sub_8049264`

    The state at `_unk3000650` is represented by `FrontendState`,
    while its fixed IWRAM storage remains the compact placeholder in `ram.c`; changing the storage
object's allocation would move the following pinned IWRAM symbols. The motion
prefix passed to `sub_8050384` is a distinct 0xC-byte `Unk8050384` prefix. The
helper initializes adjacent fields beyond that prefix through its existing
`UnkMotion` view, so the frontend layout keeps `unk464`, `unk470`, and the
following fields at their original offsets. `sub_8049264` matches exactly.

## `sub_8049458`

The loop and all calls match the dump. The remaining pure register-allocation
permutation is in the final byte block. The target computes the two addresses
in this order:

```
ldr r3, [literal + 0x584]
add r2, base, r3
ldr r1, [literal + 0x586]
add r0, base, r1
ldrb r1, [r0]
ldrb r3, [r2]
cmp r3, r1
mov r4, #0
strb r1, [r2]
mov r0, #1
bl sub_8049344
...
strb r4, [base + 0x585]
```

Natural variants using a cached `unk8`, reversed comparisons, flattened or
nested tail layouts, and local pointer temporaries all preserved semantics but
allocated the address/value pseudos differently. The current best C draft is
kept under `#if 0` above the assembly include for future retry. One notable
control-flow detail is the early `mov r4, #0` before the `sub_8049344(1)` call;
it is not a separately visible source
    - side initialization in the semantic draft but is required by the target's live ranges.
