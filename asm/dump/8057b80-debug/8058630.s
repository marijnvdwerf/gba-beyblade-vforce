	.include "asm/common.inc"

	thumb_func_start sub_8058630
sub_8058630:
	add	r0, r0, #0xc0
	str	r1, [r0]
	bx	lr
	thumb_func_end sub_8058630

.align 2, 0 @ Don't pad with nop.
