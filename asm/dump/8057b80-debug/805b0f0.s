	.include "asm/common.inc"

	thumb_func_start sub_805B0F0
sub_805B0F0:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r3, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r6, r2, #0
	mov	r0, #0x4c
	add	r1, r3, #0
	mul	r1, r1, r0
	ldr	r0, [r4, #0xc]
	add	r5, r0, r1
	cmp	r3, #0
	blt	.L2	@cond_branch
	ldr	r0, [r4, #0x14]
	cmp	r3, r0
	bge	.L2	@cond_branch
	mov	r1, #0x0
	cmp	r2, #0
	bne	.L3	@cond_branch
	mov	r1, #0x1
.L3:
	add	r0, r5, #0
	add	r0, r0, #0x44
	strb	r1, [r0]
	cmp	r6, #0
	beq	.L4	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x2c
	b	.L5
.L4:
	add	r0, r4, #0
	add	r0, r0, #0x2d
.L5:
	ldrb	r1, [r0]
	add	r0, r5, #0
	bl	sub_806185C
.L2:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805B0F0

.align 2, 0 @ Don't pad with nop.
