	.include "asm/common.inc"

	thumb_func_start sub_80512AC
sub_80512AC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r0, .L4
	ldr	r0, [r0]
	ldr	r1, .L4 + 4
	add	r0, r0, r1
	ldr	r1, .L4 + 8
	strh	r1, [r0]
	mov	r0, #0x0
	mov	r8, r0
.L14:
	mov	r0, r8
	bl	sub_8051720
	add	r7, r0, #0
	mov	r0, r8
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r0, #0x2
	ldrh	r1, [r7]
	and	r0, r0, r1
	mov	r1, #0x1
	ADD r1, r8
	mov	sl, r1
	cmp	r0, #0
	bne	.L13	@cond_branch
	ldrb	r0, [r6, #0x1c]
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r0, #0x1
	mov	r9, r0
	ldr	r5, [r6, #0x24]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000f48
	.4byte	0x6ea
	.4byte	0xffff
.L7:
	add	r5, r5, #0x1
.L3:
	ldr	r0, [r6, #0x28]
	cmp	r5, r0
	bgt	.L6	@cond_branch
	add	r0, r5, #0
	bl	getLevelDescription
	add	r4, r0, #0
	add	r0, r5, #0
	bl	sub_8051720
	add	r1, r0, #0
	ldr	r1, [r1, #0x4]
	ldr	r0, [r4, #0x8]
	cmp	r1, r0
	ble	.L7	@cond_branch
	mov	r1, #0x0
	mov	r9, r1
.L6:
	mov	r0, r9
	cmp	r0, #0
	beq	.L13	@cond_branch
	mov	r0, #0x2
	ldrh	r1, [r7]
	orr	r0, r0, r1
	strh	r0, [r7]
	ldr	r0, .L10
	ldr	r0, [r0]
	ldr	r1, .L10 + 4
	add	r0, r0, r1
	mov	r1, r8
	strh	r1, [r0]
	b	.L13
.L11:
	.align	2, 0
.L10:
	.4byte	0x3000f48
	.4byte	0x6ea
.L2:
	ldr	r0, [r6, #0x20]
	cmp	r0, #0
	blt	.L13	@cond_branch
	bl	sub_8051720
	add	r1, r0, #0
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L13	@cond_branch
	mov	r0, #0x2
	ldrh	r1, [r7]
	orr	r0, r0, r1
	strh	r0, [r7]
.L13:
	mov	r8, sl
	mov	r0, r8
	cmp	r0, #0x37
	ble	.L14	@cond_branch
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80512AC

.align 2, 0 @ Don't pad with nop.
