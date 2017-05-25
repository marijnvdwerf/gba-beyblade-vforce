	.include "asm/common.inc"

	thumb_func_start sub_8050FE8
sub_8050FE8:
	str	r1, [r0, #0x1c]
	bx	lr
	thumb_func_end sub_8050FE8

.align 2, 0 @ Don't pad with nop.
