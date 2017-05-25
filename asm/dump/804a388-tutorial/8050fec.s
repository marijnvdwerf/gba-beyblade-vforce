	.include "asm/common.inc"

	thumb_func_start sub_8050FEC
sub_8050FEC:
	str	r1, [r0, #0x18]
	bx	lr
	thumb_func_end sub_8050FEC

.align 2, 0 @ Don't pad with nop.
