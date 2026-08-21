# agbcc learnings from the block allocator

This note records the additional, concrete code-generation behavior observed while matching the allocator routines. The existing `agbcc` skill already covers general liveness, expression shape, loop rotation, signedness evidence, literal pools, and pointer temporaries; the rules below focus on the less obvious forms that were isolated here.

## Concrete rules

### A source-level `NULL` can force a fresh zero materialization

- **Asm symptom:** In the trailing-block path, the target emits a fresh `mov r0, #0` immediately before the stores that clear `block->next` (and the corresponding null predecessor case). The register holding the result of the preceding gap comparison is not reused as the zero source.
- **C change:** Write the null assignments directly at the point of use:
  ```c
  block->next = NULL;
  if (block == cur) {
      block->previous = NULL;
  }
  ```
  Do not introduce a shared `zero` value or arrange the source so that a register value from a comparison appears to be the value being stored.
- **Why:** `NULL` as the right-hand side gives agbcc a zero-valued store expression whose materialization is placed at that use. A source-level reused zero or a live comparison result changes the value's live range and can make agbcc reuse an existing register instead of emitting `mov #0`.
- **Inference:** The assembly proves the fresh zero materialization and its placement, but not whether the original programmer consciously used the literal `NULL` rather than another expression that lowered identically. The direct `NULL` spelling is the natural source that reproduces it.

### Keep a scalar address temporary when it controls load/zero ordering

- **Asm symptom:** The first-gap prologue begins with the field load, then zero initialization, then the null test:
  ```asm
  ldr r0, [r3, #0]       @ current->address
  mov r1, #0            @ firstGap = 0
  cmp r0, #0
  beq .Lfirst_gap_done
  sub r1, r0, r7
  ```
- **C change that matched:** Preserve the scalar temporary and assign the cursor before initializing the gap:
  ```c
  u32 address;
  AllocatedBlock* cur;

  address = (u32)current->address;
  cur = current;
  firstGap = 0;
  if (address != 0) {
      firstGap = (u8*)address - base;
  }
  ```
- **What failed:** Rewriting it naturally as:
  ```c
  cur = current;
  firstGap = 0;
  if (current->address != NULL) {
      firstGap = (u8*)current->address - base;
  }
  ```
  emitted `mov r1, #0` before `ldr r0, [r3, #0]`. The changed first instruction caused later block layout and branch-target differences, and the ROM comparison failed.
- **Why:** The temporary gives agbcc a value that must be loaded before the zero initialization. Removing it changes the expression tree and live-range boundaries; it is not merely a naming cleanup.
- **Inference:** The temporary is probably an artifact of the original source or of an equivalent source shape, but it is required for this compiler/target combination. It should not be removed solely because the direct field expression is semantically cleaner.

### `s32` and `u32` change the lowering of `while (count-- != 0)`

The comparison `cmp ..., #0; bne` in the final loop is not enough to prove the declaration signed. Both declarations have the same source-level meaning for ordinary nonnegative counts, but agbcc emits materially different control flow.

- **Matching `s32 count` sequence:**
  ```asm
  push {lr}
  mov  r2, r0
  b    .Ltest
  .Lbody:
      ldr  r0, [r2, #4]
      cmp  r0, #0
      bne  .Ladvance
      ldr  r0, [r2]
      cmp  r0, #0
      bne  .Ladvance
      mov  r0, r2
      b    .Lreturn
  .Ladvance:
      add  r2, #16
  .Ltest:
      mov  r0, r1
      sub  r1, #1
      cmp  r0, #0
      bne  .Lbody
  ```
  This is the byte-identical form.

- **Nonmatching `u32 count` sequence:**
  ```asm
  push {lr}
  mov  r2, r0
  sub  r1, #1
  mov  r0, #1
  neg  r0, r0
  cmp  r1, r0
  beq  .Lfail
  mov  r3, r0
  .Lbody:
      ldr  r0, [r2, #4]
      cmp  r0, #0
      bne  .Ladvance
      ldr  r0, [r2]
      cmp  r0, #0
      bne  .Ladvance
      mov  r0, r2
      b    .Lreturn
  .Ladvance:
      add  r2, #16
  .Ltest:
      sub  r1, #1
      cmp  r1, r3
      bne  .Lbody
  ```
  The unsigned form adds an early decrement and an explicit compare against `-1`, with a separate sentinel register; it also shifts the failure path and literal-pool position.

- **C change:** Retain `s32 count` for this loop despite the lack of a signed branch in the loop body. Testing `u32` was necessary because the default project rule is unsigned/unknown, but it failed the exact diff and compare.
- **Why:** agbcc's loop normalization uses the declared signedness when deciding how to represent post-decrement termination. The target's simple copy/decrement/zero-test form is evidence for the signed declaration in this case, even though the branch itself is `bne`.
- **Inference:** The emitted `-1` sentinel in the unsigned experiment is compiler-generated wraparound handling, not evidence that the original source explicitly compared against `-1`.

### A top-tested `while` can place an initial branch before the body

- **Asm symptom:** The loop body appears first in the generated layout, while the loop test is placed after it. Entry is an unconditional branch to the test block:
  ```asm
  mov r2, r0
  b   .Ltest
  .Lbody:
      ...
  .Ltest:
      mov r0, r1
      sub r1, #1
      cmp r0, #0
      bne .Lbody
  ```
- **C change:** Use the natural top-tested form:
  ```c
  while (count-- != 0) {
      ...
  }
  ```
  Do not replace it with an explicit `do/while` or hand-written sentinel test merely to describe the emitted layout.
- **Why:** agbcc rotates the top-tested loop so the body is laid out before a shared test block, requiring the initial `b .Ltest`. The branch is a control-flow-layout consequence of the source loop, not a reason to add labels or inline assembly.
- **Inference:** The exact rotation is compiler behavior; the assembly alone does not establish whether the original source used `while` or another source form that happened to normalize identically. Here the top-tested `while` is the clean source that reproduces the target.

### Typed pointer parameters can improve source without changing bytes

- **Change tested:** `current` was changed from `void*` to `AllocatedBlock*`, the explicit `(AllocatedBlock*)current` casts were removed, and callers passed `_nextWramBlock` / `_nextExramBlock` directly instead of `&_next...Block[0]`.
- **Result:** The generated instructions and ROM bytes remained identical. The typed parameter is therefore preferable: it makes the field accesses and calls honest without introducing a codegen regression.
- **Related cast cleanup:** `base` was already `u8*`; removing redundant `(u8*)base` casts also preserved the exact match. The `(u8*)_exram` call-site cast was retained because `_exram` is declared as an array-pointer type (`u8 (*)[EXRAM_SIZE]`), so its conversion to the function's `u8*` parameter is real rather than cosmetic.
- **Why:** Once the compiler sees the same effective 32-bit pointer operations and the casts do not introduce a distinct conversion, typed and untyped pointer expressions can lower identically. The cast removal is still valuable because it removes misleading source-level indirection.
- **Inference:** This is not a general rule that `void*` and typed pointers are interchangeable. A typed member access, different pointee width, or conversion at a different expression point can alter loads, arithmetic, or register allocation. Verify each change with the function diff and ROM compare.

## Short timeline

1. Replaced the two dump inclusions with natural allocator C using linked `AllocatedBlock` fields and verified both functions against the expected object.
2. Changed the `void* current` parameter to `AllocatedBlock*`, removed the redundant pointer casts, and made the allocator callers pass the typed next-block pointers directly. The exact match survived.
3. Removed redundant casts from `base`; the exact match and ROM compare still passed.
4. Renamed the moving list cursor to `cur`, renamed the output parameter to `nextBlockPtr`, and inserted the blank line between functions. These were source-only cleanups and did not affect codegen.
5. Tried removing the `u32 address` first-gap temporary. The first `ldr` moved after `mov #0`, and the full ROM comparison failed; restored the temporary and reverified.
6. Tested `u32 count` in `while (count-- != 0)`. The compiler emitted the explicit `-1` sentinel sequence above; restored `s32 count` and reverified.
7. Ran `git diff --check` and `cmake --build build --target compare`; the final comparison passed with `100% tests passed out of 1`.

## Proposed generic `SKILL.md` patch

The following patch contains only repeatable patterns and no function-specific names.

```diff
*** Begin Patch
*** Update File: .claude/skills/agbcc/SKILL.md
@@
 ## Register allocation = liveness
@@
 - Read the prologue first: a wrong push mask means the lifetime set is wrong — fix that before anything downstream.
+- A source-level `NULL` store can require a fresh `mov #0` at the store site.
+  Do not introduce a shared zero temporary or rely on a comparison's zero-valued
+  register until the emitted store sequence proves that reuse is present.
@@
 ## Control flow
@@
 - Loops: `while (count-- != 0)`, decrement-then-`while (c != -1)`, `do/while`, and top-tested `while` are distinct shapes; agbcc may rotate a loop (entry branch to a shared test block). A separate `count--;` statement matters when the target compares the decremented value.
+- For a post-decrement `while (count-- != 0)`, test both signed and unsigned
+  declarations when the branch itself is only `bne`: the signed form may lower
+  to an initial `b .Ltest` plus copy/decrement/zero-test, while the unsigned form
+  may add an early decrement and compare against `-1`.
+- A natural top-tested `while` may be emitted as body-first layout with an
+  initial unconditional branch to a shared test block. Match the source loop
+  shape rather than adding labels or inline assembly to imitate that layout.
@@
 - Explicit temporaries mirroring asm values (cursor, count, end-ptr). Keep two locals when the target keeps two registers; drop the temp when the target reloads the field each time.
+- Preserve a scalar temporary when removing it changes the order of a field load
+  relative to a zero initialization or comparison. A direct member expression can
+  move the load and shift every later block even when the arithmetic is equivalent.
@@
 ## Calls & ABI
@@
 - Passing a call result directly as an argument vs storing it in a local first can differ by a `mov`.
+- Replacing a `void *` parameter with the proven typed pointer type, and removing
+  redundant casts, can preserve codegen while making field accesses and callers
+  natural. Treat this as an experiment, not an assumption: pointee width and cast
+  placement can still change loads, conversions, or allocation.
*** End Patch
```

