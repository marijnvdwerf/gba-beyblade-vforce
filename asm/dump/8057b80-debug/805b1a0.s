	.include "asm/common.inc"

	thumb_func_start sub_805B1A0
sub_805B1A0:
	push	{r4, lr}
	add	r4, r0, #0
	add	r3, r1, #0
	mov	r0, #0x4c
	add	r1, r3, #0
	mul	r1, r1, r0
	ldr	r0, [r4, #0xc]
	add	r1, r0, r1
	cmp	r3, #0
	blt	.L6	@cond_branch
	ldr	r0, [r4, #0x14]
	cmp	r3, r0
	bge	.L6	@cond_branch
	ldr	r0, [r1, #0x48]
	cmp	r0, #0
	beq	.L3	@cond_branch
	add	r1, r0, #0
.L3:
	ldr	r0, [r1, #0x40]
	cmp	r0, #0
	beq	.L6	@cond_branch
	cmp	r2, #0
	blt	.L6	@cond_branch
	ldr	r0, [r1, #0x38]
	cmp	r2, r0
	bge	.L6	@cond_branch
	str	r2, [r1, #0x34]
	add	r0, r4, #0
	bl	sub_805AC80
.L6:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805B1A0

.align 2, 0 @ Don't pad with nop.
