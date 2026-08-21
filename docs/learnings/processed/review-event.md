# Review: event.c decompilation

## deallocEventListeners

**Verdict:** Clean and natural. No changes needed.

```c
void deallocEventListeners(void)
{
    if (_gameData->unkCA0 != NULL) {
        deallocateBlock(_gameData->unkCA0);
    }
    _gameData->unkCA0 = NULL;
    _gameData->unkCA4 = NULL;
    _gameData->unkCA8 = 0;
}
```

Fine as is.

## initEventListeners

**Verdict:** The logic is correct but has several compiler-shaped artifacts:
`__builtin_alloca(0x80)` instead of a local array, a redundant write pointer
tracked separately from the count, an inner block scope that splits
declarations unnaturally, `unk32 arg0` narrowed to `u16 levelId` via
assignment instead of just taking `u16`, and a `gameData` alias used
inconsistently (set up for the init, then `_gameData->` used for the store).

The 0x80-byte stack area is exactly `s32 listenerIds[0x20]` -- 32 entries of
4 bytes each, confirmed by `maxListeners = 0x20`. A 2002 programmer would
write a local array with a `#define`.

```c
#define MAX_EVENT_LISTENERS 0x20

void initEventListeners(u16 levelId)
{
    void* geometryData;
    void* metadata;
    LevelGeometryAddresses geometry;
    s32 listenerIds[MAX_EVENT_LISTENERS];
    s32 listenerCount;
    s32 i;

    geometryData = loadLevelGeometry(levelId);
    metadata = getLevelMetadata(levelId);

    _gameData->unkCA4 = NULL;
    _gameData->unkCA0 = NULL;
    _gameData->unkCA8 = 0;

    if (metadata != NULL && geometryData != NULL) {
        AllocatedBlock* block;
        u32 bytes;

        getLevelGeometryAddresses(&geometry, geometryData);
        StoreMetadataAddr(&geometry, metadata);

        listenerCount = 0;
        for (i = 0; i < geometry.unk8->unk8; i++) {
            void* lineMetadata = GetLineMetaData(&geometry, i);
            if (lineMetadata != NULL &&
                getLineMetaObjectBytype(&geometry, lineMetadata, 7) != NULL) {
                listenerIds[listenerCount] = i;
                listenerCount++;
                if (listenerCount > MAX_EVENT_LISTENERS) {
                    printf((const char*)Str_8729658, MAX_EVENT_LISTENERS);
                }
            }
        }

        if (listenerCount != 0) {
            bytes = listenerCount * sizeof(s32);
            block = slowAllocate(bytes);
            if (block == NULL) {
                printf((const char*)Str_87296A4, bytes);
            }
            __fastMemoryCopyARM(listenerIds, block->address, bytes);
            _gameData->unkCA0 = block;
            _gameData->unkCA4 = block->address;
            _gameData->unkCA8 = listenerCount;
            SetRiderGlobal(0);
        }
    }
}
```

**Important caveat for matching:** the natural version above is the *target
shape*, but agbcc may not produce identical code for a plain local array vs
`__builtin_alloca`. If the diff tool shows the array version mismatches on
stack frame setup, keep `__builtin_alloca(0x80)` but still flatten the rest
(remove the inner block, remove `listenerPtr`, use `listenerIds[listenerCount]`
indexing). The separate write pointer and count is the kind of thing that
results from compiler rewriting, not something a human would write.

Also: `listenerCount += 1` should be `listenerCount++`. Both produce the
same code on agbcc, but `++` is what a C programmer writes.

## Header / type suggestions

### GameData fields (ram.h)

The three new fields at 0xCA0-0xCA8 form a coherent group -- an allocated
array of event listener line indices. Consider renaming once more context
from `handleEventListeners` is decompiled:

| current       | suggested              | type              |
|---------------|------------------------|-------------------|
| `unkCA0`      | `eventListenerBlock`   | `AllocatedBlock*` |
| `unkCA4`      | `eventListenerIds`     | `s32*` (not `void*`) |
| `unkCA8`      | `eventListenerCount`   | `u32`             |

The `void*` for `unkCA4` should be `s32*` -- it stores `block->address` which
points to an array of `s32` line indices. The `unk32` for `unkCA8` should be
`u32` -- it is a count, never negative.

### LevelGeometryAddresses (common.h)

The struct mixes descriptive names (`spline`, `metadata`, `lineCount`) with
`unk*` placeholders. The descriptive names look speculative -- they may not
match once more functions using this struct are decompiled. Recommend keeping
all fields as `unk*` for now to avoid false confidence, or committing fully
to descriptive names only when there is strong evidence (string references,
SDK patterns). The `lineCount` field in particular is suspicious: it is a
`u16` at the end of the struct, but the loop bound actually comes from
`geometry.unk8->unk8`, not from `geometry.lineCount`.

### LevelGeometryTable (common.h)

The `unk8` field (offset 8, `s32`) is used as the loop bound for iterating
lines. A more descriptive name like `count` or `lineCount` would help, but
only rename once confirmed by more callsites.

### Extern naming consistency

The extern function declarations in event.c use inconsistent casing:
`loadLevelGeometry` (camelCase), `StoreMetadataAddr` (PascalCase),
`GetLineMetaData` (PascalCase), `getLineMetaObjectBytype` (camelCase with
lowercase "type"). This likely reflects the original binary's symbol names,
so leave them as-is unless evidence says otherwise.

### Parameter type

`initEventListeners` should take `u16 levelId` directly, not `unk32 arg0`.
The first thing the function does is narrow to `u16`, and `loadLevelGeometry`
/ `getLevelMetadata` both take `u16`. Whether agbcc emits the same code for a
`u16` parameter vs a `u32` narrowed to `u16` on the first line needs to be
checked with the diff tool -- on ARM/Thumb the caller may pass a full 32-bit
register and the callee may or may not mask it, so the current `unk32` + cast
could be load-bearing for matching. Try `u16` first.
