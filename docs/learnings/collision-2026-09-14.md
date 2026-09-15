# sub_80567E4 (0x080567E4, src/collision.c)

Projects an actor onto a geometry line along the axis selected by `line->unk11 & 2`: signed offset from the start point, per-axis slope bytes, interpolated height `z0 + (unk12 * relative >> 8)` clamped to the endpoint heights, and an in-range flag. Matched with no casts.

## Types (separate commit, ROM-neutral with the asm build)
- `GeometryLine.unk11` is a flags byte, not four bitfields. The target computes `ldrb [line,#0x11]; and #2; lsl/lsr #24` into a stored byte (0/2). The `unk11_1` bitfield read gives `lsl #30; lsr #31` (29 rows). Other users (riderphysics.c, geometry.c, collision.c) were truth tests and stay exact as `(unk11 & mask)` tests. `unk12` is `s16` (`mov #18; ldrsh`).
- `CollisionResult.unkC` is the byte allocation unit for bitfields `unkC_0` (1 bit, axis), `unkC_1` (1 bit, in range), and `unkC_2` (6 bits, currently unaccessed). The target's clears are `mov #2; neg` / `mov #3; neg` (QImode -2/-3). `unk8 unkC` with `&= ~1` gives `mov #254`; `s8 unkC` fixes the constants but turns sub_8056610's `(unkC & 2) == 0` extraction into `asr`. Single-bit bitfield stores give the target constants, and sub_8056610 stays exact reading `unkC_1`/`unkC_0`.
- `CollisionResult.unk0`/`unk4` (`unk32`) and `unkF` were split out of padding. The two offsets are only written by the currently typed collision users; unsigned/unknown declarations are byte-identical across every user checked, with no signed load, signed branch, or call-site evidence.

## Shape
- Debugging leftover, byte-required: the other-axis endpoint coordinates `other0 = point0->x << 5; other1 = point1->x << 5` (swapped for the other axis), plus a dead min/max swap `if (other0 > other1) { temp = other0; other0 = other1; other1 = temp; }`. The swap compiles away, but the `<< 5` loads stay in sl/r9, as in the target.
  - Removing the swap entirely gives 72 rows.
  - With the swap directly after the axis branch (the parked draft's position), the other values die early and `direction` takes r9 (20 rows).
  - Any position after the z-sort block gives 11 rows; kept it immediately after the z-sort.
- Byte-required statement order in the swapped z-sort arm: `z1 = point0->z << 5;` before `z0 = point1->z << 5;` (11 → 0 rows).
- Byte-required local: `range`.
- Folded, byte-neutral: the `direction` local (tested as `(line->unk11 & 2) == 0`).
- `relative` also folds byte-identically, but it has four uses; kept for readability.
- `result->unkD = 0` in the first arm is byte-identical to storing the tested value; kept the literal.

# sub_8056ADC (0x08056ADC, src/collision.c)

Evaluates the cubic Bezier depth of a geometry line at `t` (10-bit fixed point): endpoints `point0->z << 5` and `point1->z << 5`, control offsets `unk1C << 5` and `unk12 << 5`, and three de Casteljau lerp rounds `x + (((y - x) * t) >> 10)`. It has no callers in the ROM. Matched first try with no casts.

- Byte-required: the control offsets as named locals `d1`/`d2`, used directly in the first-round lerps: `a = z0 + ((d1 * t) >> 10)` and `c = c + ((-d2 * t) >> 10)`. The target keeps `unk12 << 5` in its own register and negates it in place.
  - Folding `d1` (with `(b - z0)` as the first lerp difference) gives 18 rows. Folding `d2` (with `(z3 - c)`) gives 25.
- Byte-required: the `z3` local (folding it into `c` gives 8 rows) and the `point1` local (folding it gives 57).
- sub_8056910 contains the same Bezier inline, and this idiom is also what its code needs.

# sub_8056910 (0x08056910, src/collision.c)

Curved-line version of sub_80567E4. It projects the actor onto the axis picked by `line->unk11 & 2`, sorts the endpoints on that axis, and computes an interpolation factor `t` from `unk1A`. The slope is lerped from `unk18` to `unk19`. The height is a clamp to the lower/upper endpoint z, or a cubic Bezier in z (same curve as sub_8056ADC). Matched with no casts, no loops and no dead code.

- Byte-required: a separate local for every de Casteljau level, `q0/q1/q2` then `r0`, with the final `r1` lerp folded directly into the result store.
  - Reusing three accumulators (`a = a + ...`, the sub_8056ADC style) generates the same instructions per statement but gives 81 rows. Every Bezier use of `t` then goes through fewer long-lived locals, so global-alloc orders `t` after the start coordinates and gives it r6 instead of r5, and everything downstream shifts.
  - Writing each level into its own local was also what three independent clean-room rewrites (subagents given only a behavioural spec, no asm) did.
  - Folding `r1` into the final lerp is byte-neutral and is the retained source form.
- Byte-required: the control offsets `d1 = unk1C << 5` / `d2 = unk12 << 5` as locals, used directly in the first-level lerps `q0 = p0 + ((d1 * t) >> 10)` and `q2 = p2 + ((-d2 * t) >> 10)`. Folding `d1` gives 62 rows; folding `d2` gives 57.
- Byte-required: per-axis end coordinates `y1`/`x1`. A shared `end` gives 117 rows. The start coordinates `y0`/`x0` may be shared byte-identically; they are kept per axis for symmetry.
- Byte-required: `s16 value` (3 rows as `unk16`). The negation then lowers to the target's `lsl #16; neg; lsr #16`.
- The actor coordinate is written out twice per arm: once for `relative` (to point0) and once for `position` (to the sorted minimum). gcse keeps the address, `actor->y` and `unk44` loads and re-reads `unk9C` at the shared tail, so only one copy of the tail survives cross-jumping.
- Target evidence for the arm structure: both axis arms branch into one shared set of sort copies and one position recompute. That is cross-jumping of identical per-axis tails, not a second direction test.
- Diagnostics that found the fix, for this class of residual (identical instructions, one register-role swap cascading):
  - An instrumented old_agbcc that logs global.c `find_reg` decisions (priority refs/length, used set, regs_someone_prefers, full preferences, conflicts) and can override allocno priority per pseudo.
  - Here the whole residual was `t` taking r6 because pass 0 prefers already-used registers. Forcing `t`'s priority above `y0/x0`, dropping r5 from its someone-prefers set, or adding an r6 conflict each gave byte-identical output. That proved the source was otherwise right and only the local structure around `t`'s uses was wrong.
  - Loop notes (`do { } while (0)`) also reproduce the match by doubling reference weights. That is a diagnostic only, not source.

# sub_80561EC (0x080561EC, src/collision.c)

Per-line collision dispatcher for with-bounding-area lines. It builds the line's x/y bounding box, optionally rejects actors outside it (flag 8), then switches on the line type:
- priority lines (0x80, 0x92 diagonal)
- surface samples (0x8A, 0x8D and default: straight or curved, then sub_8056610)
- trigger 0x8B
- height gates 0x8C (the only explicit `return 0`) and 0x8D
- rider assignments 0x94/0x97

Matched with no casts in the function.

## Types (separate commits, ROM-neutral with the asm build)
- `GeometryLine.unk16` is `s16`: the 0x80 compare and the 0x8C `<< 3` offset use `ldrsh`. initRiders keeps its zero-extended reads through an `unk16 lineType` local and `(line->unk16 & 0xFFFF) - 1` for the initRider argument (12 rows without it).
- `GeometryLine.unk8` is `unk16`: 0x94 copies it with `ldrh`. initRiders indexes `Unk_874CC3C` with `line->unk8 & 0xFF` on both indexes, keeping its `ldrb` (1 row without it). A `u8 direction` local assigned in its own statement moves the table-address load (2 rows). Assigning it inside the first subscript, `Unk_874CC3C[direction = line->unk8]`, also matches.
- `CollisionResult` moved into common.h so `RiderBase.unkF4` can embed it. Also added `RiderBase.unk68` (`GeometryLine*`), and typed `withBoundingAreas` as `GeometryLine*` (sub_80561A0/sub_80561EC take `Actor*`, `LevelGeometryAddresses*`).

## Shape
- Byte-required: test `line->unk11 & 8` / `& 4` directly instead of caching the flags byte in a local.
  - gcse keeps the byte in a QImode copy. That copy gets no register and is spilled to `[sp, #0x80]` with the target's `strb`/`ldrb`.
  - An `unk8 flags` local is promoted to an SImode pseudo. It takes r3 and shifts every register role (66 rows).
  - A one-byte local struct gets the memory form but the wrong store order (72).
- Byte-required: a separate lower-point local per case (`lowerB`, `lowerC`, `lowerD`), each chosen with an explicit if/else, not default-then-if or a ternary.
  - jump.c turns each if/else into "assign the else value, conditionally overwrite", with the copy after the z loads. That is the target's `mov r2, r9` / `add r3, r1, #0` placement.
  - The best default-then-if mix was 33 rows.
- Byte-required: separate point locals in 0x8C (`firstC/secondC`) and 0x8D (`firstD/secondD`), re-looked-up from `geometry->unk4`.
  - The 0x8D first point must be its own pseudo so it lands in ip.
  - Reusing `point0/point1` in 0x8D gives 63 rows. Sharing one first/second pair across 0x8C and 0x8D gives 177.
- Byte-required: in 0x8C, the zero test reads `line->unk16` through the `unk16 height` local (`ldrh`), while the offset uses the `s16` field directly (`ldrsh`). Testing the field directly gives 4 rows.
- Byte-required: separate stack `CollisionResult` locals for the scratch, 0x80 and 0x92 samples, in that declaration order (sp+0, +0x28, +0x50). Declaring them inside case blocks is byte-identical; kept at function scope.
- Folded, byte-neutral: the `active` local for `RiderHasFlag(rider, 0x400)`. `actor->unk48 = 0` is identical to storing the tested zero.
- The `b` trampolines in the 0x8C crossing test are far-branch artefacts of function size, not source structure.
- Method: the allocation log from the instrumented compiler showed the flags byte and the 0x8D point had to lose registers (spill, ip). The three shape grids above (flags spelling, selection form × per-case locals) then found the source. Clean-room subagent rewrites (152–199 rows) didn't help directly here.


# Fix-up measurements (2026-09-15)

## Signedness and width blockers

- `CollisionResult.unk0` and `unk4`: each unsigned/unknown rebuild was compared across all users found by searching the changed fields. The users only store these four-byte values (`str` at result offsets `+0` and `+4`); there is no signed load, signed branch, or typed call-site evidence. The `unk32` forms are byte-identical, so both fields remain `unk32`, not `s32`.
- `GeometryLine.unk19`: `sub_8056910` (`0x08056910`) loads `line + 0x19` with `ldrb` at function offset `+0xEE`, then performs `lsl #24` at `+0xF0` and `asr #24` at `+0xF2`. This is the target's signed-byte conversion, so `unk19` remains `s8`.
- `GeometryLine.unk1C`: `sub_8056910` loads `line + 0x1C` with `ldrsh` at `+0x16A` (the index setup is `mov #28` at `+0x168`). `sub_8056ADC` sets the index with `mov #28` at `+0x2A` and loads the same field with `ldrsh` at `+0x2C`. The field remains `s16`.
- `sub_8056ADC` parameter `t`: the target multiplies the parameter and uses arithmetic right shifts, with the first `asr #10` at function offset `+0x3C` and repeated `asr #10` instructions through the remaining interpolation rounds. An `unk32` parameter changes these to logical shifts; `s32 t` is required.
- `sub_8056ADC` return: the function has no ROM callers that establish signed return semantics. Changing only the return declaration from `s32` to `unk32` is byte-identical, so the shipped return type is `unk32`; no signed return claim is made.

## `CollisionResult.unkC` bitfield evidence and relocation

`CollisionResult` was moved from `collision.h` to `common.h` so the embedded `RiderBase.unkF4` result uses one shared definition. The byte is declared as `unkC_0 : 1`, `unkC_1 : 1`, and `unkC_2 : 6`, all with the default `unk8` base type. In already-matched `sub_8056610` (`0x08056610`), bit 1 is lowered as `mov #2` at `+0x1A`, `ldrb result + 0x0C` at `+0x1C`, `and` at `+0x1E`, `lsl #24` at `+0x20`, `lsr #24` at `+0x22`, and `cmp` at `+0x24`; bit 0 is lowered as `mov #1` at `+0x74`, `ldrb` at `+0x76`, `and` at `+0x78`, and `cmp` at `+0x7A`. `sub_80567E4` (`0x080567E4`) performs the corresponding byte read/modify/write stores: clear bit 1 with `-2` at `+0x6C` through `+0x72`, set bit 0 with `mov #1`/`orr` at `+0xAA` through `+0xB0`, set bit 1 with `mov #2`/`orr` at `+0x10A` through `+0x110`, and clear both with `-3` at `+0x114` through `+0x11A`. These instructions prove the two one-bit views; `unkC_2` is the untouched six-bit remainder.

## Fold and alias measurements

Each candidate below was built and compared independently. “Retained” means the candidate changed code generation; the listed target/candidate pair is the first observed divergence. The first-divergence offset for the eight early `sub_80561EC` record-alias candidates was not preserved in the available measurement artifacts and is intentionally not invented.

| Candidate | Outcome |
| --- | --- |
| `sub_80561EC` `difference` inline | Retained; non-matching candidate, first offset not recoverable from the saved artifact. |
| `sub_80561EC` `lowerB` direct conditional record expression | Folded; ROM-neutral. |
| `sub_80561EC` `firstC` direct indexing | Retained; non-matching candidate, first offset not recoverable from the saved artifact. |
| `sub_80561EC` `secondC` direct indexing | Retained; non-matching candidate, first offset not recoverable from the saved artifact. |
| `sub_80561EC` `lowerC` direct conditional endpoint | Retained; non-matching candidate, first offset not recoverable from the saved artifact. |
| `sub_80561EC` `firstD` direct indexing | Retained; non-matching candidate, first offset not recoverable from the saved artifact. |
| `sub_80561EC` `secondD` direct indexing | Retained; non-matching candidate, first offset not recoverable from the saved artifact. |
| `sub_80561EC` `lowerD` direct conditional endpoint | Retained; non-matching candidate, first offset not recoverable from the saved artifact. |
| `sub_80567E4` `other0` loads removed/inlined | Retained; at `+0x0E`, target `mov r6, r2`, candidate `mov r7, r2`. |
| `sub_80567E4` `other1` loads removed/inlined | Retained; at `+0x0E`, target `mov r6, r2`, candidate `mov r7, r2`. |
| `sub_80567E4` dead other-axis swap removed | Retained; at `+0x02`, target `mov r7, r10`, candidate `mov r7, r9`. |
| `sub_80567E4` `z1` endpoint inlined | Retained; at `+0x0E`, target `mov r6, r2`, candidate `mov r7, r2`. |
| `sub_8056910` `y0` in the `relative` expression | Folded; ROM-neutral. `y0` remains for `difference`. |
| `sub_8056910` `x0` in the `relative` expression | Folded; ROM-neutral. `x0` remains for `difference`. |
| `sub_8056910` `lower` endpoint alias folded | Retained; at `+0x0A`, target `sub sp, #16`, candidate `sub sp, #20`. |
| `sub_8056910` `upper` endpoint alias folded | Retained; at `+0x0A`, target `sub sp, #16`, candidate `sub sp, #20`. |
| `sub_8056910` `relative` folded | Retained; at `+0x0A`, target `sub sp, #16`, candidate `sub sp, #12`. |
| `sub_8056910` `range` folded | Retained; at `+0x0A`, target `sub sp, #16`, candidate `sub sp, #36`. |
| `sub_8056910` `p3` endpoint folded into `p2` | Retained; at `+0x0A`, target `sub sp, #16`, candidate `sub sp, #24`. |
| `sub_8056910` `q0` folded into `r0` | Retained; at `+0x168`, target `mov r1, #28`, candidate `mov r0, #28`. |
| `sub_8056910` `q2` folded into the next interpolation | Retained; at `+0x18C`, target `neg r3, r3`, candidate `sub r0, r2, r1`. |
| `sub_8056910` `r0` folded into the final result | Retained; at `+0x16E`, target `mov r3, r10`, candidate `mov r2, r10`. |
| `sub_8056910` `r1` folded into the final result | Folded; ROM-neutral and retained in this form. |
| `sub_8056ADC` `point0` pointer folded | Retained; at `+0x0C`, target `ldr r1, [r4, #0]`, candidate `ldr r1, [r4, #4]`. |
| `sub_8056ADC` `point1` pointer folded | Retained; at `+0x00`, target `push {r4, r5, r6, lr}`, candidate `push {r4, r5, r6, r7, lr}`. |
| `sub_8056ADC` `z3` folded into `c` | Retained; at `+0x1C`, target `mov r1, r0`, candidate `mov r2, r0`. |
| Repeated `sub_80561EC` dispatch factored through one macro | Folded; ROM-neutral, with no differing instructions. |
| Duplicated Y-axis/X-axis tails in `sub_8056910` factored | Retained; at `+0x0A`, target `sub sp, #16`, candidate `sub sp, #12`. |

The accepted source therefore keeps the pointer/record aliases and de Casteljau levels that affect allocation, folds only `lowerB`, the `y0`/`x0` relative uses, and `r1`, and retains the dead-looking `other0`/`other1` loads plus swap because they shape register allocation. `q0`, `q1`, `q2`, and `r0` remain named levels; `r1` is not retained merely for symmetry.

# `CollisionResult.unkC` spelling matrix (2026-09-15)

## `RiderBase.unkF4` field mapping

`RiderBase` now embeds `CollisionResult unkF4;` instead of flat fields. The
previous flat names map onto the embedded result as: `unkF4`/`unkF8`/`unkFC` →
`unk0`/`unk4`/`unk8`; `unk100`–`unk103` → `unkC`–`unkF`; `unk104`/`unk106` →
`unk10`/`unk12`; `unk108`–`unk118` → `unk14`–`unk24`.

In `s_rider_804C4B4` (`0x0804C4B4`) the dead zero store at `rider + 0x100` is
written as `rider->unkF4.unkC_2 = rider->unkF4.unkC_1 = rider->unkF4.unkC_0 = 0;`.
agbcc collapses the chain to the target's single whole-byte `mov r0, #0` /
`strb r0, [r1]`. This replaces the earlier `unk100 >>= 8` dead self-shift, so
`s_rider_804C4B4` no longer needs a fakematch note.

## Target evidence at `sub_80567E4 + 0x6A`

The clear of bit 0 in the first axis arm is `mov r0, #2` at `+0x6A`,
`neg r0, r0` at `+0x6C`, `ldrb r1, [r5, #12]` at `+0x6E`, `and r0, r1` at
`+0x70`, `strb r0, [r5, #12]` at `+0x72`. The mask is the SImode constant `-2`,
which Thumb must materialise with `mov`+`neg`. The whole function is 298 bytes.

## Measured spellings with a plain `unk8 unkC`

Method: compile `src/collision.c` alone with the flags from
`build/compile_commands.json`, then byte-compare the symbol taken from the
object's `.symtab` (mask bit 0 of `st_value`; Thumb symbols are odd) against
`expected/CMakeFiles/rom.dir/src/collision.c.o`. 3816 combinations were swept
over clear spelling, set spelling, and every statement interleaving of the flag
group with the neighbouring `unkD`/`unkE` stores that preserves intra-group
order. None was exact.

| Clear spelling | Result |
| --- | --- |
| `result->unkC &= ~1` | `mov r0, #254`; function 296 bytes (2 short) |
| `result->unkC &= -2` | identical to `&= ~1`, 296 bytes |
| `result->unkC = result->unkC & -2` | identical, 296 bytes |
| `result->unkC &= ~1u` | identical, 296 bytes |
| `result->unkC &= 0xFFFFFFFE` | identical, 296 bytes |
| `result->unkC = result->unkC & ~1u` | identical, 296 bytes |
| `flags = ~1; result->unkC &= flags;` | `mov r0, #2` / `neg r0, r0`, 298 bytes; first divergence `+0x076` |
| `flags = result->unkC & ~1; result->unkC = flags;` | same instructions, 298 bytes; first divergence `+0x076` |
| `flags = result->unkC; flags &= -2; result->unkC = flags;` | same instructions, 298 bytes; first divergence `+0x076` |
| `temp = 2; temp = -temp; result->unkC &= temp;` | same instructions, 298 bytes; first divergence `+0x076` |

Every constant mask collapses because GCC 2.95's `convert_to_integer` narrows
`(unsigned char)((int)x & CONST)` into a QImode AND against the truncated
constant. Only a mask that is a variable at tree level survives into SImode.

The best plain-integer residual was six instructions: at `+0x076` target
`mov r1, r8` against candidate `mov r3, r8`, at `+0x078` target
`ldrb r0, [r1, #24]` against `ldrb r0, [r3, #24]`, the same pair again at
`+0x0B2`/`+0x0B4`, and `mov r1, #0` emitted at `+0x0B0` instead of `+0x0B6`.
Shapes that move the else arm's flag write after the `unkD`/`unkE` stores fix
`+0x076` but then emit the two instruction groups in the opposite order, with a
first divergence at `+0x0AA`.

## Why a full-byte field cannot match, and a bitfield can

From `tools/asm-annotated.py src/collision.c sub_80567E4 --all-passes`: with a
full-byte `unk8 unkC`, every read-modify-write of the field expands through
`store_bit_field`. For `result->unkC |= 1;` the `.rtl` dump contains insn 199
`(set (reg:QI 101) (const_int 0))` and insn 202
`(set (reg:SI 102) (and:SI (subreg:SI (reg:QI 100) 0) (reg:SI 103)))` — the
insert mask for a whole byte is `0`. In the `.cse` dump the later
`result->unkE = 0;` store (insn 237) has been rewritten to
`(subreg:QI (reg:SI 103))`: CSE donates the insert mask's zero to the `unkE`
store. That pins the `mov #0` before the flag store instead of between the
`unkD` load and the `unkD` store, and the resulting live-range overlap pushes
both the `unkC` load and the `line` alias out of r1 into r3 in both arms.

With one-bit bitfields the insert masks are `-2` and `-3`, never `0`, so there
is nothing for CSE to donate; `result->unkE = 0;` materialises its own zero at
the target's `+0xB6`. That is the same mechanism that produces the target's
`mov #2` / `neg` constants, so both symptoms have one cause.

`sub_8056910` matches under either spelling because its arms write `unkD` and
`unkE` before the flag byte, so the donated zero already sits where the target
has it.

## Nested `CollisionFlags` struct: layout-incompatible

A standalone `struct { unk8 unkC_0 : 1; unk8 unkC_1 : 1; unk8 unkC_2 : 6; }`
compiles to `sizeof == 4` under agbcc, measured with negative-array size checks
for 1, 2 and 4 (only the `== 4` check compiled). The base type is irrelevant:
this is with `unk8` (`u8`), so the earlier four-byte report was real agbcc
behaviour and not an `unk32` base-type mistake. Such a struct therefore cannot
occupy `CollisionResult + 0xC` without attributes. Declaring the three
bitfields inline as members of `CollisionResult` packs them into the single
byte at `+0xC` and keeps `sizeof(CollisionResult) == 0x28`.
