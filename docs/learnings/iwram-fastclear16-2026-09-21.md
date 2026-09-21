# fastMemoryClear16ARM — 2026-09-21

Matched at 0x030070B8 (100 bytes) using the installed ARM compiler and the
existing flags. Zero-length and odd-length checks, including the error
callback, remain C. The shift and halfword fill loop are inline assembly,
explicitly authorized by the user. No register declarations or header
changes are needed.

All operands use `+r`: count, fill, and destination in that order. Count and
destination are modified by the block. Fill is conservatively declared
read/write even though its register is only read. This represents the
modified operands without the input-only cursor caveat of the copy routine.
The clobber list is r0, r1, r2, cc, memory. `strh` writes the low 16 bits of
the wide fill argument; no source-level narrowing or conversion is needed.

The count, fill-value, and cursor aliases in the parked draft are removed;
the direct parameters match. No disposable local remains. Call sites pass
byte counts, including halfword counts multiplied by two and tile counts
multiplied by the tile size.

Measured alternatives:

| Shape | First difference |
| --- | --- |
| Count output plus input-only fill/destination | Exact, but destination constraint incomplete |
| Count/destination read/write, fill input-only | +0x10: destination copy precedes fill copy |
| All three operands read/write | Exact; retained |
| Fill local with input-only fill constraint | Same +0x10 ordering difference |
| Destination cursor local with read/write constraint | +0x08: copies destination instead of testing count |

The shared error callback declaration is moved above both memory helpers;
its parameter is const char*, consistent with the actual string definitions.
The old parked callback declaration used a different return type, but the
return is unused and no active ABI or header was changed.

The standalone assembly dump is removed after the US SHA1 match. Its old
end directive incorrectly named fastMemoryCopyARM, so the full-ROM SHA1 is
the verification authority rather than the generic symbol diff tool.

Final verification: both US and EU full-ROM SHA1 comparisons pass.
