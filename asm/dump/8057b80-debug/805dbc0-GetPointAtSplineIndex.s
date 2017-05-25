	.include "asm/common.inc"

	thumb_func_start GetPointAtSplineIndex
GetPointAtSplineIndex:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r2, #0
	bl	GetSplineAtIndex
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r2, r0, #0
	add	r2, r2, #0x20
	ldr	r0, [r0]
	cmp	r4, r0
	bge	.L2	@cond_branch
	lsl	r0, r4, #0x2
	add	r0, r0, r2
	ldr	r1, [r0]
	lsl	r1, r1, #0x4
	ldr	r0, [r5, #0x4]
	add	r0, r0, r1
	b	.L3
.L2:
	mov	r0, #0x0
.L3:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end GetPointAtSplineIndex

.align 2, 0 @ Don't pad with nop.
