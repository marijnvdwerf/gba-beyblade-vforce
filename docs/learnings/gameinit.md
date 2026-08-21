# agbcc learnings from `gameinit.c`

These observations came from matching four caller-backed functions in
`src/gameinit.c`: `initGame`, `initGameLoop`, `sub_8053B94`, and `closeGame`.
The general rules in `.claude/skills/agbcc/SKILL.md` and the existing learning
notes already cover ordinary type inference, liveness, expression shape,
control-flow shape, struct overlays, and literal pools. This note records the
additional interactions that were important in this pass.

## Concrete rules

### A byte store can force a reload of a global pointer

- **Asm symptom:** After stores to three fields, the target repeatedly loaded
  the value of `_gameData` from its global slot before calculating the next
  field address. The stores were `strb`, while nearby word and halfword stores
  did not show the same reload pattern.
- **C change:** Model the fields at their actual widths in one shared
  `GameData` definition: the byte fields are `unk8`, the halfword fields are
  `u16`, and the word fields are `unk32`. Access the global directly, for
  example `_gameData->unkB56 = 0`, rather than copying `_gameData` to a local
  pointer for the whole function.
- **Why:** With a typed pointer, agbcc must account for the possibility that a
  byte store can affect memory observable through aliases visible to subsequent
  code. The resulting type-based alias information and live ranges naturally
  reproduce the reloads. A local cached pointer changed the aliasing model and
  removed or relocated those reloads. This is not a request to make the global
  volatile: volatility adds ordering and accesses that are not present in the
  target. The field width and direct global access are the relevant source
  facts.

The important distinction is between source-level sharing and compiler
register reuse. Writing `0` at each field is natural C; a single zero register
in the output does not imply that the source declared a `zero` temporary.
Conversely, the repeated reload of `_gameData` after byte stores is meaningful
code-generation evidence and should not be optimized away by introducing a
cached alias.

### Keep sentinel fields unsigned when another TU needs signed reads

The fields at `GameData` offsets `0xC24` and `0xC26` had to satisfy two
apparently conflicting users.

- **Asm symptom in `initGame` and `initGameLoop`:** the initialization used
  halfword read-modify-write sequences and the neighboring `0xC28`/`0xC2C`
  assignments were word stores. The fields at `0xC24` and `0xC26` therefore
  needed to remain 16-bit fields without changing the word width of the other
  fields.
- **Asm symptom in the music routines:** the sentinel tests loaded these same
  fields with `ldrsh` and compared against `-1`.
- **C change:** Keep `GameData.unkC24` and `GameData.unkC26` as `u16`, and make
  the signed interpretation explicit at the music call sites:
  ```c
  if ((s16)_gameData->unkC24 != -1) {
      /* ... */
  }
  ```
  and equivalently for `unkC26`.
- **Why:** The declaration describes the storage and initialization width;
  the cast describes the signed interpretation at the point where the target
  performs a signed load. This combination matched `initGame`,
  `initGameLoop`, and all three affected music functions at once.

The alternatives were useful diagnostics:

- Declaring the fields `s16` matched the signed music loads, but made the
  initialization experiments disagree with `initGameLoop` and changed the
  surrounding stores/codegen.
- Writing `|= -1` with signed fields still produced the wrong shape for the
  word fields and did not restore the complete set of matches.
- Leaving the fields unsigned but omitting the `(s16)` casts made the music
  routines use unsigned halfword semantics rather than the target's `ldrsh`.

**Inference:** The storage is unsigned in the recovered shared layout, while
some consumers intentionally interpret the sentinel as signed. The signed
load in the consumer is stronger evidence about that use site than the value
`-1` is about the declaration.

### Check nested-struct size and every downstream offset

- **Asm symptom:** `sub_8053B94` matched its own instructions after the
  current-state fields were represented by a `CurrentGameStateTail`, but the
  full ROM compare failed. `gamestate.c.o` became eight bytes shorter and
  later object addresses moved. `InitCurrentGameState` was the first useful
  C-defined function to expose the layout change.
- **C change:** The tail was represented as a typed nested struct, but the
  padding after it was increased so that the later fields retained their
  original offsets:
  ```c
  CurrentGameStateTail unk6EC;
  unk8 pad6FC[0x568];
  unk32 unkC64;
  unk32 unkC68;
  ```
- **Why:** A nested struct receives its own alignment and size. Four-byte
  members followed by a 16-bit member occupied the logical range through
  `0x6FA`, but the nested type's natural size rounded up to `0x10`; the
  original placeholder's direct fields occupied only `0x0E` bytes before the
  next fixed fields. The extra two bytes changed the containing structure and
  therefore the size and layout of the whole translation unit.

When splitting a placeholder into nested types, check `sizeof` and the offsets
of every field after the split, not only the offsets of fields used by the
function being matched. A function-level instruction match is insufficient if
an apparently unrelated C-defined function or trailing literal pool moves.
If a nested type is needed for readable field access, preserve the containing
layout explicitly rather than accepting natural padding by accident.

**Inference:** The source likely had a layout whose effective tail boundary was
not the same as the natural alignment boundary of the recovered nested C type.
The exact original declaration is not proven; the required invariant is the
compiled offset and object layout.

### Keep a wide value until the call site proves narrowing

- **Asm symptom:** `getSomeLevelID` returned a value that remained wide in
  `initGameLoop`; the call to `initEventListeners` received the wide value,
  while calls to `initLevelEnvironmentActors`, `initCollectables`, and
  `initTutorialManagement` narrowed it to a halfword only at their individual
  call sites.
- **C change:** Declare the local level ID as `unk32`, keep the producer's
  return type wide, and introduce a `u16` temporary only for the calls whose
  ABI requires it.
- **Why:** Making the local `u16` globally inserted narrowing operations too
  early and changed argument preparation and register lifetimes. The target's
  late conversion is represented by a late C cast or a halfword temporary at
  the final use, not by narrowing the producer or every consumer.

**Inference:** A wide return type was established by the call-site codegen,
not by the semantic range of a level number. The semantic value may fit in a
halfword while its ABI representation remains 32-bit for part of the caller.

### Distinguish a scalar global load from passing an array address

- **Asm symptom:** The assignment to the game-data field loaded the value at
  `_unk3000E30`, rather than materializing the address of that global array.
- **C change:** Write `_unk3000E30[0]` when the target performs the scalar load.
  Do not pass `_unk3000E30` as a pointer merely because the global is declared
  as an array.
- **Why:** Array-to-pointer decay and indexed scalar access are different
  expressions. The former changes both the value and the address-generation
  sequence; the latter produces the target's word load.

### Scope locals to reproduce liveness without changing global accesses

`sub_8053B94` needed both direct global accesses and one local pointer. The
matching shape used direct `_gameData->...` expressions for repeated global
fields, while a `GameData *gameData = _gameData` local was used for the later
value expression that needed to remain live in a separate register.

- **Asm symptom:** the target kept the level-description pointer and the
  global pointer/value roles in distinct callee-saved registers; a single
  uniformly cached local changed the allocation.
- **C change:** Introduce a local only for the expression whose lifetime
  requires it, and use a nested/smaller-scope local for the current-state tail.
  Do not replace every global access with the local.
- **Why:** A local copy changes the live range of the global address and can
  eliminate the reloads or move another value into the target's register. A
  scoped local can instead reproduce the target's separate value lifetime.

This is a liveness technique, not a claim that variable names map to physical
registers. Verify the prologue and first divergent instruction after each
small change.

### Model address-passed four-byte regions as arrays when no scalar load exists

In `closeGame`, several four-byte regions were passed by address to cleanup
routines. Modeling those regions as `unk8 region[4]` gave the compiler an
addressable object and avoided inventing a scalar read or a pointer type. The
same approach applies to larger opaque regions when their contents are not
observed by the function.

- **Asm symptom:** the target formed an address and passed it directly; it did
  not load the word stored there first.
- **C change:** Declare a field with the required byte extent and pass
  `&object->region` (or the array expression where appropriate).
- **Why:** A scalar field used as an argument can imply a load, while an array
  decays to an address. The field width and addressability are both part of
  the recovered layout.

Direct typed fields also mattered for the cleanup calls: using the field at
`0x7A4`, rather than the neighboring scalar at `0x7A0`, selected the correct
address. The first cleanup call was unconditional; adding a condition based
on the first byte introduced an extra load and branch absent from the target.

## Warning about raw-decomp as a reference

Raw-decomp was useful for names, likely semantics, and candidate struct
members, but its m2c-shaped C is not a matching source. It often contains
compiler-output choreography: artificial temporaries, explicit shift/cast
sequences, aliases created solely to express offsets, and types inferred from
one use while conflicting with another translation unit. Treat it as a
hypothesis generator. Re-derive every width, signedness, field offset, call
prototype, and lifetime from the hosting dump, all C callers, and the ROM
compare. In particular, do not copy a raw-decomp local pointer or overlay when
a shared typed struct can express the same field legally.

## Timeline of attempts

1. Read the four dumps, their hosting TU, surrounding declarations, and every
   C call site. Used m2c only to obtain semantic drafts.
2. Recovered the `GameData` fields needed by the first function. Initial
   layouts placed fields out of ascending offset order and shifted later
   members; reordering the definition restored the fixed offsets.
3. Matched `initGame` by making the three `strb` destinations `unk8`, the
   neighboring word destinations `unk32`, and the sentinel destinations
   `u16`. Direct `_gameData->` accesses reproduced the target's post-byte-store
   reload behavior.
4. Matched `initGameLoop` after changing the level-ID producer/local to
   `unk32`, narrowing only at the halfword call sites, and using
   `_unk3000E30[0]` as a scalar load.
5. The first `sub_8053B94` draft zeroed the wrong object and modeled the
   special branch with the wrong field widths. The target pointer arithmetic
   identified `_currentGameState->unk6BC`, a halfword value of `2`, and a word
   zero in the tail. A scoped current-state tail and carefully chosen
   `GameData` temporary then matched the allocation.
6. `closeGame` initially made the first cleanup conditional, passed the
   neighboring `0x7A0` field instead of `0x7A4`, and used an over-nested cleanup
   region. Removing the condition, selecting the correct field, and using
   direct typed array fields produced the exact instruction diff.
7. The function diffs were clean, but a full compare exposed the nested-tail
   size regression. Comparing object sizes and checking `InitCurrentGameState`
   located the eight-byte shift in `gamestate.c.o`; correcting the following
   padding restored all downstream addresses.
8. Because the shared `u16` fields affected other translation units, the music
   sentinel tests were updated with explicit `(s16)` casts. Rechecking the
   affected music routines, gameinit routines, and the full ROM compare then
   passed.

## Proposed `SKILL.md` patch

The following additions are generic and intentionally contain no function
names.

```diff
*** Begin Patch
*** Update File: .claude/skills/agbcc/SKILL.md
@@
 ## Register allocation = liveness
@@
 - Long-lived `&global` addresses parked in r9/sl push incoming args out to r7/r8 — if the target's arg registers are high, look for globals whose address is kept live across the function rather than reloaded.
+- A byte store through a typed object can make agbcc reload a global pointer
+  before later field accesses. If the target shows `strb` followed by a global
+  pointer reload, first recover the field width and preserve direct global
+  accesses; do not introduce a cached pointer or `volatile` as a workaround.
+- A narrowly scoped local can preserve a separate value lifetime while direct
+  accesses to the same global preserve the target's reload behavior. Cache only
+  the expression whose liveness the diff supports, not every access uniformly.
@@
 ## Structs vs raw offsets
@@
 - A 4-byte value passed by address can be modeled as `type arr[4]` (decays to a pointer, removes scalar loads).
+- After introducing a nested struct into a fixed-layout placeholder, verify its
+  `sizeof` and every downstream field offset. Natural nested-struct alignment
+  can add padding that changes the containing object size, later object
+  addresses, or literal-pool placement even when the matched function's own
+  instructions are unchanged.
+- When a region is passed by address and never loaded as a scalar, an array field
+  of the exact byte extent is often the honest type. A scalar field can add an
+  unwanted load; an array preserves addressability without raw offset casts.
@@
 ## Calls & ABI
@@
 - Passing a call result directly as an argument vs storing it in a local first can differ by a `mov`.
+- Do not narrow a value at its producer merely because some consumers use a
+  narrow ABI. Keep the value wide until each call site proves the conversion;
+  late casts or narrow temporaries can preserve both argument preparation and
+  the target's live ranges.
+- A shared storage field may be unsigned while a consumer intentionally uses a
+  signed sentinel. Keep the storage type required by the field-width users and
+  place an explicit signed cast at the consumer when the target shows `ldrsh`.
*** End Patch
```
