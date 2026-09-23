# Data tables and string pools (survey 2026-09-24, updated after the migration)

## Model

Proven by credits.c (cc239d41) and confirmed by every later migration: the
asm/data*.s files at the head of `.rodata` are the original TUs' `.data` in
link order (= `.text` = `.rodata` order). A non-const C table lands in
`.data`; it is placed with `src/<tu>.c.o(.data)` in `ld_script.ld` where the
asm blob was. agbcc emits an initializer's string literals in REVERSE
first-occurrence order, pools duplicates per object, and a table's strings
precede the literals of functions defined after it. Simulating that rule
before building reproduced all 11 migrated pools on the first build. The
generic rules also live in `.claude/skills/agbcc/SKILL.md`.

Duplicates across pools prove separate TUs (78 strings in two beyblade pools
→ items.c + beyblade.c); a string shared by two nominal TUs ("/" in hud and
levelhud) was evidence they are one (merged into hud.c).

## Status

Every string-bearing table is a typed non-const C table in its owning TU:
tutorial (TutorialPages + the localized tail), levelselect, dialogue, items.c
(beyblade TU1), beyblade.c (TU2), results.c, festate.c (three source blocks),
leveldata.c (data-only TU), frontend.c tail, credits.c. Also moved without
strings: transition, collection, menuobject. The only strings file left is
src/strings_8756870.c ("EEPROM_V122", the prebuilt library's marker — stays).

## Remaining asm data (no strings — placement cannot be measured from pools;
## decide by `.text` order)

- data10: font metrics (owner unknown).
- data12.s head: FontStyles + `_8068924…_806897C` palettes/motion data
  (festate or menuobject).
- data12c.s: `_806A828` background ScreenLayout + `LevelDesigns`
  (background/levelrow).
- data12b.s: unreferenced blobs.
- data11.
- audio1: music `_807561C`.
- data9.s: `_80788cc` int list (gamestate).
- data9b.s: event `_8078990`, effects `_8078a08…`.
- data8.s: layer `GlyphIndexes`, IWRAM pointer table, `byte_807D980`,
  `Pal_807DA80`.
- dataB/7/C: incbins.
