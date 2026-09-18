# Collision learnings

## sub_8056CFC (0x08056CFC)

- `sub_8056CFC` is a standalone `unk16` function; its `lsl/lsr #16` return normalization means it is not an `ActorCollisionOverlap` callback and is not stored in any callback slot, while the existing `ActorCollisionOverlap` typedef remains `unk8`.
- The function indexes `LevelGeometryAddresses::unk4` as `GeometryPoint` records, stages the summed x and y coordinates shifted left by four, then uses separate compound subtraction and arithmetic-shift statements against `Actor::x` and `Actor::y`; the final `Sqrt` call and `unk16` return reproduce the target.
- Folding the staged x expression into `x = ((point0->x + point1->x) << 4) - actor->x;` first diverged at `+0x18` and did not match.
- Folding the staged y expression into `y = ((point0->y + point1->y) << 4) - actor->y;` first diverged at `+0x18` and did not match.
- Combining x subtraction and arithmetic shift as `x = (x - actor->x) >> 8;` first diverged at `+0x00` with an extra saved register and did not match.
- Combining y subtraction and arithmetic shift as `y = (y - actor->y) >> 8;` first diverged at `+0x1E` and did not match.
- Combining both subtraction and arithmetic shift statements first diverged at `+0x00` with an extra saved register and did not match.
- Using fully direct x and y expressions first diverged at `+0x00` with an extra saved register and did not match; the split staged form is retained.

## sub_8056C0C (0x08056C0C)

- `sub_8056C0C` matches as `GeometryLine* sub_8056C0C(GeometryPoint*)`; its output pointer receives the selected line's first point coordinates shifted right by three, and the return is the first line whose `unkF` is `0x86`.
- The function uses a `LevelGeometryAddresses` local (0x11C bytes), obtains `LevelDesigns[GetLevelDescriptionNo()].geometry`, scans lines with a typed cursor and index, and stages the selected `GeometryPoint*` before its three stores.
- Separating `GetLevelDescriptionNo()` into `levelNo` before the `LevelDesigns` lookup was required for the target order (`bl` before the literal-pool load); the combined subscript first moved the pool load before the call.
- The typed cursor and staged point pointer reproduce the target's post-call line scan and coordinate stores; the final matched function has no callback-compatible signature because it accepts only the output `GeometryPoint*`.
