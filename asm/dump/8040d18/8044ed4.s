	.include "asm/common.inc"

	thumb_func_start sub_8044ED4
sub_8044ED4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe8
	mov	r8, r0
	cmp	r1, #0x1
	bne	.L1	@cond_branch
	b	.L2
.L1:
	cmp	r1, #0x1
	bcc	.L3	@cond_branch
	cmp	r1, #0x2
	bne	.L4	@cond_branch
	b	.L5
.L4:
	cmp	r1, #0x7
	bne	.L6	@cond_branch
	b	.L7
.L6:
	b	.L22
.L3:
	ldr	r0, .L11
	ldr	r0, [r0]
	ldr	r2, .L11 + 4
	add	r1, r0, r2
	ldrb	r1, [r1]
	str	r1, [sp, #0x10]
	sub	r2, r2, #0x1
	add	r1, r0, r2
	add	r2, r2, #0x2
	add	r0, r0, r2
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	sub	r0, r1, r0
	ldr	r1, [sp, #0x10]
	sub	r0, r0, r1
	str	r0, [sp, #0x14]
	mov	r0, r8
	add	r0, r0, #0x7f
	mov	r5, #0x0
	strb	r5, [r0]
	ldr	r0, .L11 + 8
	ldr	r0, [r0]
	ldr	r2, .L11 + 12
	add	r1, r0, r2
	strb	r5, [r1]
	add	r2, r2, #0x1
	add	r1, r0, r2
	strb	r5, [r1]
	ldr	r1, .L11 + 16
	add	r0, r0, r1
	strb	r5, [r0]
	bl	sub_80600B4
	mov	r0, #0x0
	bl	allocSprite
	ldr	r4, .L11 + 20
	str	r0, [r4]
	ldr	r1, .L11 + 24
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r0, .L11 + 28
	str	r5, [r0]
	ldr	r0, .L11 + 32
	str	r5, [r0]
	ldr	r0, .L11 + 36
	mov	r6, #0x80
	lsl	r6, r6, #0x9
	str	r6, [r0]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r8
	NEG	r1, r6
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r1, .L11 + 40
	mov	r3, #0x8c
	lsl	r3, r3, #0x6
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r2, r6, #0
	bl	LoadSpriteSheet
.L9:
	ldr	r4, .L11 + 44
	ldr	r2, .L11 + 48
	mov	r9, r2
	ldr	r0, .L11 + 52
	mov	sl, r0
	mov	r7, #0x80
	lsl	r7, r7, #0x1
	mov	r0, #0x6e
	str	r0, [sp]
	mov	r6, #0xf0
	str	r6, [sp, #0x4]
	mov	r5, #0x2
	str	r5, [sp, #0x8]
	add	r0, r4, #0
	mov	r1, r9
	mov	r2, sl
	add	r3, r7, #0
	bl	allocFont
	ldr	r1, .L11 + 56
	mov	r8, r1
	bl	getLanguage
	lsl	r0, r0, #0x2
	mov	r1, r8
	add	r1, r1, #0x28
	add	r0, r0, r1
	ldr	r1, [r0]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	ldr	r4, .L11 + 60
	mov	r0, #0x78
	str	r0, [sp]
	str	r6, [sp, #0x4]
	str	r5, [sp, #0x8]
	add	r0, r4, #0
	mov	r1, r9
	mov	r2, sl
	add	r3, r7, #0
	bl	allocFont
	bl	getLanguage
	lsl	r0, r0, #0x2
	ADD r0, r8
	ldr	r1, [r0]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	add	r0, r4, #0
	ldr	r1, [sp, #0x10]
	mov	r2, #0xf
	bl	showNumber
	ldr	r1, .L11 + 64
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	add	r0, r4, #0
	ldr	r1, [sp, #0x14]
	mov	r2, #0xf
	bl	showNumber
	b	.L22
.L12:
	.align	2, 0
.L11:
	.4byte	0x3000f48
	.4byte	0x6a7
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x161a
	.4byte	0x300027c
	.4byte	0x3000280
	.4byte	0x30002f0
	.4byte	0x3000284
	.4byte	0x3000288
	.4byte	0x82411a0
	.4byte	0x3000290
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	0x806db8c
	.4byte	0x30002c0
	.4byte	0x86fd470
.L7:
	ldr	r0, .L15
	bl	sub_8061204
	ldr	r0, .L15 + 4
	bl	sub_8061204
	ldr	r0, .L15 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L22	@cond_branch
	bl	sub_8060A94
	b	.L22
.L16:
	.align	2, 0
.L15:
	.4byte	0x30002c0
	.4byte	0x3000290
	.4byte	0x300027c
.L2:
	ldr	r0, .L20
	ldr	r1, [r0]
	ldr	r6, .L20 + 4
	ldr	r4, [r6]
	ldr	r7, .L20 + 8
	ldr	r5, [r7]
	ldr	r2, .L20 + 12
	ldr	r2, [r2]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	add	r3, r3, r2
	str	r3, [r5, #0x8]
	ldr	r2, .L20 + 16
	ldr	r3, [r2]
	sub	r2, r3, r1
	asr	r2, r2, #0x2
	add	r1, r1, r2
	sub	r3, r3, r4
	asr	r3, r3, #0x2
	add	r4, r4, r3
	lsl	r1, r1, #0x8
	asr	r1, r1, #0x10
	mov	r2, #0x6e
	bl	sub_8061844
	lsl	r4, r4, #0x8
	asr	r4, r4, #0x10
	add	r0, r6, #0
	add	r1, r4, #0
	mov	r2, #0x78
	bl	sub_8061844
	ldr	r0, .L20 + 20
	ldr	r5, .L20 + 24
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r8
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x3
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L22	@cond_branch
	ldr	r5, [r7]
	ldrh	r0, [r5, #0x18]
	add	r0, r0, #0x1
	strh	r0, [r5, #0x18]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0x3
	bls	.L22	@cond_branch
	strh	r1, [r5, #0x18]
	b	.L22
.L21:
	.align	2, 0
.L20:
	.4byte	0x3000290
	.4byte	0x30002c0
	.4byte	0x300027c
	.4byte	0x3000280
	.4byte	0x30002f0
	.4byte	0x3000284
	.4byte	0x3000288
.L5:
	ldr	r1, .L23
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L22	@cond_branch
	ldr	r0, .L23 + 4
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L23 + 8
	str	r1, [r0]
	ldr	r0, .L23 + 12
	str	r1, [r0]
	mov	r0, #0xa
	bl	sub_80490F8
.L22:
	add	sp, sp, #0x18
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L24:
	.align	2, 0
.L23:
	.4byte	0x3005da0
	.4byte	0x3000280
	.4byte	0x30002f0
	.4byte	0x3000284
	thumb_func_end sub_8044ED4

.align 2, 0 @ Don't pad with nop.
