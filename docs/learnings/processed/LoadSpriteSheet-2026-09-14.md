# LoadSpriteSheet (0x08060B68, src/sprite.c)

Matched. Measured with `diff.ts` row counts (differing instruction rows) and full-ROM compare.

## Signature

- Definition and shared prototype are `(SpriteEntry*, const SpriteSheet*, unk32 x, unk32 y, unk8 objMode, unk8 priority, unk8 flip, unk16 frame)`.
- Evidence: the target loads all four stack arguments at entry in parameter order, normalizes arg6 (`lsl/lsr #24`) and arg7 (`lsl/lsr #16`), and keeps arg4/arg5 in registers (r6/r9) with no visible normalization; combine folds their zero-extension into the later `& 3`.
- Wide `unk32` formals leave arg4/arg5 in their stack slots (reloaded at use, one fewer saved register). Wide formals with narrow locals assigned in parameter order match the prologue but swap `dst`/`source` register roles.
- Mixed widths measured worse: (unk32,unk32,u8,u16) 43 rows, (unk8,unk32,…) 35, (unk32,unk8,…) 34, (unk16,unk16,u8,u16) 28, (unk8,unk16,u8,u16) 28.

## Byte-required shapes

- `s8 sourceFlags = source->unk7` local: folding it to direct field reads loses the target's `ldrb` + `lsl/asr #24` into a long-lived register (32 → 26 rows but structurally wrong, the load moves after the stores). The field itself is `unk8`; `s8` vs `unk8` field gave identical bytes.
- `sourceByteC` local: folding it gives 51 rows.
- `unk28` selection must be the inline ternary `source + (source->unk1C != 0 ? source->unk1C : source->unk10)`. An `if` with a `value` local, or a ternary assigned to a local, keeps `source` in r1 instead of rematerializing `mov r2, ip` in the fallback arm (13 → 3 rows).
- `(((objMode & 3) << 10) | 0x1000) & 0xFFFF`: flagged as a possibly artificial shape. Any plain `|` spelling is reassociated by tree fold into `(acc | 0x1000) | term` (33 rows, cascading allocation changes). `+ 0x1000` keeps the grouping but emits `add` (3 rows). `(unk16)(...)` casts block reassociation, since the IOR is in HImode, but add a `mov` (6 rows). Only the `& 0xFFFF` mask is exact. `((objMode & 3) | 4) << 10`, `^`, `* 0x400`, a u16 attr0/attr1 local split, and a local accumulator were all worse.
- `|=` statement chain vs a single OR expression for `unk10`: byte-identical.

## Caller consequences of the narrow prototype

- newSpriteTrail (src/trail.c): the old `arg0 = NULL; ... (unk32)arg0` zero reuse no longer matched. Natural `for (s32 i = 0; i < arg3; i++)` with literal zeros matches exactly. The literal zeros inside a guarded `do/while` left `mov r4, #0` after `mov r6, r7` (2 rows).
- showString (src/spritetext.c): `load_flags` must be `unk8`. `u32` (the old type) or `u16` changes loop exit-test duplication (50 rows).
- Folded under the narrow prototype, ROM unchanged: `unk16 frame` in-argument assignment in initBBCollectionSprite (festate.c), and `unk16 tileCount` in-argument assignment in iconmenu.c.

# sub_8060C1C (0x08060C1C, src/sprite.c)

Matched on the first build from the asm; the old parked draft was semantically wrong (it dropped `_spritesFree` from the printf, and the loop decrements `size` itself via `while (--size != 0)`).

- Byte-required: separate `cur = first` (before the `sub_80609C4` call) and `prev = first` (after it). Folding them to `cur = prev = first` after the call breaks the ROM.
- Byte-neutral: `first->prev = NULL` vs `first->prev = insertion` in the `insertion == NULL` arm; kept the literal.
- Direct `_unk3005DE4` access in the null arm reproduces the post-store reload (`ldr r0, [r3]`).

# freeSpriteVramLocation (0x08060808, src/sprite.c)

Matched. The parked draft differed semantically: the target returns straight after the "no free entries" printf (skipping the merge pass), and snapshots the free-list head once at entry.

- Byte-required: `freeEntry = _unk3005DD8` at entry (the target loads it before the loop into r4).
- Byte-required: `s32 end = start + size`, assigned after `previous = NULL`. Dropping it lets CSE rewrite `var00 -= size` as a hoisted `end - size` (53 rows). Assigning it before `previous = NULL` also breaks the ROM.
- Byte-required: the merge pass head is `current = _unk3005DC8->next; previous = _unk3005DC8;`. `previous = head; current = previous->next` gave 11 rows, a `freeEntry` head alias 3, `next` as the head 11, and `current` as the head 4.
- `current->var00 > start` compiles to a signed `ble`, consistent with the `s32` parameters.

# Rotation/scale entry retype (commit a9312313) and sub_8060E8C (0x08060E8C, src/sprite.c)

Rotation/scale entries were typed as a `SpriteEntry` view. `SpriteRotationScaleEntry` now has `unkC[4]` matrix, `u16 unk14/unk16` scale, `u8 unk18` angle, `u8 unk19` in-use. SpriteEntry.unk30, SpriteTextCleanup.ptr2C, _unk3005DF8 and sub_8060B0C/B38/8061158/8061160 were retyped. ROM unchanged.

sub_8060E8C matched:
- Byte-required value-less `return;` when `entry->unk19 != 0`: the target branches to the epilogue with r0 still holding the tested byte (callers receive that byte as a pointer; an original bug). `return entry;` adds `mov r0, r5` and breaks the ROM.
- Byte-required `s32` trig locals: with `s16` locals, combine folds each `ldrsh` into its use. That shortens `cosAngle`'s lifetime, so `scaleX` steals r4 and `scaleY` loses r8 (47–51 rows). A grid over table locals × frame_offset × s16/s32 × parameter copies × return shape: best without table locals, without frame_offset, s32, no parameter copies, value-less return (11 rows).
- Byte-required `sinAngle = -sinAngle;` before loading `factorY`. `(-sinAngle * factorY)` loads first (11 rows), and swapped operands gave 12. An in-argument assignment `(-sinAngle * (factorY = ...))` also matches, but the separate negation is plainer source.

# resizeSpriteBlock (0x08060D98, src/sprite.c)

Matched. It replaces two parked drafts: the first used undeclared names, and the second used separate `extra`/`var22` locals.
- Byte-required: reuse the parameters. `size -= block->count` stands in for an `extra` local, and `var22 = block->prev->var22` overwrites the parameter. The target keeps the normalized incoming registers (r1/r3) for the `count == 0` call and the parameter copies (r4/r7) for the rest. A separate `unk16 extra` local left 14 differing rows (register roles only).
- Byte-neutral: a `spritesFree` snapshot local vs direct `_spritesFree` read and `-=`. Kept the direct form.
- The shrink path tail-returns `sub_8060C1C`'s result; the other paths return `block->prev`.

## Fold-test sweep (after the matches above), each probe built independently via full ROM compare

- resizeSpriteBlock: removing `last` (use `block->next` until it is reassigned) breaks. Chained `newFirst = prev = cur = _spritesLeft` breaks. `spritesFree` snapshot folded (already applied).
- freeSpriteVramLocation: removing the merge-loop `next` breaks (reusing `previous->next` instead). Moving the `freeEntry = _unk3005DD8` snapshot into the insertion branch breaks (it must be at entry).
- sub_8060E8C: removing `identity` (repeating the condition), `factorX`, or `factorY` each breaks.

## Review fold tests (2026-09-15)

- freeSpriteVramLocation: folding `end` to `start + size` in the comparison is byte-required. The independent full-ROM compare failed; `diff.ts` first diverged at function offset `0x2` (the saved-register setup), with the folded form changing the prologue and subsequent allocation. Restored `s32 end = start + size`.
- LoadSpriteSheet: removing the `& 0xFFFF` mask from the attribute expression is byte-required. The independent full-ROM compare failed; `diff.ts` first diverged at function offset `0xE` (`ldr` register allocation), followed by a shifted instruction stream and pool alignment. Restored the mask.
- sub_8060E8C: replacing the value-less `return;` in the `entry->unk19 != 0` arm with `return entry;` is byte-required to preserve the target's fall-through return register. The independent full-ROM compare failed; `diff.ts` first diverged at function offset `0x32` (the branch target), and the explicit form adds `mov r0, r5` at offset `0xC8`. Restored `return;`.
