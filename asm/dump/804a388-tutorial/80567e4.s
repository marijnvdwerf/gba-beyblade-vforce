	.include "asm/common.inc"

	thumb_func_start sub_80567E4
sub_80567E4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r4, r0, #0
	mov	r8, r1
	add	r6, r2, #0
	add	r5, r3, #0
	ldr	r1, [r1]
	bl	GetPointAtIndex
	add	r7, r0, #0
	mov	r0, r8
	ldr	r1, [r0, #0x4]
	add	r0, r4, #0
	bl	GetPointAtIndex
	add	r4, r0, #0
	cmp	r7, #0
	beq	.L2	@cond_branch
	cmp	r4, #0
	beq	.L2	@cond_branch
	mov	r0, #0x2
	mov	r1, r8
	ldrb	r1, [r1, #0x11]
	and	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, #0
	bne	.L3	@cond_branch
	ldr	r0, [r7, #0x4]
	lsl	r2, r0, #0x5
	ldr	r0, [r4, #0x4]
	lsl	r0, r0, #0x5
	mov	ip, r0
	add	r0, r6, #0
	add	r0, r0, #0x9c
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r6, #0x8]
	add	r1, r1, r0
	ldr	r0, [r6, #0x44]
	add	r6, r1, r0
	ldr	r0, [r7]
	lsl	r0, r0, #0x5
	mov	sl, r0
	ldr	r0, [r4]
	lsl	r0, r0, #0x5
	mov	r9, r0
	sub	r0, r6, r2
	str	r0, [r5, #0x4]
	mov	r0, #0x2
	NEG	r0, r0
	ldrb	r1, [r5, #0xc]
	and	r0, r0, r1
	strb	r0, [r5, #0xc]
	strb	r3, [r5, #0xd]
	mov	r1, r8
	ldrb	r0, [r1, #0x18]
	strb	r0, [r5, #0xe]
	b	.L4
.L3:
	ldr	r0, [r7]
	lsl	r2, r0, #0x5
	ldr	r0, [r4]
	lsl	r0, r0, #0x5
	mov	ip, r0
	add	r0, r6, #0
	add	r0, r0, #0x9a
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r6, #0x4]
	add	r1, r1, r0
	ldr	r0, [r6, #0x40]
	add	r6, r1, r0
	ldr	r0, [r7, #0x4]
	lsl	r0, r0, #0x5
	mov	sl, r0
	ldr	r0, [r4, #0x4]
	lsl	r0, r0, #0x5
	mov	r9, r0
	sub	r0, r6, r2
	str	r0, [r5]
	mov	r0, #0x1
	ldrb	r1, [r5, #0xc]
	orr	r0, r0, r1
	strb	r0, [r5, #0xc]
	mov	r1, r8
	ldrb	r0, [r1, #0x18]
	mov	r1, #0x0
	strb	r0, [r5, #0xd]
	strb	r1, [r5, #0xe]
.L4:
	mov	r1, r8
	ldrb	r0, [r1, #0x18]
	strb	r0, [r5, #0xf]
	cmp	r2, ip
	bge	.L5	@cond_branch
	ldr	r0, [r7, #0x8]
	lsl	r3, r0, #0x5
	ldr	r0, [r4, #0x8]
	lsl	r7, r0, #0x5
	b	.L6
.L5:
	ldr	r0, [r7, #0x8]
	lsl	r7, r0, #0x5
	ldr	r0, [r4, #0x8]
	lsl	r3, r0, #0x5
	add	r0, r2, #0
	mov	r2, ip
	mov	ip, r0
.L6:
	mov	r0, ip
	sub	r4, r0, r2
	sub	r1, r6, r2
	cmp	r1, #0
	bge	.L7	@cond_branch
	str	r3, [r5, #0x8]
	b	.L10
.L7:
	cmp	r1, r4
	blt	.L9	@cond_branch
	str	r7, [r5, #0x8]
	b	.L10
.L9:
	mov	r2, r8
	mov	r6, #0x12
	ldsh	r0, [r2, r6]
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	add	r0, r3, r0
	str	r0, [r5, #0x8]
.L10:
	cmp	r1, #0
	blt	.L12	@cond_branch
	cmp	r1, r4
	bgt	.L12	@cond_branch
	mov	r0, #0x2
	ldrb	r1, [r5, #0xc]
	orr	r0, r0, r1
	b	.L13
.L12:
	mov	r0, #0x3
	NEG	r0, r0
	ldrb	r2, [r5, #0xc]
	and	r0, r0, r2
.L13:
	strb	r0, [r5, #0xc]
.L2:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80567E4

.align 2, 0 @ Don't pad with nop.
