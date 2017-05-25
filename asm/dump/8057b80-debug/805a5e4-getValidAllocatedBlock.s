	.include "asm/common.inc"

	thumb_func_start getValidAllocatedBlock
getValidAllocatedBlock:
	push	{lr}
	add	r2, r0, #0
	b	.L1
.L5:
	ldr	r0, [r2, #0x4]
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L3	@cond_branch
	add	r0, r2, #0
	b	.L4
.L3:
	add	r2, r2, #0x10
.L1:
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	bne	.L5	@cond_branch
	ldr	r0, .L6
	bl	printf
	mov	r0, #0x0
.L4:
	pop	{r1}
	bx	r1
.L7:
	.align	2, 0
.L6:
	.4byte	0x8755254
	thumb_func_end getValidAllocatedBlock

.align 2, 0 @ Don't pad with nop.
