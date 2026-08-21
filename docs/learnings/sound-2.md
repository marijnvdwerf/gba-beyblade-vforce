# Sound matching notes

## `sub_80627F0`

The best natural C draft is parked directly above the active `INCLUDE_ASM` in
`src/sound.c`. It matches the target prologue, timer update, channel loop,
callbacks, ring-buffer wrap, epilogue, and literal-pool layout except for the target's four dead alignment instructions after the field load:

```asm
add r0, #1
mov r5, #2
neg r5, r5
and r0, r5
```

The preceding `ldr r0, [r5, #8]` does match. The four-instruction difference
is the dead rounded-value computation; the target reuses the `-2` mask for the
timer alignment. The result in
`r0` is overwritten by the timer load, and the mask in `r5` is overwritten by
the distance calculation, so neither has a later consumer.

Source shapes tried included the raw-decomp-style locals and pointer aliases,
the alternate `varA`/`varB` draft, signed and unsigned temporaries, direct and
cached global accesses, `ceil2`/explicit mask spellings, explicit shared mask
temporaries, volatile fields/globals/locals, impossible and parity guards,
split complementary branches, identity conditions, and algebraic uses in the
timer mask. Volatile locals added stack stores; volatile fields retained only
the load; guards added branches. All ordinary C forms dead-code-eliminated the
alignment arithmetic. No inline assembly or register-pinning workaround was
used.

## `sub_8062C24`

The parser draft remains parked under `#if 0` above its active
`INCLUDE_ASM`. Changing the outer `while (_unk3005E08 <= 0)` into a `do`/`while`
loop removes the extra high-register save in the matching prologue shape. The
remaining divergence begins immediately after the prologue, where the stream
pointer and opcode receive different low-register assignments than the target.

Parser source shapes tried included the original scoped-local draft, raw-decomp
function-scope locals, explicit `found` and `handle` temporaries, sentinel
loops versus ordinary decrementing loops, `for (;;)` plus return, `do`/`while`
versus `while`, volatile timing globals, explicit timing temporaries and
pointer scopes, reordered declarations, and widening the opcode local. These
changed register pressure, branches, or literal-pool layout but did not resolve
the stream-pointer/opcode allocation without introducing an artificial shape.
