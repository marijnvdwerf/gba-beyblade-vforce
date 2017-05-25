	.include "asm/common.inc"

	thumb_func_start deallocateQuadTree
deallocateQuadTree:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r0, [r4, #0x24]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
.L1:
	mov	r5, #0x0
	str	r5, [r4, #0x24]
	ldr	r0, [r4, #0x28]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	deallocateBlock
.L2:
	str	r5, [r4, #0x28]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end deallocateQuadTree

.align 2, 0 @ Don't pad with nop.
