	.include "asm/common.inc"

	thumb_func_start sub_8045160
sub_8045160:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	mov	r8, r0
	cmp	r1, #0x1
	bne	.L8045174	@cond_branch
	b	.L80452F4
.L8045174:
	cmp	r1, #0x1
	bcc	.L8045186	@cond_branch
	cmp	r1, #0x2
	bne	.L804517E	@cond_branch
	b	.L8045394
.L804517E:
	cmp	r1, #0x7
	bne	.L8045184	@cond_branch
	b	.L80452CC
.L8045184:
	b	.L80453B6
.L8045186:
	ldr	r0, .L8045288
	ldr	r0, [r0]
	ldr	r1, .L8045288 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	str	r0, [sp, #0x10]
	mov	r0, r8
	add	r0, r0, #0x7f
	mov	r5, #0x0
	strb	r5, [r0]
	ldr	r0, .L8045288 + 8
	ldr	r0, [r0]
	ldr	r2, .L8045288 + 12
	add	r1, r0, r2
	strb	r5, [r1]
	add	r2, r2, #0x1
	add	r1, r0, r2
	strb	r5, [r1]
	ldr	r1, .L8045288 + 16
	add	r0, r0, r1
	strb	r5, [r0]
	bl	sub_80600B4
	mov	r0, #0x0
	bl	allocSprite
	ldr	r4, .L8045288 + 20
	str	r0, [r4]
	ldr	r1, .L8045288 + 24
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r0, .L8045288 + 28
	str	r5, [r0]
	ldr	r0, .L8045288 + 32
	str	r5, [r0]
	ldr	r0, .L8045288 + 36
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
	beq	.L80451FE	@cond_branch
	ldr	r1, .L8045288 + 40
	mov	r3, #0x8c
	lsl	r3, r3, #0x6
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r2, r6, #0
	bl	LoadSpriteSheet
.L80451FE:
	ldr	r4, .L8045288 + 44
	ldr	r2, .L8045288 + 48
	mov	r9, r2
	ldr	r0, .L8045288 + 52
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
	ldr	r1, .L8045288 + 56
	mov	r8, r1
	bl	getLanguage
	lsl	r0, r0, #0x2
	mov	r1, r8
	add	r1, r1, #0x3c
	add	r0, r0, r1
	ldr	r1, [r0]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	ldr	r4, .L8045288 + 60
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
	ldr	r1, .L8045288 + 64
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	add	r0, r4, #0
	ldr	r1, [sp, #0x10]
	mov	r2, #0xf
	bl	showNumber
	b	.L80453B6
.L8045286:
	.align	2, 0
.L8045288:
	.4byte	0x3000f48
	.4byte	0x6a7
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x161a
	.4byte	0x30002f4
	.4byte	0x30002f8
	.4byte	0x3000368
	.4byte	0x30002fc
	.4byte	0x3000300
	.4byte	0x8243874
	.4byte	0x3000308
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	0x806db8c
	.4byte	0x3000338
	.4byte	0x86fd470
.L80452CC:
	ldr	r0, .L80452E8
	bl	sub_8061204
	ldr	r0, .L80452E8 + 4
	bl	sub_8061204
	ldr	r0, .L80452E8 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80453B6	@cond_branch
	bl	sub_8060A94
	b	.L80453B6
.L80452E6:
	.align	2, 0
.L80452E8:
	.4byte	0x3000338
	.4byte	0x3000308
	.4byte	0x30002f4
.L80452F4:
	ldr	r0, .L8045378
	ldr	r1, [r0]
	ldr	r6, .L8045378 + 4
	ldr	r4, [r6]
	ldr	r7, .L8045378 + 8
	ldr	r5, [r7]
	ldr	r2, .L8045378 + 12
	ldr	r2, [r2]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	add	r3, r3, r2
	str	r3, [r5, #0x8]
	ldr	r2, .L8045378 + 16
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
	ldr	r0, .L8045378 + 20
	ldr	r5, .L8045378 + 24
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
	bne	.L80453B6	@cond_branch
	ldr	r5, [r7]
	ldrh	r0, [r5, #0x18]
	add	r0, r0, #0x1
	strh	r0, [r5, #0x18]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0x3
	bls	.L80453B6	@cond_branch
	strh	r1, [r5, #0x18]
	b	.L80453B6
.L8045378:
	.align	2, 0

	.4byte	0x3000308
	.4byte	0x3000338
	.4byte	0x30002f4
	.4byte	0x30002f8
	.4byte	0x3000368
	.4byte	0x30002fc
	.4byte	0x3000300
.L8045394:
	ldr	r1, .L80453C8
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80453B6	@cond_branch
	ldr	r0, .L80453C8 + 4
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L80453C8 + 8
	str	r1, [r0]
	ldr	r0, .L80453C8 + 12
	str	r1, [r0]
	mov	r0, #0xa
	bl	sub_80490F8
.L80453B6:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80453C6:
	.align	2, 0
.L80453C8:
	.4byte	0x3005da0
	.4byte	0x30002f8
	.4byte	0x3000368
	.4byte	0x30002fc
	thumb_func_end sub_8045160

.align 2, 0 @ Don't pad with nop.
