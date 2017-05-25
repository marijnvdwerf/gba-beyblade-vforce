	.include "asm/common.inc"

	thumb_func_start sub_8060A94
sub_8060A94:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	ldr	r6, [r4]
	ldr	r5, [r4, #0x4]
	ldr	r2, [r4, #0x24]
	cmp	r2, #0
	blt	.L2	@cond_branch
	mov	r1, #0x1
	add	r0, r1, #0
	ldrh	r3, [r4, #0x20]
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldrh	r0, [r4, #0x16]
	sub	r0, r0, #0x5
	LSL	r1, r0
	add	r0, r2, #0
	bl	freeSpriteVramLocation
.L2:
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x24]
	cmp	r6, #0
	beq	.L3	@cond_branch
	str	r5, [r6, #0x4]
	b	.L4
.L3:
	ldr	r0, .L7
	str	r5, [r0]
.L4:
	cmp	r5, #0
	beq	.L5	@cond_branch
	str	r6, [r5]
.L5:
	ldr	r1, .L7 + 4
	ldr	r0, [r1]
	str	r0, [r4, #0x4]
	str	r4, [r1]
	ldr	r0, [r4, #0x30]
	cmp	r0, #0
	beq	.L6	@cond_branch
	bl	sub_8060B38
	mov	r0, #0x0
	str	r0, [r4, #0x30]
.L6:
	ldr	r1, .L7 + 8
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	ldr	r0, .L7
	ldr	r0, [r0]
	bl	sub_80604D4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x3005de4
	.4byte	0x3005dec
	.4byte	0x3005df4
	thumb_func_end sub_8060A94

.align 2, 0 @ Don't pad with nop.
