	.include "asm/common.inc"

	thumb_func_start SpriteString_8064FE8
SpriteString_8064FE8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe8
	mov	r9, r0
	str	r1, [sp, #0x10]
	str	r2, [sp, #0x14]
	ldr	r0, [sp, #0x48]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r8, r3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	mov	r0, r8
	bl	sub_8062EFC
	add	r7, r0, #0
	cmp	r7, #0
	bne	.L1	@cond_branch
	ldr	r0, .L4
	bl	nullsub_8
.L1:
	mov	r5, #0x0
	cmp	r5, r8
	bcs	.L2	@cond_branch
	mov	r6, #0x0
.L3:
	mov	r0, #0xc4
	mul	r0, r0, r5
	ldr	r4, [r7, #0x8]
	add	r4, r4, r0
	str	r6, [sp]
	str	r6, [sp, #0x4]
	str	r6, [sp, #0x8]
	add	r0, r4, #0
	ldr	r1, [sp, #0x38]
	mov	r2, #0x0
	mov	r3, #0x0
	bl	actor_8057C58
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_80585C8
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	cmp	r5, r8
	bcc	.L3	@cond_branch
.L2:
	ldr	r0, [r7, #0x8]
	str	r0, [sp]
	ldrb	r0, [r7, #0x4]
	str	r0, [sp, #0x4]
	ldr	r0, [sp, #0x40]
	str	r0, [sp, #0x8]
	ldr	r0, [sp, #0x44]
	str	r0, [sp, #0xc]
	mov	r0, r9
	ldr	r1, [sp, #0x10]
	ldr	r2, [sp, #0x14]
	ldr	r3, [sp, #0x3c]
	bl	sub_8064F9C
	mov	r1, sl
	mov	r0, r9
	strh	r1, [r0, #0x6]
	add	r0, r7, #0
	add	sp, sp, #0x18
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L5:
	.align	2, 0
.L4:
	.4byte	0x8756844
	thumb_func_end SpriteString_8064FE8

.align 2, 0 @ Don't pad with nop.
