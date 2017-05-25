	.include "asm/common.inc"

	thumb_func_start sub_8061E94
sub_8061E94:
	strb	r1, [r0]
	add	r0, r0, #0x1
	bx	lr
	thumb_func_end sub_8061E94

.align 2, 0 @ Don't pad with nop.
