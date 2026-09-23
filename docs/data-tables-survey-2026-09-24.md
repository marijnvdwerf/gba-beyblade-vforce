# Table-owned string pools: ownership survey (2026-09-24, main cc239d41)

Model (proven by credits.c, cc239d41): the asm/data*.s files at the head of
`.rodata` are the original TUs' `.data` in link order (= `.text` = `.rodata`
order). A non-const C table lands in `.data`; agbcc emits an initializer's
string literals in REVERSE first-occurrence order, pools duplicates per
object, and a table's strings precede the literals of functions defined
after it. Simulating that rule reproduces pools 86fcf20, 86fcf98, 87270f8,
8729894, 872af0c exactly; 86fd2e0 needs `_80691A4`+`_80691C4` and
`_8069474`+`_8069494` merged into one initializer each; 8723428 needs
`_806E724` split into four variables (`[4][5]`, then `[5]` ×3 at
0x806E774/788/79C — touches levelhud.c:173 `&_806E724[0x14]`, results.c:89/92);
87294ac needs `_80788cc` split (int list; one var 0x80788E0–0x8078937
holding both TRACK pointers; PAUSE `const char*[5]` at 0x8078938).

Duplicates across pools prove separate TUs: 78 strings in both 8729894 and
872af0c (beyblade.c is TWO original TUs: 0x805703C–0x80571F7 with data9
L1900–3071 + pool 8729894; 0x80571F8– with data9 L3072–3621, data8 L5–1945,
its own literals, pool 872af0c); "\x8F" in four pools; "Results" in
86fd2e0 and 8723428; "Attack"/"Defense" in 8723428 and 872af0c.

Ownership conflicts (table not in its user's TU): tutorial language arrays
`_806A434…_806A77C` (data12 L1585–1924) sit before background's `_806A828`
→ frontend.c or background.c, not tutorial.c; `LevelDesigns` (gameinit/
collision users) is background/levelrow/tutorial; the localized block
(data12 L4244–4963, users festate/levelselect/levelhud/results/collection/
credits) is tutorial.c's tail or a data-only TU after it; audio1 `_807561C`
vs particle's `word_8074D64` order conflict; data9 head (`_807572c…`,
`LevelDescriptions`; users gamestate/ai) is in the motion.c/main.c slot
(pool 87270f8 lies between motion.c and display.c rodata); `_80788cc` vars
are results.c or gameloop.c's tail (pool 87294ac between gameloop and
gameinit). No owner found: data10 font metrics, FontStyles + `_8068924…
_806897C`, `_806A3D0`, `_8069F7C`, `_806E6E8/7C4/830`, blobs L4964–5074,
data11 `Unk_8074D3C`, strings_8756870 ("EEPROM_V122").

hud.c/levelhud.c: one "/" object used by both, adjacent .text, split came
from name clustering → moderate evidence they are one TU (merge before
inlining "/").

## Ranked work list (all moved tables non-const, non-static)

1. tutorial.c `TutorialPages`: data12 L4101–4243 → `src/tutorial.c.o(.data)`
   between the data12 pieces; strings_8723428 lines 1–500 → tutorial.c(.rodata),
   remainder piece from `Str_87254D4`. Define after initTutorialManagement.
2. beyblade TU2 (into beyblade.c, no split needed): data9 L3072–3621 + data8
   L5–1945 (`RiderSpriteSheets`, `RiderPalettes`, `_807ac28` BeybladeData[60],
   `_807b858`, `_807BFD8…_807D7AC`, `byte_807D7C0`); drop strings_872af0c.
   Tables after getBeyBladeActorDataForIndex; name tables `const char*[][5]`.
3. beyblade TU1 → new file (0x805703C–0x80571F7 + data9 L1900–3071 +
   strings_8729894): needs `ItemDescriptionEntry` (5 `const char*` + u32) and
   `TalkingHead` (id + 5 strings) layouts.
4. levelselect.c: data12 L5–98 (`_80685E0`, `_80686E8`, `_8068710`,
   `_8068770`) before sub_8041078; drop strings_86fcf20; `.global` for
   `_806893C`, `_806E690`.
5. dialogue.c: data12 L99–110 + the unlabelled pointer at 0x80687C4 (→
   Str_86FCF98), pointer var after teletypeDefaultUserCodeHandler; drop
   strings_86fcf98; `_8068924` `.global`.
5a. no-string .data moves: data12a → credits.c (before Credits);
   transition L111–132; collection L133–142; menuobject L143–167.
6. results.c: `_80788cc` tail vars + data9 L1660–1677; drop strings_87294ac.
7. festate.c: data12 L251–1176 (opt. –1262) in three source blocks (A: L251–554
   before sub_8043DB8; B: L555–1176 after sub_8045160, before
   selectBladeFrontendHandler; C: L1177–1262 after it); merge the two label
   pairs; ~43 labels `.global`; strings_86fd2e0 lines 1–189 (or –209).
8. localized block (data12 L4244–4963) → tutorial.c tail or data-only TU;
   split `_806E724` into four.
9. level data (data9 L5–1640; `_807582c` needs a 15-string+5-word struct)
   → the motion/main slot; replaces strings_87270f8.
10. frontend tail (`_806A3D0`, language arrays, `_806A77C`): after the
    tutorial-vs-frontend/background question is settled.
11. "/" after hud+levelhud merge.
