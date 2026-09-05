# Bitfield retries — 2026-09-05

These retries cover the two functions parked in this worktree. The assembly
includes remain authoritative; neither function matched as C in this pass.

## `LoadSpriteSheet` (`0x08060B68`)

### Header-layout hypothesis

The bytes at `source + 0x06`, `source + 0x07`, and `source + 0x0C` were
initially considered possible packed header fields. The retained parked draft
uses scalar byte fields and explicit expressions. Its local `SpriteSheet`
layout is only inside the `#if 0` draft; no speculative fields were added to a
committed header.

### Forms tried and first divergence

- The scalar form
  `((sourceByteC >> 1) & 0xF) << 12` was compiled. It lowers to
  `ldrb [source,#0x0C]`, `lsr #1`, `and #0xF`, `lsl #12`, which is the target
  sequence at the `oam_attr_2` construction. There is no divergence at this
  extraction site.
- Treating the low bit of `source + 0x0C` as a one-bit field produced the
  measured bitfield read shape `ldrb`, `lsl #31`, `lsr #31`, instead of the
  target's `ldrb`, `mvn`, `and #1` sequence used for the inverted flag. The
  first divergence is the extraction itself.
- Treating bits 1 through 4 of `source + 0x0C` as a four-bit field produced
  the measured bitfield normalization `lsl #27`, `lsr #28`, rather than the
  target's `lsr #1`, `and #0xF`. The first divergence is again the extraction
  before the shift by twelve.
- Treating the flag portions of `source + 0x07` as bitfields likewise produced
  bitfield normalization instead of the target's whole-byte signed load
  (`ldrb`, `lsl #24`, `asr #24`) followed by ordinary masks `& 3` and `& 0xC`.
  The first divergence is the load/normalization of `source + 0x07`.
- Writing `dst->frame.b[0]` emitted `strb` at offset `0x1C`; the target emits
  `strh`. Changing the parked draft to `dst->frame.word` reproduces the target
  width. This is a proven two-byte whole/parts overlay already present in
  `SpriteEntry`, not a new header bitfield.

### Measured verdict

The `source + 0x0C` sites are not supported bitfield accesses in this target:
the target's `lsr #1` plus `and #0xF` does not equal agbcc's measured
bitfield lowering for a four-bit field beginning at bit 1, and the inverted
low-bit test also differs from the measured one-bit lowering. The portions of
`source + 0x07` are likewise ordinary masks of a signed byte, not bitfields.
The explicit scalar expression for `((sourceByteC >> 1) & 0xF) << 12` is the
measured source form for that site. The function remains parked because the
complete C draft was not brought to an instruction-exact match; no additional
header fields are justified by these retries.

## `sub_806014C` (`0x0806014C`)

### `MultiPlayerState->unk14` hypothesis

The retry tested whether the individual status masks in `unk14` should be
represented as bitfields. The retained `MultiPlayerState` declaration keeps
`unk14` as `unk32`, and the parked function uses whole-word masks.

### Forms tried and first divergence

- The original early-return spelling
  `if ((flags & 0x100) != 0) return 0;` generated the opposite initial
  branch polarity. The first divergence is the target's `beq` at `0x08060178`
  versus the candidate's `bne` for the same `0x100` test.
- The inverted outer form, with explicit `0xC0` and `0x400` arms, preserved
  the target's branch polarity and the target's separate `0x400` test. With
  scalar `unk14`, the latest measured candidate first diverges in the
  prologue: target `mov r6, r1` at offset `0x0E`, candidate `mov r8, r1`.
  The next role differences are target normalized `arg2` in `r8` versus
  candidate `r9`, target player count in `r9` versus candidate `sl`, and the
  target global address in `r7` versus candidate `r6`.
- The form `newCounter = flags & 0x400` with `newCounter` declared `unk8`
  loses the `0x400` test: narrowing makes bit 10 unrepresentable, and agbcc
  removes the condition. The first semantic divergence is the missing
  `mov #0x80; lsl #3; and` sequence in the `0x400` arm. A wide flags/counter
  source or explicit `else if ((flags & 0x400) != 0)` restores that test.
- A scoped `MultiPlayerState *state` alias combined with a source-buffer
  alias moved `arg1`, normalized `arg2`, and player count into the target
  high-register roles (`r6`, `r8`, and `r9`), but it kept `arg0` in `sl`
  instead of spilling it at `[sp]`. Its first divergence is therefore the
  target `str r0, [sp]` versus the alias candidate's `mov sl, r0`; subsequent
  global-address and status-flag lifetimes also differ.
- A pointer-to-global-slot alias retained a global address in a register but
  changed the incoming-argument and state-value lifetimes. It did not remove
  the prologue divergence and was not retained.
- The bitfield variants of `unk14` were measured against the initial mask
  test. A bitfield read introduces allocation-unit extraction/normalization,
  while the target uses a whole-word load followed by `mov #0x80`, `lsl #1`,
  and `and` for the `0x100` test. The first divergence is that read before
  the branch. Target writes also preserve whole-word `ldr`/`orr`/`str`
  operations; the measured bitfield write form is a width-preserving
  read-modify-write and does not match those stores.

### Measured verdict

The `unk14` sites are not bitfields. Every tested status operation is a
whole-`unk32` load, immediate mask, compare, and—when written—a whole-word
read/modify/store. The measured bitfield lowering adds extraction or
allocation-unit merging at the first `0x100` test and cannot explain the
assembly. The unresolved residual is natural C lifetime and register
allocation, not evidence for a packed `unk14` layout. The function is parked
with the explicit `0xC0`/`0x400` branch form and whole-word masks.
