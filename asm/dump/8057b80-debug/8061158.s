	.include "asm/common.inc"

	thumb_func_start sub_8061158
sub_8061158:
	mov	r1, #0x1
	strb	r1, [r0, #0x19]
	bx	lr
	thumb_func_end sub_8061158

.align 2, 0 @ Don't pad with nop.
