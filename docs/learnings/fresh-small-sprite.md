# Fresh small-function matching notes

## Repeatable agbcc patterns

- Preserve a halfword argument with an explicit `unk16` temporary or parameter when the target begins with `lsl #16` followed by `lsr #16`. This also keeps later comparisons and loop counters at halfword width.
- For decrementing counts, separate the load and decrement statements when the target loads the field first and subtracts afterward. Combining them can move the subtraction into a different register.
- A scoped pointer alias can shorten a live range around a call or a hardware operation. Use this only when it expresses a real source-level lifetime; do not use `volatile`, `register`, or inline assembly as register-allocation controls.
- For linked-list code, retain the original head separately from the cursor that advances through the list. The target often returns the original head while storing the advanced cursor as the tail.
- Use the project’s typed structs for all fixed offsets. Add fields only when the matched function accesses them, and preserve padding for unobserved bytes.

## Miss notes

- `GetLineIndexOfType` remained a natural-source near-match. Its index and scaled-offset values consistently allocated to the opposite registers from the target; no artificial source shape was retained, and its speculative byte field was removed.
- `sub_80659F0` had a semantically correct battery-backup read draft, but the compiler retained an extra callee-saved register and produced different pointer lifetimes/register roles. The draft was restored to `INCLUDE_ASM`.
- `sub_8060C1C` was reduced to a close linked-list allocator draft, but its relinking branch layout and a few register roles remained different. The source was restored to `INCLUDE_ASM`.
