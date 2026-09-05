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

## sub_8055340 (0x08055340)

The function was investigated and parked after the semantic state machine and
most of the fixed-layout accesses were recovered. The function calls
`sub_804C208`, decrements ProjectileSystem +0x7A, advances the state at +0x84
every 0x20 frames, dispatches five state cases, animates the palettes at +0x70,
+0x72, +0x74, and +0x76, and updates the window transition at +0x7C.
ProjectileSystem +0x88 is a RiderBase pointer in the recovered semantic draft.

The early dispatch matched through the state jump-table setup in one probe. The
persistent first unresolved allocation difference was the target's use of r0
for the +0x1108 literal address versus an unwanted saved r6 in the draft. A
scoped Palette pointer was tested and made the prologue worse by introducing an
additional saved register; removing that alias was required, but did not
complete the match.

The hardware transition's `lsl #16; asr #20` sequence was identified as a
signed 12-bit field read occupying bits 4 through 15 of the halfword at
ProjectileSystem +0x7C. A scratch declaration with a four-bit unnamed lower
portion followed by `s16 unk7C_4 : 12` generated the target extraction sequence.
The declaration was not retained in the active header because the function was
parked and the layout change was not independently verified across the other
users of ProjectileSystem. The best draft uses `unk7C_4` for that proven
semantic view.

Other measured differences remained in palette branch polarity and local
allocation, the +0x76 branch's register reuse and load ordering, and the
hardware register address materialization. The draft was moved under `#if 0`
immediately above the untouched `INCLUDE_ASM` line. Experimental signed field
casts and pointer casts were removed from the draft; hardware-register casts
remain only for direct GBA register accesses. The unverified changes to
`src/ram.h`, `src/rider.h`, `src/gamestate.h`, and `sub_805568C` were reverted.

## Parking retry: sub_80526C8 bitfields (0x080526C8)

The sub_8055340 hardware transition confirms that a halfword field declared as
`s16 : 4; s16 unk7C_4 : 12` reproduces the target's `lsl #16; asr #20`
extraction. The declaration remains unverified in the active ProjectileSystem
layout because sub_8055340 is parked.

The sub_80526C8 OAM operations suggest that OAM attribute 2 priority occupies
bits 10 through 11 of the halfword at SpriteEntry +0x14. A retry represented
those operations with a packed bitfield type wrapped in a union beside the
scalar word. That wrapper/union representation changed SpriteEntry layout and
produced incorrect byte-sized accesses; it is the wrong representation for this
layout. The existing bitfield measurements in
`docs/learnings/bitfields-2026-09-05.md` show that proven bitfields must instead
be declared directly in the containing struct. The direct-in-struct form was
not tested for sub_80526C8, so this remains a hypothesis rather than a match.

The function is parked with a cast-free semantic draft using the existing
Actor and LevelGeometryAddresses layouts and the original scalar OAM
operations. Probe-only changes to shared headers, camera.c, sprite.c, and
spritetext.c were reverted.
