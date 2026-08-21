---
name: agbcc
description: Use when writing or reshaping C to match agbcc (old GCC, C90) Thumb output in a GBA matching decomp — diagnosing instruction diffs, wrong branch/shift opcodes, register allocation mismatches, or literal-pool/relocation differences.
---

# agbcc matching bible

Core truth: **the goal is to recover the C the original programmer wrote.** agbcc is deterministic — if the output differs, your source differs from theirs. Equivalent C ≠ equivalent code: types, live ranges, expression trees, control-flow shape, and address materialization all steer instruction selection and layout. Downstream pool offsets and branch targets are symptoms of the first divergent instruction — everything after it is noise until it's fixed.

## Off limits

No `goto`/labels, no `register ... asm("rN")` pinning, no inline assembly. A match forced with them is not the original source.

## C90 rules

Declarations before statements. Implicit declarations and warnings are fatal — prototype everything before first call; pointer↔integer needs explicit casts; no deref through `void *`. Keep unused parameters.

## Signedness & width — read from opcodes, not intuition

A mnemonic shows the type of the expression *at that point*, not necessarily the declaration — check loads, shifts, and branches together.

| Assembly | C cause |
|---|---|
| `asr`, `bge/blt/bgt/ble` | signed arithmetic/comparison |
| `lsr`, `bhs/blo/bhi/bls` | unsigned |
| `ldsh` / `ldsb` | signed load (`s16`/`s8`) |
| `ldrh` / `ldrb` | unsigned load |
| `lsl #16; asr #16` / `lsl #16; lsr #16` | s16 / u16 normalization |
| `lsl #24; asr #24` / `lsl #24; lsr #24` | s8 / u8 |

- Default unsigned (`unk8/16/32`); go signed only on evidence. One wrong sign = one wrong branch or shift opcode.
- Width is a lever: narrow types insert normalization shift-pairs, wide types remove them. Don't pick a narrow loop var just because the data is narrow — a plain `int` index often matches where `u8`/`u16` counters add masking.
- Cast placement = conversion placement. Cast where the asm converts; keep a value wide and narrow it at the final use when the target schedules the ABI narrowing late.
- Promotion picks the shift: `((unk32)x << 28) >> 28` → `lsr`; a signed intermediate → `asr`.
- Lvalue type = access width. A `str` into an apparent halfword field is a word store — trust the asm over the "logical" layout.
- Declared return type changes the caller (e.g. `lsl #24` test after a `u8`-returning call) and can change the callee's value flow and epilogue.

## Register allocation = liveness

Allocation follows live ranges, types, and expression trees — never variable names. Levers:

- Explicit temporaries mirroring asm values (cursor, count, end-ptr). Keep two locals when the target keeps two registers; drop the temp when the target reloads the field each time.
- A list walk that keeps the moving cursor and the freshly loaded successor in distinct registers needs a separate `candidate` temp (`candidate = cur->next; next = candidate;`) even though it looks redundant.
- Assignment order moves live-range boundaries (`count = f->n; temp = count; count--;` ≠ computing via the temp first). An early `result = 0` set-on-success reproduces early return-register setup.
- Values live across calls land in callee-saved regs; repeated global accesses can keep the global's address in a saved reg where a cached local frees it.
- Nested scopes shorten lifetimes and free registers for later reuse.
- Chained assignment (`a = obj->f = call();`) keeps the value live for the following store/move; splitting adds a `mov`.
- A "redundant" temp doesn't reserve a register — non-overlapping lifetimes get coalesced; it can instead add an unwanted save and shift every stack offset.
- One shared `void *prev` reused across two list-building loops keeps a single pseudo (and the same callee-saved reg, e.g. r4) in both; separate typed locals split it and shuffle neighbouring temps. Conversely a "redundant" cursor temp (`next = entry; … next = next->next;`) can be required when the target keeps the initial pointer and the moving cursor in different registers.
- Long-lived `&global` addresses parked in r9/sl push incoming args out to r7/r8 — if the target's arg registers are high, look for globals whose address is kept live across the function rather than reloaded.

Read the prologue first: a wrong push mask means the lifetime set is wrong — fix that before anything downstream.

## Expression shape

- Stage pointer arithmetic in separate statements when the asm stages it (base; `+0x20`; `+idx<<3`) — folded expressions invite reassociation and indexed loads. Staging often works; it's not guaranteed.
- Byte offsets through `(unk8 *)` casts — typed-pointer `+` scales by element size.
- Commutative operand order is visible (`add r0, r1` vs `add r1, r0`; which field loads first). Write the target's order.
- `field += 1` and compute-then-assign lower differently.
- Read-modify-write via explicit accumulator: `t = *p & mask; t |= v; *p = t;`.
- Constant spelling matters: `160 << 19` (mov/lsl) vs a pool literal; `idx * 5 << 4` vs one big multiply; `x * 6` may strength-reduce to shifts where the target has `mul`.
- agbcc folds whenever it can prove equivalence: merges shift chains, CSEs repeated loads, merges identical blocks, reuses algebraically related constants (`#15` reused instead of `mov #16; neg`). If the target has the unfolded form, the original source blocked the proof — different locals, different grouping.

## Control flow

- Condition spelling picks branch polarity and layout: `index < count` ≠ `count > 0`; early return ≠ result-var + fall-through; nesting direction chooses the fall-through path. Reproduce redundant-looking comparisons — they're source shape.
- `switch`: lexical case order affects block layout and jump-table targets; explicit empty cases can keep the jump table where a sparse switch degrades to compares; identical case bodies may merge (breaking the table); an unsigned dispatch expression (`(u32)v - K`) can sometimes force the table form. `switch` and if/else chains lower to different comparison trees.
- Loops: `while (count-- != 0)`, decrement-then-`while (c != -1)`, `do/while`, and top-tested `while` are distinct shapes; agbcc may rotate a loop (entry branch to a shared test block). A separate `count--;` statement matters when the target compares the decremented value.
- `*out++ = v` can select `stmia`; separated store + increment selects `str` + `add`.
- A rotated CFG in the target is not always reproducible from the plain `while (cond)`: in sub_806306C both `while (next == NULL || gap < size)` and `for (;;)` with the same body changed regalloc and shortened the CFG; only spelling out the entry test + bottom test (`if (next && gap >= size) break;`) matched. Try the natural form first, but accept the rotated spelling when the diff proves it.
- Loop reversal (`check_dbra_loop`) only fires for a *signed* `<`/`<=` bound and yields a countdown to `cmp #0`; unsigned `<` and `!=` loops stay ascending even when the `.loop` dump says "Can reverse loop". The `i = n-2 … cmp #-1` sentinel shape is not reversal at all — it is how `u32 n = count; while (n--) { … }` lowers. Write that, not an explicit sentinel loop.

## Globals & literal pools

- Global addresses generally come from the literal pool, but agbcc may reuse a loaded address and derive nearby ones with `add`/`sub`. Whether the target loads fresh or derives is visible — mirror it.
- Pool placement and reach follow code size and block layout — never chase pool offsets; fix the code above them.
- Calls through a function-pointer lvalue emit load + `_call_via_rN`; direct calls emit `bl`. Match the indirection level.
- String literals passed to calls are emitted right after the function's code; if `Str_*` globals sit immediately after the function in address order, they were inline literals — write them inline.
- `diff.ts` shows expected pool words numerically and current ones by symbol, flagging them `!` even when equal. `.word` rows are relocation display noise; the ROM SHA1 compare is the authority.

## Structs vs raw offsets

Both are codegen tools: the same effective address through a struct member vs byte-offset arithmetic can produce different address calculation, temporaries, and allocation. Try the other form when stuck.

- Overlay only the fields you need (padding up to the offset); a wrong field type is a wrong access width even at the right offset.
- Unions for a field read both as word and as pointer.
- A 4-byte value passed by address can be modeled as `type arr[4]` (decays to a pointer, removes scalar loads).

## Calls & ABI

- Visible prototypes are codegen inputs on both sides: parameter widths control argument conversions at the call site; definition types affect entry code and allocation. Wrong arity = wrong stack frame; arguments past r0–r3 go on the stack.
- Calls without a prototype use default argument promotions — an old-style declaration can change argument passing.
- A variadic definition emits an argument-save area (`push {r0-r3}`) even with an empty body.
- Keep dead-looking work the asm shows — discarded division calls, unused readbacks, redundant copies were in the original source; deleting them is a mismatch.
- Passing a call result directly as an argument vs storing it in a local first can differ by a `mov`.

## Volatile

Preserves the volatile accesses themselves (hardware registers, readbacks the optimizer would elide). It does not order surrounding non-volatile work and is not a register-allocation tool — it can add loads/stores and change frame size. Apply it to the one access that needs it.

## Zeroing & initializers

- `= {0}` and `memset` spellings can lower to a library `memset` call; explicit per-element assignments or a plain `int`-indexed loop produce inline stores (such a loop can even compile to the target's pointer-walk form).
- Where zero is first used controls where `mov rN, #0` appears; two zero locals with different lifetimes can be needed — though they may still coalesce.
