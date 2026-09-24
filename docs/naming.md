# Naming

The original team's naming conventions, as shown by the identifiers quoted in the game's
leftover debug messages.

## Functions

lowerCamelCase, verb first, words spelled out. No module prefix: the subsystem is part of
the name (`newSpriteTrail`, not `Trail_new` or `trail_new`).

| Pattern | Use for | Examples |
|---|---|---|
| `init<System>` | setting up a subsystem | `initRiders`, `initEventListeners` |
| `new<Thing>` | creating/allocating one object | `newMotionGroup`, `newSpriteTrail` |
| `init`/`deallocate` + `<X>Management` | a subsystem manager's lifetime | `initAIManagement`, `deallocateAIManagement` |
| `<screen>FrontendHandler` | frontend state handlers | `selectBladeFrontendHandler`, `creditsFrontendHandler` |
| `…Handler` | other callbacks | `teletypeDefaultUserCodeHandler` |
| `get…` | lookups | `getDecompressorData`, `getBeyBladeActorDataForIndex` |
| `…ARM` suffix | ARM-mode (IWRAM) code | `fastMemoryCopyARM` |
| plain verb phrase | everything else | `readFromBatteryBackup`, `freeSpriteVramLocation`, `restoreFromSavedGameState` |

- Acronyms stay upper case: `initAIManagement`, `fastMemoryCopyARM`.
- Keep the source's casing of compound words, even when inconsistent: `BeyBlade`,
  `MultiPlayer`.
- PascalCase functions (`IdentifyEeprom`) are Nintendo SDK code, not team code; keep the
  SDK's names for those.

## Types

PascalCase nouns: `AllocatedBlock`, `BoundingArea`, `SpriteVramFree`, `CollisionQuadtree`.

## Variables and fields

lowerCamelCase: `spritesFree`, `maxPacketSize`, `startIndex`.
