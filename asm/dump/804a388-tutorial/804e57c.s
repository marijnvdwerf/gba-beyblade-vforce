	.include "asm/common.inc"

	thumb_func_start sub_804E57C
sub_804E57C:
	str	r1, [r0, #0x1c]
	str	r2, [r0, #0x20]
	bx	lr
	thumb_func_end sub_804E57C

.align 2, 0 @ Don't pad with nop.
