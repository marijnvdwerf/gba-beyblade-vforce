# Level geometry loader matching notes

## Completed functions

The following caller-backed functions matched while retaining their original
translation-unit positions:

- `StoreMetadataAddr` (`0x0805BA54`): storing through the typed
  `LevelGeometryAddresses.unk114` field produces the expected word store.
- `GetLineMetaData` (`0x0805BA60`): a typed `LineMetadata **` table and a
  null check reproduce the expected indexed load.
- `getLevelGeometryAddresses` (`0x0805B8C4`): the geometry header contains
  counts followed by relative offsets.  Converting those offsets from the
  header base and clamping the spline count to `0x40` matches the loader;
  the spline-pointer table is populated by `GetSplineAtIndex`.
- `getLevelMetadata` (`0x08053990`): the `LevelDescription.metadata` field at
  offset `0x2C` is a `LineMetadata **`, and returning the field from
  `getLevelDescription` matches the caller-pinned ABI.
- `loadLevelGeometry` (`0x08053978`): `LevelDesign` records have a fixed
  stride of `0x84` bytes and the geometry pointer is at offset `0x80`.

## Layouts that mattered

`LevelGeometryAddresses` remains exactly `0x11C` bytes.  Its geometry pointers
are typed as `GeometryPoint *`, `GeometrySpline *`, and `GeometryLine *`, and
its metadata slot is `LineMetadata **`.  `LevelGeometryTable` models the
header's relative offsets without changing the binary data.  `LevelDesign`
is represented as `0x80` bytes of padding followed by its geometry pointer.
Metadata records use a two-byte size and type followed by a two-byte id; the
object payload is variable-sized and is advanced by its stored size.

These typed layouts avoid raw offset dereferences while preserving all
accessed widths and fixed extents.

## Unmatched function

`getLineMetaObjectBytype` (`0x0805BB2C`) was not converted.  The natural typed
search draft was parked above its assembly inclusion, but agbcc consistently
emitted the null path before the search body (`beq null`), whereas the target
has the body as the fall-through path (`bne body; b null`).  Tested loop,
condition, temporary, and pointer-layout variants preserved the same CFG
ordering difference.  The parked draft is disabled with `#if 0`, so it does
not affect the ROM.

## General agbcc observations

- Modeling repeated fixed-stride records as arrays of typed structs gives the
  compiler the same scaled address calculation as the original code.
- A typed pointer field can replace an offset cast without changing code when
  the field width and structure extent are correct.
- Entry halfword normalization in these loaders comes from the caller-facing
  `u16` parameter and should not be reproduced with hand-written shifts.
- For branch-layout-only mismatches, equivalent C control flow is not enough;
  the old compiler's basic-block ordering must also be recovered.
