	.include "asm/common.inc"

	thumb_func_start selectBladeFrontendHandler
selectBladeFrontendHandler:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x8
	bls	.L1	@cond_branch
	bl	.L120
.L1:
	lsl	r0, r1, #0x2
	ldr	r1, .L4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L5:
	.align	2, 0
.L4:
	.4byte	.L3
.L3:
	.4byte	.L6
	.4byte	.L7
	.4byte	.L8
	.4byte	.L120
	.4byte	.L120
	.4byte	.L120
	.4byte	.L120
	.4byte	.L13
	.4byte	.L14
.L6:
	mov	r6, #0x0
	mov	r0, #0x80
	add	r0, r0, r7
	mov	r8, r0
	b	.L15
.L17:
	add	r6, r6, #0x1
.L15:
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L16	@cond_branch
	cmp	r6, #0x3b
	ble	.L17	@cond_branch
.L16:
	cmp	r6, #0x3c
	bne	.L18	@cond_branch
	ldr	r0, .L21
	bl	printf
.L18:
	ldr	r1, .L21 + 4
	add	r0, r1, #0
	add	r0, r0, #0x34
	mov	r5, #0x0
	strb	r6, [r0]
	add	r0, r0, #0x1
	strb	r5, [r0]
	str	r5, [r1]
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L21 + 8
	str	r4, [r0]
	cmp	r4, #0
	beq	.L19	@cond_branch
	ldr	r1, .L21 + 12
	ldr	r2, .L21 + 16
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
	b	.L20
.L22:
	.align	2, 0
.L21:
	.4byte	0x86fd640
	.4byte	0x30004f0
	.4byte	0x300053c
	.4byte	0x823bf04
	.4byte	0xffff0000
.L19:
	ldr	r0, .L25
	bl	printf
.L20:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L25 + 4
	str	r5, [r0]
	cmp	r5, #0
	beq	.L23	@cond_branch
	ldr	r1, .L25 + 8
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r4, #0x0
	str	r4, [sp]
	str	r4, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r0, r5, #0
	bl	LoadSpriteSheet
	b	.L24
.L26:
	.align	2, 0
.L25:
	.4byte	0x86fd68c
	.4byte	0x3000540
	.4byte	0x823bf04
.L23:
	ldr	r0, .L29
	bl	printf
.L24:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L29 + 4
	str	r4, [r0]
	cmp	r4, #0
	beq	.L27	@cond_branch
	ldr	r1, .L29 + 8
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xd8
	lsl	r3, r3, #0x5
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	mov	r0, #0x2
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
	b	.L28
.L30:
	.align	2, 0
.L29:
	.4byte	0x86fd6c8
	.4byte	0x3000544
	.4byte	0x823bf04
.L27:
	ldr	r0, .L33
	bl	printf
.L28:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L33 + 4
	str	r4, [r0, #0x8]
	cmp	r4, #0
	beq	.L31	@cond_branch
	ldr	r1, .L33 + 8
	mov	r2, #0xac
	lsl	r2, r2, #0x8
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
	b	.L32
.L34:
	.align	2, 0
.L33:
	.4byte	0x86fd704
	.4byte	0x30004f0
	.4byte	0x825125c
.L31:
	ldr	r0, .L37
	bl	printf
.L32:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L37 + 4
	str	r4, [r0, #0xc]
	cmp	r4, #0
	beq	.L35	@cond_branch
	ldr	r1, .L37 + 8
	mov	r2, #0xac
	lsl	r2, r2, #0x8
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
	b	.L36
.L38:
	.align	2, 0
.L37:
	.4byte	0x86fd740
	.4byte	0x30004f0
	.4byte	0x82516a8
.L35:
	ldr	r0, .L41
	bl	printf
.L36:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L41 + 4
	str	r4, [r0, #0x10]
	cmp	r4, #0
	beq	.L39	@cond_branch
	ldr	r1, .L41 + 8
	mov	r2, #0xac
	lsl	r2, r2, #0x8
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
	b	.L40
.L42:
	.align	2, 0
.L41:
	.4byte	0x86fd77c
	.4byte	0x30004f0
	.4byte	0x8251af4
.L39:
	ldr	r0, .L44
	bl	printf
.L40:
	ldr	r1, .L44 + 4
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L44 + 8
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	ldr	r1, .L44 + 12
	mov	r0, #0x90
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r1, .L44 + 16
	mov	r0, #0xdc
	lsl	r0, r0, #0x8
	str	r0, [r1]
	ldr	r1, .L44 + 20
	mov	r0, #0xd0
	lsl	r0, r0, #0x5
	str	r0, [r1]
	ldr	r1, .L44 + 24
	mov	r0, #0xd8
	lsl	r0, r0, #0x5
	str	r0, [r1]
	ldr	r0, .L44 + 28
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L44 + 32
	mov	r5, #0x0
	str	r5, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	NEG	r1, r1
	mov	r2, #0x90
	lsl	r2, r2, #0x6
	bl	sub_80596AC
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r4, .L44 + 36
	str	r0, [r4, #0x14]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x18]
	mov	r0, #0x2
	bl	sub_804A0E0
	str	r0, [r4, #0x1c]
	mov	r0, #0x3
	bl	sub_804A0E0
	str	r0, [r4, #0x20]
	mov	r0, #0x4
	bl	sub_804A0E0
	str	r0, [r4, #0x24]
	mov	r0, #0x5
	bl	sub_804A0E0
	str	r0, [r4, #0x28]
	mov	r0, #0x6
	bl	sub_804A0E0
	str	r0, [r4, #0x2c]
	mov	r0, #0x7
	bl	sub_804A0E0
	str	r0, [r4, #0x30]
	ldr	r0, [r4, #0x14]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x18]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x1c]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x20]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x24]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x28]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x2c]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x30]
	mov	r1, #0x1
	bl	sub_8062318
	str	r5, [r4, #0x4]
	add	r0, r4, #0
	add	r0, r0, #0x36
	strb	r5, [r0]
	add	r4, r4, #0x38
	add	r0, r4, #0
	bl	sub_8055C4C
	ldr	r0, .L44 + 40
	strb	r5, [r0]
	ldr	r1, .L44 + 44
	mov	r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x30
	mov	r4, r8
	ldrb	r4, [r4]
	orr	r0, r0, r4
	mov	r1, r8
	strb	r0, [r1]
	ldr	r0, .L44 + 48
	strb	r5, [r0]
	ldr	r0, .L44 + 52
	strb	r5, [r0]
	ldr	r0, .L44 + 56
	str	r5, [r0]
	ldr	r0, .L44 + 60
	str	r5, [r0]
	b	.L120
.L45:
	.align	2, 0
.L44:
	.4byte	0x86fd7b8
	.4byte	0x3000548
	.4byte	0x300054c
	.4byte	0x3000550
	.4byte	0x3000554
	.4byte	0x3000558
	.4byte	0x300055c
	.4byte	0x30004e8
	.4byte	0x30004e4
	.4byte	0x30004f0
	.4byte	0x3000539
	.4byte	0x3000538
	.4byte	0x300053a
	.4byte	0x300053b
	.4byte	0x3000560
	.4byte	0x3000564
.L13:
	ldr	r4, .L54
	ldr	r0, [r4, #0x8]
	cmp	r0, #0
	beq	.L46	@cond_branch
	bl	sub_8060A94
.L46:
	ldr	r0, [r4, #0xc]
	cmp	r0, #0
	beq	.L47	@cond_branch
	bl	sub_8060A94
.L47:
	ldr	r0, [r4, #0x10]
	cmp	r0, #0
	beq	.L48	@cond_branch
	bl	sub_8060A94
.L48:
	ldr	r0, .L54 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L49	@cond_branch
	bl	sub_8060A94
.L49:
	ldr	r0, .L54 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L50	@cond_branch
	bl	sub_8060A94
.L50:
	ldr	r0, .L54 + 12
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L51	@cond_branch
	bl	sub_8060A94
.L51:
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L52	@cond_branch
	bl	sub_8060A94
.L52:
	add	r0, r4, #0
	add	r0, r0, #0x38
	bl	sub_8055CA0
	b	.L120
.L55:
	.align	2, 0
.L54:
	.4byte	0x30004f0
	.4byte	0x300053c
	.4byte	0x3000540
	.4byte	0x3000544
.L14:
	cmp	r2, #0x1
	beq	.L56	@cond_branch
	b	.L120
.L56:
	ldr	r0, .L59
	strb	r2, [r0]
	b	.L120
.L60:
	.align	2, 0
.L59:
	.4byte	0x3000539
.L7:
	mov	r2, #0xa0
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	bl	sub_80439A0
	ldr	r4, .L75
	add	r0, r7, r4
	ldrh	r0, [r0]
	cmp	r0, #0
	bne	.L66	@cond_branch
	ldr	r1, .L75 + 4
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r2, .L75 + 8
	ldr	r1, .L75 + 12
	ldr	r3, [r1]
	mov	r0, #0x10
	sub	r0, r0, r3
	lsl	r0, r0, #0x8
	orr	r0, r0, r3
	strh	r0, [r2]
	ldr	r0, .L75 + 16
	ldr	r0, [r0]
	cmp	r3, r0
	beq	.L62	@cond_branch
	sub	r2, r3, #1
	cmp	r0, r3
	ble	.L63	@cond_branch
	add	r2, r3, #1
.L63:
	str	r2, [r1]
.L62:
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L65	@cond_branch
	ldr	r0, .L75 + 20
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L65	@cond_branch
	ldr	r0, .L75 + 24
	bl	initBBCollectionSprite
	ldr	r1, .L75 + 16
	mov	r0, #0x10
	str	r0, [r1]
.L65:
	ldr	r5, .L75 + 28
	ldrb	r0, [r5]
	cmp	r0, #0
	bne	.L66	@cond_branch
	ldr	r4, .L75 + 24
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_8047080
	add	r0, r4, #0
	bl	sub_804712C
	mov	r0, #0x1
	strb	r0, [r5]
.L66:
	ldr	r5, .L75 + 32
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L67	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L75 + 36
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L75 + 40
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	ldr	r0, .L75 + 44
	ldr	r0, [r0]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L67:
	ldr	r5, .L75 + 48
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L68	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L75 + 52
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L75 + 40
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	ldr	r0, .L75 + 44
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L68:
	ldr	r0, .L75 + 56
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L69	@cond_branch
	ldr	r0, .L75 + 60
	ldr	r0, [r0]
	ldr	r2, [r4, #0x8]
	sub	r0, r0, r2
	asr	r0, r0, #0x2
	ldr	r1, .L75 + 44
	ldr	r1, [r1]
	sub	r0, r0, r1
	add	r2, r2, r0
	str	r2, [r4, #0x8]
	ldr	r0, .L75 + 64
	ldr	r0, [r0]
	ldr	r1, [r4, #0xc]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r4, #0xc]
	bl	sub_8057C40
	asr	r0, r0, #0x8
	mov	r1, #0x1
	and	r0, r0, r1
	mov	r1, #0x3
	cmp	r0, #0
	beq	.L70	@cond_branch
	mov	r1, #0x2
.L70:
	strh	r1, [r4, #0x18]
.L69:
	ldr	r0, .L75 + 68
	ldrb	r0, [r0]
	ldr	r5, .L75 + 72
	ldr	r4, .L75 + 44
	cmp	r0, #0
	beq	.L73	@cond_branch
	ldr	r0, [r5]
	asr	r0, r0, #0x8
	cmp	r0, #0xfe
	ble	.L73	@cond_branch
	ldr	r1, [r4]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	cmp	r1, r0
	bne	.L73	@cond_branch
	mov	r0, #0x0
	str	r0, [r4]
.L73:
	ldr	r4, [r4]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r1, #0x94
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	b	.L120
.L76:
	.align	2, 0
.L75:
	.4byte	0x584
	.4byte	0x4000050
	.4byte	0x4000052
	.4byte	0x3000560
	.4byte	0x3000564
	.4byte	0x300053b
	.4byte	0x30004f0
	.4byte	0x300053a
	.4byte	0x300053c
	.4byte	0x3000548
	.4byte	0x874cc3c
	.4byte	0x30004e4
	.4byte	0x3000540
	.4byte	0x300054c
	.4byte	0x3000544
	.4byte	0x3000554
	.4byte	0x300055c
	.4byte	0x3000539
	.4byte	0x30004e8
.L8:
	ldr	r4, .L84
	mov	r0, #0x2
	ldrh	r2, [r4]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L77	@cond_branch
	ldr	r1, .L84 + 4
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, .L84 + 8
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r0, .L84 + 12
	mov	r1, #0x1
	bl	sub_8047080
.L77:
	mov	r0, #0x1
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L78	@cond_branch
	ldr	r1, .L84 + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L84 + 8
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r0, .L84 + 12
	mov	r1, #0x1
	bl	sub_8047080
.L78:
	ldr	r5, .L84 + 4
	ldrb	r0, [r5]
	cmp	r0, #0
	beq	.L90	@cond_branch
	ldr	r0, .L84 + 16
	ldr	r1, .L84 + 8
	ldr	r2, [r0]
	ldr	r0, [r1]
	cmp	r2, r0
	bne	.L90	@cond_branch
	ldr	r4, .L84 + 12
	add	r0, r4, #0
	bl	sub_80470C8
	ldr	r1, .L84 + 20
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L84 + 24
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, .L84 + 28
	ldr	r2, .L84 + 32
	str	r2, [r0]
	ldr	r0, .L84 + 36
	mov	r1, #0xf0
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L84 + 40
	str	r2, [r0]
	ldr	r0, .L84 + 44
	str	r1, [r0]
	ldrb	r5, [r5]
	cmp	r5, #0x1
	bne	.L81	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L82	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_805185C
	mov	r0, #0x1f
	b	.L83
.L85:
	.align	2, 0
.L84:
	.4byte	0x3005da0
	.4byte	0x300053b
	.4byte	0x3000564
	.4byte	0x30004f0
	.4byte	0x3000560
	.4byte	0x30004e4
	.4byte	0x3000539
	.4byte	0x3000548
	.4byte	0xffff0000
	.4byte	0x300054c
	.4byte	0x3000550
	.4byte	0x3000554
.L82:
	ldr	r0, .L88
	ldr	r0, [r0]
	ldr	r1, .L88 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L86	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_805185C
	mov	r0, #0x1b
.L83:
	bl	sub_80490F8
	mov	r0, #0x8
	bl	sub_804ABFC
	b	.L90
.L89:
	.align	2, 0
.L88:
	.4byte	0x3000f48
	.4byte	0xc64
.L86:
	mov	r0, #0x9
	bl	sub_804ABFC
	bl	sub_8049178
	b	.L90
.L81:
	mov	r0, #0x9
	bl	sub_804ABFC
	bl	sub_8049178
.L90:
	ldr	r5, .L101
	mov	r0, #0x30
	ldrh	r2, [r5]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L91	@cond_branch
	b	.L112
.L91:
	ldr	r0, .L101 + 4
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L93	@cond_branch
	b	.L112
.L93:
	mov	r0, #0x5
	bl	sub_805A914
	add	r4, r0, #0
	mov	r0, #0x4
	bl	sub_805A914
	add	r6, r0, #0
	ldr	r1, .L101 + 8
	mov	r2, #0x20
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L95	@cond_branch
	add	r0, r2, #0
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L98	@cond_branch
	ldr	r0, [r4, #0x8]
	cmp	r0, #0xf0
	bls	.L98	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L98	@cond_branch
.L95:
	mov	r4, #0x0
	ldr	r0, .L101 + 12
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	sub	r6, r0, #1
	cmp	r6, #0
	bge	.L100	@cond_branch
	add	r6, r6, #0x3c
	b	.L100
.L102:
	.align	2, 0
.L101:
	.4byte	0x3005ca0
	.4byte	0x300053a
	.4byte	0x3005da0
	.4byte	0x30004f0
.L105:
	sub	r6, r6, #0x1
	cmp	r6, #0
	bge	.L103	@cond_branch
	add	r6, r6, #0x3c
.L103:
	add	r4, r4, #0x1
.L100:
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L104	@cond_branch
	cmp	r4, #0x3b
	ble	.L105	@cond_branch
.L104:
	ldr	r4, .L107
	add	r0, r4, #0
	add	r0, r0, #0x34
	mov	r5, #0x0
	strb	r6, [r0]
	add	r0, r0, #0x1
	strb	r5, [r0]
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8047080
	add	r0, r4, #0
	bl	sub_804712C
	ldr	r0, .L107 + 4
	str	r5, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
	b	.L112
.L108:
	.align	2, 0
.L107:
	.4byte	0x30004f0
	.4byte	0x3000564
.L98:
	ldr	r1, .L115
	mov	r2, #0x10
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L109	@cond_branch
	ldr	r1, .L115 + 4
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L112	@cond_branch
	ldr	r0, [r6, #0x8]
	cmp	r0, #0xf0
	bls	.L112	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L112	@cond_branch
.L109:
	mov	r4, #0x0
	ldr	r0, .L115 + 8
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	add	r6, r0, #1
	cmp	r6, #0x3b
	ble	.L114	@cond_branch
	sub	r6, r6, #0x3c
	b	.L114
.L116:
	.align	2, 0
.L115:
	.4byte	0x3005da0
	.4byte	0x3005ca0
	.4byte	0x30004f0
.L119:
	add	r6, r6, #0x1
	cmp	r6, #0x3b
	ble	.L117	@cond_branch
	sub	r6, r6, #0x3c
.L117:
	add	r4, r4, #0x1
.L114:
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L118	@cond_branch
	cmp	r4, #0x3b
	ble	.L119	@cond_branch
.L118:
	ldr	r4, .L124
	add	r0, r4, #0
	add	r0, r0, #0x34
	mov	r5, #0x0
	strb	r6, [r0]
	add	r0, r0, #0x1
	strb	r5, [r0]
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8047080
	add	r0, r4, #0
	bl	sub_804712C
	ldr	r0, .L124 + 4
	str	r5, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
.L112:
	ldr	r0, .L124 + 8
	ldrh	r1, [r0]
	mov	r0, #0xc0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L120	@cond_branch
	mov	r0, #0x40
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, #0
	beq	.L121	@cond_branch
	ldr	r0, .L124
	add	r1, r0, #0
	add	r1, r1, #0x35
	ldrb	r2, [r1]
	mov	r0, #0x0
	ldsb	r0, [r1, r0]
	cmp	r0, #0
	ble	.L122	@cond_branch
	sub	r0, r2, #1
	b	.L123
.L125:
	.align	2, 0
.L124:
	.4byte	0x30004f0
	.4byte	0x3000564
	.4byte	0x3005da0
.L122:
	mov	r0, #0x4
.L123:
	strb	r0, [r1]
	ldr	r0, .L127
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L127 + 4
	bl	sub_8047080
	mov	r0, #0x7
	bl	sub_804ABFC
	b	.L126
.L128:
	.align	2, 0
.L127:
	.4byte	0x3000564
	.4byte	0x30004f0
.L121:
	ldr	r0, .L131
	add	r1, r0, #0
	add	r1, r1, #0x35
	ldrb	r2, [r1]
	mov	r0, #0x0
	ldsb	r0, [r1, r0]
	cmp	r0, #0x3
	bgt	.L129	@cond_branch
	add	r0, r2, #1
	strb	r0, [r1]
	b	.L130
.L132:
	.align	2, 0
.L131:
	.4byte	0x30004f0
.L129:
	strb	r3, [r1]
.L130:
	ldr	r0, .L133
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L133 + 4
	bl	sub_8047080
	mov	r0, #0x7
	bl	sub_804ABFC
.L126:
	ldr	r0, .L133 + 4
	bl	sub_804712C
.L120:
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L134:
	.align	2, 0
.L133:
	.4byte	0x3000564
	.4byte	0x30004f0
	thumb_func_end selectBladeFrontendHandler

.align 2, 0 @ Don't pad with nop.
