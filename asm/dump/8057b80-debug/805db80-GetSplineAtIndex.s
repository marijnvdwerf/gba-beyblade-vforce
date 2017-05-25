	.include "asm/common.inc"

	thumb_func_start GetSplineAtIndex
GetSplineAtIndex:
	push	{r4, lr}
	add	r4, r1, #0
	ldr	r2, [r0, #0x8]
	mov	r3, #0x0
	ldr	r0, [r0]
	ldr	r0, [r0, #0x4]
	cmp	r3, r0
	bge	.L1	@cond_branch
	add	r1, r0, #0
.L4:
	cmp	r3, r4
	bne	.L2	@cond_branch
	add	r0, r2, #0
	b	.L3
.L2:
	ldr	r0, [r2, #0x4]
	add	r2, r2, r0
	add	r3, r3, #0x1
	cmp	r3, r1
	blt	.L4	@cond_branch
.L1:
	mov	r0, #0x0
.L3:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end GetSplineAtIndex

.align 2, 0 @ Don't pad with nop.
