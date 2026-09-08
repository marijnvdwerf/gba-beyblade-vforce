# Geometry matching notes — 2026-09-08

## sub_805C9A4 (0x805C9A4)

The source shape from the matched `actor_805C48C` transfers directly after
using `QuadTreeNode* node`, `node->unk28` as the loop bound, and
`node->unk10[i]` as the line pointer. The target has no differing instructions,
retains the 84-byte frame, and `cmake --build build --target compare` passes.

The fifth parameter is evidenced by `ldrh [r3, #0x28]` at `+0x26` and
`ldr [r2, #0x10]` plus the scaled indexed load at `+0x38`–`+0x40`. The output
parameter is dereferenced by the indexed store at `+0x45E`; it is therefore a
`GeometryLine**`, not an integer. The capacity parameter is narrowed by
`lsl/lsr #16` at `+0x12`–`+0x14` and is therefore `unk16` in the matching
prototype. This conflicts with the caller-branch suggestion to expose both
parameters as `unk32`; using that declaration requires pointer casts and does
not compile with the dereference.

### s32 local evidence

Every `s32` local is supported by the following defining or consuming
instructions (offsets are relative to `sub_805C9A4`):

- `point0X`: `lsl r6, #5` at `+0x64`; `point0Y`: `lsl r0, #5` and move to `r8` at `+0x68`–`+0x6A`.
- `point1X`: `lsl r3, #5` at `+0x6E`; `point1Y`: `lsl r0, #5` and move to `ip` at `+0x72`–`+0x74`.
- `lineMinX`/`lineMaxX`: signed endpoint selection at `cmp r2, r1`/`bge` `+0x76`–`+0x78`, with stores at `+0x7A`–`+0x82`; `lineMinY`/`lineMaxY`: signed endpoint selection at `cmp r1, r0`/`bge` `+0x88`–`+0x8A`, with stores at `+0x8E`–`+0x9C`.
- `yNegativeOffset`: signed `ldsh` from actor `+0xAA` at `+0xA4` and shift at `+0xA6`; `yPositiveOffset`: signed `ldsh` from actor `+0xAE` at `+0xAE` and shift at `+0xB0`.
- `actorY`: load from actor `+0x08` at `+0xB2`; `yMargin`: load from actor `+0x50` at `+0xB4`.
- `rectMinY`/`rectMaxY`/`broadY0`/`broadY1`: signed height branch at `cmp r0, #0`/`ble` `+0xBE`–`+0xC0`; the positive arm defines them at `+0xC2`–`+0xD0`, and the non-positive arm at `+0xD4`–`+0xE2`. Their signed overlap tests include `cmp`/`bgt`/`blt` at `+0x10E`–`+0x11E`, `+0x122`–`+0x12C`, and `+0x2CC`–`+0x2D8`.
- `rectMinX`: signed `ldsh` from actor `+0xA8` at `+0xEA` and shift/add sequence at `+0xEC`–`+0xF0`; `initialMaxX`: signed `ldsh` from actor `+0xAC` at `+0xF8` and shift/add at `+0xFA`–`+0xFC`, consumed by signed comparisons at `+0x104`–`+0x10C`.
- `rectMaxX`: signed horizontal-width branch at `cmp r2, #0`/`ble` `+0x29E`–`+0x2A0`; positive-arm arithmetic is at `+0x2A2`–`+0x2B2`, and non-positive-arm arithmetic at `+0x2B6`–`+0x2C6`, consumed by signed tests at `+0x2CC`–`+0x2D8` and `+0x392`–`+0x39A`.
- `i`: initialized in the stack slot at `+0x22`, incremented at `+0x4F4`–`+0x4F6`, and compared against the node count with `ldrh`/`cmp`/`bge` at `+0x4F8`–`+0x4FE`.
- `temp`: vertical restitution uses `mul`/`asr #7` at `+0x494`–`+0x496` with signed `cmp`/`bge` at `+0x49A`–`+0x49C`; horizontal restitution repeats this at `+0x4BA`–`+0x4C2`.

### Byte-required temporary inventory

The following inventory is measured on the sibling `actor_805C48C` in
`docs/learnings/geometry-2026-09-08e.md`; the same source shape was transferred
to this function, and folds were not re-run here.

| Shape | Measured result on sibling |
| --- | --- |
| Staged `point0X`, `point0Y`, `point1X`, `point1Y` locals | Direct folds changed the frame/first divergence; staged locals retained. |
| `temp` restitution local | Folding into the actor field failed at the prologue allocation; `temp` retained. |
| Separate duplicated vertical endpoint-response arms | One shared endpoint loop changed the frame; duplicated arms retained. |
| Separate duplicated horizontal endpoint-response arms | One shared endpoint loop changed the frame; duplicated arms retained. |
| `callbackDone` and its final assignment | Removing the final assignment diverged at sibling `+0x3B4`; assignment retained. |
| Distinct `broadY0` and `rectMaxY` stack slots | Coalescing them made the frame four bytes short; distinct slots retained. |

No near-miss or parked draft was needed for `sub_805C9A4`.
