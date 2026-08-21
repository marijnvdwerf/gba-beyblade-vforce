# gameinit leaves

- `GetStruct4` returns an element from `_gameData->unkC88` with a proven stride of `0x4C`; modeling `EnvironmentObject` at its full `0x4C` size lets typed indexing emit the original multiply/add without raw offset arithmetic.
- The function's real C callers use the result as an `EnvironmentObject *`, so its prototype belongs with the shared RAM/GameData declarations in `src/ram.h`, not as a private declaration in `src/envactor.c`.
- After `GetStruct4` was removed, `uv run tools/worklist.py` contained no other `src/gameinit.c` leaves. The remaining small gameinit includes are not called from existing C and were left untouched per the caller-pinned work pool rule.
