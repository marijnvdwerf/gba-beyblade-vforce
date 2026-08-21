# Environment actor and sound parser learnings

## `sub_8054FE0`

`sub_8054FE0` matched in `/src/envactor.c`. The function pins the following
`GameData` fields and their offsets:

- `unkC74` at `0xC74`: `AllocatedBlock *`; the actor allocation is released
  through this field and the field is cleared.
- `unkC78` at `0xC78`: `EnvironmentNode *`; the node list is traversed.
- `unkC7C` at `0xC7C`: `EnvironmentActorContainer *`; its actor slots are
  traversed.
- `unkC80` at `0xC80`: node count.
- `unkC84` at `0xC84`: actor count; the actor loop uses post-decrement
  termination.
- `unkC88` at `0xC88`: `EnvironmentObject *`; the field is cleared after the
  actor cleanup.
- `unkC8C` at `0xC8C`: cleared at function exit.
- `unkC90` at `0xC90` and the padding through `0xC9F` remain explicitly laid
  out so that `unkCA0` retains its original offset.

The shared layouts added for this function are `EnvironmentActorSlot`,
`EnvironmentActorContainer`, `EnvironmentNode`, and `EnvironmentObject`.
The actor loop needs the source shape with the initial zero-count branch and a
body-first `do` loop. Replacing it with the simpler equivalent
`actor = actorContainer->slots; while (actorCount-- != 0)` changed the generated
branch/body-entry instructions and failed the ROM comparison. Likewise, the
shared `SpriteEntry *zero` local is needed by this compiler shape: replacing it
with two direct `NULL` assignments changed the generated code and failed the
comparison. The matching source therefore retains the original CSE-friendly
zero temporary.

## `sub_8062C24`

The parser draft is retained disabled directly above the active
`INCLUDE_ASM` in `/src/sound.c`; the dump remains authoritative because the
C draft does not match.

For the best draft, the first divergent instruction is immediately after the
matching target prologue. The target's instruction at the first body address
loads `_unk3005E0C` (`ldr r0, .L8062C6C`), while the draft first saves the
high register (`mov r7, r8`). This maps to the first guard statement,
`if (_unk3005E0C != 1)`, with the extra save caused by local-variable
liveness rather than by a separate semantic statement.

The target prologue is:

```asm
push {r4, r5, r6, r7, lr}
```

The best draft prologue is:

```asm
push {r4, r5, r6, r7, lr}
mov  r7, r8
push {r7}
```

The following source-shape experiments were tried; none are retained as active
code:

- A local stream cursor made pointer updates readable, but retained an extra
  cursor register and changed the global-pointer allocation.
- Direct updates to `_unk3005E00` removed the cursor, improving the body shape
  but still produced the extra high-register save.
- A post-decrement `while` for the opcode-8 channel scan matched the target's
  rotated termination sequence.
- An explicit found flag and a decrementing `for (;;)` scan for opcode 9
  reproduced the target's `i == -1` exit shape, but increased register
  pressure.
- Separate scoped byte temporaries for opcode 8 and opcode 9 moved the byte
  values between registers without eliminating the prologue mismatch.
- Keeping the sound-resource pointer live changed a byte load into the target's
  preferred low-register shape in one case, but made the opcode-9 allocation
  worse.
- Removing the temporary sound handle and assigning the call result directly
  to the channel field changed call-result liveness but did not match.
- Combining the C and D opcode cases introduced extra materialization of
  `opcode >> 4`; separating them removed those instructions and was closer.
- Raw `for (i = 4; i != 0; i--)` channel loops avoided the high-register save,
  but produced the wrong first-scan control flow and switch dispatch shape.
- Narrowing the found flag changed neither the relevant allocation nor the
  mismatch.
- Treating the stream global as `u8 **` generated `ldmia` and incorrect pointer
  offsets; the incomplete-array representation was restored.
- A volatile-qualified table lookup was rejected by agbcc as a discarded
  qualifier and was not retained.
- Switching the event resource field between pointer and integer forms changed
  casts and allocation but conflicted with the typed-layout requirements and
  did not produce a match.
