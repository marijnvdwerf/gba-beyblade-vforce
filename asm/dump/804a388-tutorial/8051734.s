	.include "asm/common.inc"

	thumb_func_start sub_8051734
sub_8051734:
	push	{lr}
	bl	getSomeLevelID
	bl	sub_8051720
	pop	{r1}
	bx	r1
	thumb_func_end sub_8051734

.align 2, 0 @ Don't pad with nop.
