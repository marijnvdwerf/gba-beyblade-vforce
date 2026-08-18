	.include "asm/common.inc"

	thumb_func_start showString
showString:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	add	r7, r0, #0
	mov	r9, r1
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	str	r2, [sp, #0x10]
	mov	r0, r9
	bl	sub_8064F38
	add	r2, r0, #0
	ldr	r0, [r7, #0x24]
	ldrb	r0, [r0, #0x4]
	str	r0, [sp, #0x14]
	ldr	r0, [r7, #0x20]
	str	r0, [sp, #0x18]
	ldr	r1, [r7, #0x1c]
	ldrh	r3, [r7, #0xa]
	str	r3, [sp, #0x1c]
	mov	r0, #0x0
	str	r0, [sp, #0x20]
	mov	r0, #0xc0
	lsl	r0, r0, #0x1
	ldrh	r3, [r7, #0x8]
	and	r0, r0, r3
	lsr	r0, r0, #0x7
	str	r0, [sp, #0x24]
	mov	r0, r9
	cmp	r0, #0
	bne	.L8061502	@cond_branch
	b	.L8061646
.L8061502:
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L806150A	@cond_branch
	b	.L8061646
.L806150A:
	ldr	r6, [r7, #0x18]
	add	r0, r7, #0
	add	r0, r0, #0x14
	add	r1, r2, r1
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r2, r7, #0
	add	r2, r2, #0x2b
	ldrb	r2, [r2]
	bl	resizeSpriteBlock
	cmp	r0, #0
	bne	.L8061534	@cond_branch
	ldr	r0, .L8061530
	mov	r1, r9
	bl	printf
	mov	r0, #0x0
	b	.L8061646
.L8061530:
	.align	2, 0

	.4byte	0x8755b58
.L8061534:
	cmp	r6, #0
	beq	.L806153A	@cond_branch
	ldr	r0, [r6, #0x4]
.L806153A:
	add	r6, r0, #0
	ldr	r1, [r7, #0x2c]
	mov	r8, r1
	cmp	r1, #0
	beq	.L8061590	@cond_branch
	ldr	r0, [r1, #0x8]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r0, r0, r1
	lsl	r0, r0, #0x14
	mov	sl, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	mov	r2, sl
	orr	r2, r2, r0
	mov	sl, r2
	mov	r0, #0x8
	ldrh	r3, [r7, #0x8]
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L8061590	@cond_branch
	mov	r1, r8
	ldrb	r0, [r1, #0x18]
	cmp	r0, #0
	beq	.L8061576	@cond_branch
	ldrh	r2, [r1, #0x14]
	cmp	r2, #0xb0
	bhi	.L8061586	@cond_branch
	ldrh	r3, [r1, #0x16]
	b	.L8061582
.L8061576:
	mov	r2, r8
	ldrh	r2, [r2, #0x14]
	cmp	r2, #0xb0
	bhi	.L8061586	@cond_branch
	mov	r3, r8
	ldrh	r3, [r3, #0x16]
.L8061582:
	cmp	r3, #0xb0
	bls	.L8061590	@cond_branch
.L8061586:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	mov	r1, sl
	orr	r1, r1, r0
	mov	sl, r1
.L8061590:
	mov	r2, r9
	ldrb	r4, [r2]
	mov	r3, #0x1
	ADD r9, r3
	cmp	r4, #0
	beq	.L8061638	@cond_branch
.L806159C:
	ldr	r5, [sp, #0x14]
	cmp	r4, #0x20
	bne	.L80615B0	@cond_branch
	add	r0, r7, #0
	add	r0, r0, #0x28
	ldrb	r5, [r0]
	mov	r0, #0x80
	lsl	r0, r0, #0x8
	str	r0, [sp, #0x20]
	b	.L8061622
.L80615B0:
	ldr	r0, .L8061658
	add	r0, r4, r0
	ldrb	r4, [r0]
	ldr	r1, [r7, #0x24]
	mov	r0, #0x0
	str	r0, [sp]
	ldr	r2, [sp, #0x24]
	str	r2, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r0, r6, #0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	LoadSpriteSheet
	add	r0, r6, #0
	ldr	r1, [sp, #0x10]
	bl	sub_8061168
	ldrb	r1, [r7, #0xe]
	add	r0, r6, #0
	bl	sub_8061130
	ldr	r3, [sp, #0x18]
	cmp	r3, #0
	beq	.L80615EE	@cond_branch
	add	r0, r3, r4
	ldrb	r0, [r0]
	sub	r0, r5, r0
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
.L80615EE:
	add	r0, r7, #0
	add	r0, r0, #0x29
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	add	r0, r5, r0
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r0, [sp, #0x1c]
	ldr	r1, [sp, #0x20]
	orr	r0, r0, r1
	strh	r0, [r6, #0x1e]
	mov	r3, #0x0
	str	r3, [sp, #0x20]
	mov	r0, r8
	cmp	r0, #0
	beq	.L8061620	@cond_branch
	ldr	r0, [r6, #0x10]
	ldr	r1, .L8061658 + 4
	and	r0, r0, r1
	mov	r1, sl
	orr	r0, r0, r1
	str	r0, [r6, #0x10]
	mov	r2, r8
	str	r2, [r6, #0x30]
.L8061620:
	ldr	r6, [r6, #0x4]
.L8061622:
	ldr	r3, [sp, #0x1c]
	add	r0, r3, r5
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x1c]
	mov	r0, r9
	ldrb	r4, [r0]
	mov	r1, #0x1
	ADD r9, r1
	cmp	r4, #0
	bne	.L806159C	@cond_branch
.L8061638:
	add	r0, r7, #0
	bl	sub_806123C
	mov	r2, sp
	ldrh	r2, [r2, #0x1c]
	strh	r2, [r7, #0xa]
	mov	r0, #0x1
.L8061646:
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L8061656:
	.align	2, 0
.L8061658:
	.4byte	0x807d980
	.4byte	0xc1fffcff
	thumb_func_end showString

.align 2, 0 @ Don't pad with nop.
