	.include "asm/common.inc"

	thumb_func_start GetSplineLineAtIndex
GetSplineLineAtIndex:
	push	{r4, lr}
	add	r4, r2, #0
	bl	GetSplineAtIndex
	add	r2, r0, #0
	cmp	r2, #0
	beq	.L2	@cond_branch
	ldr	r1, [r2]
	lsl	r0, r1, #0x2
	add	r0, r0, #0x20
	add	r2, r2, r0
	cmp	r4, r1
	bge	.L2	@cond_branch
	lsl	r0, r4, #0x4
	add	r0, r2, r0
	b	.L3
.L2:
	mov	r0, #0x0
.L3:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end GetSplineLineAtIndex

.align 2, 0 @ Don't pad with nop.
