# Temporary-reduction pass three

All retained changes passed the full ROM compare. This pass focused on source shape and type cleanup in the geometry, game initialization, sprite text, collectable, and tutorial paths.

## Results

- Geometry setup: removed a redundant cast from the signed halfword loop bound. The typed geometry-table parameter also allowed the temporary alias to be removed; the offset-table address formation remains explicit because it is a packed runtime-offset blob.
- Metadata object lookup: replaced `&array[0]` with natural array decay. The cursor, count index, and null check remain because they reproduce the target loop and early-return shape.
- Metadata storage and lookup: unchanged. The storage assignment is already minimal, and the metadata pointer must be loaded once before the null check and indexed return.
- Geometry and metadata accessors: unchanged. Direct table indexing and the metadata-field return are already the natural forms.
- Font initialization: changed the two fixed-point coordinate parameters to signed halfwords and expressed the conversion as a shift by eight. The generated normalization remains identical. The first probe using a wide parameter with only `arg << 8` failed the compare because it removed the required sign normalization.
- Number rendering: unchanged. The flag, grouping counter, digit budget, and backwards buffer cursor each correspond to live values in the target loop; folding them changes register pressure or control flow.
- Number wrapper: typed its sprite-text pointer as `SpriteTextCleanup*`; callers and instructions stayed identical. The unused compatibility typedef was removed and its two remaining uses were folded into the canonical type.
- Shared geometry declarations: moved repeated loader and metadata prototypes into one small header and removed stale local declarations. One stale declaration initially conflicted with the typed header; removing it restored the intended single declaration without changing codegen.
- Collectable initialization: retained the required `GameData*` alias, data/state aliases, and moving entry cursor. Replaced opaque pointer locals with the proven geometry and metadata types, and used the data alias for the entry array; the compare stayed exact.
- Tutorial initialization: retained the required `GameData*` alias, entry cursor, and deliberately ignored helper result. Replaced opaque geometry, metadata, and line-metadata locals with their typed forms and used a typed null check; the compare stayed exact.

## Generic patterns

- A redundant cast around an already-narrow local can be removed without changing agbcc output, while changing the local's width or signedness can alter normalization instructions.
- A typed formal parameter can eliminate a one-purpose alias when all accesses already use that type; this is safer than folding a pointer that must remain live across calls.
- Array decay is a readable replacement for an explicit zero index when the target already materializes the same element address.
- Keep a pointer local when the target loads it once and uses it after a null check; repeated direct field expressions may reload or reshape liveness.
- Use proven pointee types for locals and prototypes even when the ABI representation is unchanged. This can remove casts and opaque-pointer noise without affecting bytes.
- Packed records with runtime offsets should retain byte-based address formation; fixed-size record tables should instead be represented by typed arrays and indexed naturally.
- A compatibility typedef with no remaining external users can be folded into the canonical struct name, provided all declarations and call sites are updated together.
- Shared API declarations belong in a focused header when several translation units duplicate them; remove every local redeclaration so the header remains authoritative.
