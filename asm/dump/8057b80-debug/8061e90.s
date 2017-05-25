	.include "asm/common.inc"

	thumb_func_start sub_8061E90
sub_8061E90:
	ldrb	r0, [r0, #0xf]
	bx	lr
	thumb_func_end sub_8061E90

.align 2, 0 @ Don't pad with nop.
