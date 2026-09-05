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
