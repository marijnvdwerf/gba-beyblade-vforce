# Humanization test engine notes

## Cleanup pass: 2026-08-28

All attempted humanized functions remain parked with their assembly includes active. No dump was deleted because none matched.

| Function | Best draft state | First divergence | Result |
| --- | --- | --- | --- |
| `sub_8062EFC` | Signed counter and allocation draft retained above the active include in `src/actorheap.c` | Incoming count and zero/flag values receive opposite register roles; signed branches were corrected, but allocation remains non-identical | Parked |
| `sub_8065334` | Direct `string->actors[index]` rewrite restored above the active include in the baseline parked form | Target reloads the actor-array base after the text-space test; natural drafts cache or hoist the base | Parked |
| `sub_8065508` | Typed digit-rendering draft restored to the active include | String, value, and stride register roles differ in the prologue/body | Parked |
| `sub_80655C0` | Typed digit-walk draft restored to the active include | Temporary and pointer lifetimes produce different register/stack allocation | Parked |
| `GetLineIndexOfType` | Typed `GeometryLine.unkF` draft retained in a bare `#if 0` block | Index/pointer register roles and loop layout differ from the target; controlled testing confirmed the earlier claimed exact match was stale | Parked |
| `sub_80659F0` | Existing parked battery-backup draft unchanged | Extra callee-saved lifetime remains in the natural draft | Parked |

## Cleanup changes

- Restored all experimental scalar global declarations used only by the parked actor-heap draft.
- Restored `Actor.unk22` to its existing unproven halfword type because no matched function uses it.
- Restored `GeometryLine` offset `0xF` to padding because `GetLineIndexOfType` remains unmatched.
- Restored active assembly includes for every attempted function.
- `cmake --build build --target compare` passed with 100% tests passed.
