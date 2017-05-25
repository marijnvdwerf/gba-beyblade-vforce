	.include "asm/common.inc"

	thumb_func_start sub_804E584
sub_804E584:
	str	r1, [r0, #0x24]
	str	r1, [r0, #0x10]
	str	r2, [r0, #0x28]
	str	r2, [r0, #0x14]
	str	r3, [r0, #0x2c]
	str	r3, [r0, #0x18]
	bx	lr
	thumb_func_end sub_804E584

.align 2, 0 @ Don't pad with nop.
