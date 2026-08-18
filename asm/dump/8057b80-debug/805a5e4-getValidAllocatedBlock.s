	.include "asm/common.inc"

	thumb_func_start getValidAllocatedBlock
getValidAllocatedBlock:
	push	{lr}
	add	r2, r0, #0
	b	.L805A5FC
.L805A5EA:
	ldr	r0, [r2, #0x4]
	cmp	r0, #0
	bne	.L805A5FA	@cond_branch
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L805A5FA	@cond_branch
	add	r0, r2, #0
	b	.L805A60C
.L805A5FA:
	add	r2, r2, #0x10
.L805A5FC:
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	bne	.L805A5EA	@cond_branch
	ldr	r0, .L805A610
	bl	printf
	mov	r0, #0x0
.L805A60C:
	pop	{r1}
	bx	r1
.L805A610:
	.align	2, 0

	.4byte	0x8755254
	thumb_func_end getValidAllocatedBlock

.align 2, 0 @ Don't pad with nop.
