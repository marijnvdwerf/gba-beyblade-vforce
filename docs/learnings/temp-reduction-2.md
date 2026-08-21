# Temporary-reduction pass two

All retained changes passed `cmake --build build --target compare`. The requested
`tools/diff/diff.ts` invocations were run directly, but this checkout's generated
`expected/CMakeFiles/rom.dir/src/*.c.o` objects were not discoverable by the
objdiff symbol scan (`Could not find function ...`); the ROM compare was the
available byte-level authority.

## Results by function

- `sub_8051640` (`src/gamestate.c`): unchanged. The direct typed field store is already minimal. No failed reduction was needed.
- `getSomeLevelID` (`src/gamestate.c`): unchanged. The two direct return paths preserve the required signed-byte normalization and halfword load. No safe alias removal was found.
- `getLevelDescription2` (`src/gamestate.c`): unchanged. The typed table expression is already the natural source form.
- `getLevelDescription` (`src/gamestate.c`): unchanged. The typed table expression is already the natural source form.
- `sub_8051720` (`src/gamestate.c`): unchanged. The typed level-state array access is already minimal.
- `sub_8051734` (`src/gamestate.c`): unchanged. The helper return is consumed directly; no local remains to remove.
- `sub_8051744` (`src/gamestate.c`): simplified. Removed the one-use `LevelState* state` alias and read `sub_8051720(index)->unk0` directly. The compare passed. The increment-inside-success-branch shape was retained because moving it changes the loop instructions.
- `sub_805176C` (`src/gamestate.c`): unchanged. The direct byte field read is already minimal.
- `GetLevelDescriptionNo` (`src/gamestate.c`): simplified. Removed the one-use `LevelDescription* descriptions` alias and indexed `LevelDescriptions` directly. Removing the remaining `description` alias as well failed the ROM compare, so it remains for the alternate return path.
- `sub_80518F0` (`src/gamestate.c`): simplified. Removed the one-use `LevelState* state` alias and initialized `value` from `sub_8051734()->unk10`. The compare passed.
- `sub_805E50C` (`src/geometry.c`): unchanged. The three direct stores are minimal.
- `sub_805E514` (`src/geometry.c`): unchanged. The four stores and returned destination are minimal.
- `sub_8061228` (`src/spritetext.c`): unchanged. The typed halfword field store and cleanup call are minimal.
- `sub_804B4A4` (`src/rider.c`): unchanged. The cleanup branches use direct typed fields with no redundant local.
- `newPolyTable` (`src/animevent.c`): unchanged. The allocation handles and typed fields are used directly.
- `sub_805FA4C` (`src/animevent.c`): unchanged. The two direct cleanup branches are minimal.
- `sub_805FA68` (`src/animevent.c`): unchanged. The direct allocation-size field access is minimal.
- `sub_80588A8` (`src/actor.c`): unchanged. The typed cleanup fields are used directly.
- `sub_804EBE8` (`src/particle.c`): unchanged. The saved count and moving particle cursor are required for the target loop shape. Folding the cursor into the structure field would alter semantics or pointer allocation.
- `deallocEventListeners` (`src/event.c`): unchanged. The direct global fields are already minimal.
- `LoadHUD` (`src/hud.c`): simplified. Removed the three `SpriteTextCleanup*` aliases (`hud0`, `hud1`, and `hud3`) and passed typed fields directly. Removing the remaining `GameData* gameData` alias failed the ROM compare because it changes global reload/address liveness, so it remains.
- `sub_8060CDC` (`src/sprite.c`): unchanged. The natural list locals remain required. Removing the `last` alias and using `block->next` directly failed the ROM compare.
- `sub_8049264` (`src/frontend.c`): unchanged. The direct fixed-layout state initialization is already minimal.

## Generic agbcc patterns

- A one-use typed pointer alias can often be folded into a field expression when it is not needed to preserve a global load or a later address lifetime.
- An alias that keeps a global base live across many stores can be required even when every access is syntactically expressible through the global symbol.
- Removing one alias may become matchable only after another independent alias is removed; test combinations rather than treating an earlier failed probe as absolute.
- A pointer used for a later list-link update can be allocation-significant even when the same address can be spelled through a containing structure field.
- Moving a typed helper result directly into a field read is safe when the result is consumed once and no later branch needs the pointer lifetime; alternate return paths may still require a retained alias.
