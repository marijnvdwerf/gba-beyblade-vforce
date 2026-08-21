# Temporary reduction pass 6

Header-pass function definitions reviewed from `git diff c5146ca^..main -- src/*.c`:

- `Background_8049950` (`src/background.c`)
- `Background_80499BC` (`src/background.c`)
- `Background_8049A84` (`src/background.c`)
- `Background_8049AF8` (`src/background.c`)
- `Background_8049B68` (`src/background.c`)
- `Background_8049BF8` (`src/background.c`)
- `Background_8049C70` (`src/background.c`)
- `nullsub_12` (`src/camera.c`)
- `sub_805E50C` (`src/geometry.c`)
- `sub_804B4A4` (`src/rider.c`)
- `sub_8060CDC` (`src/sprite.c`)
- `resizeSpriteBlock` (`src/sprite.c`, `#if 0` draft; skipped)
- `SpriteString_8064FE8` (`src/spritestring.c`)
- `initTutorialManagement` (`src/tutorial.c`)

## Results

- `Background_8049950`: no retained local could be removed. Folding `arg1` changed the target register assignment; folding `pInt` directly into `sub_804A280` is rejected by the typed `void *` prototype. The `arg0`, `arg1`, and `pInt` live values remain required by the target call sequence.
- `Background_80499BC`: no local removed. The `arg0`, `arg1`, and `pInt` values remain live across the layer setup and VBlank calls, matching the target's saved registers.
- `Background_8049A84`: no local removed. The setup pointers and `pInt` survive calls and are required for the target register/live-range shape.
- `Background_8049AF8`: no local removed. The setup pointers and `pInt` survive calls and are required for the target register/live-range shape.
- `Background_8049B68`: no local removed. The setup pointers and `pInt` survive calls and are required for the target register/live-range shape.
- `Background_8049BF8`: no local removed. `pInt` is needed for the later typed `void *` call after several intervening calls.
- `Background_8049C70`: no local removed. `pInt` is needed for the later typed `void *` call after several intervening calls.
- `nullsub_12`: no local removed; the unused `void *arg0` parameter is ABI-required by its caller and emits no body instructions.
- `sub_805E50C`: no local removed; the three stores already directly express the target's word stores through the typed pointer table.
- `sub_804B4A4`: no local removed; there are no locals, and the address-of-field arguments are required to match the cleanup callees' pointer parameters.
- `sub_8060CDC`: removed the redundant `cur = first` copy by initializing `cur` directly from `block->prev`; the generated instructions are unchanged. `first` remains required for the final `_spritesLeft` store, while `last`, `prev`, `next`, and `n` remain live across calls/loop iterations.
- `resizeSpriteBlock`: skipped because its definition is entirely inside `#if 0`; the active implementation remains an `INCLUDE_ASM` dump.
- `SpriteString_8064FE8`: no local removed. Removing `actor` caused an extra pointer recomputation between the two calls; the target keeps the actor pointer in `r4` across both calls.
- `initTutorialManagement`: removed the redundant `GameData *gameData` alias and changed `data = &gameData->tutorial` to `data = &_gameData->tutorial`; the target assembly and full-ROM SHA1 remain identical.

The two successful reductions are committed as `58d0aa1` (`sub_8060CDC`) and `5bf86ba` (`initTutorialManagement`).
