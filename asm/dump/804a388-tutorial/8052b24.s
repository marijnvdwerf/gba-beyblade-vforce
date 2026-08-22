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
	ldr	r7, .L8052BA4
	ldr	r0, [r7]
	ldr	r1, .L8052BA4 + 4
	add	r1, r0, r1
	str	r1, [sp, #0xcc]
	add	r6, sp, #0x90
	ldr	r1, .L8052BA4 + 8
	add	r0, r6, #0
	bl	sub_8057158
	add	r5, sp, #0x98
	ldr	r1, .L8052BA4 + 12
	add	r0, r5, #0
	bl	sub_8057158
	add	r4, sp, #0xa0
	ldr	r1, .L8052BA4 + 16
	add	r0, r4, #0
	bl	sub_8057158
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8052BBC	@cond_branch
	ldr	r0, [r7]
	ldr	r2, .L8052BA4 + 20
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8052BBC	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	mov	r3, #0x2
	str	r3, [sp, #0xa8]
	cmp	r0, #0
	beq	.L8052BC0	@cond_branch
	mov	r0, #0x1
	str	r0, [sp, #0xa8]
	b	.L8052BC0
.L8052BA2:
	.align	2, 0
.L8052BA4:
	.4byte	_gameData
	.4byte	0x15c4
	.4byte	_8078954
	.4byte	_8078968
	.4byte	_807897c
	.4byte	0x1618
.L8052BBC:
	mov	r1, #0x0
	str	r1, [sp, #0xa8]
.L8052BC0:
	ldr	r5, .L8052C20
	ldr	r0, [r5]
	ldr	r2, .L8052C20 + 4
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
	ldr	r1, .L8052C20 + 8
	ldr	r2, .L8052C20 + 12
	mov	r3, #0xf0
	neg	r3, r3
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
	beq	.L8052C34	@cond_branch
	ldr	r4, .L8052C20 + 16
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, sp, #0x28
	mov	r2, #0xe
	bl	sub_8061660
	b	.L8052C48
.L8052C20:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x8a8
	.4byte	SpriteSheet_82B1A84
	.4byte	LargeFontMeta
	.4byte	0x806e79c
.L8052C34:
	ldr	r4, .L8052C90
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, sp, #0x28
	mov	r2, #0xe
	bl	sub_8061660
.L8052C48:
	bl	getLanguage
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r3, sp, #0x58
	mov	r8, r3
	ldr	r1, .L8052C90 + 4
	ldr	r2, .L8052C90 + 8
	mov	r3, #0xc8
	neg	r3, r3
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
	ldr	r4, .L8052C90 + 12
	str	r4, [sp, #0x1c]
	str	r6, [sp, #0x20]
	str	r0, [sp, #0x24]
	mov	r0, r8
	bl	sub_805AD24
	mov	r9, r8
	ldr	r0, [sp, #0xa8]
	cmp	r0, #0x2
	bne	.L8052CA4	@cond_branch
	ldr	r1, .L8052C90 + 16
	b	.L8052CB6
.L8052C8E:
	.align	2, 0
.L8052C90:
	.4byte	0x806e788
	.4byte	SpriteSheet_82B05EC
	.4byte	ShadowFontMeta
	.4byte	sub_8052B08 + 1
	.4byte	_806E870
.L8052CA4:
	ldr	r0, .L8052CC0
	ldr	r0, [r0]
	mov	r1, #0xb2
	lsl	r1, r1, #0x5
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8052CC8	@cond_branch
	ldr	r1, .L8052CC0 + 4
.L8052CB6:
	mov	r0, r9
	mov	r2, #0x0
	bl	allocateMenuItems
	b	.L8052CD2
.L8052CC0:
	.align	2, 0

	.4byte	_gameData
	.4byte	_806E810
.L8052CC8:
	ldr	r1, .L8052D3C
	mov	r0, r9
	mov	r2, #0x0
	bl	allocateMenuItems
.L8052CD2:
	bl	updateKeyState
	ldr	r2, [sp, #0xa8]
	cmp	r2, #0x2
	beq	.L8052D20	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [sp, #0xac]
	mov	r0, #0x0
	bl	allocSprite
	mov	sl, r0
	ldr	r6, .L8052D3C + 4
	ldr	r2, .L8052D3C + 8
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
	ldr	r2, .L8052D3C + 12
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r5, [sp, #0xc]
	mov	r0, sl
	add	r1, r6, #0
	mov	r3, r8
	bl	LoadSpriteSheet
.L8052D20:
	ldr	r0, .L8052D3C + 16
	ldr	r0, [r0]
	mov	r1, #0xb2
	lsl	r1, r1, #0x5
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8052D32	@cond_branch
	b	.L8053232
.L8052D32:
	bl	sub_804AF9C
	bl	sub_804B044
	b	.L8053232
.L8052D3C:
	.align	2, 0

	.4byte	0x806e7b0
	.4byte	SpriteSheet_82B1A84
	.4byte	0xfffed400
	.4byte	0xffff3800
	.4byte	_gameData
.L8052D50:
	bl	VBlankIntrWait
	bl	sub_80627F0
	ldr	r6, .L8052E14
	ldr	r0, [r6]
	ldr	r2, .L8052E14 + 4
	mov	r8, r2
	add r0, r8
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8052D6A	@cond_branch
	b	.L8052E6A
.L8052D6A:
	bl	isMultiplayer
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r7, #0x1
	sub	r0, r7, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L8052E14 + 8
	add	r0, r0, r2
	ldr	r1, [r6]
	add	r5, r1, r0
	add	r2, r1, r2
	ldr	r3, .L8052E14 + 12
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
	bne	.L8052DAA	@cond_branch
	bl	sub_80603E8
.L8052DAA:
	cmp	r4, #0
	bne	.L8052DEE	@cond_branch
	bl	sub_806008C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8052DEE	@cond_branch
	ldr	r0, [r6]
	add r0, r8
	strb	r4, [r0]
	ldr	r0, [r6]
	ldr	r1, .L8052E14 + 16
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
	ldr	r3, .L8052E14 + 20
	str	r3, [sp, #0xc0]
	mov	r0, #0x8
	neg	r0, r0
	str	r0, [sp, #0xc8]
	bl	sub_804AF5C
	bl	sub_804AE8C
.L8052DEE:
	add	r0, r5, #0
	mov	r1, #0x6
	bl	sub_80501C8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8052E6A	@cond_branch
	ldr	r0, .L8052E14
	ldr	r0, [r0]
	ldr	r1, .L8052E14 + 24
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8052E30	@cond_branch
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x2
	bl	sub_80501A8
	b	.L8052E6A
.L8052E14:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x1618
	.4byte	0x15d4
	.4byte	0x15c4
	.4byte	0x1619
	.4byte	0xffff3800
	.4byte	0x161a
.L8052E30:
	mov	r2, #0x1
	str	r2, [sp, #0xb0]
	ldr	r3, .L8052E78
	str	r3, [sp, #0xc0]
	mov	r0, #0x8
	neg	r0, r0
	str	r0, [sp, #0xc8]
	ldrb	r5, [r5, #0xd]
	lsl	r1, r5, #0x1c
	lsr	r1, r1, #0x1c
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8052E5A	@cond_branch
	bl	sub_804AF5C
	bl	sub_804AE8C
	mov	r0, #0x1
	bl	sub_8053E18
.L8052E5A:
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x2
	bl	sub_8050184
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x5
	bl	sub_80501A8
.L8052E6A:
	ldr	r1, [sp, #0xa8]
	cmp	r1, #0x2
	bne	.L8052E80	@cond_branch
	ldr	r1, .L8052E78 + 4
	mov	r0, #0x0
	strh	r0, [r1]
	b	.L8052E84
.L8052E78:
	.align	2, 0

	.4byte	0xffff3800
	.4byte	_unk3005DA0
.L8052E80:
	bl	updateKeyState
.L8052E84:
	ldr	r2, [sp, #0xc4]
	ldr	r3, [sp, #0xc8]
	add	r2, r2, r3
	str	r2, [sp, #0xc4]
	cmp	r2, #0
	bge	.L8052E94	@cond_branch
	mov	r0, #0x0
	str	r0, [sp, #0xc4]
.L8052E94:
	ldr	r1, [sp, #0xc4]
	asr	r0, r1, #0x3
	cmp	r0, #0xf
	ble	.L8052EA4	@cond_branch
	mov	r2, #0x78
	str	r2, [sp, #0xc4]
	mov	r3, #0x0
	str	r3, [sp, #0xc8]
.L8052EA4:
	ldr	r0, [sp, #0xb8]
	cmp	r0, #0
	beq	.L8052F00	@cond_branch
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0xb8]
	ldr	r0, .L8052ED4
	ldrh	r2, [r0]
	cmp	r2, #0
	beq	.L8052F08	@cond_branch
	ldr	r1, .L8052ED4 + 4
	ldr	r3, [sp, #0xb4]
	lsl	r0, r3, #0x1
	add	r0, r0, r1
	ldrh	r0, [r0]
	cmp	r2, r0
	beq	.L8052EDC	@cond_branch
	mov	r0, #0x0
	str	r0, [sp, #0xb4]
	mov	r1, #0xc0
	str	r1, [sp, #0xb8]
	b	.L8052F08
.L8052ED2:
	.align	2, 0
.L8052ED4:
	.4byte	_unk3005DA0
	.4byte	_807894c
.L8052EDC:
	add	r0, r3, #0
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0xb4]
	cmp	r0, #0x4
	bne	.L8052F08	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8052F08	@cond_branch
	ldr	r0, .L805301C
	ldr	r0, [r0]
	ldr	r1, .L805301C + 4
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
.L8052F00:
	mov	r2, #0x0
	str	r2, [sp, #0xb4]
	mov	r3, #0xc0
	str	r3, [sp, #0xb8]
.L8052F08:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8052FBC	@cond_branch
	add	r0, sp, #0x90
	bl	sub_8057164
	add	r0, sp, #0x90
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8052F3A	@cond_branch
	ldr	r3, .L805301C
	ldr	r1, [r3]
	ldr	r2, .L805301C + 8
	add	r1, r1, r2
	mov	r0, #0x5
	strb	r0, [r1]
	ldr	r0, [r3]
	add	r0, r0, r2
	ldrb	r0, [r0]
	bl	sub_804F800
.L8052F3A:
	add	r0, sp, #0x98
	bl	sub_8057164
	add	r0, sp, #0x98
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8052F86	@cond_branch
	mov	r5, #0x0
	ldr	r1, .L805301C
	ldr	r0, [r1]
	mov	r2, #0x86
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	ldr	r0, [r0]
	cmp	r5, r0
	bge	.L8052F86	@cond_branch
	add	r6, r1, #0
	mov	r4, #0x0
.L8052F62:
	ldr	r0, [r6]
	ldr	r3, .L805301C + 12
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
	blt	.L8052F62	@cond_branch
.L8052F86:
	add	r0, sp, #0xa0
	bl	sub_8057164
	add	r0, sp, #0xa0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8052FBC	@cond_branch
	ldr	r0, .L805301C
	ldr	r4, [r0]
	bl	getLevelDescription2
	ldrb	r1, [r0, #0x1]
	cmp	r1, #0
	beq	.L8052FBC	@cond_branch
	ldr	r2, .L805301C + 16
	add	r3, r4, r2
	mov	r4, #0x1
	ldr	r2, [r3]
.L8052FAE:
	sub	r1, r1, #0x1
	add	r0, r4, #0
	lsl	r0, r1
	orr	r2, r2, r0
	cmp	r1, #0
	bne	.L8052FAE	@cond_branch
	str	r2, [r3]
.L8052FBC:
	mov	r3, r9
	ldr	r0, [r3, #0x14]
	cmp	r0, #0
	bne	.L8052FC6	@cond_branch
	b	.L8053148
.L8052FC6:
	mov	r7, r9
	ldr	r4, [r3, #0x18]
	ldr	r5, [r3, #0xc]
	ldr	r0, [r5]
	ldr	r2, [sp, #0xc0]
	sub	r1, r2, r0
	cmp	r1, #0
	beq	.L8052FFE	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x10
	bl	sub_80491E0
	add	r1, r0, #0
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	beq	.L8052FFE	@cond_branch
	lsl	r6, r1, #0x10
.L8052FEA:
	add	r0, r5, #0
	asr	r1, r6, #0x10
	mov	r2, #0x0
	bl	sub_8061824
	add	r5, r5, #0x4c
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L8052FEA	@cond_branch
.L8052FFE:
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
	b	.L8053046
.L805301A:
	.align	2, 0
.L805301C:
	.4byte	_gameData
	.4byte	0x1641
	.4byte	0x1638
	.4byte	0x42c
	.4byte	0x13f8
.L8053030:
	ldr	r0, [r5, #0x2c]
	cmp	r0, #0
	beq	.L8053044	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x10
	neg	r1, r1
	mov	r2, #0x8
	neg	r2, r2
	bl	sub_8061880
.L8053044:
	add	r5, r5, #0x4c
.L8053046:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L8053030	@cond_branch
	ldr	r3, [sp, #0xa8]
	cmp	r3, #0x2
	beq	.L8053148	@cond_branch
	ldr	r0, .L8053294
	mov	r8, r0
	ldr	r1, [sp, #0xbc]
	lsl	r0, r1, #0x1
	add r0, r8
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	lsl	r1, r1, #0x1
	ldr	r6, .L8053294 + 4
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
	beq	.L80530B8	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x1c
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	ldr	r3, [sp, #0xac]
	ldr	r1, [r3, #0x8]
	add	r1, r1, r0
	str	r1, [r3, #0x8]
.L80530B8:
	add	r0, r5, #0
	bl	sub_8061E44
	ldr	r2, [sp, #0xac]
	ldr	r1, [r2, #0xc]
	mov	r4, #0x80
	lsl	r4, r4, #0x3
	add	r1, r1, r4
	sub	r1, r0, r1
	cmp	r1, #0
	beq	.L80530E0	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x4
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	ldr	r3, [sp, #0xac]
	ldr	r1, [r3, #0xc]
	add	r1, r1, r0
	str	r1, [r3, #0xc]
.L80530E0:
	add	r0, r5, #0
	bl	sub_8061E08
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	ldr	r3, .L8053294 + 8
	add	r1, r1, r3
	sub	r1, r0, r1
	cmp	r1, #0
	beq	.L8053106	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x1c
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	add	r1, r1, r0
	str	r1, [r2, #0x8]
.L8053106:
	add	r0, r5, #0
	bl	sub_8061E44
	mov	r3, sl
	ldr	r1, [r3, #0xc]
	add	r1, r1, r4
	sub	r1, r0, r1
	cmp	r1, #0
	beq	.L805312A	@cond_branch
	add	r0, r1, #0
	mov	r1, #0x4
	bl	sub_80491E0
	lsl	r0, r0, #0x8
	mov	r2, sl
	ldr	r1, [r2, #0xc]
	add	r1, r1, r0
	str	r1, [r2, #0xc]
.L805312A:
	ldr	r3, [sp, #0xbc]
	lsl	r0, r3, #0x1
	add r0, r8
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
.L8053148:
	ldr	r0, .L8053294 + 12
	ldr	r0, [r0]
	bl	_call_via_r0
	ldr	r3, [sp, #0xb0]
	cmp	r3, #0
	bne	.L805323A	@cond_branch
	mov	r1, r9
	ldr	r0, [r1, #0xc]
	ldr	r0, [r0]
	ldr	r2, [sp, #0xc0]
	cmp	r0, r2
	bne	.L8053232	@cond_branch
	ldr	r7, .L8053294 + 16
	ldr	r1, [r7]
	ldr	r6, .L8053294 + 20
	add	r0, r1, r6
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8053184	@cond_branch
	ldr	r3, .L8053294 + 24
	add	r0, r1, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8053202	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8053202	@cond_branch
.L8053184:
	mov	r0, r9
	bl	sub_805B240
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r4, .L8053294 + 28
	mov	r0, #0x40
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80531A2	@cond_branch
	mov	r0, r9
	mov	r1, #0x0
	bl	sub_805AFBC
.L80531A2:
	mov	r0, #0x80
	ldrh	r2, [r4]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L80531B4	@cond_branch
	mov	r0, r9
	mov	r1, #0x1
	bl	sub_805AFBC
.L80531B4:
	mov	r0, #0x1
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L80531F2	@cond_branch
	lsl	r0, r5, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0
	bne	.L80531CA	@cond_branch
	mov	r3, #0x1
	str	r3, [sp, #0xb0]
.L80531CA:
	cmp	r0, #0x1
	bne	.L80531F2	@cond_branch
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
	beq	.L80531F2	@cond_branch
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x4
	bl	sub_8050184
.L80531F2:
	ldr	r1, .L8053294 + 28
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8053202	@cond_branch
	mov	r1, #0x1
	str	r1, [sp, #0xb0]
.L8053202:
	ldr	r2, [sp, #0xb0]
	cmp	r2, #0
	bne	.L805320A	@cond_branch
	b	.L8052D50
.L805320A:
	ldr	r0, .L8053294 + 16
	ldr	r0, [r0]
	ldr	r3, .L8053294 + 20
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8053228	@cond_branch
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x2
	bl	sub_8050184
	ldr	r0, [sp, #0xcc]
	mov	r1, #0x1
	bl	sub_80501A8
.L8053228:
	ldr	r0, .L8053294 + 32
	str	r0, [sp, #0xc0]
	mov	r1, #0x8
	neg	r1, r1
	str	r1, [sp, #0xc8]
.L8053232:
	ldr	r2, [sp, #0xb0]
	cmp	r2, #0
	bne	.L805323A	@cond_branch
	b	.L8052D50
.L805323A:
	mov	r3, r9
	ldr	r0, [r3, #0xc]
	ldr	r0, [r0]
	ldr	r1, [sp, #0xc0]
	cmp	r0, r1
	beq	.L8053248	@cond_branch
	b	.L8052D50
.L8053248:
	ldr	r0, .L8053294 + 16
	ldr	r0, [r0]
	mov	r2, #0xb2
	lsl	r2, r2, #0x5
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8053260	@cond_branch
	bl	sub_804AFB8
	bl	sub_804B060
.L8053260:
	ldr	r3, [sp, #0xa8]
	cmp	r3, #0x2
	beq	.L8053272	@cond_branch
	mov	r0, sl
	bl	sub_8060A94
	ldr	r0, [sp, #0xac]
	bl	sub_8060A94
.L8053272:
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
.L8053292:
	.align	2, 0
.L8053294:
	.4byte	Unk_874CC3C
	.4byte	0xffffff00
	.4byte	0xfffffc00
	.4byte	__oam_8756CC0
	.4byte	_gameData
	.4byte	0x1618
	.4byte	0x161a
	.4byte	_unk3005DA0
	.4byte	0xffff3800
	thumb_func_end sub_8052B24

.align 2, 0 @ Don't pad with nop.
