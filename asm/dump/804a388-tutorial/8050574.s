	.include "asm/common.inc"

	thumb_func_start sub_8050574
sub_8050574:
	strh	r1, [r0, #0xe]
	bx	lr
	thumb_func_end sub_8050574

.align 2, 0 @ Don't pad with nop.
