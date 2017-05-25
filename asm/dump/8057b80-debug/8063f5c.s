	.include "asm/common.inc"

	thumb_func_start sub_8063F5C
sub_8063F5C:
	add	r0, r0, #0xdc
	str	r1, [r0]
	bx	lr
	thumb_func_end sub_8063F5C

.align 2, 0 @ Don't pad with nop.
