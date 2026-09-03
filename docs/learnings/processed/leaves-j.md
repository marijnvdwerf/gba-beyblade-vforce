# Leaves J

## sub_804DAA0 (0x804DAA0)

The semantic draft remains parked above the assembly inclusion. The dump remains intact and the shared headers intentionally contain no fields added for this function.

The closest legal draft implements the rider-selection, flag checks, fixed-point distance test, and state updates. Its residual is a lifetime and register-allocation mismatch: the target keeps the selected rider and the alternate rider in the high-register roles established by the prologue, while the natural typed draft assigns those live ranges differently. No register pinning, `volatile`, inline assembly, or artificial symbol was used.

The first divergence in the closest tested draft is in the early argument/temporary setup after the prologue. The later arithmetic and branch structure are semantically equivalent, but the high-register roles do not converge.

| Change tried | Result |
| --- | --- |
| Opaque-pointer semantic draft from the m2c output | Stable early prologue/register-lifetime divergence; no size improvement |
| Typed `RiderBase*` member accesses | Preserved the semantic body but retained the high-register mismatch |
| Added only fields proven by the dump | No change to the first divergence; shared-layout edits were subsequently removed |
| Reordered rider/other aliases and distance temporaries | Register roles remained different; no byte-identical match |
| Switched between direct member expressions and cached rider aliases | Residual remained in the same prologue/high-register lifetime region |
| Signedness sweep for distance and state temporaries | No improvement; the signed halfword state loads remained tied to the unrepresented layout |

The dump proves the following layout facts, which are documented here rather than added to `RiderBase`:

- `unk210` is a signed 32-bit field. The target forms offset `0x210` with `mov r3, #0x84; lsl r3, #2`, computes the field address, then performs `ldr r0, [r0]` at `0x804DB2C` and compares the word distance against it at `0x804DB2E`.
- `unk220` and `unk222` are signed 16-bit fields. The target addresses `rider + 0x220` and `rider + 0x222` and performs `ldsh r2, [r0]` at `0x804DB40` and `ldsh r0, [r1]` at `0x804DB42`.
- `unk21E` is a 16-bit field. The target addresses `rider + 0x21E` and performs `strh r0, [r1]` at `0x804DB56`; the alternate branch copies the existing halfword value with `ldrh r1, [r0]` at `0x804DB72` and stores it with `strh r1, [r0]` at `0x804DB78`.
- `unk20C` is a `RiderBase*` field. The target forms offset `0x20C` with `mov r3, #0x83; lsl r3, #2`, then stores the alternate rider pointer with `str r1, [r0]` at `0x804DB80`.

## sub_804B7FC (0x804B7FC)

The semantic draft remains parked above the assembly inclusion. The house-style version uses `RiderBase*` throughout, typed member access, indexed access to the dynamic `RiderBase` array, and a `RiderBase*` result. It contains no pointer-to-integer casts or cast-and-offset walk. The assembly dump remains intact.

The closest tested legal draft matched the coordinate loads, filtering tests, distance arithmetic, comparison, and loop tail. Its first divergence is the prologue at `0x0000000C`: the target stores the incoming argument at `[sp, #8]`, uses a 12-byte local frame, and later keeps the negative record offset in `r6`; the closest draft uses a 16-byte frame, retains the argument in a register, and spills the offset. The final residual is therefore a source-lifetime/register-allocation mismatch, not an unresolved semantic operation.

| Change tried | Result |
| --- | --- |
| Direct `GameData*` parameter, cached candidate, and top-tested `while` | First divergence at `0x0000000A`; frame was 20 bytes instead of 12 (`+8` bytes) |
| Global `_gameData` count/array accesses with a separate negative stride offset | First divergence moved to `0x0000000A`; frame reduced to 16 bytes, still `+4` bytes |
| Explicit `dx`, `dy`, and `dz` temporaries | Kept the 16-byte frame and first divergence at `0x0000000A`; distance instruction order then matched from the arithmetic body |
| Raw-style separate coordinate pointer and input alias | Prologue stabilized at first divergence `0x0000000C`; target frame remained 12 bytes versus draft 16 bytes (`+4` bytes) |
| Reordered declarations and initialization statements | No size reduction; first divergence remained `0x0000000C` |
| Opaque `unk8*` and `unk32*` parameter variants | No improvement; first divergence remained `0x0000000C` and the target still spilled the argument differently |
| Typed `RiderBase*` parameter variant | Same stable residual; arithmetic and candidate filtering remained matched, but the prologue and high-register roles did not |
| Indexed `&_gameData->unk42C[i - 1]` rewrite | Applied to the parked house-style draft; not used as a claim of a byte match because the function remains assembled from the dump |

No shared struct changes are needed for this function. The target accesses the existing actor pointer at offset `0`, actor coordinates at offsets `4`, `8`, and `0xC`, rider flags at offset `0x3CC`, the global rider count at `0x430`, and the dynamic rider array at `0x42C`; those existing declarations are sufficient for the parked source draft.
