# Team coding style (evidenced by matched code only)

This document records the coding habits of the original ~2002 development team,
drawn exclusively from functions that compile to byte-identical ROM output (no
`INCLUDE_ASM`, no `#if 0`). Approximately 400 matched functions across ~40 TUs.

---

## 1. Loop idioms

### Counting-up `while` with post-increment (dominant pattern)

The team overwhelmingly uses `while` loops with a separate counter initialized
to zero, tested against a limit, and incremented at the bottom of the body.
`for` loops are rare in matched code and appear mainly in the palette/geometry
TUs.

```c
/* sub_8051028 — iconmenu.c */
item = menu->items;
i = 0;
while (i < menu->itemCount) {
    if (item->sprite != NULL) {
        sub_8060A94(item->sprite);
        item->sprite = NULL;
    }
    item++;
    i++;
}
```

```c
/* sub_80630F4 — actorheap.c */
for (i = 0; i < arg0->size; i++) {
    actor = sub_8063190(arg0, i);
    if (actor != NULL) {
        sub_80584B8(actor);
    }
}
```

```c
/* sub_80656B8 — spritestring.c */
count = string->count;
text = string->text;
actor = string->actors;
while (count != 0 && (character = *text++) != 0) {
    if (character != ' ') {
        ActorSetFrame(actor, 0, byte_807D980[character]);
        actor->unk70 = -1;
        actor++;
        count--;
    }
}
while (count-- != 0) {
    actor->unk70 = 0;
    actor++;
}
```

### Counting-down `while (n--)` (engine/low-level)

The engine-layer code (sprite, sound, actorheap) uses `while (n--)` for
link-walking and block-initialization loops. This pattern never appears in
gameplay or frontend code.

```c
/* SpriteVRamFree — sprite.c */
n = max_sprites - 1;
while (n--) {
    sprite->prev = prev;
    sprite->next = sprite + 1;
    sprite->var24 = -1;
    prev = sprite;
    sprite = sprite->next;
}
```

```c
/* sub_8060CDC — sprite.c */
n = block->count;
while (n--) {
    /* ... */
    cur = cur->next;
}
```

### `do { ... } while` for guaranteed-at-least-once

Used sparingly, only where the body must execute once: the credits text
display, the sound channel loop, and the geometry-spline search.

```c
/* GetSplineAtIndex — geometry.c */
if (index < count) {
    limit = count;
    do {
        if (index != arg1) {
            spline = (GeometrySpline*)((unk8*)spline + spline->size);
            index += 1;
        } else {
            return spline;
        }
    } while (index < limit);
}
```

```c
/* sub_80627F0 draft — sound.c, entry guard then do-while */
channelCount -= 1;
if (channelCount != -1) {
    do {
        Sound_80627A8(channel, mixLength, _unk3000DA0);
        channel++;
        channelCount -= 1;
    } while (channelCount != -1);
}
```

### Pointer-cursor vs index

The team uses pointer-cursor (`item++`) when walking linked lists or arrays
with a known stride. They use index (`i`) when the index itself is needed for
a call or lookup. Often both appear together:

```c
/* newMotionGroup — motion.c */
source = arg1->prev;
i = 0;
while (i < arg0->count) {
    target->unkC = 0;
    /* ... */
    source = source->next;
    target++;
    i++;
}
```

---

## 2. Clamps and bounds checks

### Inline if-clamp (never ternary for clamps)

```c
/* sub_8053920 — gameinit.c */
_gameData->unk1638++;
if (_gameData->unk1638 > 5)
    _gameData->unk1638 = 5;
```

```c
/* SpriteVRamFree — sprite.c */
if (max_sprites > 0x80) {
    max_sprites = 0x80;
}
```

```c
/* Sound_8062AD4 — sound.c */
if (arg1 > 256) {
    arg1 = 256;
}
```

### Symmetric if/clamp for palette channels

```c
/* sub_8063544 — palette.c */
if (red > 0x1F) {
    red = 0x1F;
}
if (green > 0x1F) {
    green = 0x1F;
}
if (blue > 0x1F) {
    blue = 0x1F;
}
```

---

## 3. Early-return vs nested-if

### Early-return for preconditions (consistent)

Almost every function with a NULL check or zero-count guard uses early return.
Deep nesting is reserved for switch cases.

```c
/* sub_80604D4 — sprite.c */
if (current == NULL) {
    return;
}
```

```c
/* GetLineMetaData — geometry.c */
metadata = arg0->unk114;
if (metadata == NULL) {
    return NULL;
}
return metadata[index];
```

```c
/* GetStruct4 — gameinit.c */
if (_gameData->unkC88 == NULL)
    return NULL;
return &_gameData->unkC88[arg0];
```

### Nested ifs within switch cases (never early-return from inside a case)

The team avoids `return` inside switch case bodies except when a case is the
entire function. They use `break` consistently. The one exception is
`GetSplineAtIndex` which returns from inside a do-while inside an if.

---

## 4. State machines / handler layout

### Switch on an action/selector argument

Frontend handlers take `(FrontendState* state, u32 arg1)` or
`(FrontendState* state, u32 arg1, u32 arg2)` and switch on `arg1`. Cases are
in a specific order that matches the asm jump table: **0, 7, 1, 2** (or
**0, 7, 8, 1, 2** when an 8-callback exists). Case 0 = init, 7 = teardown,
1 = per-frame update, 2 = input. This order is load-order, not numerical.

```c
/* sub_804541C — festate.c (representative) */
switch (arg1) {
case 0:
    /* allocate sprites, init menu */
    break;
case 7:
    /* free sprites, teardown menu */
    break;
case 1:
    /* per-frame interpolation, input poll */
    break;
case 2:
    /* button press -> state transition */
    break;
}
```

### Dummy/empty cases

Some matched handlers include `case 3: case 4: case 5: case 6: break;` to
fill the jump table and reproduce the target's compare-tree for the switch.
An empty `default: break;` is also common.

### The transition callback switch (sub_8049344)

The master transition dispatcher uses `if (arg0 <= 4) switch (arg0)` with
grouped cases `case 0: case 2:` and `case 1: case 4:`, proving the team groups
related behaviors rather than using strictly sequential case numbering.

---

## 5. Temporaries and aliases

### Global-to-local caching

The team consistently caches `_gameData` in a local when it will be used more
than twice:

```c
/* sub_80493C8 — frontend.c */
data = _gameData;
if (data->unk1619 != 1) {
    if (sub_806014C(data->unk15D4, data->unk15D4 - 0x10, 1) == 0 ...
```

```c
/* closeGame — gameinit.c */
/* No cache — each use is _gameData->... directly (different pattern). */
```

### Struct-field aliases

The `menu = &state->menuState.menu` alias is the hallmark of the frontend
author. It appears in nearly every festate handler, cached once at the start
of a case body and reused throughout:

```c
/* sub_8043AA0 — festate.c */
menu = &state->menuState.menu;
newIconMenu(menu, _80689A4, 0);
sub_8050FEC(menu, 0x9600);
```

The `state = &_unk3000650` alias appears in frontend.c but not in festate.c
(where the parameter is already `FrontendState* state`).

### Sprite-pair temporaries

The alloc-and-check pattern for sprite pairs is a fingerprint:

```c
sprite1 = allocSprite(0);
_unk3000158 = sprite1;
if (sprite1 != NULL) {
    LoadSpriteSheet(sprite1, ...);
}
sprite2 = allocSprite(0);
_unk300015C = sprite2;
if (sprite2 != NULL) {
    LoadSpriteSheet(sprite2, ...);
}
```

The local is always `sprite1`/`sprite2` or `leftSprite`/`rightSprite`, stored
to the global, then the global is not reused in the same case body.

---

## 6. Allocation failure handling

### `printf` then continue (never abort)

```c
/* initGameLoop — gameinit.c */
ridersBlock = slowAllocate(0x2990);
if (ridersBlock == NULL) {
    printf(Str_87294CC, 0x2990);
}
_gameData->unk428 = ridersBlock;
```

```c
/* fastAllocate — memory.c */
block = getValidAllocatedBlock(_wramBlocks, BLOCK_COUNT);
if (block == NULL) {
    printf("Error in fastAllocate(), unable to allocate %i bytes\n", size);
}
```

The team never `return`s or halts after a failed allocation. The printf string
is always an extern ROM literal. `nullsub_8` is an alternate debug path that
takes a string but does nothing.

---

## 7. Fixed-point conventions

### 8.8 fixed-point (<<8 / >>8)

Coordinates and interpolation targets use 8.8 fixed-point. The `>> 8`
conversion happens at call sites:

```c
/* sub_8061844 — spritetext.c */
arg0->x = arg1 << 8;
arg0->y = arg2 << 8;
```

```c
/* sub_80464C0 — festate.c */
arg0->sprite->x = value + (0x80 << 6);
sub_8061844(arg0->unk4, (value >> 8) + 0x54, arg0->unk4->y >> 8);
```

### Sine table access pattern

The canonical sine table idiom is always spelled:

```c
Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1]
```

or equivalently with a stored timer value. The `& 0x1FE` masks to 512 entries,
`>> 1` converts byte offset to halfword index. This idiom appears in every
festate handler with sprite bobbing.

### 16.16 fixed-point (sound)

Sound uses 16.16 Hz values: `FIXED_16_16(440)` = `0x01B80000`.

### Interpolation: `+= (target - current) >> N`

The canonical ease-toward pattern:

```c
_unk3000600->x += (_unk3000604 - _unk3000600->x) >> 2;
```

`>> 2` (quarter-step) and `>> 3` (eighth-step) are both used. The shift is
always a literal, never a variable.

---

## 8. Global vs local caching of `_gameData` / `_unk3000650`

- `_gameData` is cached locally when accessed 3+ times in a function.
  Single/double accesses go through the global directly.
- `_unk3000650` is always accessed as a field of the global in frontend.c.
  In festate.c, it arrives as the `state` parameter and is never re-loaded.
- `_currentGameState` is used directly (never cached) in all matched code.

---

## 9. Ternary usage

Rare. The team uses ternary only for simple initializers:

```c
/* sub_804541C — festate.c */
newIconMenu(menu, _80692A4, sub_805162C() == 0 ? 3 : 0);
```

```c
/* sub_8046CC4 — festate.c */
value = sub_8051618() != 0 ? 2 : 0;
```

Never for assignments with side effects, never nested.

---

## 10. Probable author grouping

Based on shared habits (loop idiom, alias style, naming, struct access
patterns), the TUs cluster into three probable authors:

### Author A — Frontend/Menu/Credits

**TUs**: frontend.c, festate.c, credits.c, iconmenu.c, menu.c, background.c,
levelselect.c (sub_80413FC), menuobject.c, dialogue.c, language.c

**Fingerprints**:
- `menu = &state->menuState.menu` alias in every handler
- Sprite-pair alloc-and-check pattern with `sprite1`/`sprite2` locals
- Case order 0/7/1/2 with `sub_80439A0` in case 1, input masks in case 2
- `Unk_874CC3C[(sub_8057C40() & 0x1FE) >> 1]` sprite bobbing
- `_unk3005DA0 & 0x30` / `& 0x20` / `& 0x10` button mask cascade
- `sub_80490F8` for state transitions, `sub_8049178` for back-navigation
- Uses `FrontendState*` parameter aliases extensively; never caches
  `_unk3000650` in festate handlers
- Per-frame `sub_80439A0(&state->unk140)` or `(&state->unkB8)` in every handler
- `_unk3000xxx = 0x800` / `0xD800` pairs for scroll targets

### Author B — Engine/Sprite/Sound/Memory

**TUs**: sprite.c, spritetext.c, spritestring.c, sound.c, memory.c,
actorheap.c, palette.c, math.c, layer.c, system.c, bios.c

**Fingerprints**:
- `while (n--)` countdown loops (never used by Author A)
- `prev = current; current = current->next` linked-list walking
- Inline `printf("Error ...")` with English error messages
- `nullsub_8(string)` debug stubs
- `_spritesFree += 1` / `-= 1` (never `++`/`--` on globals)
- Local structs defined inside .c files (`SpriteStruct2`, `ActorBlock`)
- `var00`/`var04`/`var08` field naming (only in sound.c and sprite.c)
- Heavy use of `u32`/`s32` explicit widths; avoids `unk32`
- Byte-cursor walking for variable-size records (`(unk8*)ptr + ptr->size`)

### Author C — Gameplay/Rider/Collision/Environment

**TUs**: gameinit.c, gameloop.c, rider.c, riderstate.c, riderphysics.c,
camera.c, collision.c, envactor.c, effects.c, event.c, actor.c, anim.c,
geometry.c, beyblade.c, collectable.c, hud.c, particle.c, projectile.c,
tutorial.c, motion.c

**Fingerprints**:
- `_gameData` cached at function top: `gameData = _gameData;`
- Direct `if (X != NULL) deallocateBlock(X); X = NULL;` teardown pattern
- `for (i = 0; i < count; i++)` with index needed in the body (not pointer)
- `SetRiderFlag` / `RiderHasFlag` bit-flag API
- `GetLineMetaData` / `getLineMetaobjectByTypeAndId` metadata chain
- `sub_8051780(flag)` mode checks
- Uses `LevelGeometryAddresses` and `LevelDescription` heavily
- Verbose printf for geometry/rider errors with string externs
- Motion-entry arithmetic: `(s32*)arg0->motions` cast to walk 6-word stride
- `processRiderMetadata` chain: repeated
  `metaobject = getLineMetaobjectByTypeAndId(..., TYPE, ID);
  if (metaobject != NULL) { field = metaobject->unk8.word; }`

### Unknown / shared

- `transition.c`, `backup.c`, `keystate.c`, `debug.c`, `profile.c`,
  `render.c`, `display.c` — too few matched functions to attribute
- `gamestate.c` straddles B and C; its save/load functions use B-style
  block management but C-style `_currentGameState` access
- The `libc.c` and `irq.c` files are SDK boilerplate, not team code

---

## 11. Other distinctive patterns

### Multi-field initialization chains

The team initializes struct fields in sequential-offset order, often in blocks
of 4-8 fields without blank lines:

```c
/* sub_8049264 — frontend.c */
_unk3000650.unk424 = 0;
_unk3000650.unk470 = 0;
_unk3000650.unk474 = 0;
_unk3000650.menuState.unk9 = 0;
_unk3000650.unk578 = _unk3000650.unk57C = _unk3000650.unk580 = 0;
```

### Chained assignment

Multiple fields set to the same value in one statement:

```c
_unk3000650.unk84 = _unk3000650.unk88 = (unk32)-65536;
```

### `(unk32)-1` for sentinel values

The team uses `(unk32)-1` or just `-1` for "no selection" / "invalid" states.
Never `0xFFFFFFFF`.

### Deallocation guard pattern

```c
if (arg0->block != NULL) {
    deallocateBlock(arg0->block);
}
arg0->block = NULL;
```

The NULL-set always follows outside the if, even when deallocateBlock itself
checks for NULL. This is consistent across all three authors.
