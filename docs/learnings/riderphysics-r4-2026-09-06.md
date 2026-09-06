# riderphysics r4 learnings

## sub_804D710 (0x0804D710)

- Replaced the dump inclusion in `src/riderphysics.c` with a natural C implementation.
- The word read at offset `0x19C` required extending `RiderBase` while preserving its fixed size: `unk32 unk19C` between `padBC[0xE0]` and `pad1A0[0x5C]`.
- `sub_804E440` must return `unk8` (not `unk32`) so the caller emits the target `lsl r0, #24` normalization after the call. Its callee bytes remain unchanged.
- Matched all instructions at `0x0804D710` after the return-type correction.

## sub_804E154 (0x0804E154)

- Replaced the dump inclusion in `src/riderphysics.c` with a natural C implementation retaining the three-argument ABI; the middle argument is unused.
- The third argument remains `unk32` at the prototype, with a local `unk16` copy to produce the target entry `lsl`/`lsr` narrowing before the first call.
- Added only the accessed `RiderBase` fields at offsets `0x30`, `0x3C`, `0x6C`, `0x70`, `0x74`, `0xCC`, `0x144`, `0x150`, `0x19C`, `0x1EE`, and `0x1F2`, preserving the fixed `0x428`-byte layout.
- The `RiderHasFlag` result is tested directly; plain zero stores and signed `s16` field declarations reproduce the target evaluation order and register allocation without aliases or casts. After the first `strh` update, the target performs `lsl r0, #16` at `0x0804E184`, `cmp r0, #0` at `0x0804E186`, and signed `bge` at `0x0804E188`; the second update has the same sign test at `0x0804E19A`, `0x0804E19C`, and `0x0804E19E`. These post-store sign tests support the signed `s16` declarations for `unk1EE` and `unk1F2`.
- A local `unk16` copy of the third argument is required to keep its entry normalization and final halfword store shape.
- Matched all instructions at `0x0804E154`.

## sub_804D754 (0x0804D754)

- The function is parked with its dump retained. A typed natural draft is kept directly above the `INCLUDE_ASM` line in `src/riderphysics.c` inside `#if 0`; draft-only fields are confined to `RiderD754Draft`.
- The target's category ladder compares against `0x8FF`, `0x3FF`, `0x1FF`, and `0xFF`, and writes `Actor->unk36` as `(0x100 - value) >> 1` for the final threshold. The target reads the current and motion-target halfwords at offsets `0x204` and `0x206`.
- The natural draft matches the target through `cmp r4, r3`. The first divergence is the following target-only 16-byte sequence:

      cmp r4, #1
      bls .L804D840
      mov r0, #0x80
      lsl r0, r0, #3
      cmp r4, r0
      bne .L804D844
      .L804D840:
      mov r0, #1
      neg r0, r0

  The computed `-1` is overwritten by the following `mov r0, #0` before the visible clear-and-call sequence, so it has no visible consumer and appears dead. The source of this target-only sequence remains unresolved.
- The signed draft fields are supported by the target's measured comparisons: `unk48` is loaded at `0x0804D778` and tested with `cmp r1, #0xC`/`ble` at `0x0804D77A`/`0x0804D77C`, then against `-0xC`/`bge` at `0x0804D786`/`0x0804D788`; `unk4C` has the corresponding tests at `0x0804D78E`/`0x0804D790` and `0x0804D79A`/`0x0804D79C`. The category value loaded from `unk208` at `0x0804D806` is tested by signed `bgt` branches at `0x0804D80C`, `0x0804D814`, `0x0804D81C`, and `0x0804D822`, and its derived value uses `asr` at `0x0804D82A`; these observations support the draft's signed `s32` declarations.
- Step table:

  | Change | Result |
  | --- | --- |
  | Use signed `s32` draft fields for `unk48`, `unk4C`, and `unk208` | The target's signed `ble`/`bge` tests against `+/-0xC` and signed `bgt` ladder tests require the signed draft declarations; the exact evidence is listed above. |
  | Use `s32` temporaries for fields `0x204` and `0x206` | Entry loads matched the target's signed `ldrsh` instructions. |
  | Use `actor_80580C0(Actor*, unk16, unk16)` | Helper argument setup matched the target. |
  | Correct the motion-target field from `0x20A` to `0x206` | Target field loads/stores and the `0x206` literal matched. |
  | Restore the direct natural call `actor_80580C0(actor, category, category)` | First divergence remained at function offset `0xE0` (`0x0804D834`); the candidate was `0x10` bytes shorter. |
  | Fold the matched `sub_804E154` `value` local into `rider->unk150 = arg2` | First divergence moved to function offset `0x04` (`0x0804E158`): the target entry narrowing `lsl`/`lsr` pair disappeared, and the function/pool layout changed. |
  | Fold `current` into `category != rider->unk204` | First divergence was function offset `0x02` (`0x0804D756`), with a different saved-register allocation and the early halfword load moved. |
  | Fold `target` into `motion != rider->unk206` | First divergence was function offset `0x08` (`0x0804D75C`), with a different actor register and the early halfword load moved. |
  | Share the reset/call/store sequence through one natural combined condition | First divergence was function offset `0x08` (`0x0804D75C`); the resulting branch polarity and body layout also differed, so the original duplicated control flow was retained in the draft. |
  | Add the unused conditional/comma expression for the apparent `-1` result | agbcc rejected the direct comma expression because its left operand had no effect. |
  | Use `((void)((category <= 1 || category == 0x400) ? -1 : 0), category)` | It compiled but optimized away; first divergence and the `0x10` size delta were unchanged. |
  | Park the best typed draft under `#if 0` and restore `INCLUDE_ASM` | The dump remains authoritative and no artificial matching construct is shipped. |
