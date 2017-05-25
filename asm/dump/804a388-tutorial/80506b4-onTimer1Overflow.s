	.include "asm/common.inc"

	thumb_func_start onTimer1Overflow
onTimer1Overflow:
	push	{lr}
	bl	sub_8062774
	pop	{r0}
	bx	r0
	thumb_func_end onTimer1Overflow

.align 2, 0 @ Don't pad with nop.
