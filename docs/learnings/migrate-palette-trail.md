# Palette and trail migration learnings

- When one fixed-layout object points at storage that is consumed at multiple proven widths, a named union of typed pointers preserves the access widths without raw offset casts. The union belongs in the shared layout header, and each access selects the width that the operation actually uses.
- In old agbcc, a countdown update placed after an early-return branch can preserve the original control-flow shape. Keep the decrement in the branch that consumes the loop rather than hoisting it ahead of a branch whose other arm returns.
