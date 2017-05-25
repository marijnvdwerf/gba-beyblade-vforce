	.include "asm/common.inc"

	thumb_func_start sub_80650F8
sub_80650F8:
	str	r1, [r0, #0x10]
	bx	lr
	thumb_func_end sub_80650F8

.align 2, 0 @ Don't pad with nop.
