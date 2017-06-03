	.include "asm/common.inc"

	thumb_func_start sub_8052B24
sub_8052B24:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffff30
	bl	getLevelDescription2
	mov	r0, #0x0
	str	r0, [sp, #0xac]
	mov	sl, r0
	mov	r1, #0x0
	str	r1, [sp, #0xb0]
	mov	r2, #0x0
	str	r2, [sp, #0xb4]
	mov	r3, #0x0
	str	r3, [sp, #0xb8]
	str	r0, [sp, #0xbc]
	str	r1, [sp, #0xc0]
	str	r2, [sp, #0xc4]
	mov	r3, #0x1
	str	r3, [sp, #0xc8]
	ldr	r7, .L5
	ldr	r0, [r7]
	ldr	r1, .L5 + 4
	add	r1, r0, r1
	str	r1, [sp, #0xcc]
	add	r6, sp, #0x90
	ldr	r1, .L5 + 8
	add	r0, r6, #0
	bl	sub_8057158
	add	r5, sp, #0x98
	ldr	r1, .L5 + 12
	add	r0, r5, #0
	bl	sub_8057158
	add	r4, sp, #0xa0
	ldr	r1, .L5 + 16
	add	r0, r4, #0
	bl	sub_8057158
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r0, [r7]
	ldr	r2, .L5 + 20
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	mov	r3, #0x2
	str	r3, [sp, #0xa8]
	cmp	r0, #0
	beq	.L4	@cond_branch
	mov	r0, #0x1
	str	r0, [sp, #0xa8]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000fb0
	.4byte	0x15c4
	.4byte	0x8078954
	.4byte	0x8078968
	.4byte	0x807897c
	.4byte	0x1618
.L2:
	mov	r1, #0x0
	str	r1, [sp, #0xa8]
.L4:
	ldr	r5, .L9
	ldr	r0, [r5]
	ldr	r2, .L9 + 4
	add	r0, r0, r2
	bl	sub_8061228
	ldr	r0, [r5]
	mov	r3, #0x87
	lsl	r3, r3, #0x4
	add	r0, r0, r3
	bl	sub_8061228
	ldr	r0, [r5]
	mov	r1, #0x8a
	lsl	r1, r1, #0x4
	add	r0, r0, r1
	mov	r4, #0x0
	strh	r4, [r0]
	ldr	r1, .L9 + 8
	ldr	r2, .L9 + 12
	mov	r3, #0xf0
	NEG	r3, r3
	str	r4, [sp]
	mov	r0, #0xf0
	str	r0, [sp, #0x4]
	mov	r0, #0x2
	str	r0, [sp, #0x8]
	add	r0, sp, #0x28
	bl	allocFont
	ldr	r0, [r5]
	mov	r2, #0xb2
	lsl	r2, r2, #0x5
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r4, .L9 + 16
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, sp, #0x28
	mov	r2, #0xe
	bl	sub_8061660
	b	.L8
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000fb0
	.4byte	0x8a8
	.4byte	0x82b1a84
	.4byte	0x8067c0d
	.4byte	0x806e79c
.L7:
	ldr	r4, .L13
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, sp, #0x28
	mov	r2, #0xe
	bl	sub_8061660
.L8:
	bl	getLanguage
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r3, sp, #0x58
	mov	r8, r3
	ldr	r1, .L13 + 4
	ldr	r2, .L13 + 8
	mov	r3, #0xc8
	NEG	r3, r3
	mov	r6, #0x0
	str	r6, [sp]
	mov	r4, #0xf0
	str	r4, [sp, #0x4]
	mov	r5, #0xa
	str	r5, [sp, #0x8]
	mov	r4, #0xd
	str	r4, [sp, #0xc]
	mov	r4, #0xf
	str	r4, [sp, #0x10]
	str	r5, [sp, #0x14]
	str	r5, [sp, #0x18]
	ldr	r4, .L13 + 12
	str	r4, [sp, #0x1c]
	str	r6, [sp, #0x20]
	str	r0, [sp, #0x24]
	mov	r0, r8
	bl	sub_805AD24
	mov	r9, r8
	ldr	r0, [sp, #0xa8]
	cmp	r0, #0x2
	bne	.L11	@cond_branch
	ldr	r1, .L13 + 16
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x806e788
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	sub_8052B08 + 1
	.4byte	0x806e870
.L11:
	ldr	r0, .L17
	ldr	r0, [r0]
	mov	r1, #0xb2
	lsl	r1, r1, #0x5
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L15	@cond_branch
	ldr	r1, .L17 + 4
.L12:
	mov	r0, r9
	mov	r2, #0x0
	bl	allocateMenuItems
	b	.L16
.L18:
	.align	2, 0
.L17:
	.4byte	0x3000fb0
	.4byte	0x806e810
.L15:
	ldr	r1, .L23
	mov	r0, r9
	mov	r2, #0x0
	bl	allocateMenuItems
.L16:
	bl	updateKeyState
	ldr	r2, [sp, #0xa8]
	cmp	r2, #0x2
	beq	.L19	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [sp, #0xac]
	mov	r0, #0x0
	bl	allocSprite
	mov	sl, r0
	ldr	r6, .L23 + 4
	ldr	r2, .L23 + 8
	mov	r3, #0xf0
	lsl	r3, r3, #0x6
	mov	r8, r3
	mov	r4, #0x0
	str	r4, [sp]
	str	r4, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	mov	r5, #0x62
	str	r5, [sp, #0xc]
	ldr	r0, [sp, #0xac]
	add	r1, r6, #0
	bl	LoadSpriteSheet
	ldr	r2, .L23 + 12
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r5, [sp, #0xc]
	mov	r0, sl
	add	r1, r6, #0
	mov	r3, r8
	bl	LoadSpriteSheet
.L19:
	ldr	r0, .L23 + 16
	ldr	r0, [r0]
	mov	r1, #0xb2
	lsl	r1, r1, #0x5
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L20	@cond_branch
	b	.L74
.L20:
	bl	sub_804AF9C
	bl	sub_804B044
	b	.L74
.L24:
	.align	2, 0
.L23:
	.4byte	0x806e7b0
	.4byte	0x82b1a84
	.4byte	0xfffed400
	.4byte	0xffff3800
	.4byte	0x3000fb0
.L91:
	bl	VBlankIntrWait
	bl	sub_80627F0
	ldr	r6, .L33
	ldr	r0, [r6]
	ldr	r2, .L33 + 4
	mov	r8, r2
	ADD r0, r8
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L25	@cond_branch
	b	.L32
.L25:
	bl	isMultiplayer
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r7, #0x1
	sub	r0, r7, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L33 + 8
	add	r0, r0, r2
	ldr	r1, [r6]
	add	r5, r1, r0
	add	r2, r1, r2
	ldr	r3, .L33 + 12
	add	r1, r1, r3
	add	r0, r2, #0
	mov	r2, #0x1
	bl	sub_806014C
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r1, [r6]
	ldr	r0, [sp, #0xcc]
	bl	sub_805000C
	add	r0, r5, #0
	bl	sub_8050114
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L27	@cond_branch
	bl	sub_80603E8
.L27:
	cmp	r4, #0
	bne	.L29	@cond_branch
	bl	sub_806008C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L29	@cond_branch
	ldr	r0, [r6]
	ADD r0, r8
	strb	r4, [r0]
	ldr	r0, [r6]
	ldr	r1, .L33 + 16
	add	r0, r0, r1
	strb	r7, [r0]
	mov	r0, #0x8
	bl	sub_8049234
	mov	r0, #0x1d
	bl	sub_804924C
	mov	r0, #0x1
	bl	sub_8053E18
	mov	r2, #0x1
	str	r2, [sp, #0xb0]
	ldr	r3, .L33 + 20
	str	r3, [sp, #0xc0]
	mov	r0, #0x8
	NEG	r0, r0
	str	r0, [sp, #0xc8]
	bl	sub_804AF5C
	bl	sub_804AE8C
.L29:
	add	r0, r5, #0
	mov	r1, #0x6
	bl	sub_80501C8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L32	@cond_branch
	ldr	r0, .L33
	ldr	r0, [r0]
	ldr	r1, .L33 + 24
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L31	@cond_branch
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x2
	bl	sub_80501A8
	b	.L32
.L34:
	.align	2, 0
.L33:
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x15d4
	.4byte	0x15c4
	.4byte	0x1619
	.4byte	0xffff3800
	.4byte	0x161a
.L31:
	mov	r2, #0x1
	str	r2, [sp, #0xb0]
	ldr	r3, .L38
	str	r3, [sp, #0xc0]
	mov	r0, #0x8
	NEG	r0, r0
	str	r0, [sp, #0xc8]
	ldrb	r5, [r5, #0xd]
	lsl	r1, r5, #0x1c
	lsr	r1, r1, #0x1c
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L35	@cond_branch
	bl	sub_804AF5C
	bl	sub_804AE8C
	mov	r0, #0x1
	bl	sub_8053E18
.L35:
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x2
	bl	sub_8050184
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x5
	bl	sub_80501A8
.L32:
	ldr	r1, [sp, #0xa8]
	cmp	r1, #0x2
	bne	.L36	@cond_branch
	ldr	r1, .L38 + 4
	mov	r0, #0x0
	strh	r0, [r1]
	b	.L37
.L39:
	.align	2, 0
.L38:
	.4byte	0xffff3800
	.4byte	0x3005da0
.L36:
	bl	updateKeyState
.L37:
	ldr	r2, [sp, #0xc4]
	ldr	r3, [sp, #0xc8]
	add	r2, r2, r3
	str	r2, [sp, #0xc4]
	cmp	r2, #0
	bge	.L40	@cond_branch
	mov	r0, #0x0
	str	r0, [sp, #0xc4]
.L40:
	ldr	r1, [sp, #0xc4]
	asr	r0, r1, #0x3
	cmp	r0, #0xf
	ble	.L41	@cond_branch
	mov	r2, #0x78
	str	r2, [sp, #0xc4]
	mov	r3, #0x0
	str	r3, [sp, #0xc8]
.L41:
	ldr	r0, [sp, #0xb8]
	cmp	r0, #0
	beq	.L42	@cond_branch
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0xb8]
	ldr	r0, .L46
	ldrh	r2, [r0]
	cmp	r2, #0
	beq	.L49	@cond_branch
	ldr	r1, .L46 + 4
	ldr	r3, [sp, #0xb4]
	lsl	r0, r3, #0x1
	add	r0, r0, r1
	ldrh	r0, [r0]
	cmp	r2, r0
	beq	.L44	@cond_branch
	mov	r0, #0x0
	str	r0, [sp, #0xb4]
	mov	r1, #0xc0
	str	r1, [sp, #0xb8]
	b	.L49
.L47:
	.align	2, 0
.L46:
	.4byte	0x3005da0
	.4byte	0x807894c
.L44:
	add	r0, r3, #0
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0xb4]
	cmp	r0, #0x4
	bne	.L49	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L49	@cond_branch
	ldr	r0, .L64
	ldr	r0, [r0]
	ldr	r1, .L64 + 4
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
.L42:
	mov	r2, #0x0
	str	r2, [sp, #0xb4]
	mov	r3, #0xc0
	str	r3, [sp, #0xb8]
.L49:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L56	@cond_branch
	add	r0, sp, #0x90
	bl	sub_8057164
	add	r0, sp, #0x90
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L51	@cond_branch
	ldr	r3, .L64
	ldr	r1, [r3]
	ldr	r2, .L64 + 8
	add	r1, r1, r2
	mov	r0, #0x5
	strb	r0, [r1]
	ldr	r0, [r3]
	add	r0, r0, r2
	ldrb	r0, [r0]
	bl	sub_804F800
.L51:
	add	r0, sp, #0x98
	bl	sub_8057164
	add	r0, sp, #0x98
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L53	@cond_branch
	mov	r5, #0x0
	ldr	r1, .L64
	ldr	r0, [r1]
	mov	r2, #0x86
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	ldr	r0, [r0]
	cmp	r5, r0
	bge	.L53	@cond_branch
	add	r6, r1, #0
	mov	r4, #0x0
.L54:
	ldr	r0, [r6]
	ldr	r3, .L64 + 12
	add	r0, r0, r3
	ldr	r0, [r0]
	add	r0, r0, r4
	bl	sub_804C0C0
	mov	r0, #0x85
	lsl	r0, r0, #0x3
	add	r4, r4, r0
	add	r5, r5, #0x1
	ldr	r0, [r6]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r5, r0
	blt	.L54	@cond_branch
.L53:
	add	r0, sp, #0xa0
	bl	sub_8057164
	add	r0, sp, #0xa0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L56	@cond_branch
	ldr	r0, .L64
	ldr	r4, [r0]
	bl	getLevelDescription2
	ldrb	r1, [r0, #0x1]
	cmp	r1, #0
	beq	.L56	@cond_branch
	ldr	r2, .L64 + 16
	add	r3, r4, r2
	mov	r4, #0x1
	ldr	r2, [r3]
.L57:
	sub	r1, r1, #0x1
	add	r0, r4, #0
	LSL	r0, r1
	orr	r2, r2, r0
	cmp	r1, #0
	bne	.L57	@cond_branch
	str	r2, [r3]
.L56:
	mov	r3, r9
	ldr	r0, [r3, #0x14]
	cmp	r0, #0
	bne	.L58	@cond_branch
	b	.L68
.L58:
	mov	r7, r9
	ldr	r4, [r3, #0x18]
	ldr	r5, [r3, #0xc]
	ldr	r0, [r5]
	ldr	r2, [sp, #0xc0]
	sub	r1, r2, r0
	cmp	r1, #0
	beq	.L61	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x10
	bl	sub_80491E0
	add	r1, r0, #0
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	beq	.L61	@cond_branch
	lsl	r6, r1, #0x10
.L62:
	add	r0, r5, #0
	asr	r1, r6, #0x10
	mov	r2, #0x0
	bl	sub_8061824
	add	r5, r5, #0x4c
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L62	@cond_branch
.L61:
	ldr	r4, [r7, #0x18]
	ldr	r5, [r7, #0xc]
	ldr	r1, [r5]
	lsl	r1, r1, #0x8
	asr	r1, r1, #0x10
	ldr	r2, [r5, #0x4]
	asr	r2, r2, #0x8
	sub	r2, r2, #0x14
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	add	r0, sp, #0x28
	bl	sub_8061844
	b	.L63
.L65:
	.align	2, 0
.L64:
	.4byte	0x3000fb0
	.4byte	0x1641
	.4byte	0x1638
	.4byte	0x42c
	.4byte	0x13f8
.L67:
	ldr	r0, [r5, #0x2c]
	cmp	r0, #0
	beq	.L66	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x10
	NEG	r1, r1
	mov	r2, #0x8
	NEG	r2, r2
	bl	sub_8061880
.L66:
	add	r5, r5, #0x4c
.L63:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L67	@cond_branch
	ldr	r3, [sp, #0xa8]
	cmp	r3, #0x2
	beq	.L68	@cond_branch
	ldr	r0, .L94
	mov	r8, r0
	ldr	r1, [sp, #0xbc]
	lsl	r0, r1, #0x1
	ADD r0, r8
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	lsl	r1, r1, #0x1
	ldr	r6, .L94 + 4
	and	r1, r1, r6
	ldr	r3, [sp, #0xac]
	ldr	r0, [r3, #0x8]
	sub	r0, r0, r1
	str	r0, [r3, #0x8]
	mov	r2, sl
	ldr	r0, [r2, #0x8]
	add	r0, r0, r1
	str	r0, [r2, #0x8]
	mov	r0, r9
	bl	sub_805B240
	mov	r1, #0x4c
	mul	r1, r1, r0
	ldr	r0, [r7, #0xc]
	add	r5, r0, r1
	ldr	r0, [sp, #0xbc]
	add	r0, r0, #0x4
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0xbc]
	add	r0, r5, #0
	bl	sub_8061D54
	ldr	r3, [sp, #0xac]
	ldr	r1, [r3, #0x8]
	mov	r2, #0xa0
	lsl	r2, r2, #0x5
	add	r1, r1, r2
	sub	r1, r0, r1
	cmp	r1, #0
	beq	.L69	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x1c
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	ldr	r3, [sp, #0xac]
	ldr	r1, [r3, #0x8]
	add	r1, r1, r0
	str	r1, [r3, #0x8]
.L69:
	add	r0, r5, #0
	bl	sub_8061E44
	ldr	r2, [sp, #0xac]
	ldr	r1, [r2, #0xc]
	mov	r4, #0x80
	lsl	r4, r4, #0x3
	add	r1, r1, r4
	sub	r1, r0, r1
	cmp	r1, #0
	beq	.L70	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x4
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	ldr	r3, [sp, #0xac]
	ldr	r1, [r3, #0xc]
	add	r1, r1, r0
	str	r1, [r3, #0xc]
.L70:
	add	r0, r5, #0
	bl	sub_8061E08
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	ldr	r3, .L94 + 8
	add	r1, r1, r3
	sub	r1, r0, r1
	cmp	r1, #0
	beq	.L71	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x1c
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	add	r1, r1, r0
	str	r1, [r2, #0x8]
.L71:
	add	r0, r5, #0
	bl	sub_8061E44
	mov	r3, sl
	ldr	r1, [r3, #0xc]
	add	r1, r1, r4
	sub	r1, r0, r1
	cmp	r1, #0
	beq	.L72	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x4
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	mov	r2, sl
	ldr	r1, [r2, #0xc]
	add	r1, r1, r0
	str	r1, [r2, #0xc]
.L72:
	ldr	r3, [sp, #0xbc]
	lsl	r0, r3, #0x1
	ADD r0, r8
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	lsl	r1, r1, #0x1
	and	r1, r1, r6
	ldr	r3, [sp, #0xac]
	ldr	r0, [r3, #0x8]
	add	r0, r0, r1
	str	r0, [r3, #0x8]
	mov	r2, sl
	ldr	r0, [r2, #0x8]
	sub	r0, r0, r1
	str	r0, [r2, #0x8]
.L68:
	ldr	r0, .L94 + 12
	ldr	r0, [r0]
	bl	_call_via_r0
	ldr	r3, [sp, #0xb0]
	cmp	r3, #0
	bne	.L88	@cond_branch
	mov	r1, r9
	ldr	r0, [r1, #0xc]
	ldr	r0, [r0]
	ldr	r2, [sp, #0xc0]
	cmp	r0, r2
	bne	.L74	@cond_branch
	ldr	r7, .L94 + 16
	ldr	r1, [r7]
	ldr	r6, .L94 + 20
	add	r0, r1, r6
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L75	@cond_branch
	ldr	r3, .L94 + 24
	add	r0, r1, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L84	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L84	@cond_branch
.L75:
	mov	r0, r9
	bl	sub_805B240
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r4, .L94 + 28
	mov	r0, #0x40
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L78	@cond_branch
	mov	r0, r9
	mov	r1, #0x0
	bl	sub_805AFBC
.L78:
	mov	r0, #0x80
	ldrh	r2, [r4]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L79	@cond_branch
	mov	r0, r9
	mov	r1, #0x1
	bl	sub_805AFBC
.L79:
	mov	r0, #0x1
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L83	@cond_branch
	lsl	r0, r5, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0
	bne	.L81	@cond_branch
	mov	r3, #0x1
	str	r3, [sp, #0xb0]
.L81:
	cmp	r0, #0x1
	bne	.L83	@cond_branch
	mov	r0, #0x1
	str	r0, [sp, #0xb0]
	bl	sub_804AF5C
	bl	sub_804AE8C
	mov	r0, #0x1
	bl	sub_8053E18
	ldr	r0, [r7]
	add	r0, r0, r6
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L83	@cond_branch
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x4
	bl	sub_8050184
.L83:
	ldr	r1, .L94 + 28
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L84	@cond_branch
	mov	r1, #0x1
	str	r1, [sp, #0xb0]
.L84:
	ldr	r2, [sp, #0xb0]
	cmp	r2, #0
	bne	.L85	@cond_branch
	b	.L91
.L85:
	ldr	r0, .L94 + 16
	ldr	r0, [r0]
	ldr	r3, .L94 + 20
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L87	@cond_branch
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x2
	bl	sub_8050184
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x1
	bl	sub_80501A8
.L87:
	ldr	r0, .L94 + 32
	str	r0, [sp, #0xc0]
	mov	r1, #0x8
	NEG	r1, r1
	str	r1, [sp, #0xc8]
.L74:
	ldr	r2, [sp, #0xb0]
	cmp	r2, #0
	bne	.L88	@cond_branch
	b	.L91
.L88:
	mov	r3, r9
	ldr	r0, [r3, #0xc]
	ldr	r0, [r0]
	ldr	r1, [sp, #0xc0]
	cmp	r0, r1
	beq	.L90	@cond_branch
	b	.L91
.L90:
	ldr	r0, .L94 + 16
	ldr	r0, [r0]
	mov	r2, #0xb2
	lsl	r2, r2, #0x5
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L92	@cond_branch
	bl	sub_804AFB8
	bl	sub_804B060
.L92:
	ldr	r3, [sp, #0xa8]
	cmp	r3, #0x2
	beq	.L93	@cond_branch
	mov	r0, sl
	bl	sub_8060A94
	ldr	r0, [sp, #0xac]
	bl	sub_8060A94
.L93:
	mov	r0, r9
	bl	sub_805AD9C
	add	r0, sp, #0x28
	bl	sub_8061204
	bl	VBlankIntrWait
	add	sp, sp, #0xd0
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L95:
	.align	2, 0
.L94:
	.4byte	0x874cc3c
	.4byte	0xffffff00
	.4byte	0xfffffc00
	.4byte	0x807d93c
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x161a
	.4byte	0x3005da0
	.4byte	0xffff3800
	thumb_func_end sub_8052B24

.align 2, 0 @ Don't pad with nop.
