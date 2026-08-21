# spritestring.c round 6 (written by the coordinator from the agent's reports)

- 15 functions matched (sub_8064F38 … sub_80657EC); SpriteString/SpriteStringActorBlock
  typed in common.h, Actor fields x/y/unk10–unk22/unk40–unk70 in actor.h.
- `Actor.unk22` is s16: `ldrsh [actor, #0x22]` in sub_8065334 (other users use ldrh).
- `unk16 character` local (not s32, no `register`) keeps the narrowed compare apart
  from its source.
- Parked sub_8065334: the target reloads `string->actors` every loop iteration with
  no intervening call or aliasing store; plain C hoists it. `volatile` on the field
  reproduces the reload but is not acceptable in a canonical header. Unknown cause.
- Parked sub_80655C0, sub_8065508: register/stack shape diverged.
