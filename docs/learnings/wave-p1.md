# Wave P1

## LoadSpriteSheet (0x8060B68)

Status: parked. The function remains in `INCLUDE_ASM` form in `src/sprite.c`.

The best semantic draft was retained immediately above the include in a disabled
`#if 0` block. It uses a typed local `SpriteSheet` layout for offsets 0x6,
0x7, 0xC, 0x10, and 0x1C, and models the source flag at offset 0x7 as signed
because the target performs `lsl #24` followed by `asr #24` before consuming it.
The target writes a halfword at `SpriteEntry+0x18`; the packed two-byte pun was
experimented with but was reverted because the function was not matched.

### Near-miss steps

| Change | Result / first divergence |
| --- | --- |
| Semantic typed draft with cached source fields and normalized arg6/arg7 locals | Built; first divergence was the prologue register-save shape. |
| Packed `SpriteEntry+0x18` union and byte-user rewrites | Preserved layout but did not change the register-allocation mismatch. |
| `arg5` changed from `unk32` to `s32` | No improvement; signedness was not proven for this parameter. |
| Separate accumulator local for `SpriteEntry+0x10` and `oam_attr_2` | Produced a shorter, less similar operation sequence. |
| Direct compound assignments to destination fields | Best body shape; matched the target's flag-building instruction sequence after the register mismatch, but remained eight bytes shorter. |
| Formal `arg6`/`arg7` narrowed to `unk8`/`unk16` | No improvement over explicit normalized locals; reverted to `unk32` formals. |
| Direct `(SpriteSheet*)sourceArg` accesses instead of a cached source pointer | No improvement in prologue or register allocation. |
| Declaration initializers and local declaration reordering | No improvement. |
| Shared zero local for the final zero stores | Added an unwanted early zero initialization; reverted. |
| Direct use of stack parameters instead of cached `arg4`/`arg5` locals | No improvement; compiler still reloaded the stack values at their uses. |

### First persistent divergence

The target saves `r8`, `r9`, and `r10` and begins with:

```
mov r7, r10
mov r6, r9
mov r5, r8
push {r5, r6, r7}
```

The best natural draft saves only `r8` and `r9`:

```
mov r7, r9
mov r6, r8
push {r6, r7}
```

Consequently, the target retains stack arguments 4 and 5 in callee-saved
registers (`r6` and `r9`) while the draft reloads them from the stack at the
flag and OAM attribute expressions. The target also retains normalized arg7 in
`r10` and the signed source flag in `r8`; the draft assigns those values to
other registers. No source-level lifetime or type adjustment tested here
produced the target's three-register live range without artificial register
pinning, inline assembly, volatile qualifiers, or other prohibited levers.

The target additionally contains a zero halfword before the literal pool and a
`0xFFFF` word at the pool location. The parked asm baseline is byte-identical.
