	.include "asm/common.inc"

	thumb_func_start sub_8063DE8
sub_8063DE8:
	strb	r1, [r0, #0xc]
	strb	r2, [r0, #0xd]
	strb	r3, [r0, #0xe]
	bx	lr
	thumb_func_end sub_8063DE8

.align 2, 0 @ Don't pad with nop.
