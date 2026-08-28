#Fresh small - state matching notes

## `sub_805AFBC`

The semantic near-match is kept above the assembly include in `src/menu.c`.
The final draft uses a rotated control-flow layout with an explicit `goto` to
place the countdown test after the candidate-item body. It reproduces the
complete 0x94-byte function except for register coloring: the first divergent
instruction is `mov r6, r0` at offset `0x08` (the draft emits `mov r5, r0`),
with no size delta. The target keeps the state pointer in `r6` and the step in
`r5`;
the draft swaps those roles and consequently swaps the old-index and
callback register roles downstream.

### Near-match experiment table

| Change | First divergent instruction / size delta |
| --- | --- |
| Initial typed `while` draft with separate `count`, `remaining`, `step`, `oldIndex`, and callback temporary | Prologue gained `sub sp,#4`;
first divergence at `0x02`;
+ 0x12 bytes
    | | Removed callback temporary and used a separate countdown variable
    | Prologue still gained `sub sp,
    #4`;
first divergence at `0x02`;
+ 0x12 bytes
    | | Removed the cached bound and used `state->itemCount` directly | Same high - register spill;
first divergence at `0x02`;
+ 0x12 bytes
    | | Changed countdown,
    step, and old - index locals from `s32` to `unk32` | Same spill and register coloring;
first divergence at `0x02`;
+ 0x12 bytes | | Reordered scalar declarations | No change;
first divergence at `0x02`;
+ 0x12 bytes | | Changed the parameter name and all uses(`arg0` to `state`) | No change;
first divergence at `0x02`;
+ 0x12 bytes
    | | Used the raw - derived `for (;;)` / `if (count-- == 0)break` shape
    | Control flow near - match,
    but countdown block was placed before the body;
first divergence at the loop layout;
function remained 0x94 bytes | | Used `do / while (count-- != 0)`
    | Body was emitted before the initial count test,
    so zero - count behavior and layout differed;
first divergence at the entry loop;
function remained 0x94 bytes | | Used explicit `goto` labels(`condition` → `loop` → `end`)
    | All instructions and size match except register coloring;
first divergence `mov r6, r0` at `0x08`; size delta 0 |

The semantic source shape was preferred over adding `register` declarations,
which are disallowed by the project matching rules. The function remains on
assembly with its best draft retained for future work.

## Small-state lessons

- A byte-indexed bit set should be modeled as an array of 32-bit words when
  the target loads and stores words;
explicit byte
    - offset arithmetic through a typed pointer can preserve the
          target's shift ordering without raw offset dereferences.
    - For old agbcc,
    explicitly staged 32 - bit masked merges can preserve both operation widths and literal
    - pool order where an equivalent single expression does not.
    - When a target loop decrements a retry / count value at a shared condition label,
    source - level control
    - flow order can affect both branch polarity and register lifetimes.A rotated loop is sometimes
          the natural representation;
use an explicit source control
        - flow shape only when it describes the actual bounded search rather than as a compiler
              workaround.
        - A metadata table stride is part of the recovered type.The collectable environment
        - line record is `0x20` bytes because the target uses `index
    << 5`;
treating it as a larger speculative record forces an incorrect multiply.

## Parked-only layout rollback

The following layout hypotheses were removed from headers because their only
accesses were in parked functions:

- The signed view of `MenuState.unk24`, plus `MenuState.unk2C` and
  `MenuState.callback`.
- `UnkMenuItem.unk44`.
- `CurrentGameState.unk594[4]`; it is restored to `unk8 unk594[0x10]`.
- The typed view of `_unk3000F20[16]` and signed views of `_unk3000F40` and
  `_unk3000F44`; the globals retain their original declarations.

The parked drafts remain above their `INCLUDE_ASM` lines and document these
layouts locally without changing matched translation units.
