# Fresh small-function matching notes

## Repeatable agbcc patterns

- Preserve a halfword argument with an explicit `unk16` temporary or parameter when the target begins with `lsl #16` followed by `lsr #16`. This also keeps later comparisons and loop counters at halfword width.
- For decrementing counts, separate the load and decrement statements when the target loads the field first and subtracts afterward. Combining them can move the subtraction into a different register.
- A scoped pointer alias can shorten a live range around a call or a hardware operation. Use this only when it expresses a real source-level lifetime; do not use `volatile`, `register`, or inline assembly as register-allocation controls.
- For linked-list code, retain the original head separately from the cursor that advances through the list. The target often returns the original head while storing the advanced cursor as the tail.
- Use the project’s typed structs for all fixed offsets. Add fields only when the matched function accesses them, and preserve padding for unobserved bytes.

## Miss notes

- `GetLineIndexOfType` remained a natural-source near-match. Its index and scaled-offset values consistently allocated to the opposite registers from the target; no artificial source shape was retained, and its speculative byte field was removed.
- `sub_80659F0` had a semantically correct battery-backup read draft, but the compiler retained an extra callee-saved register and produced different pointer lifetimes/register roles. The draft was restored to `INCLUDE_ASM`.
- `sub_8060C1C` was reduced to a close linked-list allocator draft, but its relinking branch layout and a few register roles remained different. The source was restored to `INCLUDE_ASM`.

## Near-miss step tables and parked drafts

### `GetLineIndexOfType`

| Change | First divergent instruction / size delta |
| --- | --- |
| Width-only `unk16` arguments and explicit byte/halfword normalization | `0x0A`: target keeps the scaled pointer in `r3` while the draft keeps the index there; size unchanged |
| Add the accessed byte as a temporary `GeometryLine` field | Same `0x0A` register-role divergence; speculative field removed |
| Cache the line-count field versus reload it in the loop condition | Same `0x0A` divergence; no retained source change |
| `for`, `while`, and explicit entry-test plus `do/while` loops | Same `0x0A` divergence; size unchanged |

Parked semantic draft:

```c
unk32 GetLineIndexOfType(LevelGeometryAddresses* addresses, unk16 type, unk16 index)
{
    unk32 count;
    unk32 current;
    GeometryLine* line;

    type = (unk8)type;
    index = (unk16)index;
    line = addresses->unkC + index;
    count = addresses->unk0->lineCount;
    if (index >= count) {
        return -1;
    }
    current = count;
    while (index < current) {
        if (*((unk8*)line + 0xF) == type) {
            return index;
        }
        line++;
        index++;
    }
    return -1;
}
```

### `sub_80659F0`

| Change | First divergent instruction / size delta |
| --- | --- |
| Semantic battery-backup draft using `void*` output and stack temporary | Prologue: one extra callee-saved register; draft frame/code layout differs |
| Change output to `unk16*` and adjust callers | Callers became type-incompatible; reverted to the proven `void*` prototype |
| Separate temporary pointer, countdown, DMA calls, and reconstruction temporaries | Prologue remained divergent; no natural spelling removed the extra saved register |
| Scope the backup configuration pointer around the sector check | Pointer lifetime changed, but prologue remained divergent |

Parked semantic draft:

```c
unk32 sub_80659F0(u16 sector, void* buffer)
{
    unk16* temp;
    unk16* tempPtr;
    unk32 i;
    unk32 value;
    BatteryBackupConfig* config;

    config = _unk3005E9C;
    if (sector >= config->unk4) {
        return 0x80FF;
    }
    temp = (unk16*)buffer;
    tempPtr = temp + config->unk8 + 2;
    i = 0;
    while (i < config->unk8) {
        *tempPtr = sector;
        tempPtr--;
        sector >>= 1;
        i++;
    }
    *tempPtr = 1;
    tempPtr--;
    *tempPtr = 1;
    DMA3Copy(buffer, (void*)0x0D000000, config->unk8 + 3);
    DMA3Copy((void*)0x0D000000, buffer, 0x44);
    for (i = 0; i < 0x40; i++) {
        ((unk16*)buffer)[i] = ((unk16*)buffer)[i];
    }
    value = 0;
    for (i = 0; i < 4; i++) {
        value |= (((unk16*)buffer)[i + 4] & 1) << i;
    }
    ((unk16*)buffer)[0] = value;
    return 0;
}
```

### `sub_8060C1C`

| Change | First divergent instruction / size delta |
| --- | --- |
| Separate first pointer, moving cursor, tail, insertion point, and successor | Relinking branch first diverged around `0x5E`; size remained close |
| Replace direct head accesses with a local head pointer | Prologue/register roles changed but did not match |
| Reverse list/free-list alias declaration order | Literal load order changed; target still required a different saved-register allocation |
| Add an explicit successor temporary in the merge loop | Merge loads moved closer to target, but the branch/register allocation remained different |
| Remove the null guard before traversing the head list | Control-flow layout moved closer, but the first loop still differed in register roles |

Parked semantic draft:

```c
SpriteEntry* sub_8060C1C(SpriteTextBlock* block, u16 size, u16 var22)
{
    unk32 spritesFree;
    SpriteEntry* first;
    SpriteEntry* last;
    SpriteEntry* previous;
    SpriteEntry* insertion;
    SpriteEntry* next;
    u16 count;

    spritesFree = _spritesFree;
    if (spritesFree < size) {
        printf(Str_8755AC8, size);
        return NULL;
    }
    _spritesFree = spritesFree - size;
    first = _spritesLeft;
    previous = first;
    insertion = sub_80609C4(_unk3005DE4, var22);
    block->count = size;
    block->prev = first;
    first->var22 = var22;
    count = size - 1;
    while (count != 0) {
        first = first->next;
        first->var22 = var22;
        first->prev = previous;
        previous = first;
        count--;
    }
    last = first;
    block->next = last;
    _spritesLeft = last->next;
    if (insertion == NULL) {
        next = _unk3005DE4;
        if (next != NULL) {
            next->prev = last;
        }
        last->next = next;
        first->prev = insertion;
        _unk3005DE4 = first;
    } else {
        next = insertion->next;
        if (next != NULL) {
            next->prev = last;
        }
        last->next = next;
        first->prev = insertion;
        insertion->next = first;
    }
    sub_80604D4(_unk3005DE4);
    return first;
}
```
