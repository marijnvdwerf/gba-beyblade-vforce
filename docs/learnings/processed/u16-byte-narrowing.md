# Halfword fields and byte accesses with agbcc

A controlled experiment with agbcc tested three spellings for reading the high byte of a `u16` field at offset `0x18`:

- `entry->field >> 8`
- `(entry->field & 0xFF00) >> 8`
- `entry->field / 256`

All three produced a halfword load (`ldrh`) followed by a shift or equivalent arithmetic. None narrowed the memory operation to `ldrb [entry, #0x19]`.

An 8+8 bitfield layout did produce the desired byte access for the high member: reading or writing the high member generated `ldrb`/`strb` at offset `0x19`. Updating both members generated two byte stores, not one halfword store. A two-byte embedded struct likewise produced `ldrb` for the high member, but whole-struct copies were widened to word `ldr`/`str` operations rather than the required `ldrh`/`strh` pair.

The union pun experiment used:

```c
union {
    u16 whole;
    struct {
        u8 lo;
        u8 hi;
    } b;
} unk18;
```

In an isolated two-byte test, `unk18.b.hi` generated `ldrb`/`strb` at `+0x19`, while `unk18.whole = value` generated `strh` at `+0x18`. In the full SpriteEntry test, however, the compiler's layout of the anonymous union view changed the offsets of later fields, so the loader needed a separate two-byte-aligned construction view to preserve its target offsets. With that separate loader view, the three existing byte-reader functions still matched exactly; LoadSpriteSheet's first divergence remained the stack-argument scheduling (`[sp,#36]` was loaded after `[sp,#40]`), and the function did not otherwise match.

The `strh` at `SpriteEntry + 0x18` in `LoadSpriteSheet` stores the eighth parameter. The parameter is normalized to 16 bits with the usual `lsl #16` / `lsr #16` sequence and then copied to the destination; it is not a halfword loaded from the sprite-sheet metadata.

The conclusion is that the original code read the high byte of a `u16` field through a byte access (a punning representation such as a cast or union), while the loader wrote the same storage as a halfword. agbcc never narrows halfword loads; a byte read at `+1` of a halfword-written field means the original punned it. The matching source therefore retains the existing byte-based `SpriteEntry` view and keeps `LoadSpriteSheet` parked. Unions are appropriate only for a pun proven by assembly on both sides, but this repository's matching source rules prohibit union layouts, so the tested union remains an experiment rather than shipped source.
