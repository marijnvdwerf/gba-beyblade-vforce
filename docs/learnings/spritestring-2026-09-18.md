# spritestring 2026-09-18

## sub_8065508

- The matched source keeps `SpriteString.x` as `unk32` and stages it in an `s32 value`; this emits the target signed comparison and negation without changing the shared layout.
- The clear loop requires a typed `Actor*` cursor assigned from `&string->actors[i]`; direct member indexing emitted a two-operand base add instead of the target three-operand `add r0, r2, r0`.
- A wide `unk32 index` assigned from `string->count` and used as `&string->actors[index - 3]` is required for the `ActorSetFrame` address calculation; using `string->count - 3` directly introduced a different allocation and normalization shape.
- The post-call `unk70` store matches with the natural `string->actors[string->count - 3].unk70 = -1` spelling; the older pointer-minus-3 spelling was not required. Reusing one `actor` alias for both `ActorSetFrame` and the post-call store kept the pointer live across the call and diverged.
- `byte_807D980[':']` is byte-identical to `byte_807D980[0x3A]`.
- The `sub_80655C0` declaration uses wide `unk32` parameters for the second and third data arguments; narrow declarations inserted caller-side halfword normalization absent from the target.
- Reusing `value` for the quotient after the first `Div` preserves the target quotient lifetime in `r7`; a separate quotient local changed allocation.
