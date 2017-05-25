	.include "asm/common.inc"

	thumb_func_start sub_805BAFC
sub_805BAFC:
	push	{r4, lr}
	add	r4, r2, #0
	mov	r2, #0x0
	add	r3, r1, #4
	cmp	r1, #0
	bne	.L1	@cond_branch
	b	.L4
.L5:
	add	r0, r3, #0
	b	.L3
.L1:
	ldrh	r1, [r1]
	cmp	r2, r1
	bge	.L4	@cond_branch
.L6:
	ldrh	r0, [r3, #0x4]
	cmp	r0, r4
	beq	.L5	@cond_branch
	ldrh	r0, [r3]
	add	r3, r0, r3
	add	r2, r2, #0x1
	cmp	r2, r1
	blt	.L6	@cond_branch
.L4:
	mov	r0, #0x0
.L3:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805BAFC

.align 2, 0 @ Don't pad with nop.
