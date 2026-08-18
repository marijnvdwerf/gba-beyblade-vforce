	.include "asm/common.inc"

	thumb_func_start getLineMetaAtIndex
getLineMetaAtIndex:
	mov	r3, #0x0
	add	r0, r1, #4
	cmp	r1, #0
	beq	.L805BAE6	@cond_branch
	ldrh	r1, [r1]
	cmp	r2, r1
	blt	.L805BAEA	@cond_branch
.L805BAE6:
	mov	r0, #0x0
	b	.L805BAFA
.L805BAEA:
	cmp	r3, r2
	bge	.L805BAFA	@cond_branch
	add	r3, r2, #0
.L805BAF0:
	ldrh	r1, [r0]
	add	r0, r1, r0
	sub	r3, r3, #0x1
	cmp	r3, #0
	bne	.L805BAF0	@cond_branch
.L805BAFA:
	bx	lr
	thumb_func_end getLineMetaAtIndex

.align 2, 0 @ Don't pad with nop.
