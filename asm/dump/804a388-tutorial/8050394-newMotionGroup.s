	.include "asm/common.inc"

	thumb_func_start newMotionGroup
newMotionGroup:
	push	{r4, r5, r6, r7, lr}
	add	r4, r0, #0
	add	r6, r1, #0
	lsl	r2, r2, #0x10
	lsr	r7, r2, #0x10
	ldr	r1, [r6, #0x8]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3
	bl	printf
	b	.L9
.L4:
	.align	2, 0
.L3:
	.4byte	0x8727080
.L1:
	add	r0, r5, #0
	bl	slowAllocate
	str	r0, [r4]
	cmp	r0, #0
	bne	.L5	@cond_branch
	ldr	r0, .L7
	ldr	r2, [r6, #0x8]
	add	r1, r5, #0
	bl	printf
	b	.L9
.L8:
	.align	2, 0
.L7:
	.4byte	0x87270b8
.L5:
	ldr	r2, [r0]
	str	r2, [r4, #0x8]
	ldr	r0, [r6, #0x8]
	mov	r1, #0x0
	strh	r0, [r4, #0xc]
	str	r6, [r4, #0x4]
	str	r1, [r4, #0x10]
	mov	r0, #0x80
	str	r0, [r4, #0x14]
	strh	r7, [r4, #0xe]
	ldr	r1, [r6]
	mov	r5, #0x0
	mov	r3, #0xc
	ldsh	r0, [r4, r3]
	cmp	r5, r0
	bge	.L9	@cond_branch
	mov	r3, #0x0
.L10:
	str	r3, [r2, #0xc]
	str	r3, [r2, #0x8]
	str	r3, [r2, #0x14]
	str	r3, [r2, #0x10]
	ldr	r0, [r1, #0x8]
	str	r0, [r2]
	ldr	r0, [r1, #0xc]
	str	r0, [r2, #0x4]
	ldr	r1, [r1, #0x4]
	add	r2, r2, #0x18
	add	r5, r5, #0x1
	mov	r6, #0xc
	ldsh	r0, [r4, r6]
	cmp	r5, r0
	blt	.L10	@cond_branch
.L9:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end newMotionGroup

.align 2, 0 @ Don't pad with nop.
