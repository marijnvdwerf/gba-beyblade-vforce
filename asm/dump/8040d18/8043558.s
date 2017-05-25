	.include "asm/common.inc"

	thumb_func_start sub_8043558
sub_8043558:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	mov	r9, r0
	mov	r0, #0x92
	lsl	r0, r0, #0x3
	ADD r0, r9
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L2	@cond_branch
	ldr	r5, .L5
	mov	r0, #0xa4
	lsl	r0, r0, #0x3
	ADD r0, r9
	ldr	r4, [r0]
	ldr	r0, .L5 + 4
	ADD r0, r9
	ldr	r0, [r0]
	mov	r8, r0
	mov	r7, #0x0
	cmp	r7, r1
	bge	.L2	@cond_branch
.L4:
	mov	r0, #0x1
	and	r0, r0, r7
	mov	r6, #0x1
	NEG	r6, r6
	cmp	r0, #0
	beq	.L3	@cond_branch
	mov	r6, #0x1
.L3:
	add	r0, r4, #0
	bl	sub_8050584
	mov	r1, r8
	add	r1, r1, #0x14
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newMotionGroup
	ldr	r0, [r5]
	add	r1, r0, #0
	mul	r1, r1, r6
	ldr	r2, [r5, #0x4]
	ldr	r3, [r5, #0x8]
	ldr	r0, [r5, #0xc]
	str	r0, [sp]
	add	r0, r4, #0
	bl	sub_80504E4
	ldr	r0, [r5, #0x10]
	add	r1, r0, #0
	mul	r1, r1, r6
	ldr	r2, [r5, #0x14]
	ldr	r3, [r5, #0x18]
	ldr	r0, [r5, #0x1c]
	str	r0, [sp]
	add	r0, r4, #0
	bl	sub_805052C
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8050574
	mov	r0, #0x4c
	ADD r8, r0
	add	r4, r4, #0x18
	add	r7, r7, #0x1
	mov	r0, #0x92
	lsl	r0, r0, #0x3
	ADD r0, r9
	ldr	r0, [r0]
	cmp	r7, r0
	blt	.L4	@cond_branch
.L2:
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x8068868
	.4byte	0x484
	thumb_func_end sub_8043558

.align 2, 0 @ Don't pad with nop.
