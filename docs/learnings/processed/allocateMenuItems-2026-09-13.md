# allocateMenuItems (0x0805ADD4)

Matched in src/menu.c; ROM SHA1 cd527c8c24e20e33913fc45199e64b3e6138a6e5.

## Types and layout

Existing MenuState, MenuItemDescriptor, MenuOptionSet, and UnkMenuItem declarations cover all accesses; no header changes were needed. The descriptor stride is 0x20, option-set stride 0x14, and item stride 0x4C.

The line-spacing field at MenuState +A is signed (LDSH). The byte height at +9 is reloaded with LDRB. The centering expression is (0xA0 - state->unk9) / 2 + state->unk20; signed division supplies LSR #31, ADD, ASR #1 without hand-written shift choreography. Descriptor x/y remain unsigned halfwords (LDRH). allocFont's existing narrow parameters supply the coordinate and size conversions.

## Measured source shape

- The function parameter is the descriptor cursor for construction; a separate local scans descriptors for the initial count. Reversing these roles moved the descriptor copy after the saved selected argument; the retained arrangement matches the prologue.
- Use one cumulative center variable throughout construction. The draft's separate currentCenter and center increased the frame and spilled the running center.
- Initialize the secondary option-table cursor inside a direct descriptor->subitems null check. Loading that cursor before the check reuses its load register, omits the target copy, and changes allocation beginning at function +0x94. The retained form matches every instruction.
- Pass the color as index++ == selected ? state->unk2E : state->unk2C. The draft's selected byte-address alias introduced another stack slot: frame 52 bytes instead of the target 48. Direct value selection still generates the target shared byte load after address selection.
- Store the allocation address into state->items before copying it to the item cursor, matching the target LDR/STR/MOV sequence. Compute the secondary item cursor from state->itemCount after allocation.
- Plain pointer-cursor increments recover the target hoisted successor addresses. Explicit itemNext and descriptorNext aliases were removed.
- Folded size and totalCount into their uses with matching ROM checks. Changed the guarded do-loop to a plain while, then removed the cached language. Removing language before simplifying the loop changed bytes; removing it afterward preserved the SHA1.

## Verification

allocateMenuItems has zero differing instruction rows. Full ROM compare passes after formatting. No header changes, casts on field accesses, raw offsets, or rule-breaking matching shapes remain.


## Fold-test review

The separate descriptor scan cursor was replaced with a single cursor that was rewound by `itemCount`; this probe was reverted after the ROM mismatch.

| Probe | Result | First difference | Probe SHA1 |
| --- | --- | --- | --- |
| separate `descriptors` cursor replaced by one rewound `descriptor` cursor | BYTE-REQUIRED | +0x0E | bf1ddcc91292e054df84180f9208f3f063b18875 |

The two descriptor cursors remain distinct.
