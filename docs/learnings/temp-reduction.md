# Temporary-reduction notes

These experiments simplify the caller-backed functions merged in the small-leaf pass. Every retained source shape was checked with the full ROM compare; instruction diffs were read directly with `tools/diff/diff.ts`.

## Results by function

- `sub_80538C0` (`src/gameinit.c`): unchanged. Folding the `rider` conditional directly into the call produced an old-agbcc pointer-type-mismatch warning because the two conditional arms are `unk8 *` and `GameData *`. The existing `void *rider` also keeps the common call after the branch; no natural alias-free form was found.
- `sub_8053F0C` (`src/gameinit.c`): simplified. Removed the four duplicated case-local `GameData *gameData` declarations and assignments, replacing the field accesses with direct `_gameData->...` expressions. The ROM and function diff stayed exact. A hoisted shared alias was not retained: it loads `_gameData` before `_currentGameState` and changes switch dispatch/liveness, so it does not match the target.
- `emptyBeybladeActorData` (`src/beyblade.c`): unchanged. Replacing the moving `BeybladeActorData *record` with `_gameData->actorData[i]` changed the prologue, address materialization, and loop shape; the diff first diverged at the initial global/record setup and the full compare failed.
- `deallocBeybladeActorData` (`src/beyblade.c`): unchanged. Replacing the record cursor with indexed accesses kept the integer index and base address live, changing the target's pointer-walk/countdown allocation; the first meaningful diff introduced an extra index setup and changed the loop branches.
- `sub_8055CB8` (`src/collision.c`): simplified. Removed explicit `(void *)` casts from the three callback function names. The direct function names produce the same relocations and instructions, and the full compare passed.
- `sub_805BA3C` (`src/geometry.c`): unchanged. The typed `GeometryAddressTable *` and direct field access are already the minimal natural form; removing or introducing a temporary would not express the target more clearly.
- `deallocateQuadTree` (`src/geometry.c`): unchanged. The two direct typed block fields already match the natural cleanup source; no redundant temporary remains.
- `sub_804F800` (`src/hud.c`): unchanged. Removing `GameData *base` and storing through `_gameData` adds a reload of `_gameData` after the clamp. The target materializes the global pointer before the signed comparisons, so the alias is required for exact liveness/address order.
- `sub_804FEE8` (`src/levelhud.c`): simplified. Kept `base` and `hud`, but read the status field directly in the condition (`base->levelHudStatus != 0`) while retaining the `status` address local for the final store. The generated instructions and ROM remain exact. Removing `base` or replacing all three locals with repeated global expressions adds reloads and changes address formation.
- `sub_8061204` (`src/spritetext.c`): unchanged. The function already uses direct typed fields, with no removable local alias or redundant cursor.
- `sub_804A72C` (`src/tutorial.c`): unchanged. The direct typed `GameData` field store is already the simplest natural expression and matches exactly.

## Generic agbcc patterns

- A local alias is optional when direct global field expressions let agbcc materialize the same base at the same point and preserve the target's live ranges. This can remove declaration noise without changing bytes.
- A global alias is required when the target loads the global before a clamp/branch or keeps a derived address live across later operations. Replacing it with a direct global access can introduce a reload or move the first divergent instruction.
- A local used only for a later store may remain necessary even when the corresponding field can be read directly. In that case, simplify the read but preserve the address local for the target's store and register lifetime.
- Fixed-stride record cursors are not interchangeable with array indexing in agbcc. Indexing can keep both an integer index and a base pointer live, changing the prologue, address formation, and loop reversal; retain the cursor when the target is a pointer walk.
- Direct function names should be tried before explicit callback casts. When the prototype already accepts the callable value, agbcc preserves the same relocation and removes source-only cast noise.
- Conditional expressions require compatible pointer types under old agbcc. A common call after a conditional branch may therefore need a temporary typed as `void *` rather than an alias-free conditional argument.
