	.include "asm/common.inc"

	thumb_func_start newIconMenu
newIconMenu:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffdc
	mov	r8, r0
	mov	r9, r1
	str	r2, [sp, #0x10]
	ldr	r0, [r1, #0x4]
	lsl	r1, r0, #0x3
	sub	r1, r1, r0
	lsl	r4, r1, #0x2
	mov	r0, #0x80
	str	r0, [sp, #0x1c]
	add	r0, r4, #0
	bl	slowAllocate
	mov	r1, r8
	str	r0, [r1, #0x30]
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L5
	add	r1, r4, #0
	bl	printf
.L1:
	mov	r2, r8
	ldr	r0, [r2, #0x30]
	ldr	r6, [r0]
	str	r6, [r2, #0x28]
	mov	r3, r9
	ldr	r5, [r3, #0x4]
	str	r5, [r2]
	str	r3, [r2, #0x2c]
	mov	r4, #0x0
	strh	r4, [r2, #0x3c]
	ldr	r0, [r3, #0xc]
	str	r0, [r2, #0x34]
	ldr	r0, [r3, #0x10]
	str	r0, [r2, #0x38]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	add	r1, r5, #0
	bl	__divsi3
	mov	r1, r8
	str	r0, [r1, #0xc]
	str	r4, [r1, #0x10]
	ldr	r2, [sp, #0x10]
	add	r1, r2, #0
	mul	r1, r1, r0
	ldr	r0, .L5 + 4
	sub	r0, r0, r1
	mov	r3, r8
	str	r0, [r3, #0x14]
	str	r0, [r3, #0x8]
	str	r2, [r3, #0x4]
	str	r4, [r3, #0x20]
	str	r4, [r3, #0x24]
	mov	r1, r9
	ldr	r0, [r1, #0x8]
	str	r0, [r3, #0x1c]
	str	r0, [r3, #0x18]
	ldr	r4, [r1, #0x1c]
	mov	r2, #0x0
	mov	sl, r2
	add	r3, r3, #0x40
	str	r3, [sp, #0x20]
	cmp	sl, r5
	bge	.L2	@cond_branch
.L9:
	ldr	r3, [sp, #0x1c]
	asr	r1, r3, #0x8
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r0, r1, #0x1
	ldr	r5, .L5 + 8
	add	r0, r0, r5
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	mov	r3, r9
	ldr	r2, [r3, #0x8]
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	str	r0, [sp, #0x14]
	add	r1, r1, #0x40
	lsl	r1, r1, #0x1
	add	r1, r1, r5
	mov	r5, #0x0
	ldsh	r0, [r1, r5]
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	str	r0, [sp, #0x18]
	str	r4, [r6]
	ldr	r0, [r4, #0x20]
	str	r0, [r6, #0x10]
	ldr	r0, [sp, #0x10]
	cmp	sl, r0
	bne	.L3	@cond_branch
	ldr	r0, [r4, #0x24]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x8729398
	.4byte	0xffff
	.4byte	0x874cc3c
.L3:
	ldr	r0, [r4, #0x20]
.L4:
	str	r0, [r6, #0x14]
	ldr	r0, [r4, #0x18]
	str	r0, [r6, #0x8]
	ldr	r0, [r4, #0x1c]
	str	r0, [r6, #0xc]
	mov	r0, #0x2
	ldr	r1, [sp, #0x10]
	cmp	sl, r1
	bne	.L7	@cond_branch
	mov	r0, #0x1
.L7:
	bl	allocSprite
	add	r5, r0, #0
	str	r5, [r6, #0x4]
	mov	r7, #0x0
	strh	r7, [r6, #0x18]
	cmp	r5, #0
	beq	.L8	@cond_branch
	ldr	r1, [r4]
	mov	r3, r9
	ldr	r2, [r3, #0xc]
	ldr	r0, [r6, #0x8]
	sub	r2, r2, r0
	ldr	r0, [sp, #0x14]
	add	r2, r2, r0
	ldr	r3, [r3, #0x10]
	ldr	r0, [r6, #0xc]
	sub	r3, r3, r0
	ldr	r0, [sp, #0x18]
	add	r3, r3, r0
	str	r7, [sp]
	mov	r0, #0x2
	str	r0, [sp, #0x4]
	str	r7, [sp, #0x8]
	ldrh	r0, [r4, #0x28]
	str	r0, [sp, #0xc]
	add	r0, r5, #0
	bl	LoadSpriteSheet
.L8:
	add	r6, r6, #0x1c
	add	r4, r4, #0x30
	mov	r1, r8
	ldr	r0, [r1, #0xc]
	ldr	r2, [sp, #0x1c]
	add	r2, r2, r0
	str	r2, [sp, #0x1c]
	mov	r3, #0x1
	ADD sl, r3
	mov	r5, r9
	ldr	r0, [r5, #0x4]
	cmp	sl, r0
	blt	.L9	@cond_branch
.L2:
	mov	r0, r9
	ldr	r4, [r0]
	ldr	r1, [r4]
	ldr	r2, [r4, #0x4]
	ldr	r3, [r0, #0x14]
	lsl	r3, r3, #0x8
	asr	r3, r3, #0x10
	ldr	r0, [r0, #0x18]
	lsl	r0, r0, #0x8
	asr	r0, r0, #0x10
	str	r0, [sp]
	mov	r0, #0xf0
	str	r0, [sp, #0x4]
	ldrh	r0, [r4, #0x8]
	str	r0, [sp, #0x8]
	ldr	r0, [sp, #0x20]
	bl	allocFont
	mov	r1, r8
	ldr	r0, [r1, #0x2c]
	ldr	r1, [r1, #0x4]
	ldr	r0, [r0, #0x1c]
	lsl	r4, r1, #0x1
	add	r4, r4, r1
	lsl	r4, r4, #0x4
	add	r4, r4, r0
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, #0x4
	add	r4, r4, r0
	ldr	r1, [r4]
	mov	r2, r8
	ldr	r0, [r2, #0x2c]
	ldr	r0, [r0]
	ldrb	r2, [r0, #0xa]
	ldr	r0, [sp, #0x20]
	bl	sub_8061660
	add	sp, sp, #0x24
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end newIconMenu

.align 2, 0 @ Don't pad with nop.
