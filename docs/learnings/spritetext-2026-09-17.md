# spritetext matching notes — 2026-09-17

## sub_80622D0 (0x080622D0)

- The wrapper is variadic with parameters `SpriteTextCleanup*`, `unk8` mode, and `const unk8*` format string; `va_start(args, arg2)` passes the first variadic argument area to `sub_8061F3C`.
- The `unk8` mode emits the target entry `lsl #24`/`lsr #24` normalization. Declaring the wrapper return as `u8` added a trailing normalization pair; `unk32` return and `unk32 sub_8061F3C(...)` reproduce the target fall-through return.
- The variadic `va_list` shape is required for the target `push {r2, r3}`, `push {lr}`, stack recovery, and `add r3, sp, #8` sequence. A fixed fourth parameter only spilled `r3` and diverged at the prologue.
- `bun run tools/diff/diff.ts sub_80622D0` reports every instruction equal, and the US ROM SHA1 comparison passes with `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

## sub_8061C24 (0x08061C24)

- The no-caller wrapper takes `SpriteTextCleanup*`, `unk32`, and `unk8`, clears the cleanup with `sub_8061228`, then returns `sub_80619A4`'s byte result.
- The `unk8` mode parameter and `unk8` return reproduce the target entry and return `lsl #24`/`lsr #24` normalizations. Direct forwarding of the first two parameters reproduces the target saved values and call sequence.
- `bun run tools/diff/diff.ts sub_8061C24` reports every instruction equal, and the US ROM SHA1 comparison passes with `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

## sub_8061C6C (0x08061C6C)

- The no-caller sibling wrapper takes `SpriteTextCleanup*`, `unk32`, and `unk8`, clears the cleanup with `sub_8061228`, then returns `sub_8061AE8`'s byte result.
- The `unk8` mode parameter and `unk8` return reproduce the target entry and return `lsl #24`/`lsr #24` normalizations. Direct forwarding of the first two parameters reproduces the target saved values and call sequence.
- `bun run tools/diff/diff.ts sub_8061C6C` reports every instruction equal, and the US ROM SHA1 comparison passes with `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

## sub_8061C90 (0x08061C90)

- The no-caller third sibling wrapper takes `SpriteTextCleanup*`, `unk32`, and `unk8`, clears the cleanup with `sub_8061228`, then returns `sub_8061BA0`'s byte result.
- The `unk8` mode parameter and `unk8` return reproduce the target entry and return `lsl #24`/`lsr #24` normalizations. Direct forwarding of the first two parameters reproduces the target saved values and call sequence.
- `bun run tools/diff/diff.ts sub_8061C90` reports every instruction equal, and the US ROM SHA1 comparison passes with `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

## sub_8061CB4 (0x08061CB4)

- The no-caller accessor takes `SpriteTextCleanup*` and returns `s32`. It returns the final sprite x for mode 0, the first sprite x adjusted by glyph width, spacing, and font width for mode 1, and the centered result for mode 2.
- Only `s32 result` and `s32 base` locals are needed; direct `arg0->unk8 & 3`, `arg0->unkC & ~1`, and direct case-local `next`/width accesses reproduce the target's register allocation and all instructions. Folding the mode, width, and sprite-pointer aliases and inlining the case-two mask were byte-neutral; combining the case-one adjustment was not.
- The signed `s8` `unk29` field is proven by the target `ldrb; lsl #24; asr #24` sequence. The signed `s32` result and arithmetic right shift reproduce the target midpoint calculation. An explicit `default: break` is also byte-neutral.
- `bun run tools/diff/diff.ts sub_8061CB4` reports every instruction equal; the final US ROM SHA1 comparison passes with `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.

## sub_8061E9C (0x08061E9C)

- The formatter calls this helper as `unk8* sub_8061E9C(unk8*, unk32, unk32, unk8, s32, unk8)`. The fourth and sixth arguments are byte-normalized at entry; the fifth argument is a signed width/limit because the target uses `ble`, `bgt`, and `ble` around its clamp and zero-padding loops.
- A 16-byte local buffer and a moving byte cursor are required. The helper emits radix digits least-significant first, optionally zero-pads to the remaining signed width, then walks the cursor backward and forwards each byte through `sub_8061E94`.
- `s32 digit` is required for the signed `bgt` comparison against 9; the unsigned trial emitted `bhi`. `while (arg4-- > 0)` reproduces the target's pre-decrement signed padding loop exactly.
- `bun run tools/diff/diff.ts sub_8061E9C` reports every instruction equal; the final US ROM SHA1 comparison passes with `cd527c8c24e20e33913fc45199e64b3e6138a6e5`.
