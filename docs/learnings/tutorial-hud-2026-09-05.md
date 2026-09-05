# Tutorial and HUD matching — 2026-09-05

## sub_804A310 (0x0804A310)

Matched with:

```c
void sub_804A310(void)
{
    sub_804AE34(0, 0x3C);
}
```

The generated sequence matched the six-instruction dump: `push {lr}`, the two
immediate arguments, `bl sub_804AE34`, and the `pop`/`bx` return sequence. The
full ROM compare passed.

## sub_804A550 (0x0804A550)

Matched with a typed `TutorialEntry*` parameter and typed tutorial data. The
page data is represented as five signed language counts followed by eight
five-pointer string groups. The signed count produces the target `bge` in the
page-bound check. The initial page string is selected from group zero, and the
advancing lookup uses `languageStrings[index].strings[getLanguage()]`; agbcc
strength-reduces the indexed access to the target byte-cursor arithmetic while
keeping the source fully typed.

The matched control flow is a guarded `do/while`: the done flag is initialized
before the guard, the loop waits for VBlank, updates input, decrements the
30-frame timer, and advances one page when the input or timeout condition is
met. The frame toggle uses a zero-initialized `unk16` temporary, conditionally
sets it to one, and performs one final halfword store. This reproduces the
shared target store and the 24-byte frame with the incoming entry spilled at
`[sp, #16]` and the loop counter at `[sp, #20]`.

The first near-miss used a byte cursor and cast-and-offset dereference for the
string lookup. Replacing that with the typed grouped-array index preserved the
same instruction sequence and removed the raw offset access. The full function
diff was identical, including literal-pool placement and trailing padding; the
ROM compare passed.
