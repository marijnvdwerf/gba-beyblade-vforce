# Miscellaneous round 3

## sub_805DCFC (0x0805DCFC)

The function returns a spline line record from the variable-length line area following a spline's point-index array. `GeometrySplineLine` is a 0x10-byte record with only `unkC` currently named because that is the field used by its caller. The index parameter and count local must be signed to emit the target's `bge`; using `unk32` produced `bhs` at the bounds check. The matched source uses `&spline->pointIndices[count]` as the dynamic line-area base and typed indexing for the 0x10-byte records.
