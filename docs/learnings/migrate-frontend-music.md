# Frontend and music migration notes

These notes record the unsuccessful natural-C migrations of two reachable
functions. Their assembly dumps remain authoritative and were left in place.

## `sub_805041C`

The best C draft was a structured, no-goto implementation. It matched the
initialization, per-entry arithmetic, sprite writes, linked-list traversal, and
loop tail closely, but did not match the target's threshold branch shape and
register allocation.

```c
void sub_805041C(UnkMotion* arg0)
{
    MotionEntry* motion;
    SpriteEntry* sprite;
    unk16 mode;
    unk16 bounce;
    unk32 mirror;
    unk32 direction;
    s32 i;
    s32 value;
    s32 position;
    s32 delta;
    s32 lower;
    s32 upper;

    motion = arg0->motions;
    sprite = arg0->sourceBlock->prev;
    mode = arg0->mode;
    i = 0;
    if (i < arg0->count) {
        mirror = 3;
        mirror &= mode;
        direction = 1;
        direction &= mode;
        bounce = mode & 4;
        do {
            motion->x += motion->unk8;
            motion->y += motion->unkC;
            motion->unk8 += motion->unk10;
            motion->unkC += motion->unk14;
            sprite->x = motion->x;
            sprite->y = motion->y;
            if (mirror != 0) {
                if (direction != 0) {
                    position = motion->x;
                    delta = motion->unk8;
                } else {
                    position = motion->y;
                    delta = motion->unkC;
                }
                value = arg0->unk10;
                lower = position - value;
                upper = position + delta - value;
                if (lower <= 0 ? (upper > 0 || (lower == 0 && upper < 0)) : upper < 0) {
                    if (bounce != 0)
                        delta = -(arg0->unk14 * delta) >> 8;
                    else
                        delta = 0;
                    if (direction != 0) {
                        motion->x = value;
                        motion->unk8 = delta;
                    } else {
                        motion->y = value;
                        motion->unkC = delta;
                    }
                }
            }
            sprite = sprite->next;
            motion++;
            i++;
        } while (i < arg0->count);
    }
}
```

The final close draft's exact residual around the reset was:

```asm
TARGET: 0x9c  mov r0, r1
        0x9e  mov r1, r12
        0xa0  cmp r1, #0
        0xa2  beq ...

DRAFT:  0xa2  mov r0, r12
        0xa4  cmp r0, #0
        0xa6  beq ...
```

Thus the target performs the `mov r0, r1 / mov r1, r12` reset-coordinate and
reset-direction sequence, while the draft retained the direction value in
`r12` and compared that register directly. The draft was two bytes larger than
the target. The residual was not accepted as an artificial source workaround.

Shapes tried and their effects:

- The direct m2c draft used goto labels to share the reset block. It exposed the
  target's nested threshold ladder and was semantically useful, but goto labels
  were rejected as final source.
- A `for` loop with `i++`, `motion++`, and `sprite = sprite->next` in the
  iteration expression preserved the required increments after threshold skips,
  but did not match the target branch layout.
- A `do-while` loop with increments at the bottom matched the loop tail more
  closely. The first `continue` version was incorrect because it skipped those
  increments; it was replaced by a form where all paths reached the tail.
- A source condition combining the crossing cases into one Boolean expression
  produced the right broad behavior but inverted/reordered the compiler's
  branch ladder and kept the wrong temporary registers.
- Nested structured `if` statements with duplicated reset bodies avoided gotos,
  but increased the function substantially and prevented the target's shared
  reset block from being emitted.
- A nested condition with one reset body, expressed using a one-iteration
  `do { ... break; } while (0)`, restored a shared reset block and brought the
  branch destinations closer. It was an artificial control-flow shape and
  still produced different register allocation and branch placement.
- Reordering local declarations, moving the `value` load before and after the
  coordinate/velocity selection, and removing/reintroducing a separate
  `position` temporary changed which registers held the coordinate and
  velocity. One arrangement matched the target's velocity in `r2`, but the
  value/lower pair and threshold branches still differed.
- Reusing the selected coordinate and velocity directly, rather than adding
  more casts or volatile temporaries, preserved the correct signed arithmetic.
  It did not solve the final register assignment. No inline assembly, register
  variables, volatile locals, or fake guards were used.

## `sub_804967C`

The target begins with:

```asm
push    {r4, r5, r6, r7, lr}
add     sp, sp, #0xfffffff4
```

The attempted C versions retained extra high-register state. Their prologues
included high-register moves and an additional high-register save, such as:

```asm
mov     r7, r9
mov     r6, r8
push    {r6, r7}
```

The first divergence was therefore at the prologue and continued into the
selected-object setup. The target keeps the address of
`_unk3000650.unkB4` in a lower saved register, then selects the subobject with:

```asm
add     r6, r5, #0
add     r6, r6, #0xb4
ldr     r0, [r6]
ldr     r7, [r0, #0x4]
```

The attempted source aliases and scoped locals did not make agbcc retain that
same lower-register arrangement without introducing other differences.

The resource and callback layout established from the dump is:

- The selected object table is indexed from `_8069FC8`; each record is `0x18`
  bytes. The selected object pointer is stored in `FrontendState.unkB4`.
- The selected object's screen subobject pointer is at object offset `+0x4`.
- The selected object's ordinary callback is at object offset `+0xC`.
- The state transition callback at `FrontendState.transition.unk58C` is a
  `void (*)(FrontendState *, unk32)`. The target calls it when non-null and
  otherwise calls the selected object's `+0xC` callback.
- The optional single text resource pointer is at screen-subobject `+0x10`.
- The repeated resource count is a 32-bit field at screen-subobject `+0x14`.
  The dump uses `ldr r1, [r7, #0x14]`, computes `count * 0x30`, and calls
  `slowAllocate`; it is not a halfword count.
- The repeated resource descriptor pointer is at screen-subobject `+0x18`.
- The descriptor stride is `0x2C`, shown by `add r4, r4, #0x2c`.
- The corresponding cleanup entries have a `0x30` stride, shown by
  `add r6, r6, #0x30`.
- Within a text resource, the font pointer is at `+0x8`, the language-string
  table follows it, the tile/configuration halfword is at `+0x20`, and the
  motion configuration pointer is at `+0x24`. The latter is loaded by the
  optional-resource path before creating a motion group.
- The font descriptor contains sprite-sheet and metadata pointers at `+0` and
  `+4`, a tile count at `+0x8`, and a byte-sized font parameter at `+0xA`.
- The motion configuration contains coordinate and motion values at `+0`,
  `+4`, `+0x8`, `+0xC`, `+0x10`, `+0x14`, `+0x18`, `+0x1C`, and `+0x20`, with
  halfword fields at `+0x24` and `+0x26`.
- The target masks the state flags at `FrontendState.unk80` with `0xF3`, calls
  `StoreFunction(NULL)`, clears the byte global at `0x03000BFD`, invokes the
  callback, initializes the repeated resources, optionally initializes the
  single text resource and its motion group, and finishes with
  `sub_8043370(&_unk3000A78)` and `sub_80490CC(0, 0)`.

The generic `FrontendSubobject` layout was deliberately not changed: packet
code uses its numeric fields at the same offsets. A separate screen-subobject
layout was needed because this function's `+0x10`, `+0x14`, and `+0x18` fields
have pointer/count/pointer meanings that do not apply to the generic packet
layout.

## Generic lessons

- In agbcc, shortening the lifetime of aliases and cursor temporaries can
  remove high-register saves, but adding an address alias can also increase
  register pressure and move the first divergence into the prologue.
- A target branch ladder with one shared body is not necessarily reproduced by
  an equivalent Boolean expression. Source nesting and the placement of the
  shared body materially affect old-GCC branch inversion and tail merging.
- A field's access width must be recovered before matching control flow: a
  32-bit `ldr` and a `0x2C`/`0x30` stride establish layout facts that cannot be
  repaired by changing loop syntax later.
- For a jump-table switch, agbcc sorts the jump-table entries by selector value,
  but emits the case bodies in source order. Reordering the cases therefore
  changed the body layout and the addresses stored in the otherwise sorted
  table; the resulting jump-table and block-layout differences failed the
  instruction and ROM comparisons. The target's body order must dictate the
  source case order.
- Equivalent bit tests do not necessarily lower alike: `(x >> 4) & 1`
  emitted an arithmetic shift followed by an `and` with one, while
  `(x & 0x10) != 0` emitted a direct mask and a different control-flow shape.
  The latter changed instruction offsets and failed comparison, so semantic
  equivalence is not sufficient for agbcc matching.
