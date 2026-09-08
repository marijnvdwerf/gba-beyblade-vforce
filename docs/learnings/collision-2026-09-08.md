# Collision matching notes

## def_94_0_8055CFC (0x8055CFC)

- The exact instruction stream matches with both `unk32` and `unk8` return types for `def_94_0_8055CFC`; the non-void type is required for the null-path `mov r0,#0`, but the return width is not distinguishable in the generated code. The final callback declarations use `unk8`, matching the filter callback.
- `Actor::unkB4` is an owner-dependent union at the same four-byte offset: rider actors use `rider` as a `RiderBase*` (`src/rider.c:49`), while environment actors use `lineIndex` as a signed geometry-line index (`src/envactor.c:153`, read during cleanup at `src/envactor.c:426`, rendering at `src/gameloop.c:437-450`, and event save/restore at `src/event.c:218-229`). The collision callback therefore uses `actor->unkB4.rider` without a cast, and environment users select `.lineIndex` without changing the layout.
- Generic actor initialization clears `Actor::unkB4` through `.lineIndex` (`src/actor.c:86`); the resulting ROM passed the byte-identical compare. The member choice is semantically neutral for the zero value and preserves the target store.
- `if (rider == NULL) return 0;` is byte-required: it produces `bne` to the body followed by `mov r0,#0` and a branch to the epilogue. A `void` early return instead emits `beq` to the epilogue and first diverges at 0x1A.
- `collisionMask` is `unk16`; entry normalization is `lsl r3,#16` / `lsr r3,#16`. The two mask tests use the normalized argument and its copied value as in the target.
- No local temporary beyond the rider pointer is byte-required. Both calls pass masks `collisionMask & 0x90` / `collisionMask & 9` and stack arguments `0x40` / `0` in target order.
- `ActorCollisionResponse` was tested with both `unk32` and `unk8` returns; the final response callback uses `unk8`. `ActorCollisionOverlap`, `sub_8056B54`, and `def_94_4_AddWithBoundingAreaMessage` remain `void` because the overlap slot provides no return-width evidence. `def_94_0_8055CFC`, `sub_805CEB8`, and `initLevelEnvironmentActors` remained instruction-identical.
- `cmake --build build --target compare` passed after replacing the dump and formatting the touched files.
