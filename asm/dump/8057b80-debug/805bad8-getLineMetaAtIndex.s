	.include "asm/common.inc"

	thumb_func_start getLineMetaAtIndex
getLineMetaAtIndex:
	mov	r3, #0x0
	add	r0, r1, #4
	cmp	r1, #0
	beq	.L1	@cond_branch
	ldrh	r1, [r1]
	cmp	r2, r1
	blt	.L2	@cond_branch
.L1:
	mov	r0, #0x0
	b	.L4
.L2:
	cmp	r3, r2
	bge	.L4	@cond_branch
	add	r3, r2, #0
.L5:
	ldrh	r1, [r0]
	add	r0, r1, r0
	sub	r3, r3, #0x1
	cmp	r3, #0
	bne	.L5	@cond_branch
.L4:
	bx	lr
	thumb_func_end getLineMetaAtIndex

.align 2, 0 @ Don't pad with nop.
