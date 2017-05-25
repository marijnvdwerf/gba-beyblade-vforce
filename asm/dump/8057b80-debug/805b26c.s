	.include "asm/common.inc"

	thumb_func_start sub_805B26C
sub_805B26C:
	strb	r1, [r0, #0xc]
	bx	lr
	thumb_func_end sub_805B26C

.align 2, 0 @ Don't pad with nop.
