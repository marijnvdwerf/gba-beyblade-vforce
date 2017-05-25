	.include "asm/common.inc"

	thumb_func_start sub_805B268
sub_805B268:
	strb	r1, [r0, #0xd]
	bx	lr
	thumb_func_end sub_805B268

.align 2, 0 @ Don't pad with nop.
