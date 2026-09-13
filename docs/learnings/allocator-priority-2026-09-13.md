# agbcc global allocator priority (measured 2026-09-13)

`global_alloc` orders allocnos by `floor_log2(n_refs) * n_refs / live_length`;
the `.greg` dump order from `tools/asm-annotated.py --all-passes` reproduces
exactly with that formula. Callee-saved registers are handed out in that
order, so a role swap between two long-lived locals is decided by their
ref/length ratio, not by declaration order. A loop cursor with 20 refs over
196 insns (0.408) loses to a 4-ref temp over 17 insns (0.471). Changing the
outcome needs a real source difference that moves refs or live length:
declaring a record/sprite pointer inside the loop body, or a different loop
control expression (agbcc's `combine` can rewrite `old != 0` post-decrement
tests into `new != -1` when the source shape differs). Splitting a cursor
into a renamed duplicate alias or padding a live range is a lever.
