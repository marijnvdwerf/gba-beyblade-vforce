	.include "asm/common.inc"

	thumb_func_start renderActor2
renderActor2:
	push	{lr}
	mov	r1, #0x0
	bl	renderActor
	pop	{r0}
	bx	r0
	thumb_func_end renderActor2

.align 2, 0 @ Don't pad with nop.
