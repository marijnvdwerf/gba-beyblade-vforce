	.include "asm/common.inc"

	thumb_func_start sub_80640F8
sub_80640F8:
	push	{lr}
	bl	sub_8063CD0
	pop	{r0}
	bx	r0
	thumb_func_end sub_80640F8

.align 2, 0 @ Don't pad with nop.
