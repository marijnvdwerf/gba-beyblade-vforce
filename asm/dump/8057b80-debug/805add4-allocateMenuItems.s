	.include "asm/common.inc"

	thumb_func_start allocateMenuItems
allocateMenuItems:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd0
	add	r4, r0, #0
	add	r6, r1, #0
	str	r2, [sp, #0xc]
	mov	r5, #0x0
	mov	r0, #0x0
	str	r0, [sp, #0x10]
	mov	r3, #0x0
	str	r2, [r4, #0x24]
	ldrb	r0, [r4, #0x8]
	lsl	r2, r0, #0x2
	add	r0, r6, r2
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r7, #0x1
.L3:
	ldr	r0, [r1, #0x14]
	and	r0, r0, r7
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r3, r3, #0x1
.L2:
	add	r1, r1, #0x20
	add	r5, r5, #0x1
	add	r0, r1, r2
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L3	@cond_branch
.L1:
	mov	r1, #0xa
	ldsh	r0, [r4, r1]
	add	r2, r5, r3
	mul	r0, r0, r2
	strb	r0, [r4, #0x9]
	mov	r0, #0xa0
	ldrb	r3, [r4, #0x9]
	sub	r0, r0, r3
	lsr	r1, r0, #0x1f
	add	r0, r0, r1
	asr	r0, r0, #0x1
	ldr	r1, [r4, #0x20]
	add	r0, r0, r1
	mov	r9, r0
	str	r5, [r4, #0x14]
	str	r2, [r4, #0x18]
	mov	r7, #0x4c
	add	r0, r2, #0
	mul	r0, r0, r7
	bl	slowAllocate
	str	r0, [r4, #0x10]
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r0, .L6
	bl	printf
.L4:
	ldr	r0, [r4, #0x10]
	ldr	r0, [r0]
	str	r0, [r4, #0xc]
	add	r5, r0, #0
	ldr	r0, [r4, #0x14]
	mul	r0, r0, r7
	add	r0, r0, r5
	mov	r8, r0
	ldrb	r1, [r4, #0x8]
	lsl	r0, r1, #0x2
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x8755370
.L16:
	mov	r3, #0x0
	str	r3, [sp, #0x14]
	ldr	r0, [r6, #0x18]
	ldrh	r1, [r6, #0x1e]
	mov	ip, r1
	ldr	r3, [r4]
	str	r3, [sp, #0x28]
	ldr	r1, [r4, #0x4]
	str	r1, [sp, #0x18]
	ldr	r7, [r4, #0x1c]
	ldrh	r3, [r6, #0x1c]
	ldr	r1, [r4, #0x28]
	mov	sl, r1
	add	r1, r5, #0
	add	r1, r1, #0x44
	str	r1, [sp, #0x1c]
	ldr	r1, [sp, #0x10]
	add	r1, r1, #0x1
	str	r1, [sp, #0x24]
	add	r1, r5, #0
	add	r1, r1, #0x4c
	str	r1, [sp, #0x20]
	add	r1, r6, #0
	add	r1, r1, #0x20
	str	r1, [sp, #0x2c]
	cmp	r0, #0
	beq	.L8	@cond_branch
	add	r1, r0, #0
	ldrb	r0, [r4, #0x8]
	lsl	r2, r0, #0x2
	b	.L9
.L10:
	add	r1, r1, #0x14
	ldr	r0, [sp, #0x14]
	add	r0, r0, #0x1
	str	r0, [sp, #0x14]
.L9:
	add	r0, r1, r2
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L10	@cond_branch
.L8:
	ADD r9, ip
	add	r3, r7, r3
	lsl	r3, r3, #0x10
	asr	r3, r3, #0x10
	mov	r1, r9
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x10
	str	r0, [sp]
	mov	r1, sl
	lsl	r0, r1, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x4]
	mov	r0, #0x2
	mov	sl, r0
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	ldr	r1, [sp, #0x28]
	ldr	r2, [sp, #0x18]
	bl	allocFont
	ldrb	r1, [r4, #0x8]
	lsl	r0, r1, #0x2
	add	r0, r6, r0
	ldr	r0, [r0]
	str	r0, [r5, #0x30]
	ldr	r0, [r6, #0x14]
	str	r0, [r5, #0x3c]
	ldr	r0, [r6, #0x18]
	str	r0, [r5, #0x40]
	mov	r7, #0x0
	str	r7, [r5, #0x34]
	ldr	r3, [sp, #0x1c]
	strb	r7, [r3]
	ldr	r0, [sp, #0x14]
	str	r0, [r5, #0x38]
	str	r7, [r5, #0x48]
	add	r0, r4, #0
	add	r1, r5, #0
	bl	sub_805AC80
	ldr	r0, [r6, #0x18]
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldr	r0, [r6, #0x14]
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L12	@cond_branch
	mov	r1, #0xa
	ldsh	r0, [r4, r1]
	ADD r9, r0
	ldr	r1, [r4]
	ldr	r2, [r4, #0x4]
	ldr	r3, [r4, #0x1c]
	ldrh	r0, [r6, #0x1c]
	add	r3, r0, r3
	lsl	r3, r3, #0x10
	asr	r3, r3, #0x10
	mov	ip, r3
	mov	r3, r9
	lsl	r0, r3, #0x10
	asr	r0, r0, #0x10
	str	r0, [sp]
	ldrh	r0, [r4, #0x28]
	str	r0, [sp, #0x4]
	mov	r0, sl
	str	r0, [sp, #0x8]
	mov	r0, r8
	mov	r3, ip
	bl	allocFont
	mov	r1, r8
	str	r7, [r1, #0x30]
	ldr	r0, [r6, #0x14]
	str	r0, [r1, #0x3c]
	ldr	r0, [r6, #0x18]
	str	r0, [r1, #0x40]
	str	r7, [r1, #0x34]
	mov	r0, r8
	add	r0, r0, #0x44
	strb	r7, [r0]
	ldr	r3, [sp, #0x14]
	str	r3, [r1, #0x38]
	str	r7, [r1, #0x48]
	str	r1, [r5, #0x48]
	str	r7, [r5, #0x40]
	add	r0, r4, #0
	add	r1, r5, #0
	bl	sub_805AC80
	add	r0, r4, #0
	mov	r1, r8
	bl	sub_805AC80
	mov	r0, #0x4c
	ADD r8, r0
.L12:
	ldr	r0, [sp, #0x10]
	ldr	r1, [sp, #0x24]
	str	r1, [sp, #0x10]
	ldr	r3, [sp, #0xc]
	cmp	r0, r3
	bne	.L13	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x2e
	b	.L14
.L13:
	add	r0, r4, #0
	add	r0, r0, #0x2c
.L14:
	ldrb	r1, [r0]
	add	r0, r5, #0
	bl	sub_806185C
	ldr	r5, [sp, #0x20]
	mov	r1, #0xa
	ldsh	r0, [r4, r1]
	ADD r9, r0
	ldr	r6, [sp, #0x2c]
	ldrb	r3, [r4, #0x8]
	lsl	r0, r3, #0x2
.L5:
	add	r0, r6, r0
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L15	@cond_branch
	b	.L16
.L15:
	add	sp, sp, #0x30
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end allocateMenuItems

.align 2, 0 @ Don't pad with nop.
