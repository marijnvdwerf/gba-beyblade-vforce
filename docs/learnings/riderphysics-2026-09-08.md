# Rider physics matching notes

## s_rider_804C4B4 (0x804C4B4)

The function is parked after allocation-only near-miss work. The target has no
stack frame (`frame 0`) and the following persistent register roles:

- `r4`: incoming `actor`, then reused for `rider + 0x108`
- `r6`: hoisted zero value
- `r10`: `-0x1A`
- `r9`: `&rider->unkF4`
- `r8`: `&rider->unkF8`
- `ip`: `&rider->unkFC`

The target materializes the three F4/F8/FC addresses, then the five contiguous
addresses for 0x108 through 0x118, and stores the contiguous fields in
0x118, 0x114, 0x110, 0x10C, 0x108 order. It then stores 0xFC, 0xF8, and
0xF4.

### Allocation step table

| Change | Measured result | First divergent shape |
| --- | --- | --- |
| Straight-line zero stores | Did not preserve the target high-register roles or descending contiguous-store chain. | Prologue/register allocation |
| Eight-field right-associative chain with direct literals | Reproduced the target high-register save mask, `r10`, `r9`, `r8`, address setup order, and descending stores. | `sub sp, #8`, followed by actor spill `str r1, [sp, #0]` |
| Eight-field chain with an explicit long-lived negative local | Preserved the `r10` role but did not remove the actor spill. | `sub sp, #8` / `str r1, [sp, #0]` |
| Actor pointer alias, declaration-order changes, and `actor = actor` | Did not coalesce the incoming actor parameter with the target's `r4` lifetime. | `sub sp, #8` / `str r1, [sp, #0]` |
| `ptr108` and `ptrFC` aliases around the chain | Put the 0x108 cursor in `r4`, but spilled the FC pointer and still spilled actor; it did not produce the target `ip` lifetime. | Stack spill of actor and FC pointer |

The target's hoisted zero in `r6` is real compiler output. Whether to express
that value with a `zero` temporary is a user decision when this function is
unparked; the parked draft keeps literals as the best tested form.

The `ptr108` and `ptrFC` names were scalar-field aliases used only during
experiments. They are not retained in the parked draft; the chain uses direct
`rider->unk108` and `rider->unkFC` expressions. No record alias passed to a
helper is involved in this function.
