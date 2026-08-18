	.include "asm/common.inc"

	thumb_func_start getLineMetaobjectByTypeAndId
getLineMetaobjectByTypeAndId:
	push	{r4, r5, r6, lr}
	add	r0, r1, #0
	add	r6, r2, #0
	add	r4, r3, #0
	mov	r2, #0x0
	add	r1, r0, #4
	cmp	r0, #0
	bne	.L805BB72	@cond_branch
	b	.L805BB94
.L805BB6E:
	add	r0, r1, #0
	b	.L805BB96
.L805BB72:
	ldrh	r3, [r0]
	cmp	r2, r3
	bge	.L805BB94	@cond_branch
	lsl	r0, r4, #0x10
	lsr	r5, r0, #0x10
	add	r4, r3, #0
.L805BB7E:
	ldrh	r0, [r1, #0x2]
	cmp	r0, r6
	bne	.L805BB8A	@cond_branch
	ldrh	r0, [r1, #0x4]
	cmp	r0, r5
	beq	.L805BB6E	@cond_branch
.L805BB8A:
	ldrh	r0, [r1]
	add	r1, r0, r1
	add	r2, r2, #0x1
	cmp	r2, r4
	blt	.L805BB7E	@cond_branch
.L805BB94:
	mov	r0, #0x0
.L805BB96:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end getLineMetaobjectByTypeAndId

.align 2, 0 @ Don't pad with nop.
