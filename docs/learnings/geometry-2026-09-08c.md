# Geometry matching notes

## sub_805BAC0 (0x805BAC0)

- Matched exactly at 24 bytes. The function computes the zero-based line index from the byte distance between `line` and `geometry->unkC`, divides by the 0x20-byte `GeometryLine` stride, and returns `-1` when the index is not below `geometry->unk0->lineCount`.
- The byte-pointer subtraction and explicit `unk32` conversion are required for the target's unsigned `lsr #5`; typed `GeometryLine*` subtraction plus `>> 5` compiled to a signed `asr #10` because the compiler already scaled the pointer difference by 0x20.
- No local temporary is byte-required beyond the result `index` used by the bounds test and successful return. The function uses the default `unk32` return and no signed declaration; `blo` proves the unsigned index/count comparison, while the `-1` path is the required sentinel.
- `sub_805BAC0(LevelGeometryAddresses*, GeometryLine*)` was moved into `src/geometry.h` so the matched collision caller uses the shared declaration.

### Step table

| Change | Measured result |
| --- | --- |
| `index = (line - geometry->unkC) >> 5` | First divergence at relative offset 0x04: `asr #10` instead of target `lsr #5`; all later instructions remained aligned. |
| `index = (unk32)((unk8*)line - (unk8*)geometry->unkC) >> 5` | All 12 instructions matched exactly; function size remained 24 bytes. |
| Natural `index = line - geometry->unkC;` | The typed 0x20-stride subtraction emitted `asr #5` at relative offset 0x04 instead of target `lsr #5`; all later instructions remained aligned. The explicit byte-pointer subtraction and `unk32` conversion were restored. |

## sub_805D610 (0x805D610)

- Matched exactly at 64 bytes. The function reads the actor's spline callback bundle at offset 0x90, invokes its callback at bundle offset 0x04 with `(actor, actor->unk80, actor->unk84)` when both pointers are non-NULL, then clears `actor->unk80`, sets `actor->unk84` to `-1`, and clears `actor->unk88`.
- `ActorSplineCallbacks` was extended in `src/common.h` with the accessed `unk4` callback while preserving its existing 16-byte layout; the pre-existing callbacks at `unk8` and `unkC` remain at the same offsets for `sub_805D650`.
- The callback pointer local is byte-required: it preserves the target's callback-bundle load before the null checks and gives the indirect call through `r3`. No other local temporary is byte-required. `Actor::unk84` is declared `s32`, is assigned the signed `-1` sentinel when spline motion is cleared, and is passed directly to `unk4`; therefore `ActorSplineCallbacks.unk4` uses an `s32` third parameter. The sibling `unk8` callback also carries `actor->unk84` as its fourth `s32` argument. `unkC` remains `unk32` because its call site passes `SplineConnection.unk8`, which is declared `unk32`, not the actor's signed spline index.

### Step table

| Change | Measured result |
| --- | --- |
| Initial implementation with `ActorSplineCallbacks* callbacks`, callback null checks, indirect callback, and the three field clears | All 32 instructions matched exactly; function size remained 64 bytes. |

## sub_805E068 (0x805E068)

- The interpolation helper matched exactly at 112 bytes after declaring its return as `s32*` and returning `result`. It resolves the spline, obtains adjacent point indices from the inline point-index array at `spline + 0x20`, interpolates x/y/z using `(point1 - point0) * position >> 10`, and stores position and point index in result slots 3 and 4.
- The non-void `s32*` return is required by the target epilogue: with `return result`, `r0` already holds the result pointer and agbcc emits `pop {r1}; bx r1`; a `void` definition produced `pop {r0}; bx r0` while matching the preceding 108 bytes. The matched caller ignores the returned pointer, so changing the shared prototype does not alter its call sequence.
- `pointIndices`, `point0`, and `point1` are retained as separate locals. Their measured lifetimes reproduce the target's `r4` indexed pointer, `r6` first-point pointer, and `r0` second-point pointer across the two calls. No additional temporary is byte-required; the single-use `spline` alias was folded into the `pointIndices` assignment without changing the bytes.
- The target's `asr #10` operations establish signed interpolation arithmetic; the coordinate fields and `position` remain `s32`, while `splineIndex` retains the default `unk32` ABI view. The result pointer is `s32*`, matching the existing point-evaluation helper and the caller's `s32 values[6]` buffer.

### Step table

| Change | Measured result |
| --- | --- |
| `void` return with adjacent-point interpolation and `result[0..4]` stores | First divergence at relative offset 0x6C: target `pop {r1}; bx r1`, current `pop {r0}; bx r0`; preceding 108 bytes matched. |
| `s32*` return plus `return result` | All 56 instructions matched exactly; function size remained 112 bytes. |
| Fold `spline` into `pointIndices = GetSplineAtIndex(geometry, splineIndex)->pointIndices;` | All 56 instructions still matched exactly; the single-use `spline` local and its assignment were removed. |
