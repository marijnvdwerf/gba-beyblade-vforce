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
- When consumers of one halfword field include both `ldrsh` and `ldrh`, the signed load is positive evidence for a signed declaration even if other contexts zero-extend it; do not decide by majority opcode alone.
- `lsl #16; asr #16` versus `lsl #16; lsr #16` → signed versus unsigned halfword normalization; `#24` pairs do the same for bytes.
- Default to `unk8/16/32`; use signed types only on evidence, because one wrong sign produces one wrong branch or shift opcode.
- Narrow locals insert normalization pairs; wide locals remove them. A plain `int` index often matches where `u8`/`u16` adds masking.
- A dedicated `unk16` conversion temporary can preserve zero-extension and keep a narrowed compare value separate from its wide source; a wider temporary may coalesce them and change saved-register allocation.
- Cast placement is conversion placement: keep a producer wide and cast or assign narrow only where the target performs the conversion. A narrowing cast in a comparison adds normalization before `cmp`; if the target has only arithmetic plus `cmp`, keep the count/index wide there.
- Staging a narrow field in a signed `s32` temporary can keep arithmetic wide and delay normalization until the result is narrowed; using the field directly may reorder the add or conversion.
- Entry normalization proves narrowing at entry, not a narrow formal parameter; try a wide ABI parameter assigned or cast to a narrow local. Conversely, a genuinely narrow formal tested for truth can emit the low-byte shift/test at entry without explicit source shifts.
- Promotion chooses shifts: an unsigned intermediate yields `lsr`, while a signed intermediate yields `asr`, even with identical stored width.
- Lvalue type selects `ldr`/`str`, `ldrh`/`strh`, or byte access; trust the opcode over the field's apparent semantics.
- A cast that changes a field read from zero-extension to sign-extension (or vice versa) proves the view needed by that consumer, not automatically the canonical declaration. Prefer the declaration proven by established users; retain a per-use cast only when a controlled comparison proves the alternate signedness access.
- agbcc can emit `ldrsb`: a signed `*ptr++` directly in a loop condition or call argument may select `mov #0; ldrsb`, while staging the read and increment separately can select `ldrb` plus sign-extension shifts. Preserve the dereference context instead of assuming signed-byte loads always lower one way.
- A return prototype drives caller normalization, while the definition's declared return type also shapes the callee. In particular, an `s16` declaration can add sign-normalization inside the callee even when the target callee returns without it; diagnose caller and callee diffs separately rather than assuming one declaration explains both.
- Decide parameter widths from matched callers as well as the definition. A caller-side `lsl #16; lsr #16` immediately before a call is positive evidence for an `unk16` prototype even when the callee body alone is ambiguous; update the declaration and all callers together.
- Pointer→integer conversion and an integer identity cast can create different RTL despite both being 32-bit; preserve the proven global type.

## Locals and register pressure

- Read the prologue, push mask, frame size, and which value is spilled first. If the draft saves more registers or has a larger frame, suspect an unintended cached alias or extra live pseudo; if the target saves more or has a larger frame, recover the missing long-lived value or explicit stack lifetime before chasing downstream instructions.
- Values live across calls prefer callee-saved registers or spills; one extra live value across one call can change the push mask or spill slot. A target that retains an incoming or normalized value in a callee-saved register where the draft reloads it points to a missing source local/lifetime, not a semantic mismatch.
- Keep explicit cursor/count/end temporaries when the target keeps distinct values, including separate count and loop-limit copies when the bound occupies a different register; remove them when the target reloads or coalesces instead.
- A separate successor temporary can keep a moving cursor and freshly loaded pointer in distinct registers: `candidate = cur->next; next = candidate;`.
- A scalar temporary can force one field/byte load that is reused by multiple tests, or place that load before a later initialization; removing it may duplicate or reorder instructions.
- Open problem: reading a byte field once into a temporary can produce one signed load and reuse, while rereading the field can produce an unsigned load plus later normalization; if natural lifetime variants do not match, do not turn this observation into a field-typing rule.
- A separate result or magnitude temporary can preserve the original argument for a later sign test while the transformed value occupies the return-value path; an in-place rewrite changes that dataflow.
- Assignment and initialization order set live-range boundaries and address-materialization order; spell them in target order.
- In `.greg`, global-allocation priority is roughly `refs / live_length`: more references help, while a longer-lived pseudo gets lower priority; use this to explain saved-register choices.
- For a pure register-role swap, declaration order, scopes, signedness sweeps, and equivalent VLA-bound spellings often do not change allocator rank. Compare `.greg`, then vary the creation/use order or the lifetime that crosses a call or branch; if the same swap survives those natural probes, park it rather than churning permutations.
- Nested scopes shorten lifetimes, but a switch-arm-local pointer also defers its global load until that arm; hoisting it changes dispatch allocation.
- Reuse one compatible local across similar loops when the target preserves one pseudo/register history; separate locals may reshuffle both loops.
- Conversely, keep initial-pointer and mutable-cursor locals separate when the target keeps both roles live in different registers.
- A redundant-looking temporary — including a local alias of a global pointer or a separate `size`/count local — can add the exact pseudo pressure needed, or an unwanted save; keep it only when the target proves the distinct lifetime, and judge it by the prologue and first divergence.
- Alias removals interact: one failed simplification may match after another alias is removed, so probe combinations while checking the first divergence.
- Early `result = 0` or a real 0/1 flag can reproduce early return-register setup and later separate tests; do not fold proven source state away.

## Expressions and store shape

- Stage pointer arithmetic when asm stages base, displacement, and scaled index separately; a folded expression invites reassociation or indexed loads.
- Typed-pointer addition scales by the pointed-to type; a `base + i * SIZE` walk is an array of SIZE-byte structs — declare it and index, never `(unk8 *)` arithmetic in final code.
- Runtime offset tables into packed or variable-size blobs legitimately use `(unk8 *)base + offset`; do not force them into fixed-stride arrays.
- Commutative operand order is visible in load and `add` order; write the target's expression-tree order.
- `field += 1`, compute-then-assign, and read-modify-write through an explicit accumulator are distinct source shapes.
- Precomputing one branch's value, conditionally overwriting it, then storing once produces a different CFG and store shape from an `if/else` with a store in each arm.
- A pre-decrement embedded in an array subscript can reuse the wide subtraction result for both the field store and index, forcing byte normalization before scaling; a separate decrement followed by a byte reload may collapse to a simple scaled index.
- Straight-line struct initialization preserves lexical store order; chained assignment stores right-to-left and keeps the value live, while splitting it can reverse stores or add a `mov`.
- `*out++ = value` can select `stmia`; a separated store and increment selects `str` plus `add`.
- A target induction initialized to `-stride` may be strength-reduced `array[i - 1]`; try the indexed source before preserving a negative cursor.
- Constant spelling matters: staged forms such as `mask = 1; mask = -mask;` or `scale = 0x80; scale <<= 1;` can force the target `mov`/`neg` or `mov`/`lsl` materialization, while a direct large literal may use the pool; grouped multiplies may strength-reduce differently.
- Preserve add-versus-subtract spelling for constants: `frameCount + 0xFFFF` is not interchangeable with `frameCount - 1`; old agbcc can materialize and combine them differently.
- Signed `a * b / 256` truncates toward zero: agbcc can lower it as `mul`, copy/test the product, add `255` only when negative, then arithmetic-shift by eight. With an `s16` result, the divide and narrowing may combine into `lsl #8; asr #16`; a target copy that natural C coalesces can indicate a second product lifetime, not a different division formula.
- Shift-pair extraction of a field should first be read as bitfield access, not a source shift dance. In measured agbcc output, a 10-bit field at bit 0 of a halfword lowers to `ldrh; lsl #22; lsr #22`; a 4-bit field at bit 0 of a byte lowers to `ldrb; lsl #28; lsr #28`; a 4-bit field at bit 4 lowers to `ldrb; lsr #4`; and a 6-bit field at bit 10 lowers to `ldrb` from the next byte followed by `lsr #2`. Bitfield writes use a width-preserving read-modify-write: mask the input, preserve the other bits, combine, then store at the allocation unit's width. Compound `|=` and `&=` first read and extract the field, apply the operation, then shift/mask and merge it back; they do not lower like a plain assignment. For non-bitfield code, shift-pair extraction can still differ from masking: `(u32)(x << 22) >> 22` may avoid the literal-pool load introduced by `x & 0x3FF`, and `(x << 28) >> 28` may normalize differently from `x & 0xF`. Keep the form proven by the target.
- If a high-register value is compared with an immediate, Thumb may materialize the constant in a low register for register-to-register `cmp`.
- agbcc CSEs loads, merges shifts/blocks, and reuses related constants; if the target stays unfolded, block the proof with grouping or distinct locals.
- Array decay produces an address while `array[0]` produces a scalar load; choose the shape shown by the target.
- Let typed indexing expose cancellation between an explicit element-size division and the compiler's implicit scale; manually replacing it with shifts and masks can prevent simplification and add instructions.
- `ptr[i + k]` on a pointer variable can scale `i` and fold constant `k` into the load displacement, while indexing an embedded array member may scale the whole `i + k` before adding its base. Use the source shape shown by the target address sequence.
- Bit extraction and mask tests are not interchangeable: `(x >> 4) & 1` preserves a shift-plus-`and` shape (with `asr`/`lsr` selected by type), while `(x & 0x10) != 0` favors a direct mask/test and can change the CFG.

## Loops

- `while (n-- != 0)`, decrement-before-test, `do/while`, and top-tested `while` are distinct; a separate entry guard must remain when present and can make a following `do/while` semantically correct while changing prologue allocation.
- Signed and unsigned post-decrement can differ even when both end in `bne`; test both when one form introduces an unwanted `-1` sentinel, and keep an explicit `previous = n; n--;` when the target compares the old value separately.
- `u32 n = count; while (n--)` naturally yields a compare-against-`-1` countdown and fits counted list walks; do not hand-write the sentinel unless the diff requires it.
- Variable-size record walks should advance by the current record's runtime size, e.g. `ptr = (Record *)((unk8 *)ptr + ptr->size)`; array indexing falsely implies a fixed stride and changes liveness.
- Loop reversal accepts signed `<`/`<=` forms and emits a countdown to zero; unsigned `<` and `!=` generally remain ascending.
- Do not assume an eligible ascending loop actually reverses; if experiments stay ascending, retain the explicit matching countdown source. Likewise, keep a proven descending index with a forward-moving cursor when indexed or ascending rewrites produce a different loop.
- A target rotated search CFG may not come from plain `while` or `for (;;)`; spell the entry test and bottom break explicitly when proven.
- If the target reloads a global loop limit each iteration, keep the global expression in the condition instead of caching a local bound.
- When a fixed small sequence appears as individual calls or stores, write it unrolled; a source loop can introduce induction registers or `stmia`/`ldmia` combining that the target lacks.
- Open problem: a target may reload a non-volatile struct field every iteration despite no call or aliasing store, while plain C hoists it. `volatile` can reproduce the reload but is not canonical; treat this as unresolved rather than a general typing rule.
- Moving an increment or decrement into or out of a branch changes the CFG even when semantics agree. In particular, keep a countdown update after an early-return arm inside the branch that continues the loop rather than hoisting it before the branch.

## Switches and branches

- Condition spelling picks branch polarity, fall-through, and tail merging: early return, nested `if`, an equivalent combined Boolean, and result-variable forms are not interchangeable. When the target has a branch ladder feeding one shared body, preserve that nesting and shared-body placement.
- In old GCC, a value-less `return;` in a non-void function can reproduce fall-through to the epilogue with `r0` still holding the just-tested value; use it only when that undefined return path is proven by the target.
- Preserve redundant-looking compares when present; identical function size alone does not validate branch targets.
- Switch case count controls lowering and block layout. For a jump-table switch, agbcc sorts table entries by selector value but emits case bodies in source order, so order the source cases to match the target's body layout. Sparse switches may become compare trees, and an otherwise empty high case plus `default` can cross a threshold where agbcc pivots on a middle value and uses an unsigned range branch for lower cases.
- Identical case bodies may merge; an unsigned normalized dispatch expression can sometimes restore the expected table form. Conversely, repeating an identical tail call in each arm can let agbcc tail-merge it naturally, avoiding a source `goto`.
- If each switch arm loads a global only after dispatch, use case-local aliases or direct global access; a shared pre-switch alias changes dispatch liveness and load order.
- Register-only divergences repeated across several cases usually point to lifetime or ordering: a temporary is scoped per case instead of hoisted (or vice versa), or two independent statements are lexically swapped.
- A search whose success/return block is hoisted above the loop usually comes from a plain top-tested `for` with an early `return` inside (and any `NULL` guard as an early return before it); try that before a `found` flag + `break`, and never a nested `if (i < n) do { } while`.

## Pointers, globals, and aliasing

- Direct global access can still leave `&global` live in a saved/high register; do not invent a pointer-to-global alias merely to explain reuse.
- A proven struct-pointer type can change alias analysis enough to reload a global's address where `void *` caches it across calls or loops; preserve the strongest justified pointee type before adding lifetime tricks.
- Keep `base = global` when the target loads it before clamps/branches or keeps derived addresses live; otherwise test direct global access first.
- Decisive test: a global pointer's *value* still in a register after a `bl` (no reload) ⇒ the source copied it into a local before the call (the compiler may not keep a global live across calls). A fresh `ldr` of the global after each call ⇒ direct `global->` access.
- Cache only the expression whose lifetime is proven; mixing a scoped local with direct accesses can preserve both a distinct value and target reloads.
- If the target reads a scalar field directly before later taking its address, preserve that order; taking the address first can hoist the derived pointer into a loop preheader.
- If one global aggregate supplies several nested subobject addresses across calls, cache its pointer and any proven subobject pointers; repeated chains alter reloads and saved-register lifetimes.
- A `strb` through a typed object may force later global-pointer reloads because agbcc treats byte stores as broadly aliasing; do not use `volatile` to fake it.
- Long-lived global addresses consume callee-saved registers and can push incoming arguments into higher registers; preserve the source access pattern.
- Global addresses may be loaded separately or derived from a nearby loaded address with `add`/`sub`; mirror whichever shape the target shows.
- Taking `&global.member` can fold the symbol plus member offset into one literal-pool relocation. Loading a member at a large offset instead typically materializes the global base and a second offset literal before the load; small encodable offsets hide this distinction.
- A direct literal for an interior address is therefore not evidence of a separate global. Typed record/subobject aliases such as `T *record = &table[i]` or `T *part = &aggregate.member` are legitimate source when the target keeps that address live; do not generalize this into a pointer alias to a scalar global merely to force callee-saved retention.

## Stack and frame shape

- agbcc accepts GNU VLAs even with a local `const` bound; they can fold the byte count yet retain a second, late stack adjustment that a fixed array merges into the main frame.
- A `const` bound can also eliminate a live maximum or turn a register comparison into an immediate one; compare the whole frame and loop setup.
- A variadic definition saves `r0`–`r3` and emits the ABI frame even with an empty body; wrong arity or prototype changes stack arguments and frame size.

## Structs and fixed layout

- Struct members and raw byte offsets can produce different address temporaries; if a typed field doesn't match, the field's type/width or the struct nesting is wrong — fix the layout, don't fall back to byte arithmetic.
- Overlay only proven fields and preserve all padding; a correct offset with the wrong type still gives the wrong access width.
- Declaration width also imposes alignment: a halfword or word global cannot model storage proven at an odd byte address without shifting later fixed-layout symbols. Use byte storage for byte-addressed globals at odd offsets, even if some consumers combine bytes.
- A field that is both compared/stored as a word and dereferenced is a pointer — type it so.
- Later shifts, masks, or division do not narrow a field's memory access. If assembly proves the same scalar storage is intentionally accessed at incompatible widths (`strh`/`ldrb`, `ldr`/`ldrsh`), model a documented whole/parts union. If one stored pointer is dereferenced at multiple proven pointee widths, use a named union of typed pointer variants. These proven width puns are the only sanctioned union uses; otherwise, prefer adjacent narrower fields.
- Under old agbcc, `union __attribute__((packed)) { u16 word; u8 b[2]; }` is a byte-neutral two-byte whole/parts overlay; the unpacked union is not. A nested two-byte struct arm also makes the union four bytes, so use a byte-array arm for proven two-byte storage and verify `sizeof` plus every following offset.
- A proven halfword read spanning adjacent byte fields may require a documented pointer cast when introducing a named union would disturb the fixed layout; C90 offers no anonymous union as a zero-friction overlay.
- One shared declaration may be unable to reproduce both signed and unsigned consumers. Preserve the type proven by established matched users, and keep a per-use cast only when a controlled comparison reproduces the alternate load; otherwise park the incompatible function rather than breaking a match.
- An embedded header whose address is passed to list helpers must be an embedded struct field, not a pointer; the pointer spelling changes layout and cleanup codegen.
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
- Passing a call result directly versus storing it in a local can differ by a `mov` and by how long the value remains live. In particular, `tmp = call(); global = tmp;` can materialize `&global` after the call, while `global = call();` may preload the address into a callee-saved register.
- A call result forwarded into an argument register for the next `bl` proves that source dataflow; preserve it rather than substituting `NULL` or a reload.
- An argument identical to a value just produced or stored may be reused directly from its current argument register; preserve the exact value flow instead of independently rematerializing the argument.
- Mixed pointer types in `?:` can warn or lower differently under old agbcc; a `void *` temporary can preserve a common call after an explicit branch.
- Replacing `void *` with a proven typed pointer can remove casts without changing bytes, but verify pointee width and conversion placement.
- Keep dead-looking calls, arithmetic, divisions, readbacks, and copies that asm shows; a dead result may still expose original operation order or constant construction. If agbcc eliminates every natural C spelling, park the function rather than force retention with `volatile`, fake guards, or register hacks.

## Literals, object layout, and relocation noise

- Pool reach and placement follow preceding code size and block layout; never chase pool offsets before fixing the first code difference.
- Inline strings can be emitted in a function's trailing literal pool; use inline literals when address order supports that shape.
- `.word` number-versus-symbol differences can be relocation-display noise; compare resolved bytes and use the full-ROM SHA1 as authority.
- agbcc safely folds floating constants in file-scope initializers: a fixed-point macro such as `(u32)((x) * 65536.0)` can reproduce exact 16.16 table bytes without precomputing integer literals.
- Give hand-written assembly data tables `.size sym, . - sym`; this leaves bytes unchanged while exposing the table extent to ELF-aware tools.
- Replace an assembly inclusion in its original source position; moving a C definition within the translation unit shifts everything after it.
- Mid-TU alignment directives may be no-ops because functions are already aligned. When a translation unit's ROM tail is `00 00` but the assembler emits Thumb NOP padding (`C0 46`), place `ASM_ZEROPAD` at EOF.

## Zeroing and volatile

- A shared zero register does not prove a source zero local; direct `= 0` assignments can be CSE'd to one register.
- When the target keeps one typed zero value live across two pointer-field clears, reusing a local such as `T *zero = NULL;` can preserve the required pseudo and allocation where two direct `NULL` stores do not.
- A fresh `mov #0` immediately before pointer clears favors direct `NULL` stores; a shared zero local may suppress that materialization.
- `= {0}` or `memset` may become a library call; explicit fields or a plain `int` loop can produce inline stores or a pointer walk.
- `volatile` preserves only the marked hardware access or readback; it does not order ordinary work and is not a register-allocation tool.

## Matching process

- Start with dump, hosting translation unit, declarations, and every caller; use mechanical decompilation only as a semantic draft.
- For a signedness sweep, establish an all-unsigned (width-only `unk*`) baseline, then re-sign one field, local, or parameter at a time only where `asr`, `ldrsh`/`ldrsb`, or a signed branch supplies evidence; compare the complete function after each change because signedness can also reshape allocation.
- Change one source-shape variable at a time and inspect the prologue plus first divergent instruction before interpreting later noise.
- Prefer correcting types, casts, scopes, and expression shape over compiler-flag workarounds: a pass toggle that fixes one register allocation often changes another loop or load. Use flags diagnostically unless the original build settings justify them.
- Verify every instruction and branch target, then run the full-ROM SHA1 compare; a local function match is insufficient when layout changed.
- Treat raw-decomp and reviewer claims about types, layout, or "natural" source as hypotheses; verify them against assembly, controlled experiments, and ROM bytes.
- A semantic draft parked under `#if 0` is absent from the object but still visible to source-based callgraph tooling, so its callees can appear reachable. Distinguish compiled reachability from callgraph-parser reachability before selecting work.
- If natural C is semantically and structurally correct but a stable residual is only register allocation after justified type, lifetime, and ordering experiments, preserve the assembly rather than add volatile qualifiers, artificial temporaries, or forced control flow.
