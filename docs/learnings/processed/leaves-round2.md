# Leaves round two

## Functions

- `sub_805E50C` matched exactly with three word stores through an `unk32 *` destination.
- `sub_805E514` matched exactly with four word stores in source order and the destination pointer returned.
- `sub_8061228` matched exactly after modeling the halfword at offset `0xA` as a typed struct field; the cleanup buffer remains at offset `0x14`.
- `sub_804B4A4` matched exactly with a shared fixed-layout rider structure, typed pointer fields, and the three cleanup branches.
- `newPolyTable` matched exactly with a typed polygon-table structure and narrow `unk16` parameters. The initial wide-parameter draft allocated the wrong registers; narrow formals reproduced the entry normalization, saved registers, and epilogue.

No artificial control flow or inline assembly was needed. All five functions had zero instruction differences and passed the ROM comparison.

## Generic agbcc patterns

- Narrow unsigned formals can produce the target's entry `lsl`/`lsr` normalization and preserve normalized values in callee-saved registers; explicit wide-parameter masking can instead introduce premature moves.
- Typed fixed-layout fields reproduce accesses cleanly when padding is represented explicitly; splitting an opaque byte array around a proven halfword preserves both offsets and store width.
- Repeated fixed offsets passed by address should be modeled as arrays inside a shared structure, while allocation handles should use pointer fields and their first member for the returned address.
- Changing a fixed-size byte-array placeholder to an equal-sized typed structure can preserve all downstream layout and caller code, but callers passing the field must use its address when it is no longer an array expression.
- A matching function can be validated independently with the object diff, but the full ROM comparison is still required after deleting its dump and formatting the translation unit.
