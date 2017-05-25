	.include "asm/common.inc"

	thumb_func_start allocateParticleSystem
allocateParticleSystem:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff0
	add	r4, r0, #0
	add	r7, r1, #0
	mov	r8, r2
	mov	r9, r3
	ldr	r1, [sp, #0x2c]
	lsl	r1, r1, #0x18
	lsl	r0, r7, #0x3
	add	r0, r0, r7
	lsl	r5, r0, #0x2
	cmp	r1, #0
	beq	.L1	@cond_branch
	add	r0, r5, #0
	bl	fastAllocate
	b	.L2
.L1:
	add	r0, r5, #0
	bl	slowAllocate
.L2:
	add	r6, r0, #0
	cmp	r6, #0
	bne	.L3	@cond_branch
	ldr	r0, .L9
	add	r1, r5, #0
	bl	printf
.L3:
	str	r6, [r4, #0x30]
	mov	r0, #0x0
	strh	r0, [r4, #0x6]
	add	r1, r7, #0
	strh	r7, [r4, #0x4]
	mov	r2, r8
	str	r2, [r4]
	mov	r5, #0x0
	cmp	r6, #0
	beq	.L4	@cond_branch
	ldr	r5, [r6]
.L4:
	str	r5, [r4, #0x8]
	mov	r2, r9
	str	r2, [r4, #0xc]
	str	r0, [r4, #0x20]
	str	r0, [r4, #0x1c]
	str	r0, [r4, #0x2c]
	str	r0, [r4, #0x28]
	str	r0, [r4, #0x24]
	str	r0, [r4, #0x18]
	str	r0, [r4, #0x14]
	str	r0, [r4, #0x10]
	cmp	r5, #0
	beq	.L6	@cond_branch
	sub	r7, r7, #0x1
	cmp	r1, #0
	beq	.L6	@cond_branch
	mov	r4, #0x0
.L8:
	mov	r0, #0x80
	bl	allocSprite
	str	r0, [r5]
	strh	r4, [r5, #0x22]
	strh	r4, [r5, #0x20]
	strh	r4, [r5, #0x1e]
	strh	r4, [r5, #0x1c]
	strh	r4, [r5, #0x1a]
	strh	r4, [r5, #0x14]
	strh	r4, [r5, #0x12]
	strh	r4, [r5, #0x10]
	str	r4, [r5, #0xc]
	str	r4, [r5, #0x8]
	str	r4, [r5, #0x4]
	cmp	r0, #0
	beq	.L7	@cond_branch
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	mov	r1, r8
	mov	r2, #0x0
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	bl	LoadSpriteSheet
.L7:
	add	r5, r5, #0x24
	add	r0, r7, #0
	sub	r7, r7, #0x1
	cmp	r0, #0
	bne	.L8	@cond_branch
.L6:
	add	sp, sp, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.4byte	0x8727018
	thumb_func_end allocateParticleSystem

.align 2, 0 @ Don't pad with nop.
