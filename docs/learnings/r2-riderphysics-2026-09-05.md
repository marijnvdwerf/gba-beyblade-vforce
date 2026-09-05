# Rider physics round 2 — 2026-09-05

## UnsetRiderFlag (0x0804E40C)

Matched in `src/riderphysics.c`. The target is a direct read-modify-write of `RiderBase.flags` at offset `0x9C`; `rider->flags &= ~flags` emits the target five instructions exactly. `RiderBase.flags` remains `unk32` because this function proves only whole-word access and bitwise clearing.
