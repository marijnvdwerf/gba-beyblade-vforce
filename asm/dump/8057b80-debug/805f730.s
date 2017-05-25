	.include "asm/common.inc"

	thumb_func_start sub_805F730
sub_805F730:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r1, [r4]
	ldrh	r0, [r1, #0x1a]
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldrh	r1, [r4, #0x2e]
	ldrh	r0, [r4, #0x2c]
	cmp	r1, r0
	bne	.L4	@cond_branch
	ldrh	r2, [r4, #0x30]
	ldrh	r0, [r4, #0x28]
	cmp	r2, r0
	bne	.L4	@cond_branch
	ldrh	r2, [r4, #0x3e]
	ldrh	r0, [r4, #0x3c]
	cmp	r2, r0
	beq	.L5	@cond_branch
.L4:
	add	r0, r4, #0
	add	r0, r0, #0x68
	strh	r1, [r0]
	mov	r2, #0x2e
	ldsh	r1, [r4, r2]
	add	r0, r4, #0
	bl	sub_805F3A8
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	add	r0, r4, #0
	bl	sub_805F378
	ldrh	r0, [r4, #0x2c]
	strh	r0, [r4, #0x2e]
	ldrh	r0, [r4, #0x28]
	strh	r0, [r4, #0x30]
.L5:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F730

.align 2, 0 @ Don't pad with nop.
