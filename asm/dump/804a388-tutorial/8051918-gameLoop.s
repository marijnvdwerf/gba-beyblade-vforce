	.include "asm/common.inc"

	thumb_func_start gameLoop
gameLoop:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	mov	r0, #0x0
	mov	r9, r0
	mov	sl, r0
	ldr	r4, .L8051AE0
	ldr	r0, [r4]
	ldr	r1, .L8051AE0 + 4
	add	r1, r0, r1
	str	r1, [sp, #0x10]
	mov	r2, #0xf
	str	r2, [sp, #0x14]
	mov	r3, #0xff
	str	r3, [sp, #0x18]
	ldr	r5, .L8051AE0 + 8
	add	r0, r0, r5
	bl	nullsub_12
	ldr	r0, [r4]
	mov	r8, r0
	ldr	r1, [r0]
	str	r1, [sp, #0x20]
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	mov	r2, sl
	strh	r2, [r0]
	mov	r0, #0x8e
	lsl	r0, r0, #0x2
	ADD r0, r8
	bl	sub_80539E8
	ldr	r0, [r4]
	add	r0, r0, r5
	bl	sub_805EEE0
	str	r0, [sp, #0x24]
	ldr	r0, .L8051AE0 + 12
	mov	r1, #0x96
	lsl	r1, r1, #0x1
	bl	sub_8052140
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	beq	.L80519BA	@cond_branch
	mov	r0, #0x8
	bl	sub_8051780
	cmp	r0, #0
	bne	.L80519BA	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	mov	r9, r0
	ldr	r1, .L8051AE0 + 16
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	mov	r3, #0x8c
	lsl	r3, r3, #0x8
	mov	r0, #0x1
	str	r0, [sp]
	mov	r4, sl
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	mov	r0, r9
	bl	LoadSpriteSheet
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	beq	.L80519BA	@cond_branch
	mov	r0, #0x2
	mov	r5, r9
	strh	r0, [r5, #0x18]
.L80519BA:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L80519DC	@cond_branch
	ldr	r0, .L8051AE0
	ldr	r0, [r0]
	ldr	r1, .L8051AE0 + 20
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L80519DC	@cond_branch
	ldr	r0, [sp, #0x10]
	bl	sub_804FF5C
	bl	sub_804FFD4
.L80519DC:
	bl	allocateBeybladeObjectPalettes
	bl	sub_8056FAC
	bl	VBlankIntrWait
	bl	sub_80627F0
	mov	r0, #0x0
	mov	r1, #0x0
	ldr	r2, .L8051AE0 + 24
	bl	_call_via_r2
	ldr	r4, .L8051AE0
	ldr	r0, [r4]
	ldr	r3, .L8051AE0 + 8
	add	r0, r0, r3
	bl	sub_805EADC
	bl	initProjectileSystem
	mov	r0, #0x3
	mov	r1, #0x0
	ldr	r5, .L8051AE0 + 24
	bl	_call_via_r5
	bl	sub_804ACF0
	bl	getLevelDescription2
	add	r0, r0, #0xbc
	ldrb	r0, [r0]
	bl	sub_804AF04
	bl	sub_804F878
	bl	sub_804F9B4
	ldr	r0, [r4]
	ldr	r1, .L8051AE0 + 28
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	cmp	r0, #0
	bne	.L8051A38	@cond_branch
	b	.L80520B4
.L8051A38:
	ldr	r0, .L8051AE0 + 32
	ldrh	r0, [r0]
	cmp	r0, #0x9f
	bls	.L8051A48	@cond_branch
	ldr	r3, [sp, #0x1c]
	lsl	r0, r3, #0x18
	cmp	r0, #0
	bne	.L8051A4C	@cond_branch
.L8051A48:
	bl	VBlankIntrWait
.L8051A4C:
	mov	r4, #0x0
	str	r4, [sp, #0x1c]
	bl	sub_80627F0
	bl	sub_804AD74
	ldr	r4, .L8051AE0
	ldr	r1, [r4]
	ldr	r6, .L8051AE0 + 20
	add	r0, r1, r6
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051B0C	@cond_branch
	ldr	r0, .L8051AE0 + 32
	ldrh	r0, [r0]
	bl	isMultiplayer
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r5, #0x1
	sub	r0, r5, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L8051AE0 + 36
	add	r0, r0, r2
	ldr	r1, [r4]
	add	r0, r0, r1
	mov	sl, r0
	add	r2, r1, r2
	ldr	r0, .L8051AE0 + 4
	add	r1, r1, r0
	add	r0, r2, #0
	mov	r2, #0x1
	bl	sub_806014C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8051AC4	@cond_branch
	bl	sub_806008C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051AC4	@cond_branch
	ldr	r0, [r4]
	add	r0, r0, r6
	mov	r1, sp
	ldrb	r1, [r1, #0x1c]
	strb	r1, [r0]
	ldr	r0, [r4]
	ldr	r2, .L8051AE0 + 40
	add	r0, r0, r2
	strb	r5, [r0]
	mov	r0, #0x8
	bl	sub_8049234
	mov	r0, #0x1d
	bl	sub_804924C
	mov	r0, #0x1
	bl	sub_8053E18
.L8051AC4:
	ldr	r0, [sp, #0x10]
	mov	r1, r8
	bl	sub_805000C
	mov	r0, sl
	bl	sub_8050114
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8051B2A	@cond_branch
	bl	sub_80603E8
	b	.L8051B2A
.L8051ADE:
	.align	2, 0
.L8051AE0:
	.4byte	_gameData
	.4byte	0x15c4
	.4byte	0x434
	.4byte	_unk3000F50
	.4byte	SpriteSheet_86FBC4C
	.4byte	0x1618
	.4byte	sub_8052978 + 1
	.4byte	0xc6c
	.4byte	0x4000006
	.4byte	0x15d4
	.4byte	0x1619
.L8051B0C:
	ldr	r3, .L8051B84
	add	r0, r1, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051B2A	@cond_branch
	ldr	r4, .L8051B84 + 4
	add	r0, r1, r4
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8051B2A	@cond_branch
	mov	r5, #0x86
	lsl	r5, r5, #0x3
	add	r0, r1, r5
	ldr	r1, [sp, #0x1c]
	str	r1, [r0]
.L8051B2A:
	ldr	r4, .L8051B84 + 8
	ldr	r0, [r4]
	ldr	r2, .L8051B84 + 12
	add	r0, r0, r2
	bl	sub_805EB00
	mov	r0, #0x2
	mov	r1, #0x0
	ldr	r3, .L8051B84 + 16
	bl	_call_via_r3
	bl	sub_805529C
	bl	renderEnvironmentActors
	ldr	r0, [sp, #0x20]
	add	r0, r0, #0xb8
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L8051B5E	@cond_branch
	ldr	r0, [r4]
	mov	r5, #0xbf
	lsl	r5, r5, #0x2
	add	r2, r0, r5
	bl	sub_80526C8
.L8051B5E:
	mov	r5, #0x0
	ldr	r0, [r4]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r5, r0
	bge	.L8051BCC	@cond_branch
	add	r6, r4, #0
	ldr	r7, .L8051B84 + 20
.L8051B74:
	cmp	r5, #0
	beq	.L8051BA0	@cond_branch
	ldr	r0, [r6]
	ldr	r2, .L8051B84 + 24
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r4, r0, r7
	b	.L8051BA2
.L8051B84:
	.align	2, 0

	.4byte	0x1619
	.4byte	0x161b
	.4byte	_gameData
	.4byte	0x434
	.4byte	sub_8052978 + 1
	.4byte	0xfffffbd8
	.4byte	0x42c
.L8051BA0:
	ldr	r4, [r6]
.L8051BA2:
	add	r0, r4, #0
	bl	renderRider
	mov	r3, #0xf2
	lsl	r3, r3, #0x2
	add	r1, r4, r3
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	mov	r4, #0x85
	lsl	r4, r4, #0x3
	add	r7, r7, r4
	add	r5, r5, #0x1
	ldr	r0, [r6]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r5, r0
	blt	.L8051B74	@cond_branch
.L8051BCC:
	ldr	r0, .L8051C30
	ldr	r0, [r0]
	bl	_call_via_r0
	bl	updateKeyState
	bl	sub_8055340
	ldr	r0, [sp, #0x24]
	mov	r1, sl
	bl	sub_804B4FC
	bl	nullsub_1
	ldr	r4, .L8051C30 + 4
	ldr	r0, [r4]
	ldr	r2, .L8051C30 + 8
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051BFE	@cond_branch
	ldr	r0, [sp, #0x10]
	mov	r1, sl
	bl	sub_8050050
.L8051BFE:
	ldr	r0, [r4]
	mov	r5, #0xcb
	lsl	r5, r5, #0x3
	add	r1, r0, r5
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L8051C40	@cond_branch
	mov	r0, r8
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, #0
	bne	.L8051C54	@cond_branch
	ldr	r0, [r4]
	add	r2, r0, r5
	mov	r4, #0x8e
	lsl	r4, r4, #0x2
	add	r1, r0, r4
	str	r1, [r2]
	ldr	r5, .L8051C30 + 12
	add	r0, r0, r5
	strb	r3, [r0]
	b	.L8051C54
.L8051C30:
	.align	2, 0

	.4byte	__oam_8756CC0
	.4byte	_gameData
	.4byte	0x1618
	.4byte	0xb53
.L8051C40:
	mov	r2, r8
	ldr	r0, [r2]
	ldr	r0, [r0, #0xc]
	cmp	r0, #0
	bge	.L8051C54	@cond_branch
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0xf
	bl	sub_804ABFC
.L8051C54:
	ldr	r6, .L8051E60
	ldr	r2, [r6]
	ldr	r4, .L8051E60 + 4
	add	r1, r2, r4
	ldrh	r3, [r1]
	mov	r5, #0x0
	ldsh	r0, [r1, r5]
	cmp	r0, #0
	beq	.L8051CC2	@cond_branch
	ldr	r5, .L8051E60 + 8
	add	r0, r2, r5
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8051C74	@cond_branch
	sub	r0, r3, #1
	strh	r0, [r1]
.L8051C74:
	ldr	r0, [r6]
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	bne	.L8051CC2	@cond_branch
	bl	sub_804EE2C
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8051CAE	@cond_branch
	ldr	r1, [r6]
	ldr	r2, .L8051E60 + 12
	add	r0, r1, r2
	ldrb	r5, [r0]
	cmp	r5, #0
	bne	.L8051CC2	@cond_branch
	mov	r4, #0xb2
	lsl	r4, r4, #0x5
	add	r1, r1, r4
	mov	r0, #0x1
	strb	r0, [r1]
	bl	sub_8052B24
	ldr	r0, [r6]
	add	r0, r0, r4
	strb	r5, [r0]
.L8051CAE:
	ldr	r0, [r6]
	ldr	r3, .L8051E60 + 12
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8051CC2	@cond_branch
	bl	sub_804F9B4
	bl	sub_804F878
.L8051CC2:
	bl	nullsub_3
	bl	updateEnvirenmentActors
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8051CDC	@cond_branch
	bl	sub_804EE54
	bl	sub_804A51C
.L8051CDC:
	ldr	r0, .L8051E60
	ldr	r0, [r0]
	ldr	r4, .L8051E60 + 16
	add	r0, r0, r4
	ldrh	r0, [r0]
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0x1e
	bhi	.L8051D04	@cond_branch
	ldr	r5, [sp, #0x18]
	cmp	r5, #0
	bne	.L8051D04	@cond_branch
	mov	r0, #0x4
	mov	r1, #0x0
	ldr	r2, .L8051E60 + 20
	bl	_call_via_r2
	mov	r3, #0x1
	str	r3, [sp, #0x18]
.L8051D04:
	ldr	r4, [sp, #0x14]
	lsl	r1, r4, #0x18
	asr	r1, r1, #0x18
	ldr	r5, [sp, #0x18]
	lsl	r0, r5, #0x18
	asr	r0, r0, #0x18
	add	r1, r1, r0
	lsl	r1, r1, #0x18
	lsr	r0, r1, #0x18
	str	r0, [sp, #0x14]
	cmp	r1, #0
	bge	.L8051D24	@cond_branch
	mov	r1, #0x0
	str	r1, [sp, #0x14]
	mov	r2, #0x0
	str	r2, [sp, #0x18]
.L8051D24:
	ldr	r3, [sp, #0x14]
	lsl	r0, r3, #0x18
	add	r6, r0, #0
	cmp	r6, #0
	bne	.L8051DAC	@cond_branch
	ldr	r1, .L8051E60 + 24
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8051D74	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8051D74	@cond_branch
	ldr	r4, .L8051E60
	ldr	r0, [r4]
	ldr	r5, .L8051E60 + 28
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051D74	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051D74	@cond_branch
	ldr	r0, [sp, #0x10]
	mov	r1, #0x1
	bl	sub_8050184
	ldr	r0, [r4]
	ldr	r1, .L8051E60 + 32
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
.L8051D74:
	cmp	r6, #0
	bne	.L8051DAC	@cond_branch
	ldr	r1, .L8051E60 + 24
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8051DAC	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8051DAC	@cond_branch
	ldr	r0, .L8051E60
	ldr	r0, [r0]
	ldr	r2, .L8051E60 + 28
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051DE2	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8051DE2	@cond_branch
.L8051DAC:
	ldr	r0, .L8051E60
	ldr	r0, [r0]
	ldr	r3, .L8051E60 + 28
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051E1E	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8051E1E	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8051E1E	@cond_branch
	mov	r0, sl
	mov	r1, #0x1
	bl	sub_80501C8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051E1E	@cond_branch
.L8051DE2:
	mov	r0, #0x2
	bl	sub_8051780
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L8051E1E	@cond_branch
	mov	r0, #0x6
	mov	r1, #0x0
	ldr	r5, .L8051E60 + 20
	bl	_call_via_r5
	bl	sub_804B5C0
	bl	sub_805AAE0
	bl	sub_8052B24
	ldr	r5, .L8051E60
	ldr	r0, [r5]
	ldr	r1, .L8051E60 + 12
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8051E16	@cond_branch
	bl	sub_805AAD4
.L8051E16:
	ldr	r0, [r5]
	ldr	r2, .L8051E60 + 32
	add	r0, r0, r2
	strb	r4, [r0]
.L8051E1E:
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8051E2A	@cond_branch
	b	.L8051F58
.L8051E2A:
	mov	r0, #0x8
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8051E98	@cond_branch
	ldr	r0, .L8051E60 + 36
	ldr	r0, [r0]
	lsr	r0, r0, #0x3
	mov	r1, #0x3f
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8051E98	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8051E88	@cond_branch
	mov	r0, #0x2
	mov	r3, r9
	ldrh	r3, [r3, #0x18]
	cmp	r3, #0x2
	bne	.L8051E58	@cond_branch
	mov	r0, #0x3
.L8051E58:
	mov	r4, r9
	strh	r0, [r4, #0x18]
	b	.L8051E98
.L8051E5E:
	.align	2, 0
.L8051E60:
	.4byte	_gameData
	.4byte	0xc6e
	.4byte	0xb53
	.4byte	0x161b
	.4byte	0xc6c
	.4byte	sub_8052978 + 1
	.4byte	_unk3005DA0
	.4byte	0x1618
	.4byte	0x161a
	.4byte	_unk3000E30
.L8051E88:
	mov	r1, #0x0
	mov	r5, r9
	ldrh	r0, [r5, #0x18]
	cmp	r0, #0
	bne	.L8051E94	@cond_branch
	mov	r1, #0x1
.L8051E94:
	mov	r0, r9
	strh	r1, [r0, #0x18]
.L8051E98:
	bl	sub_805AB58
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051EAE	@cond_branch
	ldr	r0, .L8051F10
	ldrh	r1, [r0]
	mov	r0, #0x9
	BIC	r0, r1
	cmp	r0, #0
	beq	.L8051EB4	@cond_branch
.L8051EAE:
	mov	r0, #0x1
	bl	sub_8053E18
.L8051EB4:
	bl	sub_805AB58
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051EE2	@cond_branch
	cmp	r6, #0
	bne	.L8051EE2	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8051EE2	@cond_branch
	ldr	r0, .L8051F10
	ldrh	r0, [r0]
	MVN	r0, r0
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r1, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8051EE2	@cond_branch
	bl	sub_805295C
.L8051EE2:
	bl	sub_805AB58
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051F58	@cond_branch
	cmp	r6, #0
	bne	.L8051F58	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L8051F58	@cond_branch
	ldr	r2, .L8051F10
	ldrh	r0, [r2]
	MVN	r0, r0
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8051F58	@cond_branch
	ldrh	r0, [r2]
	MVN	r0, r0
	b	.L8051F32
.L8051F0E:
	.align	2, 0
.L8051F10:
	.4byte	0x4000130
.L8051F14:
	bl	VBlankIntrWait
	bl	sub_80627F0
	mov	r0, #0x4
	mov	r3, r9
	strh	r0, [r3, #0x18]
	ldr	r0, .L8051F4C
	ldr	r0, [r0]
	bl	_call_via_r0
	ldr	r0, .L8051F4C + 4
	ldrh	r0, [r0]
	MVN	r0, r0
	mov	r1, #0x2
.L8051F32:
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8051F14	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8051F54	@cond_branch
	mov	r0, #0x2
	mov	r4, r9
	strh	r0, [r4, #0x18]
	b	.L8051F58
.L8051F4A:
	.align	2, 0
.L8051F4C:
	.4byte	__oam_8756CC0
	.4byte	0x4000130
.L8051F54:
	mov	r5, r9
	strh	r0, [r5, #0x18]
.L8051F58:
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	sub_804E440
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051FA6	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051FA6	@cond_branch
	ldr	r4, .L8052048
	ldr	r0, [r4]
	ldr	r1, .L8052048 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051F8E	@cond_branch
	ldr	r0, [sp, #0x10]
	mov	r1, #0x4
	bl	sub_8050184
.L8051F8E:
	ldr	r0, [r4]
	ldr	r2, .L8052048 + 8
	add	r0, r0, r2
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L8051FA6	@cond_branch
	mov	r0, #0x0
	bl	sub_8053E18
.L8051FA6:
	ldr	r4, .L8052048
	ldr	r0, [r4]
	ldr	r5, .L8052048 + 4
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8051FE4	@cond_branch
	mov	r0, sl
	mov	r1, #0x4
	bl	sub_80501C8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8051FE4	@cond_branch
	ldr	r0, [r4]
	ldr	r1, .L8052048 + 8
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L8051FE4	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	SetRiderFlag
	mov	r0, #0x0
	bl	sub_8053E18
.L8051FE4:
	asr	r0, r6, #0x18
	ldr	r2, .L8052048
	cmp	r0, #0x20
	ble	.L8051FF6	@cond_branch
	ldr	r0, [r2]
	ldr	r3, .L8052048 + 8
	add	r0, r0, r3
	mov	r1, #0x0
	strh	r1, [r0]
.L8051FF6:
	ldr	r0, [r2]
	ldr	r4, .L8052048 + 8
	add	r0, r0, r4
	mov	r5, #0x0
	ldsh	r0, [r0, r5]
	cmp	r0, #0
	ble	.L8052092	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805202C	@cond_branch
	mov	r0, r8
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L805202C	@cond_branch
	mov	r0, r8
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L805203A	@cond_branch
.L805202C:
	ldr	r0, .L8052048
	ldr	r1, [r0]
	ldr	r2, .L8052048 + 4
	add	r0, r1, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8052054	@cond_branch
.L805203A:
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	SetRiderFlag
	b	.L8052068
.L8052046:
	.align	2, 0
.L8052048:
	.4byte	_gameData
	.4byte	0x1618
	.4byte	0xc6c
.L8052054:
	ldr	r3, .L80520E0
	add	r0, r1, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8052068	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	SetRiderFlag
.L8052068:
	ldr	r5, .L80520E0 + 4
	ldr	r0, [r5]
	ldr	r4, .L80520E0 + 8
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	ble	.L8052092	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8052092	@cond_branch
	ldr	r0, [r5]
	add	r0, r0, r4
	ldrh	r1, [r0]
	sub	r1, r1, #0x1
	strh	r1, [r0]
.L8052092:
	ldr	r0, .L80520E0 + 12
	ldrh	r0, [r0]
	cmp	r0, #0x9f
	bhi	.L805209E	@cond_branch
	mov	r2, #0x1
	str	r2, [sp, #0x1c]
.L805209E:
	bl	sub_8057930
	ldr	r0, .L80520E0 + 4
	ldr	r0, [r0]
	ldr	r3, .L80520E0 + 8
	add	r0, r0, r3
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	cmp	r0, #0
	beq	.L80520B4	@cond_branch
	b	.L8051A38
.L80520B4:
	bl	sub_804AF5C
	bl	sub_804AE8C
	bl	sub_804AD28
	mov	r0, #0x1
	mov	r1, #0x0
	ldr	r5, .L80520E0 + 16
	bl	_call_via_r5
	bl	sub_80556F4
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80520DE:
	.align	2, 0
.L80520E0:
	.4byte	0x161b
	.4byte	_gameData
	.4byte	0xc6c
	.4byte	0x4000006
	.4byte	sub_8052978 + 1
	thumb_func_end gameLoop

.align 2, 0 @ Don't pad with nop.
