	.include "asm/common.inc"

	thumb_func_start sub_80585E8
sub_80585E8:
	add	r0, r0, #0x8c
	strb	r1, [r0]
	bx	lr
	thumb_func_end sub_80585E8

.align 2, 0 @ Don't pad with nop.
