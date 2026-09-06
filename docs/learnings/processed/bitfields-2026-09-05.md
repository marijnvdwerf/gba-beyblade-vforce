# Bitfield lowering — 2026-09-05

## Matched functions

The three previously unmatched RiderState functions now match with C bitfields:

- `sub_8050050` (`0x08050050`)
- `sub_8050184` (`0x08050184`)
- `sub_80501A8` (`0x080501A8`)

The same bitfield declarations also replaced shift/mask expressions in the
already matched `sub_805000C`, `sub_8050114`, `sub_80501F8`, and
`sub_805024C`. The full ROM compare passed after each final source change.

## Before and after: `sub_8050114`

Before, the matched checksum implementation treated the fields as whole scalar
values and explicitly extracted the low portions:

```c
s32 sub_8050114(RiderState* arg0)
{
    unk32 checksum;
    u32 flagsWord;
    u32 flagBits;

    checksum = (s16)(arg0->prefix.words.unk2 ^ arg0->prefix.words.unk4);
    flagsWord = arg0->prefix.words.unk6;
    checksum ^= (u32)(flagsWord << 22) >> 22;
    checksum ^= (u32)(arg0->unkD << 28) >> 28;
    checksum ^= arg0->unk8;
    flagBits = arg0->unkC;
    checksum ^= flagBits;
    checksum ^= arg0->unkA;
    checksum &= 0x3F;
    flagBits = arg0->prefix.bytes.unk7 >> 2;
    if (flagBits == checksum) {
        _gameData->unk161C &= 0xFFFE;
        return 1;
    }
    _gameData->unk161C |= 1;
    return 0;
}
```

After, the source names the fields directly:

```c
s32 sub_8050114(RiderState* arg0)
{
    unk32 checksum;
    u32 flagBits;

    checksum = (s16)(arg0->prefix.unk2 ^ arg0->prefix.unk4);
    checksum ^= arg0->prefix.unk6_0;
    checksum ^= arg0->unkD_0;
    checksum ^= arg0->unk8;
    flagBits = arg0->unkC;
    checksum ^= flagBits;
    checksum ^= arg0->unkA;
    checksum &= 0x3F;
    flagBits = arg0->prefix.unk6_10;
    if (flagBits == checksum) {
        _gameData->unk161C &= 0xFFFE;
        return 1;
    }
    _gameData->unk161C |= 1;
    return 0;
}
```

The declarations used for the final layout are:

```c
typedef struct RiderStatePrefix {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    unk16 unk6_0 : 10;
    unk16 unk6_10 : 6;
} RiderStatePrefix;

typedef struct RiderState {
    RiderStatePrefix prefix;
    u16 unk8;
    u16 unkA;
    u8 unkC;
    u8 unkD_0 : 4;
    u8 unkD_4 : 4;
    unk8 padE[0x46];
    unk32 unk54;
} RiderState;
```

## Verified layout cleanup

Removing `__attribute__((packed))` from the nested `RiderStateUnkD` wrapper was
not byte-neutral. Its two `u8` bitfields caused the wrapper to occupy four
bytes in this layout, moving the following fields from offset `0x0E` to
`0x11` and changing the ROM. Replacing the wrapper with the two `u8` bitfields
directly in `RiderState` restored the byte at offset `0x0D`; the compare passed.

Collapsing the three overlapping `RiderStatePrefix` views into one struct with
three `s16` members and two `unk16` bitfields was byte-neutral. The compare
passed, and all accesses in `riderstate.c` use the single layout.

Changing the checksum field's base type from `unk16` to `u8` was also tested in
the actual build and passed the ROM compare. Its generated accesses and
following offsets were unchanged in this layout. The final declaration keeps
`unk16` because it is the default unknown-width base type and documents the
16-bit allocation unit established by the preceding 10-bit field. A scratch
build likewise produced identical read/write sequences for `u16` and `u8` on
this field in the same prefixed layout.

## Measured agbcc lowering

The following sequences were measured from the current `riderstate.c` object
and from isolated scratch structs compiled with the project agbcc command. The
four-bit fields below are byte-based fields at offset `0x0D`; the ten- and
six-bit fields are the two fields beginning at offset `0x06`.

### Reads

| Source field | Measured sequence |
|---|---|
| `u8 field : 4` at bit 0 | `ldrb [base, #0x0D]`; `lsl #28`; `lsr #28` |
| `u8 field : 4` at bit 4 | `ldrb [base, #0x0D]`; `lsr #4` |
| `unk16 field : 10` at bit 0 | `ldrh [base, #6]`; `lsl #22`; `lsr #22` |
| `unk16 field : 6` at bit 10 | `ldrb [base, #7]`; `lsr #2` |

The extraction pairs are therefore the lowering of bitfield reads in these
layouts, rather than evidence that the source contained manually transcribed
shift choreography.

### Plain writes

A plain assignment performs a width-preserving read-modify-write. The input is
masked to the field width, the other bits from the allocation unit are
preserved, the values are combined, and the allocation unit is stored.

- A four-bit bit-0 byte field masks the input with `0xF`, preserves the high
  nibble with `~0xF`, then emits `strb`.
- A four-bit bit-4 byte field shifts the input left by four, preserves the low
  nibble with `0xF`, then emits `strb`.
- A ten-bit bit-0 halfword field masks the input with `0x3FF`, preserves
  `0xFC00`, then emits `strh`.
- A six-bit bit-10 field shifts the input left by two, preserves the low two
  bits with `0x3`, then emits `strb` at the next byte.

### Compound writes

`|=` and `&=` on a bitfield retain a separate read/extract/operation/merge
shape. In the measured four-bit bit-0 case, the compiler loads the byte,
extracts it with `lsl #28`/`lsr #28`, applies `orrs` or `bics` to the promoted
value, masks the result to `0xF`, preserves the high nibble, and stores the
merged byte. This differs from a plain assignment and from manually doing a
whole-byte operation.
