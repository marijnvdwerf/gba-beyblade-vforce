	.include "asm/common.inc"

	thumb_func_start sub_805033C
sub_805033C:
	strh	r1, [r0, #0x20]
	bx	lr
	thumb_func_end sub_805033C

.align 2, 0 @ Don't pad with nop.
