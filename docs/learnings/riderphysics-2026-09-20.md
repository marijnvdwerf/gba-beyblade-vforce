# riderphysics matching learnings — 2026-09-20

## sub_804E2A4 (0x0804E2A4)

- The matched signature is `s32 sub_804E2A4(s32 arg0, s32 arg1, s32 period, s16 scale, unk32 unused, s32 limit)`.
- The incoming fourth argument has `lsl #16; lsr #16; asr #16` at offsets `0x08`, `0x0A`, and `0x0C`; its signed-halfword view controls the zero/positive/negative branches. The zero-scale delegate narrows the same value to the sibling `unk8 scale` call shape at `0x12` and `0x14`.
- Replacing the cast choreography with a natural `s16 scaleValue`, `scaleValue = -scale` / `scaleValue = scale`, and `result = (scaleValue * magnitude) >> 8` produced an instruction-identical function. The retained source has no scale casts.
- The separate `s32 adjusted` temporary is byte-required. Folding the positive branch to `delta = arg2 + delta + 1` first diverged at `0x38`: target `add r0, r1, #1`, folded form `add r0, r5, r1`. The negative branch then diverged at `0x48`: target `sub r0, r1, #1`, folded form began with `add r0, r5, #1`.
- Grouping variants `arg2 + (delta + 1)`, `(arg2 + delta) + 1`, `(delta + 1) + arg2`, and the corresponding folded negative forms also failed from `0x38`; none restored the target's separate `delta + 1` temporary before adding `period`.
- Renaming parameters to `period`, `scale`, `unused`, and `limit` after `sub_804E258` did not change code generation.
- A repository-wide search found no declaration of `sub_804E3B0` outside this translation unit; the local forward declaration matches its later definition (`unk32` return and three `unk32` parameters).
