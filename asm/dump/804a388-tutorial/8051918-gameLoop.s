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
	ldr	r4, .L15
	ldr	r0, [r4]
	ldr	r1, .L15 + 4
	add	r1, r0, r1
	str	r1, [sp, #0x10]
	mov	r2, #0xf
	str	r2, [sp, #0x14]
	mov	r3, #0xff
	str	r3, [sp, #0x18]
	ldr	r5, .L15 + 8
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
	ldr	r0, .L15 + 12
	mov	r1, #0x96
	lsl	r1, r1, #0x1
	bl	sub_8052140
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	beq	.L3	@cond_branch
	mov	r0, #0x8
	bl	sub_8051780
	cmp	r0, #0
	bne	.L3	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	mov	r9, r0
	ldr	r1, .L15 + 16
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
	beq	.L3	@cond_branch
	mov	r0, #0x2
	mov	r5, r9
	strh	r0, [r5, #0x18]
.L3:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r0, .L15
	ldr	r0, [r0]
	ldr	r1, .L15 + 20
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r0, [sp, #0x10]
	bl	sub_804FF5C
	bl	sub_804FFD4
.L5:
	bl	allocateBeybladeObjectPalettes
	bl	sub_8056FAC
	bl	VBlankIntrWait
	bl	sub_80627F0
	mov	r0, #0x0
	mov	r1, #0x0
	ldr	r2, .L15 + 24
	bl	call_via_r2
	ldr	r4, .L15
	ldr	r0, [r4]
	ldr	r3, .L15 + 8
	add	r0, r0, r3
	bl	sub_805EADC
	bl	initProjectileSystem
	mov	r0, #0x3
	mov	r1, #0x0
	ldr	r5, .L15 + 24
	bl	call_via_r5
	bl	sub_804ACF0
	bl	getLevelDescription2
	add	r0, r0, #0xbc
	ldrb	r0, [r0]
	bl	sub_804AF04
	bl	sub_804F878
	bl	sub_804F9B4
	ldr	r0, [r4]
	ldr	r1, .L15 + 28
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	cmp	r0, #0
	bne	.L108	@cond_branch
	b	.L107
.L108:
	ldr	r0, .L15 + 32
	ldrh	r0, [r0]
	cmp	r0, #0x9f
	bls	.L8	@cond_branch
	ldr	r3, [sp, #0x1c]
	lsl	r0, r3, #0x18
	cmp	r0, #0
	bne	.L9	@cond_branch
.L8:
	bl	VBlankIntrWait
.L9:
	mov	r4, #0x0
	str	r4, [sp, #0x1c]
	bl	sub_80627F0
	bl	sub_804AD74
	ldr	r4, .L15
	ldr	r1, [r4]
	ldr	r6, .L15 + 20
	add	r0, r1, r6
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L10	@cond_branch
	ldr	r0, .L15 + 32
	ldrh	r0, [r0]
	bl	isMultiplayer
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r5, #0x1
	sub	r0, r5, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L15 + 36
	add	r0, r0, r2
	ldr	r1, [r4]
	add	r0, r0, r1
	mov	sl, r0
	add	r2, r1, r2
	ldr	r0, .L15 + 4
	add	r1, r1, r0
	add	r0, r2, #0
	mov	r2, #0x1
	bl	sub_806014C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L12	@cond_branch
	bl	sub_806008C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldr	r0, [r4]
	add	r0, r0, r6
	mov	r1, sp
	ldrb	r1, [r1, #0x1c]
	strb	r1, [r0]
	ldr	r0, [r4]
	ldr	r2, .L15 + 40
	add	r0, r0, r2
	strb	r5, [r0]
	mov	r0, #0x8
	bl	sub_8049234
	mov	r0, #0x1d
	bl	sub_804924C
	mov	r0, #0x1
	bl	sub_8053E18
.L12:
	ldr	r0, [sp, #0x10]
	mov	r1, r8
	bl	sub_805000C
	mov	r0, sl
	bl	sub_8050114
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L18	@cond_branch
	bl	sub_80603E8
	b	.L18
.L16:
	.align	2, 0
.L15:
	.4byte	0x3000fb0
	.4byte	0x15c4
	.4byte	0x434
	.4byte	0x3000f50
	.4byte	0x86fbc4c
	.4byte	0x1618
	.4byte	sub_8052978 + 1
	.4byte	0xc6c
	.4byte	0x4000006
	.4byte	0x15d4
	.4byte	0x1619
.L10:
	ldr	r3, .L23
	add	r0, r1, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L18	@cond_branch
	ldr	r4, .L23 + 4
	add	r0, r1, r4
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L18	@cond_branch
	mov	r5, #0x86
	lsl	r5, r5, #0x3
	add	r0, r1, r5
	ldr	r1, [sp, #0x1c]
	str	r1, [r0]
.L18:
	ldr	r4, .L23 + 8
	ldr	r0, [r4]
	ldr	r2, .L23 + 12
	add	r0, r0, r2
	bl	sub_805EB00
	mov	r0, #0x2
	mov	r1, #0x0
	ldr	r3, .L23 + 16
	bl	call_via_r3
	bl	sub_805529C
	bl	renderEnvironmentActors
	ldr	r0, [sp, #0x20]
	add	r0, r0, #0xb8
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L19	@cond_branch
	ldr	r0, [r4]
	mov	r5, #0xbf
	lsl	r5, r5, #0x2
	add	r2, r0, r5
	bl	sub_80526C8
.L19:
	mov	r5, #0x0
	ldr	r0, [r4]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r5, r0
	bge	.L20	@cond_branch
	add	r6, r4, #0
	ldr	r7, .L23 + 20
.L25:
	cmp	r5, #0
	beq	.L21	@cond_branch
	ldr	r0, [r6]
	ldr	r2, .L23 + 24
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r4, r0, r7
	b	.L22
.L24:
	.align	2, 0
.L23:
	.4byte	0x1619
	.4byte	0x161b
	.4byte	0x3000fb0
	.4byte	0x434
	.4byte	sub_8052978 + 1
	.4byte	0xfffffbd8
	.4byte	0x42c
.L21:
	ldr	r4, [r6]
.L22:
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
	blt	.L25	@cond_branch
.L20:
	ldr	r0, .L30
	ldr	r0, [r0]
	bl	call_via_r0
	bl	updateKeyState
	bl	sub_8055340
	ldr	r0, [sp, #0x24]
	mov	r1, sl
	bl	sub_804B4FC
	bl	nullsub_1
	ldr	r4, .L30 + 4
	ldr	r0, [r4]
	ldr	r2, .L30 + 8
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L26	@cond_branch
	ldr	r0, [sp, #0x10]
	mov	r1, sl
	bl	sub_8050050
.L26:
	ldr	r0, [r4]
	mov	r5, #0xcb
	lsl	r5, r5, #0x3
	add	r1, r0, r5
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L27	@cond_branch
	mov	r0, r8
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, #0
	bne	.L32	@cond_branch
	ldr	r0, [r4]
	add	r2, r0, r5
	mov	r4, #0x8e
	lsl	r4, r4, #0x2
	add	r1, r0, r4
	str	r1, [r2]
	ldr	r5, .L30 + 12
	add	r0, r0, r5
	strb	r3, [r0]
	b	.L32
.L31:
	.align	2, 0
.L30:
	.4byte	0x807d93c
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0xb53
.L27:
	mov	r2, r8
	ldr	r0, [r2]
	ldr	r0, [r0, #0xc]
	cmp	r0, #0
	bge	.L32	@cond_branch
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0xf
	bl	sub_804ABFC
.L32:
	ldr	r6, .L66
	ldr	r2, [r6]
	ldr	r4, .L66 + 4
	add	r1, r2, r4
	ldrh	r3, [r1]
	mov	r5, #0x0
	ldsh	r0, [r1, r5]
	cmp	r0, #0
	beq	.L38	@cond_branch
	ldr	r5, .L66 + 8
	add	r0, r2, r5
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L34	@cond_branch
	sub	r0, r3, #1
	strh	r0, [r1]
.L34:
	ldr	r0, [r6]
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	bne	.L38	@cond_branch
	bl	sub_804EE2C
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L36	@cond_branch
	ldr	r1, [r6]
	ldr	r2, .L66 + 12
	add	r0, r1, r2
	ldrb	r5, [r0]
	cmp	r5, #0
	bne	.L38	@cond_branch
	mov	r4, #0xb2
	lsl	r4, r4, #0x5
	add	r1, r1, r4
	mov	r0, #0x1
	strb	r0, [r1]
	bl	sub_8052B24
	ldr	r0, [r6]
	add	r0, r0, r4
	strb	r5, [r0]
.L36:
	ldr	r0, [r6]
	ldr	r3, .L66 + 12
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L38	@cond_branch
	bl	sub_804F9B4
	bl	sub_804F878
.L38:
	bl	nullsub_3
	bl	updateEnvirenmentActors
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	bne	.L39	@cond_branch
	bl	sub_804EE54
	bl	sub_804A51C
.L39:
	ldr	r0, .L66
	ldr	r0, [r0]
	ldr	r4, .L66 + 16
	add	r0, r0, r4
	ldrh	r0, [r0]
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0x1e
	bhi	.L41	@cond_branch
	ldr	r5, [sp, #0x18]
	cmp	r5, #0
	bne	.L41	@cond_branch
	mov	r0, #0x4
	mov	r1, #0x0
	ldr	r2, .L66 + 20
	bl	call_via_r2
	mov	r3, #0x1
	str	r3, [sp, #0x18]
.L41:
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
	bge	.L42	@cond_branch
	mov	r1, #0x0
	str	r1, [sp, #0x14]
	mov	r2, #0x0
	str	r2, [sp, #0x18]
.L42:
	ldr	r3, [sp, #0x14]
	lsl	r0, r3, #0x18
	add	r6, r0, #0
	cmp	r6, #0
	bne	.L50	@cond_branch
	ldr	r1, .L66 + 24
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L47	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L47	@cond_branch
	ldr	r4, .L66
	ldr	r0, [r4]
	ldr	r5, .L66 + 28
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L47	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L47	@cond_branch
	ldr	r0, [sp, #0x10]
	mov	r1, #0x1
	bl	sub_8050184
	ldr	r0, [r4]
	ldr	r1, .L66 + 32
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
.L47:
	cmp	r6, #0
	bne	.L50	@cond_branch
	ldr	r1, .L66 + 24
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L50	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L50	@cond_branch
	ldr	r0, .L66
	ldr	r0, [r0]
	ldr	r2, .L66 + 28
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L52	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L52	@cond_branch
.L50:
	ldr	r0, .L66
	ldr	r0, [r0]
	ldr	r3, .L66 + 28
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L57	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L57	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L57	@cond_branch
	mov	r0, sl
	mov	r1, #0x1
	bl	sub_80501C8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L57	@cond_branch
.L52:
	mov	r0, #0x2
	bl	sub_8051780
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L57	@cond_branch
	mov	r0, #0x6
	mov	r1, #0x0
	ldr	r5, .L66 + 20
	bl	call_via_r5
	bl	sub_804B5C0
	bl	sub_805AAE0
	bl	sub_8052B24
	ldr	r5, .L66
	ldr	r0, [r5]
	ldr	r1, .L66 + 12
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L58	@cond_branch
	bl	sub_805AAD4
.L58:
	ldr	r0, [r5]
	ldr	r2, .L66 + 32
	add	r0, r0, r2
	strb	r4, [r0]
.L57:
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	bne	.L59	@cond_branch
	b	.L84
.L59:
	mov	r0, #0x8
	bl	sub_8051780
	cmp	r0, #0
	bne	.L65	@cond_branch
	ldr	r0, .L66 + 36
	ldr	r0, [r0]
	lsr	r0, r0, #0x3
	mov	r1, #0x3f
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L65	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	beq	.L63	@cond_branch
	mov	r0, #0x2
	mov	r3, r9
	ldrh	r3, [r3, #0x18]
	cmp	r3, #0x2
	bne	.L64	@cond_branch
	mov	r0, #0x3
.L64:
	mov	r4, r9
	strh	r0, [r4, #0x18]
	b	.L65
.L67:
	.align	2, 0
.L66:
	.4byte	0x3000fb0
	.4byte	0xc6e
	.4byte	0xb53
	.4byte	0x161b
	.4byte	0xc6c
	.4byte	sub_8052978 + 1
	.4byte	0x3005da0
	.4byte	0x1618
	.4byte	0x161a
	.4byte	0x3000e30
.L63:
	mov	r1, #0x0
	mov	r5, r9
	ldrh	r0, [r5, #0x18]
	cmp	r0, #0
	bne	.L68	@cond_branch
	mov	r1, #0x1
.L68:
	mov	r0, r9
	strh	r1, [r0, #0x18]
.L65:
	bl	sub_805AB58
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L69	@cond_branch
	ldr	r0, .L80
	ldrh	r1, [r0]
	mov	r0, #0x9
	BIC	r0, r1
	cmp	r0, #0
	beq	.L70	@cond_branch
.L69:
	mov	r0, #0x1
	bl	sub_8053E18
.L70:
	bl	sub_805AB58
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L74	@cond_branch
	cmp	r6, #0
	bne	.L74	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L74	@cond_branch
	ldr	r0, .L80
	ldrh	r0, [r0]
	MVN	r0, r0
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r1, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L74	@cond_branch
	bl	sub_805295C
.L74:
	bl	sub_805AB58
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L84	@cond_branch
	cmp	r6, #0
	bne	.L84	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L84	@cond_branch
	ldr	r2, .L80
	ldrh	r0, [r2]
	MVN	r0, r0
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L84	@cond_branch
	ldrh	r0, [r2]
	MVN	r0, r0
	b	.L79
.L81:
	.align	2, 0
.L80:
	.4byte	0x4000130
.L82:
	bl	VBlankIntrWait
	bl	sub_80627F0
	mov	r0, #0x4
	mov	r3, r9
	strh	r0, [r3, #0x18]
	ldr	r0, .L85
	ldr	r0, [r0]
	bl	call_via_r0
	ldr	r0, .L85 + 4
	ldrh	r0, [r0]
	MVN	r0, r0
	mov	r1, #0x2
.L79:
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L82	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	beq	.L83	@cond_branch
	mov	r0, #0x2
	mov	r4, r9
	strh	r0, [r4, #0x18]
	b	.L84
.L86:
	.align	2, 0
.L85:
	.4byte	0x807d93c
	.4byte	0x4000130
.L83:
	mov	r5, r9
	strh	r0, [r5, #0x18]
.L84:
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	sub_804E440
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L90	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L90	@cond_branch
	ldr	r4, .L101
	ldr	r0, [r4]
	ldr	r1, .L101 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L89	@cond_branch
	ldr	r0, [sp, #0x10]
	mov	r1, #0x4
	bl	sub_8050184
.L89:
	ldr	r0, [r4]
	ldr	r2, .L101 + 8
	add	r0, r0, r2
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L90	@cond_branch
	mov	r0, #0x0
	bl	sub_8053E18
.L90:
	ldr	r4, .L101
	ldr	r0, [r4]
	ldr	r5, .L101 + 4
	add	r0, r0, r5
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L93	@cond_branch
	mov	r0, sl
	mov	r1, #0x4
	bl	sub_80501C8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L93	@cond_branch
	ldr	r0, [r4]
	ldr	r1, .L101 + 8
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L93	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	SetRiderFlag
	mov	r0, #0x0
	bl	sub_8053E18
.L93:
	asr	r0, r6, #0x18
	ldr	r2, .L101
	cmp	r0, #0x20
	ble	.L94	@cond_branch
	ldr	r0, [r2]
	ldr	r3, .L101 + 8
	add	r0, r0, r3
	mov	r1, #0x0
	strh	r1, [r0]
.L94:
	ldr	r0, [r2]
	ldr	r4, .L101 + 8
	add	r0, r0, r4
	mov	r5, #0x0
	ldsh	r0, [r0, r5]
	cmp	r0, #0
	ble	.L105	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L97	@cond_branch
	mov	r0, r8
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L97	@cond_branch
	mov	r0, r8
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L98	@cond_branch
.L97:
	ldr	r0, .L101
	ldr	r1, [r0]
	ldr	r2, .L101 + 4
	add	r0, r1, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L99	@cond_branch
.L98:
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	SetRiderFlag
	b	.L103
.L102:
	.align	2, 0
.L101:
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0xc6c
.L99:
	ldr	r3, .L109
	add	r0, r1, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L103	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	SetRiderFlag
.L103:
	ldr	r5, .L109 + 4
	ldr	r0, [r5]
	ldr	r4, .L109 + 8
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	ble	.L105	@cond_branch
	mov	r0, r8
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L105	@cond_branch
	ldr	r0, [r5]
	add	r0, r0, r4
	ldrh	r1, [r0]
	sub	r1, r1, #0x1
	strh	r1, [r0]
.L105:
	ldr	r0, .L109 + 12
	ldrh	r0, [r0]
	cmp	r0, #0x9f
	bhi	.L106	@cond_branch
	mov	r2, #0x1
	str	r2, [sp, #0x1c]
.L106:
	bl	sub_8057930
	ldr	r0, .L109 + 4
	ldr	r0, [r0]
	ldr	r3, .L109 + 8
	add	r0, r0, r3
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	cmp	r0, #0
	beq	.L107	@cond_branch
	b	.L108
.L107:
	bl	sub_804AF5C
	bl	sub_804AE8C
	bl	sub_804AD28
	mov	r0, #0x1
	mov	r1, #0x0
	ldr	r5, .L109 + 16
	bl	call_via_r5
	bl	sub_80556F4
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L110:
	.align	2, 0
.L109:
	.4byte	0x161b
	.4byte	0x3000fb0
	.4byte	0xc6c
	.4byte	0x4000006
	.4byte	sub_8052978 + 1
	thumb_func_end gameLoop

.align 2, 0 @ Don't pad with nop.
