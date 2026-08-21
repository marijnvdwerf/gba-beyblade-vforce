# memory.c allocator matching notes (sub_805A53C, getValidAllocatedBlock)

Written by the manager from the decompiler agent's status reports (the agent
did not deliver its own debrief). Observations are what the agent reported
and what was verified by `compare`; reasoning is marked (inferred).

- **Fresh `mov r0, #0` before two NULL stores vs. reusing a zero register.**
  Storing the literal `NULL` produces a fresh zero; reusing a pointer variable
  that is known-NULL on that path lets agbcc reuse the register. Write the
  literal when the target materializes zero.
- **A `u32 address` temporary was required** in the first-gap computation
  (`address = (u32)current->address; if (address != 0) gap = (u8*)address -
  base;`). Removing it changed instruction ordering and broke the ROM
  compare. (inferred) The integer detour changes how the null test and the
  subtraction share the loaded value.
- **`getValidAllocatedBlock`: `while (count-- != 0)` with `s32 count`.**
  The target's test block is `r0 = count; count--; cmp r0, #0; bne body`
  (post-decrement test) entered via an initial unconditional `b .Ltest` —
  the signature of a top-tested `while`. The agent reported that `u32 count`
  produced different code; signedness was not provable from opcodes, so this
  is recorded as an empirical requirement.
- **String literal inline.** `Str_8755254` sat immediately after the
  function; writing the literal inline in the `printf` call reproduced the
  layout and let the standalone definition and the `#ifdef NONMATCHING`
  stub be deleted.
- Parameter typing: `AllocatedBlock* current` (not `void*`) and `u8* base`
  matched; remaining `(u8*)` casts are only where `AllocatedBlock.address`
  (`void*`) enters pointer arithmetic.
