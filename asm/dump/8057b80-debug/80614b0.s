	.include "asm/common.inc"

	thumb_func_start sub_80614B0
sub_80614B0:
	push	{lr}
	strh	r1, [r0, #0x8]
	bl	sub_806123C
	pop	{r0}
	bx	r0
	thumb_func_end sub_80614B0

.align 2, 0 @ Don't pad with nop.
