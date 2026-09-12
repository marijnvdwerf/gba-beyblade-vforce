# sub_80596AC byte-local follow-up — 2026-09-12

Removed the BGLayer.var64 union. The field is again unk16, all field accesses use var64 directly, and sub_80596AC declares horizontal as unk8 instead of unk32. Its assignment remains `horizontal = bgLayer->var64 & 1;`. This matches all original instructions without a cast or extra temporary.

## Measured probes

- Plain unk8 field with padding: sub_8058AA8+0x2A changes strh to strb and +0x2C changes ldrh to ldrb. unref_8058C74 changes its halfword zero store to a byte store and changes allocation. sub_8058EF4+0x24 and sub_8048FFC+0x08 change ldrh to ldrb. sub_80596AC stays exact. Rejected.
- A 16-bit unk16 bitfield: all four existing functions stay exact, but sub_80596AC+0x24 changes ldrb to ldrh. Rejected.
- Plain unk16 field, explicit unk8 cast before the mask in sub_80596AC: exact.
- Plain unk16 field, separate unk8 mode local feeding the wide horizontal local: exact.
- Plain unk16 field, unk8 horizontal assigned first and then masked: exact.
- Fold into `horizontal = bgLayer->var64 & 1` with unk8 horizontal: exact. Retained as the simplest shape.

This disproves the earlier inference that differing access widths here require a union. With this compiler and expression, narrowing the destination local is enough to select a byte load from a halfword member. Target access width alone does not prove a byte member or an explicit byte view. The source's original declaration remains unknown, but the plain field is sufficient for the exact match.

After clang-format, diff.ts reports zero differing rows for sub_8058AA8, unref_8058C74, sub_8058EF4, sub_8048FFC, and sub_80596AC. Full ROM SHA1 compare passes (cd527c8c24e20e33913fc45199e64b3e6138a6e5).
