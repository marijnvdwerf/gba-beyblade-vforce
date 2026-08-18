	.include "asm/common.inc"

	thumb_func_start sub_805B13C
sub_805B13C:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	ldr	r0, [r4, #0x24]
	cmp	r5, r0
	beq	.L805B19A	@cond_branch
	mov	r6, #0x4c
	add	r1, r5, #0
	mul	r1, r1, r6
	ldr	r0, [r4, #0xc]
	add	r2, r0, r1
	cmp	r5, #0
	blt	.L805B19A	@cond_branch
	ldr	r0, [r4, #0x14]
	cmp	r5, r0
	bge	.L805B19A	@cond_branch
	add	r0, r2, #0
	add	r0, r0, #0x44
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L805B19A	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x2e
	ldrb	r1, [r0]
	add	r0, r2, #0
	bl	sub_806185C
	ldr	r0, [r4, #0x24]
	add	r1, r0, #0
	mul	r1, r1, r6
	ldr	r0, [r4, #0xc]
	add	r2, r0, r1
	add	r0, r2, #0
	add	r0, r0, #0x44
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L805B18C	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x2d
	b	.L805B190
.L805B18C:
	add	r0, r4, #0
	add	r0, r0, #0x2c
.L805B190:
	ldrb	r1, [r0]
	add	r0, r2, #0
	bl	sub_806185C
	str	r5, [r4, #0x24]
.L805B19A:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805B13C

.align 2, 0 @ Don't pad with nop.
