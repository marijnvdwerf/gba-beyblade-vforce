	.include "asm/common.inc"

	thumb_func_start sub_806306C
sub_806306C:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r6, r1, #0
	ldr	r0, .L3
	ldr	r3, [r0]
	mov	r7, #0x0
	ldr	r1, [r3]
	mov	ip, r0
	cmp	r1, r5
	blt	.L1	@cond_branch
	mov	r7, #0x1
	b	.L7
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e60
.L1:
	ldr	r4, [r3, #0x10]
	cmp	r4, #0
	beq	.L10	@cond_branch
	ldr	r0, [r3, #0x4]
	add	r0, r1, r0
	ldr	r1, [r4]
	sub	r1, r1, r0
	cmp	r1, r5
	bge	.L8	@cond_branch
.L10:
	add	r3, r4, #0
	cmp	r3, #0
	beq	.L7	@cond_branch
	cmp	r1, r5
	bge	.L8	@cond_branch
	ldr	r2, [r3, #0x10]
	add	r4, r2, #0
	cmp	r2, #0
	beq	.L10	@cond_branch
	ldr	r0, [r3]
	ldr	r1, [r3, #0x4]
	add	r0, r0, r1
	ldr	r1, [r2]
	sub	r1, r1, r0
	cmp	r1, r5
	blt	.L10	@cond_branch
.L7:
	cmp	r1, r5
	blt	.L12	@cond_branch
.L8:
	cmp	r7, #0
	bne	.L12	@cond_branch
	str	r3, [r6, #0xc]
	ldr	r0, [r3, #0x10]
	str	r0, [r6, #0x10]
	ldr	r0, [r3, #0x10]
	str	r6, [r0, #0xc]
	str	r6, [r3, #0x10]
	ldr	r0, [r3]
	ldr	r1, [r3, #0x4]
	add	r0, r0, r1
	b	.L15
.L12:
	cmp	r7, #0x1
	beq	.L14	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	b	.L15
.L14:
	str	r6, [r3, #0xc]
	str	r3, [r6, #0x10]
	mov	r0, #0x0
	str	r0, [r6, #0xc]
	mov	r0, ip
	str	r6, [r0]
	mov	r0, #0x0
.L15:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_806306C

.align 2, 0 @ Don't pad with nop.
