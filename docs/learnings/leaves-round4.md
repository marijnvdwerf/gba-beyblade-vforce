# Round 4 decompilation learnings

## Variadic no-op functions

An empty old-GCC variadic function body can still emit the complete ABI
prologue and epilogue. For a variadic `printf`-shaped function, keeping the
named parameter and ellipsis in the C signature produced the expected save of
`r0`–`r3`, stack adjustment, and return without requiring explicit statements.

## Narrow conversion and register allocation

When a 32-bit argument is compared with a 16-bit record field, declaring the
conversion temporary as `unk16` preserved the compiler's zero-extension
sequence and, in this case, kept the converted value separate from the source
argument. A wider temporary allowed agbcc to coalesce the values and changed
callee-saved register allocation even though the generated operations were
semantically equivalent.

## Variable-sized metadata records

For metadata stored as variable-sized records, a typed record header plus a
byte-pointer-style stride expression preserves the record-width loads while
avoiding raw offset dereferences in the final source. Keeping the initial
count test separate from the top-tested loop also preserved the original
null/empty-list control-flow shape.
