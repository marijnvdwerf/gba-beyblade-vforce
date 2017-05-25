	.include "asm/common.inc"

	thumb_func_start sub_8061160
sub_8061160:
	mov	r1, #0x0
	strb	r1, [r0, #0x19]
	bx	lr
	thumb_func_end sub_8061160

.align 2, 0 @ Don't pad with nop.
