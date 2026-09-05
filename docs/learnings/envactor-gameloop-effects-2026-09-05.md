# envactor, gameloop, and effects matching notes

## renderEnvironmentActors (0x08054C9C)

Parked after a semantic near-match. The assembly and controlled builds established the following layout evidence:

- Actor records have a stride of `0xC4`; the render state begins at Actor + `0xA0`.
- Render-state accesses used by the function are halfwords at +`0xA0` and +`0xA2`, an object/index field at +`0xB4`, and a sprite pointer at +`0xB8`.
- Actor display data uses a pointer at +`0x3C`, with coordinate fields at DisplayRecord +`0x40` and +`0x44`.
- `nullsub_12` returns its argument.
- Environment effect records have a stride of `0x1C`. Proven accesses are sprite +`0x00`, x/y/z +`0x04`/`0x08`/`0x0C`, a halfword at +`0x10`, a byte at +`0x12`, a sheet pointer at +`0x14`, and an actor pointer at +`0x18`.
- Environment line objects have a stride of `0x4C`; the renderer uses actor, sprite, x, and y fields at +`0x00`, +`0x04`, +`0x08`, and +`0x0C`.

The best C draft is retained directly above the INCLUDE_ASM in `src/envactor.c` under `#if 0`. It is not a matched implementation. The first persistent divergence was register/lifetime allocation after the common prologue; the strongest natural draft held actor in `r9` and render state in `r6`, but allocated the effect cursor and coordinate/helper temporaries differently from the target. Further changes were stopped at the time-box boundary rather than introducing artificial source shapes.

The target saves the two helper results and reuses them while updating the line sprite. The target stack frame is 36 bytes. Culling constants observed in the target are `0xFFFFFC00`, `0xFFFFE000`, `0x0000EFFF`, and `0x00009FFF`.

## sub_80522D4 (0x080522D4)

Parked after a semantic draft and natural lifetime probes. The callback receives an actor-like first argument and a CameraState-like second argument. The second argument is passed through `nullsub_12`, whose result is used as the primary display-record base; the original callback argument is retained for clearing `unk224`. Proven layout evidence from the target includes RiderBase fields at +`0x1A0` and +`0x1A4`, GameData byte fields at +`0xB50`, +`0xB51`, +`0xB52`, and +`0xB53`, Actor fields at +`0xA0`, +`0xA2`, and +`0x11`, DisplayRecord fields at +`0x40`, +`0x44`, +`0x14`, and +`0x18`, and CameraDisplayEntry data at +`0x14`.

The draft is retained directly above the INCLUDE_ASM in `src/gameloop.c` under `#if 0`. The target has a 72-byte stack frame, preserves the original second argument in `r10`, the nullsub result in `r9`, the global pointer address in `r8`, and the loaded GameData pointer in `r7`. The best natural draft reached the callback arithmetic and loop semantics but remained at a 60-byte frame, inlined the 12-byte memcpy, and allocated the nullsub result and GameData pointer differently. Pointer aliases and direct-versus-cached global access were tested; the persistent first divergence was the prologue/local lifetime shape. No artificial register or volatile workaround was introduced.
