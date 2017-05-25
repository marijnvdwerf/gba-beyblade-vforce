	.include "asm/common.inc"

	thumb_func_start sub_8056E2C
sub_8056E2C:
	push	{r4, r5, r6, r7, lr}
	add	r2, r0, #0
	mov	r5, #0x0
	ldr	r0, .L9
	ldr	r0, [r0]
	ldr	r1, .L9 + 4
	add	r6, r0, r1
	add	r1, r1, #0x4
	add	r4, r0, r1
	ldr	r1, .L9 + 8
	add	r7, r0, r1
	ldr	r0, [r4, #0x4]
	cmp	r0, r2
	beq	.L3	@cond_branch
	ldr	r1, [r6]
	cmp	r5, r1
	bge	.L3	@cond_branch
.L4:
	add	r5, r5, #0x1
	add	r4, r4, #0x8
	ldr	r0, [r4, #0x4]
	cmp	r0, r2
	beq	.L3	@cond_branch
	cmp	r5, r1
	blt	.L4	@cond_branch
.L3:
	ldr	r0, [r6]
	cmp	r5, r0
	beq	.L6	@cond_branch
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L6	@cond_branch
	bl	sub_804FE50
	ldr	r1, [r4, #0x4]
	add	r0, r7, #0
	bl	GetLineMetaData
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L8	@cond_branch
	ldr	r3, .L9 + 12
	add	r0, r7, #0
	mov	r2, #0x1
	bl	getLineMetaobjectByTypeAndId
	cmp	r0, #0
	beq	.L8	@cond_branch
	ldr	r0, [r0, #0x8]
	bl	getItem
.L8:
	asr	r0, r5, #0x5
	lsl	r0, r0, #0x2
	mov	r1, #0x82
	lsl	r1, r1, #0x1
	add	r2, r6, r1
	add	r2, r2, r0
	mov	r0, #0x1f
	and	r5, r5, r0
	mov	r1, #0x1
	LSL	r1, r5
	ldr	r0, [r2]
	orr	r0, r0, r1
	str	r0, [r2]
.L6:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000fb0
	.4byte	0x12f4
	.4byte	0x65c
	.4byte	0x37ae
	thumb_func_end sub_8056E2C

.align 2, 0 @ Don't pad with nop.
