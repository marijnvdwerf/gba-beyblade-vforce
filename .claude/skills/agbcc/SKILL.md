---
name: agbcc
description: Use when writing or reshaping C to match agbcc (old GCC, C90) Thumb output in a GBA matching decomp — diagnosing instruction diffs, wrong branch/shift opcodes, register allocation mismatches, or literal-pool/relocation differences.
---

# agbcc matching bible

Core truth: **recover the C the original programmer wrote.** Equivalent C is not equivalent code: types, live ranges, expression trees, control flow, and address materialization all steer deterministic agbcc output. Fix the first divergent instruction; later branches, pools, and addresses are usually downstream noise.

## Off limits and C90

- No `goto`/labels, register pinning, or inline assembly; a match forced with them is not recovered source.
- Declarations precede statements; prototype every call, cast pointer↔integer conversions, never dereference `void *`, and keep unused parameters.

## Types, widths, and signedness

- Read expression type from loads, shifts, and branches together; one mnemonic proves the operation there, not necessarily the declaration.
- `asr`, `ldsh`/`ldsb`, and `bge`/`blt`/`bgt`/`ble` → signed; `lsr`, `ldrh`/`ldrb`, and `bhs`/`blo`/`bhi`/`bls` → unsigned.
- `lsl #16; asr #16` versus `lsl #16; lsr #16` → signed versus unsigned halfword normalization; `#24` pairs do the same for bytes.
- Default to `unk8/16/32`; use signed types only on evidence, because one wrong sign produces one wrong branch or shift opcode.
- Narrow locals insert normalization pairs; wide locals remove them. A plain `int` index often matches where `u8`/`u16` adds masking.
- Cast placement is conversion placement: keep a producer wide and cast or assign narrow only where the target performs the conversion.
- Entry normalization proves narrowing at entry, not a narrow formal parameter; try a wide ABI parameter assigned or cast to a narrow local.
- Promotion chooses shifts: an unsigned intermediate yields `lsr`, while a signed intermediate yields `asr`, even with identical stored width.
- Lvalue type selects `ldr`/`str`, `ldrh`/`strh`, or byte access; trust the opcode over the field's apparent semantics.
- A cast on a field read (`(s8)p->f`, `ldsb`) is the field's real type: fix the declaration, don't keep the cast. Only a field proven unsigned by other users may keep a `(s16)` cast at a sentinel (`== -1`) consumer.
- A return type changes caller normalization and can also reshape the callee's value flow and epilogue.
- Pointer→integer conversion and an integer identity cast can create different RTL despite both being 32-bit; preserve the proven global type.

## Locals and register pressure

- Read the prologue first: a wrong push mask means the lifetime set is wrong, so fix that before downstream instructions.
- Values live across calls prefer callee-saved registers or spills; one extra live value across one call can change the push mask or spill slot.
- Keep explicit cursor/count/end temporaries when the target keeps distinct values; remove them when the target reloads or coalesces instead.
- A separate successor temporary can keep a moving cursor and freshly loaded pointer in distinct registers: `candidate = cur->next; next = candidate;`.
- A scalar temporary can force a field load before a later zero initialization; removing it may reorder the first instructions.
- Assignment and initialization order set live-range boundaries and address-materialization order; spell them in target order.
- In `.greg`, global-allocation priority is roughly `refs / live_length`: more references help, while a longer-lived pseudo gets lower priority; use this to explain saved-register choices.
- For a pure register-role swap, declaration order, scopes, and equivalent VLA-bound spellings may not change allocator rank; compare `.greg` before churning permutations.
- Nested scopes shorten lifetimes, but a switch-arm-local pointer also defers its global load until that arm; hoisting it changes dispatch allocation.
- Reuse one compatible local across similar loops when the target preserves one pseudo/register history; separate locals may reshuffle both loops.
- Conversely, keep initial-pointer and mutable-cursor locals separate when the target keeps both roles live in different registers.
- A redundant-looking temporary can add the exact pseudo pressure needed, or an unwanted save; judge it by the prologue and first divergence.
- Alias removals interact: one failed simplification may match after another alias is removed, so probe combinations while checking the first divergence.
- Early `result = 0` or a real 0/1 flag can reproduce early return-register setup and later separate tests; do not fold proven source state away.

## Expressions and store shape

- Stage pointer arithmetic when asm stages base, displacement, and scaled index separately; a folded expression invites reassociation or indexed loads.
- Typed-pointer addition scales by the pointed-to type; a `base + i * SIZE` walk is an array of SIZE-byte structs — declare it and index, never `(unk8 *)` arithmetic in final code.
- Runtime offset tables into packed or variable-size blobs legitimately use `(unk8 *)base + offset`; do not force them into fixed-stride arrays.
- Commutative operand order is visible in load and `add` order; write the target's expression-tree order.
- `field += 1`, compute-then-assign, and read-modify-write through an explicit accumulator are distinct source shapes.
- Straight-line struct initialization preserves lexical store order; chained assignment stores right-to-left and keeps the value live, while splitting it can reverse stores or add a `mov`.
- `*out++ = value` can select `stmia`; a separated store and increment selects `str` plus `add`.
- A target induction initialized to `-stride` may be strength-reduced `array[i - 1]`; try the indexed source before preserving a negative cursor.
- Constant spelling matters: shifted small constants favor `mov`/`lsl`, while a large literal may use the pool; grouped multiplies may strength-reduce differently.
- If a high-register value is compared with an immediate, Thumb may materialize the constant in a low register for register-to-register `cmp`.
- agbcc CSEs loads, merges shifts/blocks, and reuses related constants; if the target stays unfolded, block the proof with grouping or distinct locals.
- Array decay produces an address while `array[0]` produces a scalar load; choose the shape shown by the target.

## Loops

- `while (n-- != 0)`, decrement-before-test, `do/while`, and top-tested `while` are distinct; a top-tested loop may emit body first with an entry branch.
- Signed and unsigned post-decrement can differ even when both end in `bne`; test both when one form introduces an unwanted `-1` sentinel.
- `u32 n = count; while (n--)` naturally yields a compare-against-`-1` countdown and fits counted list walks; do not hand-write the sentinel unless the diff requires it.
- Variable-size record walks should advance a byte cursor by each record's runtime size; array indexing falsely implies a fixed stride and changes liveness.
- Loop reversal accepts signed `<`/`<=` forms and emits a countdown to zero; unsigned `<` and `!=` generally remain ascending.
- Do not assume an eligible ascending loop actually reverses; if experiments stay ascending, retain the explicit matching countdown source.
- A target rotated search CFG may not come from plain `while` or `for (;;)`; spell the entry test and bottom break explicitly when proven.
- If the target reloads a global loop limit each iteration, keep the global expression in the condition instead of caching a local bound.
- Moving an increment into or out of a branch changes the CFG even when semantics agree; preserve the lexical placement shown by the target.

## Switches and branches

- Condition spelling picks branch polarity and fall-through: early return, nested `if`, and result-variable forms are not interchangeable.
- Preserve redundant-looking compares when present; identical function size alone does not validate branch targets.
- Switch case order controls block and jump-table layout; empty cases can preserve a table while sparse cases may become compares.
- Identical case bodies may merge; an unsigned normalized dispatch expression can sometimes restore the expected table form.
- If each switch arm loads a global only after dispatch, use case-local aliases or direct global access; a shared pre-switch alias changes dispatch liveness and load order.
- A search whose success/return block is hoisted above the loop usually comes from a plain top-tested `for` with an early `return` inside (and any `NULL` guard as an early return before it); try that before a `found` flag + `break`, and never a nested `if (i < n) do { } while`.

## Pointers, globals, and aliasing

- Direct global access can still leave `&global` live in a saved/high register; do not invent a pointer-to-global alias merely to explain reuse.
- Keep `base = global` when the target loads it before clamps/branches or keeps derived addresses live; otherwise test direct global access first.
- Decisive test: a global pointer's *value* still in a register after a `bl` (no reload) ⇒ the source copied it into a local before the call (the compiler may not keep a global live across calls). A fresh `ldr` of the global after each call ⇒ direct `global->` access.
- Cache only the expression whose lifetime is proven; mixing a scoped local with direct accesses can preserve both a distinct value and target reloads.
- If one global aggregate supplies several nested subobject addresses across calls, cache its pointer and any proven subobject pointers; repeated chains alter reloads and saved-register lifetimes.
- A `strb` through a typed object may force later global-pointer reloads because agbcc treats byte stores as broadly aliasing; do not use `volatile` to fake it.
- Long-lived global addresses consume callee-saved registers and can push incoming arguments into higher registers; preserve the source access pattern.
- Global addresses may be loaded separately or derived from a nearby loaded address with `add`/`sub`; mirror whichever shape the target shows.

## Stack and frame shape

- agbcc accepts GNU VLAs even with a local `const` bound; they can fold the byte count yet retain a second, late stack adjustment that a fixed array merges into the main frame.
- A `const` bound can also eliminate a live maximum or turn a register comparison into an immediate one; compare the whole frame and loop setup.
- A variadic definition saves argument registers even with an empty body; wrong arity or prototype changes stack arguments and frame size.

## Structs and fixed layout

- Struct members and raw byte offsets can produce different address temporaries; if a typed field doesn't match, the field's type/width or the struct nesting is wrong — fix the layout, don't fall back to byte arithmetic.
- Overlay only proven fields and preserve all padding; a correct offset with the wrong type still gives the wrong access width.
- A field that is both compared/stored as a word and dereferenced is a pointer — type it so; don't invent unions. A field accessed at two widths is usually two adjacent narrower fields (a byte read at +0 of a halfword = `unk8 a; unk8 b;`), not a union.
- An opaque region only passed by address is naturally `unk8 region[N]`; a scalar member there introduces an unwanted load.
- Allocation/resource handles with repeatedly accessed address, size, or owner slots should be typed structs; returning or passing the usable address often means accessing the first pointer member.
- Out-parameter bundles of related pointers, tables, and counts should use one typed address-table struct; field offsets and pointee types determine loads and liveness.
- Repeated fixed-stride records are naturally an array of structs; this gives honest field widths and pointer/index arithmetic.
- After splitting or nesting a fixed-layout struct, verify `sizeof` and every later offset; natural tail padding can shift unrelated code and pools.
- Retyping fixed globals must preserve both accessed width and total byte extent, especially in address-pinned RAM layouts.

## Calls and ABI

- Prototypes affect both sides: parameter widths select call-site conversions, while definition widths control entry normalization and allocation.
- Calls without a prototype use default promotions; arguments after r0–r3 go on the stack, so wrong arity changes the frame.
- Direct calls emit `bl`; function-pointer lvalues emit a load plus `_call_via_rN`; match the indirection level.
- Pass direct function names before adding explicit Thumb-bit arithmetic; relocation handling may already encode the callable address.
- Passing a call result directly versus storing it in a local can differ by a `mov` and by how long the value remains live.
- A call result forwarded into an argument register for the next `bl` proves that source dataflow; preserve it rather than substituting `NULL` or a reload.
- Mixed pointer types in `?:` can warn or lower differently under old agbcc; a `void *` temporary can preserve a common call after an explicit branch.
- Replacing `void *` with a proven typed pointer can remove casts without changing bytes, but verify pointee width and conversion placement.
- Keep dead-looking calls, divisions, readbacks, and copies that asm shows; optimizer-visible useless work may have existed in source.

## Literals, object layout, and relocation noise

- Pool reach and placement follow preceding code size and block layout; never chase pool offsets before fixing the first code difference.
- Inline strings can be emitted in a function's trailing literal pool; use inline literals when address order supports that shape.
- `.word` number-versus-symbol differences can be relocation-display noise; compare resolved bytes and use the full-ROM SHA1 as authority.
- Replace an assembly inclusion in its original source position; moving a C definition within the translation unit shifts everything after it.
- Mid-TU alignment directives may be no-ops because functions are already aligned; EOF zero-fill can still differ from assembler NOP padding.

## Zeroing and volatile

- A shared zero register does not prove a source zero local; direct `= 0` assignments can be CSE'd to one register.
- A fresh `mov #0` immediately before pointer clears favors direct `NULL` stores; a shared zero local may suppress that materialization.
- `= {0}` or `memset` may become a library call; explicit fields or a plain `int` loop can produce inline stores or a pointer walk.
- `volatile` preserves only the marked hardware access or readback; it does not order ordinary work and is not a register-allocation tool.

## Matching process

- Start with dump, hosting translation unit, declarations, and every caller; use mechanical decompilation only as a semantic draft.
- Change one source-shape variable at a time and inspect the prologue plus first divergent instruction before interpreting later noise.
- Verify every instruction and branch target, then run the full-ROM SHA1 compare; a local function match is insufficient when layout changed.
- Treat raw-decomp and reviewer claims about types, layout, or "natural" source as hypotheses; verify them against assembly, controlled experiments, and ROM bytes.
