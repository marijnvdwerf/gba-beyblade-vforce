	.include "asm/common.inc"

	thumb_func_start sub_8045CB4
sub_8045CB4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	mov	r9, r0
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
	b	.L60
.L3:
	ldr	r0, .L14
	mov	r7, #0x0
	str	r7, [r0]
	ldr	r0, .L14 + 4
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r9
	NEG	r4, r1
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, .L14 + 8
	strb	r7, [r0]
	mov	r0, #0x0
	bl	allocSprite
	add	r2, r0, #0
	ldr	r0, .L14 + 12
	str	r2, [r0]
	cmp	r2, #0
	beq	.L9	@cond_branch
	ldr	r1, .L14 + 16
	mov	r3, #0xc0
	lsl	r3, r3, #0x6
	str	r7, [sp]
	str	r7, [sp, #0x4]
	str	r7, [sp, #0x8]
	str	r7, [sp, #0xc]
	add	r0, r2, #0
	add	r2, r4, #0
	bl	LoadSpriteSheet
.L9:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L14 + 20
	str	r4, [r0]
	cmp	r4, #0
	beq	.L10	@cond_branch
	ldr	r1, .L14 + 16
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xc0
	lsl	r3, r3, #0x6
	str	r7, [sp]
	str	r7, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	str	r7, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L10:
	mov	r0, #0x0
	bl	allocSprite
	ldr	r5, .L14 + 24
	str	r0, [r5]
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r1, .L14 + 28
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa0
	lsl	r3, r3, #0x6
	str	r7, [sp]
	str	r7, [sp, #0x4]
	str	r7, [sp, #0x8]
	str	r7, [sp, #0xc]
	bl	LoadSpriteSheet
.L11:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r6, .L14 + 32
	str	r4, [r6]
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldr	r1, .L14 + 36
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xb0
	lsl	r3, r3, #0x7
	str	r7, [sp]
	str	r7, [sp, #0x4]
	str	r7, [sp, #0x8]
	str	r7, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L12:
	ldr	r1, .L14 + 40
	mov	r0, #0xc8
	lsl	r0, r0, #0x5
	str	r0, [r1]
	ldr	r1, .L14 + 44
	mov	r0, #0xc7
	lsl	r0, r0, #0x8
	str	r0, [r1]
	ldr	r1, .L14 + 48
	mov	r0, #0xf0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r1, .L14 + 52
	mov	r0, #0xa4
	lsl	r0, r0, #0x6
	str	r0, [r1]
	ldr	r1, .L14 + 56
	mov	r0, #0xc0
	lsl	r0, r0, #0x6
	str	r0, [r1]
	ldr	r2, .L14 + 60
	ldr	r0, .L14 + 64
	ldr	r1, [r0]
	ldr	r0, .L14 + 68
	add	r3, r1, r0
	ldrh	r4, [r3]
	lsr	r0, r4, #0x5
	str	r0, [r2]
	ldr	r0, .L14 + 72
	ldr	r2, .L14 + 76
	add	r1, r1, r2
	ldrh	r1, [r1]
	lsr	r1, r1, #0x5
	str	r1, [r0]
	ldr	r0, [r6]
	strh	r1, [r0, #0x18]
	ldr	r1, [r5]
	ldrh	r3, [r3]
	lsr	r0, r3, #0x5
	strh	r0, [r1, #0x18]
	ldr	r5, .L14 + 80
	ldr	r3, .L14 + 84
	mov	r8, r3
	ldr	r4, .L14 + 88
	mov	r9, r4
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	mov	sl, r0
	mov	r0, #0x38
	str	r0, [sp]
	mov	r6, #0xf0
	str	r6, [sp, #0x4]
	str	r7, [sp, #0x8]
	add	r0, r5, #0
	mov	r1, r8
	mov	r2, r9
	mov	r3, sl
	bl	allocFont
	ldr	r4, .L14 + 92
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r5, .L14 + 96
	mov	r0, #0x68
	str	r0, [sp]
	str	r6, [sp, #0x4]
	str	r7, [sp, #0x8]
	add	r0, r5, #0
	mov	r1, r8
	mov	r2, r9
	mov	r3, sl
	bl	allocFont
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, #0x14
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xe
	bl	sub_8061660
	b	.L60
.L15:
	.align	2, 0
.L14:
	.4byte	0x30003c8
	.4byte	0x30003cc
	.4byte	0x3000460
	.4byte	0x30003d0
	.4byte	0x823bf04
	.4byte	0x30003d4
	.4byte	0x30003d8
	.4byte	0x8247028
	.4byte	0x30003dc
	.4byte	0x824b01c
	.4byte	0x30003e0
	.4byte	0x30003e4
	.4byte	0x30003ec
	.4byte	0x30003f0
	.4byte	0x30003e8
	.4byte	0x3000458
	.4byte	0x3000f48
	.4byte	0x6e4
	.4byte	0x300045c
	.4byte	0x6e6
	.4byte	0x30003f8
	.4byte	0x82b1a84
	.4byte	0x8067c0d
	.4byte	0x806dfd0
	.4byte	0x3000428
.L7:
	ldr	r0, .L21
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L16	@cond_branch
	bl	sub_8060A94
.L16:
	ldr	r0, .L21 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L17	@cond_branch
	bl	sub_8060A94
.L17:
	ldr	r0, .L21 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L18	@cond_branch
	bl	sub_8060A94
.L18:
	ldr	r0, .L21 + 12
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L19	@cond_branch
	bl	sub_8060A94
.L19:
	ldr	r0, .L21 + 16
	bl	sub_8061204
	ldr	r0, .L21 + 20
	bl	sub_8061204
	b	.L60
.L22:
	.align	2, 0
.L21:
	.4byte	0x30003d0
	.4byte	0x30003d4
	.4byte	0x30003d8
	.4byte	0x30003dc
	.4byte	0x30003f8
	.4byte	0x3000428
.L2:
	ldr	r6, .L26
	ldr	r4, [r6]
	ldr	r2, .L26 + 4
	mov	r8, r2
	ldr	r5, [r2]
	mov	r0, #0xa0
	lsl	r0, r0, #0x1
	ADD r0, r9
	bl	sub_80439A0
	ldr	r0, .L26 + 8
	ldr	r1, [r0]
	sub	r0, r1, r4
	asr	r0, r0, #0x2
	add	r4, r4, r0
	sub	r1, r1, r5
	asr	r1, r1, #0x2
	add	r5, r5, r1
	lsl	r4, r4, #0x8
	asr	r4, r4, #0x10
	add	r0, r6, #0
	add	r1, r4, #0
	mov	r2, #0x38
	bl	sub_8061844
	lsl	r5, r5, #0x8
	asr	r5, r5, #0x10
	mov	r0, r8
	add	r1, r5, #0
	mov	r2, #0x68
	bl	sub_8061844
	ldr	r6, .L26 + 12
	ldr	r5, .L26 + 16
	ldr	r4, [r6]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r9
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	ldr	r5, .L26 + 20
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L23	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L26 + 24
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L26 + 28
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	ldr	r0, [r6]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
	ldr	r0, .L26 + 32
	ldr	r0, [r0]
	ldr	r1, [r5, #0xc]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r5, #0xc]
.L23:
	ldr	r5, .L26 + 36
	ldr	r2, [r5]
	cmp	r2, #0
	beq	.L24	@cond_branch
	ldr	r0, .L26 + 32
	ldr	r0, [r0]
	ldr	r1, [r2, #0xc]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r2, #0xc]
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L26 + 40
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L26 + 28
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	ldr	r0, [r6]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L24:
	ldr	r0, .L26 + 44
	ldr	r3, [r0]
	ldr	r0, .L26 + 48
	ldr	r2, [r0]
	ldr	r1, [r3, #0x8]
	sub	r0, r2, r1
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r3, #0x8]
	ldr	r0, .L26 + 52
	ldr	r1, [r0]
	ldr	r0, [r1, #0x8]
	sub	r2, r2, r0
	asr	r2, r2, #0x2
	add	r0, r0, r2
	str	r0, [r1, #0x8]
	b	.L60
.L27:
	.align	2, 0
.L26:
	.4byte	0x30003f8
	.4byte	0x3000428
	.4byte	0x30003f0
	.4byte	0x30003c8
	.4byte	0x30003cc
	.4byte	0x30003d0
	.4byte	0x30003e0
	.4byte	0x874cc3c
	.4byte	0x30003e8
	.4byte	0x30003d4
	.4byte	0x30003e4
	.4byte	0x30003d8
	.4byte	0x30003ec
	.4byte	0x30003dc
.L5:
	ldr	r0, .L30
	ldrh	r2, [r0]
	add	r1, r2, #0
	cmp	r1, #0x2
	bne	.L28	@cond_branch
	ldr	r1, .L30 + 4
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L30 + 8
	ldr	r0, .L30 + 12
	str	r0, [r1]
	ldr	r1, .L30 + 16
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L30 + 20
	mov	r0, #0x96
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L30 + 24
	mov	r0, #0x8c
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r0, .L30 + 28
	ldr	r0, [r0]
	lsl	r0, r0, #0x5
	bl	sub_804B00C
	ldr	r0, .L30 + 32
	ldr	r0, [r0]
	lsl	r0, r0, #0x5
	bl	sub_804AFD4
	bl	sub_8049178
	mov	r0, #0x9
	bl	sub_804ABFC
	b	.L60
.L31:
	.align	2, 0
.L30:
	.4byte	0x3005da0
	.4byte	0x30003c8
	.4byte	0x30003e0
	.4byte	0xffff0000
	.4byte	0x30003e4
	.4byte	0x30003ec
	.4byte	0x30003f0
	.4byte	0x3000458
	.4byte	0x300045c
.L28:
	cmp	r1, #0x1
	bne	.L32	@cond_branch
	ldr	r1, .L34
	ldr	r0, .L34 + 4
	str	r0, [r1]
	ldr	r1, .L34 + 8
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L34 + 12
	mov	r0, #0x96
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L34 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L34 + 20
	mov	r0, #0x8c
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r0, #0xc
	bl	sub_80490F8
	mov	r0, #0x8
	bl	sub_804ABFC
	b	.L60
.L35:
	.align	2, 0
.L34:
	.4byte	0x30003e0
	.4byte	0xffff0000
	.4byte	0x30003e4
	.4byte	0x30003ec
	.4byte	0x30003c8
	.4byte	0x30003f0
.L32:
	mov	r0, #0xc0
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L36	@cond_branch
	ldr	r0, .L39
	ldrb	r1, [r0]
	add	r2, r0, #0
	cmp	r1, #0
	bne	.L37	@cond_branch
	mov	r0, #0x1
	b	.L38
.L40:
	.align	2, 0
.L39:
	.4byte	0x3000460
.L37:
	mov	r0, #0x0
.L38:
	strb	r0, [r2]
	ldr	r1, .L42
	ldrb	r3, [r2]
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r0, r0, #0xc
	mov	r4, #0xc0
	lsl	r4, r4, #0x6
	add	r0, r0, r4
	str	r0, [r1]
	b	.L60
.L43:
	.align	2, 0
.L42:
	.4byte	0x30003e8
.L36:
	cmp	r1, #0x20
	bne	.L44	@cond_branch
	ldr	r0, .L48
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L45	@cond_branch
	ldr	r0, .L48 + 4
	ldr	r1, [r0]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0
	beq	.L60	@cond_branch
	sub	r0, r0, #0x1
	b	.L47
.L49:
	.align	2, 0
.L48:
	.4byte	0x3000460
	.4byte	0x30003d8
.L45:
	ldr	r0, .L52
	ldr	r1, [r0]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0
	beq	.L60	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r1, #0x18]
	lsl	r0, r0, #0x5
	bl	sub_804AFD4
	b	.L60
.L53:
	.align	2, 0
.L52:
	.4byte	0x30003dc
.L44:
	cmp	r1, #0x10
	bne	.L60	@cond_branch
	ldr	r0, .L58
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L55	@cond_branch
	ldr	r0, .L58 + 4
	ldr	r1, [r0]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0x9
	bhi	.L60	@cond_branch
	add	r0, r0, #0x1
.L47:
	strh	r0, [r1, #0x18]
	lsl	r0, r0, #0x5
	bl	sub_804B00C
	bl	sub_804A310
	b	.L60
.L59:
	.align	2, 0
.L58:
	.4byte	0x3000460
	.4byte	0x30003d8
.L55:
	ldr	r0, .L61
	ldr	r1, [r0]
	ldrh	r0, [r1, #0x18]
	cmp	r0, #0x9
	bhi	.L60	@cond_branch
	add	r0, r0, #0x1
	strh	r0, [r1, #0x18]
	lsl	r0, r0, #0x5
	bl	sub_804AFD4
.L60:
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L62:
	.align	2, 0
.L61:
	.4byte	0x30003dc
	thumb_func_end sub_8045CB4

.align 2, 0 @ Don't pad with nop.
