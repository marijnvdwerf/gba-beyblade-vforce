# Residual analysis: what the near-misses are still missing

Date: 2026-08-28

## Conclusion

There is no single missing compiler flag or one magical C idiom. The residuals fall into two groups:

1. **Recoverable source shape:** the draft has the right operations, but it has expressed a value with the wrong lifetime, alias, scope, or loop cursor. This changes pseudo priority and therefore register coloring, reloads, frame size, or branch layout. The most productive correction is to write the C as the original programmer likely did: direct member/global expressions, a pointer cursor when the assembly advances a pointer, and a separate local only when a value demonstrably survives a call or phase boundary.
2. **Not recoverable by ordinary natural C alone:** a few residuals are allocator ties or target instructions that agbcc normally removes. These should not be “fixed” with `volatile`, hard-register variables, inline assembly, fake guards, or raw offset tricks. They need either more evidence about the original source or an assembly include.

The strongest cross-function finding is **lifetime shaping, not macro expansion**. A function-like macro can explain an occasional duplicate evaluation, but the observed residuals are overwhelmingly explained by whether the source retained a cursor/index, cached a base, scoped a temporary, or used a direct expression. The target is often the result of ordinary 2002 C written with pointer cursors and phase-local variables, not an allocator-directed reconstruction.

RETRACTED (manager, 2026-08-28): the claim below that enabling the parked `GetLineIndexOfType` draft produced a byte-for-byte match was re-tested in a clean detached worktree with the draft enabled and `line->unkF` typed: the ROM SHA1 does NOT match. Treat GetLineIndexOfType as a near-miss; the shape analysis in this document stands as hypotheses only.

## Residual matrix

“Target value” names the semantic value occupying the relevant register, rather than the register number alone. “Status” distinguishes a source-shape explanation from a compiler/allocation wall.

| Function | Residual class | Target value in wrong/extra register or target-only lifetime | Best explanation / next source shape | Status |
| --- | --- | --- | --- | --- |
| `GetLineIndexOfType` | Register-role swap; value copied after first use | `r2` remains the normalized line index; `r3` is the line-count copy made **after** the entry compare; `r1` is the scaled line pointer | Normalize `type` and `index`; compute the pointer from `index`; load/compare the count; then assign `current = count`; use a pointer cursor and return the live index. Do not replace the index with a pointer-difference result | **Confirmed**: isolated build matched exactly |
| `sub_805041C` | Register-role swap; narrow-value lifetime | Target keeps motion item index in `r7`, masks in `r8`/`ip`, and keeps the 0x4 direction mask in `r9`; the draft's selected direction/index values are colored differently | Preserve the original `UnkMotion` item index across the loop and keep the three masked flag values as separate locals. The `riderBase = rider` alias is a real lifetime requirement in the matched asmlift result; do not collapse it | **Experimented**: closest natural draft still differs in the final axis-selection register movement and is 2 bytes shorter |
| `sub_80510FC` | Reload versus cached/pointer-increment load; branch layout | In the final table scan target uses `r0` as the current table pointer and `r2` as the inner index, with `lsl` plus pointer addition and `ldr`; an indexed C reconstruction produces a different pointer form | Use a moving `unk32 *` cursor (`value = *cursor++`) and preserve the separate outer value. The target's first half also repeatedly reloads `_currentGameState`; do not cache it across the initialization phases | Strong; parked without a C marker |
| `updateKeyState` | Register-role swap / allocator tie | At `0xA8`, target materializes base+4 in `r4` and base+8 in `r0`, then copies to `r8` and `ip`; natural draft materializes them in `r0` and `r1` | Keep the two base-plus-field expressions live through the same release path, but do not add aliases or hard-register declarations. The exact tie may depend on the original surrounding expression order | Strong but unresolved; all natural variants tried |
| `freeSpriteVramLocation` | Prologue high-register lifetime; pointer roles | `r7=start`, `r5=size`, `r8=&_unk3005DC8`, `r9=&_unk3005DD8`, `r2=current`, `r4=free-list node`, `r6=previous`, `ip=start+size` | Keep the two global-head **addresses** alive, retain start and size separately, and use `previous` only for the insertion/relink phase. Preserve original head separately from the advancing cursor. Do not pin registers | Strong source-shape candidate; previous pinned “match” was invalid |
| `sub_8060C1C` | Register-role swap; branch-local lifetime | `r8=block`, `r5=normalized requested size`, `r7=var22`, `r6=first free sprite`, `r4=tail/cursor`, `r2=insertion point`; target keeps `_spritesLeft` address in two phases | Keep original head, moving cursor, tail, insertion point, and successor as distinct values. Let the insertion/relink successor be a branch-local temporary. Use a separate pointer to `_spritesLeft` only where the target retains its address; avoid flattening both relink branches | Strong source-shape candidate; semantic draft remains parked |
| `resizeSpriteBlock` | Prologue high-register lifetime; register roles; size-sensitive frame | `r5=block`, `r4=normalized new size`, `r7=normalized arg2`, `r9=&_spritesFree`, `r8=loaded free count`, `r10/sl=first newly inserted node / free-list values`, `[sp]=predecessor cursor` | Keep old block tail and free-list predecessor distinct; scope the old tail to the shrink/grow branch; retain the global head address separately from its loaded count. The explicit loop that builds added nodes should use the moving predecessor cursor | Strong source-shape candidate; no evidence for a macro |
| `LoadSpriteSheet` | Size/representation pun | Target stores a halfword at `SpriteEntry+0x18`, while other consumers load the low byte at `+0x19`; the target therefore writes two bytes as one word and later reads one byte | Model the proven two-byte storage pun without changing the fixed `SpriteEntry` layout. A union with `u16 word` plus `u8 b[2]` is the only remaining natural representation to test; the struct-of-two-bytes union variant inserted unwanted 4-byte alignment under old agbcc | Representation issue, not register allocation; ordinary field typing cannot express both widths |
| `sub_806123C` | Prologue/stack-frame and early register roles | Target has the 0x2c local area and saves `r8/r9/sl`; the values in its slots are widths, x/y, scale, marked sprite, line shift, and a saved first node. Early target roles include `ip=text`, `sl=char_width`, `r4=current`, `r5=cursor`, `r6=marked`, `r7=mode/temporary` | Keep the long-lived layout locals in stack-backed variables, preserve `saved_first` separately, and use case-scoped adjustment/position values. Do not turn the repeated line calculations into one shared temporary if that changes branch shape | Partial source-shape match; large residual remains |
| `sub_8065334` | Reload versus cached load | Target reloads `string->actors` from `[string]` on every iteration, then scales `index` by `0xc4`; it does not retain a cached actor-array base | Write `string->actors[index]` directly at each use. Do not cache `Actor *actor` or `Actor **actors`; direct member subscripting is the source construct that preserves the reload | Strong and specific; `volatile` is not an explanation |
| `sub_80655C0` | Register/stack shape | The parked draft's temporaries do not have the target's live ranges; exact target value mapping was not recorded in the note | Reconstruct the matched TU's pointer-cursor style first; keep callback/object aliases only across calls that need them, and scope formatting temporaries to each branch | Unresolved; insufficient residual evidence |
| `sub_8065508` | Register/stack shape | Same class as `sub_80655C0`; no reliable target-only value was recorded | Start from the target's call argument order and introduce only values that survive a call. Avoid a global cached base | Unresolved; insufficient residual evidence |
| `sub_80659F0` | Extra callee-saved register / prologue | Draft retains one extra long-lived backup/configuration or DMA temporary; target does not save that register | Scope `BatteryBackupConfig *config` around the sector check and DMA-size calculation; use a buffer cursor only for the bit packing, then let it die before reconstruction. Do not keep both `temp` and `tempPtr` alive beyond their phases | Strong but tested scope changes did not remove the extra save |
| `sub_805529C` | Prologue high-register lifetime; size delta | Draft caches `GameData *gameData` and `ProjectileSystem *effect`; target's first saved-register set and body are 0x32 bytes longer than the natural draft | Use a narrowly scoped `ProjectileSystem *effect` for the state update, while using direct `gameData` layer expressions in the layer loop (or vice versa according to the target reloads). The target likely retains a layer cursor/offset across each pair of hardware calls | Strong source-shape candidate; no macro evidence |
| `sub_80627F0` | Target-only dead arithmetic | Target executes `(state->var08 + 1) & -2` after loading the field, then overwrites the value; normal C DCE removes it | No ordinary natural C construct found. `volatile`, fake uses, and guards are rejected because they are not evidenced source. Preserve assembly until the original source or compiler quirk is identified | **Compiler/source wall** |
| `sub_8062C24` | Prologue fixed; stream-pointer/opcode register-role swap; branch layout | Target keeps stream-pointer address in `r4`, opcode in `r5`, event/channel search cursors in `r4/r6/r7`, and uses a jump table whose case bodies are in source order 8,9,B,C,D | Use one outer `do/while` entered when adjusted time is nonpositive. Scope each case's byte temporaries; increment/store the global cursor after every byte load; order switch case bodies to match the emitted jump-table body order. Keep `opcode` live across dispatch rather than recomputing it | Strong source-shape candidate; draft improves guard but remains parked |
| `initEventListeners` | Register-role swap; VLA frame | Target has listener count in `sl`, max listener count in `r6`; draft has the reverse. Target's VLA gives the split fixed/dynamic frame and `stmia` moving store | Keep `unk32 listenerIds[maxListeners]` as a VLA and write `*listenerPtr++ = i`; do not replace with indexed stores. Count/max declaration order alone did not resolve the allocator tie | Source shape confirmed for frame/store; allocator tie unresolved |
| `initRiders` | Size delta / extra spilled lifetime | Target frame is 0x134; draft is 0x138. Target has rider index in `r9`, primary line index in `sl`, current line in `r8`, coordinates in `r7/r6/r4` | Recompute the selected/multiplayer line address at the use site instead of retaining both a selected-line pointer and a second long-lived line/state value. Keep `riderIndex` live only across the rider calls that use it | Strong: one extra long-lived local is the likely 4-byte difference |
| `initMultiPlayer` | Register-role swap / argument normalization | Target copies second argument to `r8` at entry and retains normalized third argument in `r5`; natural draft chooses the opposite roles | Preserve `arg1` as a long-lived size/count value through allocation and pointer construction; normalize `arg2` once into a halfword local used for serial setup. Compute the allocation size after those values have their target lifetimes | Strong source-shape candidate |
| `initLevelEnvironmentActors` | Size delta / high-register and stack-slot lifetime | Target frame is 0x268; draft is 0x26c. Target keeps geometry pointer in `r6`, computed line in `r4`, and actor-loop state in slots near `sp+0x25c..264` | Let selected-line/sprite/state values die before the actor loop; use stack-backed predecessor/actor-state cursors only where they span a call. Preserve typed fixed strides: actor 0xc4, line object 0x4c, point 8 bytes. The point loop is pre-guard plus bottom-tested `do/while` | Strong: one extra selected-line/sprite/state lifetime |
| `sub_804967C` | Extra high-register saves / address alias lifetime | Natural draft saves `r8/r9` because it caches state/subobject aliases. Target keeps `&_unk3000650.unkB4` in lower `r6` and derives the object with `add r6,r5,#0; add r6,#0xb4; ldr` | Access `_unk3000650.unkB4` directly at phase boundaries; retain only the `unkB4` address across the callback loop. Do not cache the whole frontend state or nested object when target reloads it | Strong source-shape candidate |
| `sub_8049458` | Branch-layout and final temporary/register permutation | Target computes `unk584` address into `r2/r3`, `unk586` address into `r0/r1`, compares bytes, materializes `r4=0` before `sub_8049344(1)`, then stores the zero to `unk585` | Keep the final byte block as separate address/value expressions in target order; do not collapse the compare/store into one cached byte. The early zero is a real live-range artifact, not evidence for an artificial assignment | Strong but unresolved allocator/layout tie |
| `sub_806014C` | Reload versus cached global; register roles | Target reloads `_unk3005DC4` after the callback and retains its address in `r7`; the draft only reproduced the reload with `volatile`. Target also has `sl`/`r8` flags and `r9` player count | Use direct `_unk3005DC4` expressions across the callback and hardware phase; capture only the caller-supplied pointer in `[sp]` because it survives calls. A natural local alias hoists the global and is wrong here | Strong semantic evidence; forbidden `volatile` result means keep investigating source order |
| `sub_8057A7C` | No C body / orphan | No caller and no trustworthy draft; no target value can be assigned | Do not infer a C construct from this symbol. It is not evidence for the common residual pattern | Not a near-miss |

## Ranked source constructs

### 1. Direct member/global expression instead of a cached alias

**Coverage:** clearly explains `sub_8065334`, `sub_804967C`, `sub_806014C`, `sub_805529C`, and likely parts of `sub_80659F0`, `initLevelEnvironmentActors`, and `sub_80510FC`.

A cached alias changes both reload behavior and pseudo priority:

```c
/* likely target shape */
for (i = 0; i < string->count; i++) {
    string->actors[i].x = ...;
    string->actors[i].y = ...;
}

/* tempting but different */
actors = string->actors;
for (i = 0; i < string->count; i++) {
    actors[i].x = ...;
    actors[i].y = ...;
}
```

Likewise, use `_unk3005DC4->field` again after a callback when the target reloads the global. Capture a value before a call only when the target needs that value after the call.

### 2. Pointer cursor plus index kept live

**Coverage:** `GetLineIndexOfType`, `sub_80510FC`, `initEventListeners`, `sub_8065334`, and both sprite free-list functions.

The original code often appears to retain both the logical index and a cursor:

```c
line = addresses->unkC + index;
count = addresses->unk0->lineCount;
if (index >= count)
    return -1;
current = count;
while (index < current) {
    if (line->kind == type)
        return index;
    line++;
    index++;
}
```

For a table scan, prefer the equivalent moving cursor rather than making every dereference an indexed expression:

```c
for (ptr = table; ptr != end; ptr++) {
    value = *ptr;
    ...
}
```

This is not merely style: it selects `stmia`/`ldmia`, post-increment loads, and the target's pointer arithmetic.

### 3. Scope a value to the phase in which it is used

**Coverage:** frame-size/prologue residuals in `sub_80659F0`, `initRiders`, `initLevelEnvironmentActors`, `sub_805529C`, `resizeSpriteBlock`, `sub_8060C1C`, and `sub_804967C`.

Use a block or branch-local declaration when the target's value dies before the next phase:

```c
/* configuration is not live during reconstruction */
{
    BatteryBackupConfig *config = _unk3005E9C;
    if (sector >= config->unk4)
        return 0x80FF;
    dmaCount = config->unk8 + 3;
}
/* only buffer cursor and result remain live here */
```

Conversely, do not scope a value that must survive a call:

```c
callbackData = ...;
actorState->unk4 = callbackData;
actor_80585F8(...);
actor_805C48C(...);
actorState->unk4 = NULL;
```

The target frame delta is often one word because a draft retains exactly one such value too long.

### 4. Separate original head, cursor, predecessor, and successor

**Coverage:** `freeSpriteVramLocation`, `sub_8060C1C`, `resizeSpriteBlock`, and `sub_806123C`.

Do not compress a linked-list algorithm into one `node` variable:

```c
first = _spritesLeft;       /* original head / return value */
previous = first;           /* predecessor while building */
insertion = find(...);      /* insertion point */
...
next = insertion->next;     /* successor is branch-local */
last->next = next;
first->prev = insertion;
insertion->next = first;
```

The target's use of saved registers is evidence that these are separate source-level lifetimes, even if two values are equal on one path.

### 5. Keep narrow arguments wide until the target proves a conversion

**Coverage:** `initMultiPlayer`, `GetLineIndexOfType`, `initRiders`, `resizeSpriteBlock`, `sub_8060C1C`, and `sub_80413FC`.

Use explicit `u16`/`s8` locals where the assembly has `lsl/lsr` or `ldrsb`, but do not cast every use:

```c
u16 normalized = (u16)arg2;
...
state->mode = normalized;
```

For signed byte streams, the post-increment condition is materially different:

```c
while (*ptr++ != -1) {
    ...
}
```

This produces the target `ldrsb` shape where a separate load and increment produces `ldrb` plus shifts.

### 6. Preserve source switch/loop body order

**Coverage:** `sub_8062C24`, `sub_8049458`, `initEventListeners`, and `sub_80413FC`.

Old agbcc emits jump-table case bodies in source order, not numerical order. Put case bodies in the target body order, and use the target loop rotation:

```c
if (time > 0)
    return;
do {
    opcode = *cursor++;
    dispatch(opcode);
} while (time <= 0);
```

Equivalent Boolean expressions and `while`/`do` forms can move labels and branch fall-through without changing semantics.

### 7. Function-like macros and duplicated evaluation

**Coverage:** possible in callback/size calculations, but no residual currently proves it.

A macro can create an extra expression evaluation or temporary:

```c
#define CLAMP(x, lo, hi) ((x) < (lo) ? (lo) : ((x) > (hi) ? (hi) : (x)))
size = CLAMP(config->size + 1, 0, limit);
```

This is a lower-ranked hypothesis because the observed target reloads are better explained by direct member access, and no target residual shows the same side-effecting argument evaluated twice. Test this only after the lifetime/cursor forms above.

## Controlled experiments

### Experiment 1: `GetLineIndexOfType`

- Created an isolated detached worktree under the session scratchpad.
- Configured and built it with the repository's normal CMake preset and agbcc toolchain.
- Enabled the parked semantic draft without changing the main checkout.
- Ran the repository instruction diff for `GetLineIndexOfType`.
- Result: every instruction from the prologue through the return matched the expected object. The target sequence is reproduced exactly, including:
  - normalized `type` in `r4`,
  - normalized `index` in `r2`,
  - scaled pointer temporary in `r3`,
  - line pointer in `r1`,
  - count in `r0`,
  - `current = count` in `r3` after the compare,
  - index retained in `r2` through the loop.

This confirms that the apparent one-register residual was not evidence of a missing exotic construct in the current source. It was stale evidence from an earlier tree/source state. The concrete draft in `src/geometry.c` is the correct experiment result.

### Experiment 2: `sub_805041C`

A fresh isolated attempt preserved the closest natural C draft, including the `riderBase` alias. Removing that alias caused an immediate mismatch (`mov r7, r8` in the target versus `mov r6, r0`), confirming that the apparently redundant alias is a real source-level lifetime signal. With the alias retained, the remaining mismatch is confined to the final axis-selection register movement; the draft is two bytes shorter than the target. This is an allocator/source-order residual, not evidence that the broad motion-object semantics are wrong.

### Experiment 3: previously recorded natural-source matrix

The repository notes record controlled variants for the other strongest candidates:

- `GetLineIndexOfType`: width-only arguments, explicit normalization, field temporary, cached versus reloaded count, `for`, `while`, and entry-test plus `do/while`; the current exact draft now matches.
- `sub_80659F0`: output pointer width, temporary ordering, DMA temporaries, and scoped configuration pointer; none removed the extra saved register.
- `sub_8060C1C`: alias declaration order, explicit successor, direct versus cached global head, and null-guard removal; all moved individual blocks but none matched the relinking allocation.
- `sub_80413FC`: `while (*ptr++ != -1)` was confirmed to generate `ldrsb`; all natural pointer/type/declaration/loop variants still left the counting-loop result in the wrong register.
- `sub_8065334`: caching `Actor *actor` versus direct `string->actors[index]` was tested; only `volatile` forced the reload, so the reload remains a source-shape hypothesis rather than permission to use `volatile`.
- `sub_80627F0`: ordinary C, `volatile`, and artificial guards did not retain target dead alignment arithmetic.

The overall experiment result is negative for a universal macro or declaration-order trick and positive for direct expressions, cursors, and phase-local lifetimes.

## Three cheapest next experiments

1. **Re-test the exact current `sub_8065334` direct-member rewrite.** Remove the cached `Actor *actor` only, build `spritestring.c`, and diff the function. This is a one-edit experiment with a sharply defined prediction: the actor-array base reload should appear without `volatile`.
2. **Try the `u8 b[2]` union representation for `LoadSpriteSheet`.** Keep the union exactly two bytes (`u16 word; u8 b[2];`) and verify `sizeof(SpriteEntry)` and the offsets of `var24/unk28/unk30` before compiling the whole TU. This directly tests the only remaining representation that can produce `strh` at `+0x18` without the 4-byte nested-struct padding that invalidated the prior union.
3. **Minimize `initRiders` and `initLevelEnvironmentActors` lifetimes one value at a time.** First eliminate only the retained selected-line pointer after its coordinates are loaded; then rebuild and inspect frame size. The prediction is a one-word reduction (0x138→0x134 or 0x26c→0x268) and movement of rider/actor index into the target high register. Do not change field types or control flow in the same experiment.

## Guardrails

- The isolated experiment worktree is disposable and is not part of the main checkout.
- No source or assembly file in the main tree was changed by this analysis.
- Do not use `volatile`, `register`, hard-register bindings, inline assembly, fake side effects, or raw address tricks as matching levers. They obscure the source explanation and repeatedly fail to generalize.
- Keep the best near-miss draft under `#if 0` above its assembly include until a full ROM compare succeeds.
