	.include "asm/common.inc"

	thumb_func_start getLineMetaObjectBytype
getLineMetaObjectBytype:
	push	{r4, lr}
	add	r4, r2, #0
	mov	r2, #0x0
	add	r3, r1, #4
	cmp	r1, #0
	bne	.L805BB3E	@cond_branch
	b	.L805BB54
.L805BB3A:
	add	r0, r3, #0
	b	.L805BB56
.L805BB3E:
	ldrh	r1, [r1]
	cmp	r2, r1
	bge	.L805BB54	@cond_branch
.L805BB44:
	ldrh	r0, [r3, #0x2]
	cmp	r0, r4
	beq	.L805BB3A	@cond_branch
	ldrh	r0, [r3]
	add	r3, r0, r3
	add	r2, r2, #0x1
	cmp	r2, r1
	blt	.L805BB44	@cond_branch
.L805BB54:
	mov	r0, #0x0
.L805BB56:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end getLineMetaObjectBytype

.align 2, 0 @ Don't pad with nop.
