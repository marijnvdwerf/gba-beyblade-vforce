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
	bne	.L1	@cond_branch
	b	.L4
.L6:
	add	r0, r1, #0
	b	.L3
.L1:
	ldrh	r3, [r0]
	cmp	r2, r3
	bge	.L4	@cond_branch
	lsl	r0, r4, #0x10
	lsr	r5, r0, #0x10
	add	r4, r3, #0
.L7:
	ldrh	r0, [r1, #0x2]
	cmp	r0, r6
	bne	.L5	@cond_branch
	ldrh	r0, [r1, #0x4]
	cmp	r0, r5
	beq	.L6	@cond_branch
.L5:
	ldrh	r0, [r1]
	add	r1, r0, r1
	add	r2, r2, #0x1
	cmp	r2, r4
	blt	.L7	@cond_branch
.L4:
	mov	r0, #0x0
.L3:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end getLineMetaobjectByTypeAndId

.align 2, 0 @ Don't pad with nop.
