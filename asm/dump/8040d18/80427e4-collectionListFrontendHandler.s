	.include "asm/common.inc"

	thumb_func_start collectionListFrontendHandler
collectionListFrontendHandler:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xffffffec
	mov	r8, r0
	cmp	r1, #0x1
	bne	.L1	@cond_branch
	b	.L2
.L1:
	cmp	r1, #0x1
	bcc	.L3	@cond_branch
	cmp	r1, #0x2
	bne	.L4	@cond_branch
	bl	.L5
.L4:
	cmp	r1, #0x7
	bne	.L6	@cond_branch
	bl	.L7
.L6:
	bl	.L112
.L3:
	mov	r4, #0x9a
	lsl	r4, r4, #0x1
	ldr	r0, .L12
	ldr	r1, .L12 + 4
	str	r1, [r0]
	ldr	r0, .L12 + 8
	mov	r5, #0x0
	str	r5, [r0]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r8
	mov	r2, #0x0
	bl	sub_80596AC
	add	r0, r4, #0
	bl	slowAllocate
	ldr	r6, .L12 + 12
	str	r0, [r6]
	cmp	r0, #0
	bne	.L9	@cond_branch
	ldr	r0, .L12 + 16
	bl	printf
.L9:
	ldr	r3, .L12 + 20
	ldr	r0, [r6]
	ldr	r1, [r0]
	str	r1, [r3]
	ldr	r2, .L12 + 24
	add	r0, r1, #0
	add	r0, r0, #0xf0
	str	r0, [r2]
	ldr	r0, .L12 + 28
	mov	r2, #0x82
	lsl	r2, r2, #0x1
	add	r1, r1, r2
	str	r1, [r0]
	ldr	r0, .L12 + 32
	str	r5, [r0]
	ldr	r0, .L12 + 36
	str	r5, [r0]
	ldr	r0, .L12 + 40
	str	r5, [r0]
	ldr	r0, .L12 + 44
	str	r5, [r0]
	ldr	r0, .L12 + 48
	str	r5, [r0]
	ldr	r0, .L12 + 52
	str	r5, [r0]
	ldr	r0, .L12 + 56
	str	r5, [r0]
	ldr	r0, .L12 + 60
	str	r5, [r0]
	mov	r6, #0x0
	add	r7, r3, #0
.L23:
	lsl	r0, r6, #0x1
	add	r0, r0, r6
	lsl	r5, r0, #0x4
	ldr	r0, [r7]
	add	r0, r0, r5
	lsl	r1, r6, #0x4
	sub	r1, r1, r6
	add	r1, r1, #0x56
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	str	r1, [sp]
	mov	r1, #0xc8
	str	r1, [sp, #0x4]
	mov	r1, #0x0
	str	r1, [sp, #0x8]
	ldr	r1, .L12 + 64
	ldr	r2, .L12 + 68
	mov	r3, #0x42
	bl	allocFont
	ldr	r0, [r7]
	add	r0, r0, r5
	mov	r1, #0x3
	bl	sub_80611FC
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L10	@cond_branch
	ldr	r4, [r7]
	add	r4, r4, r5
	add	r0, r6, #0
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	add	r4, r6, #1
	b	.L11
.L13:
	.align	2, 0
.L12:
	.4byte	0x30000fc
	.4byte	0xffff0000
	.4byte	0x30000f8
	.4byte	0x3000120
	.4byte	0x86fd214
	.4byte	0x3000124
	.4byte	0x300012c
	.4byte	0x3000128
	.4byte	0x3000100
	.4byte	0x3000104
	.4byte	0x3000108
	.4byte	0x300010c
	.4byte	0x3000110
	.4byte	0x3000114
	.4byte	0x3000118
	.4byte	0x300011c
	.4byte	0x82b05ec
	.4byte	0x8067ae0
.L10:
	ldr	r0, [r7]
	add	r0, r0, r5
	ldr	r1, .L17
	mov	r2, #0xc
	bl	sub_8061660
	ldr	r0, [r7]
	add	r0, r0, r5
	add	r4, r6, #1
	add	r1, r4, #0
	mov	r2, #0xc
	bl	showNumber
.L11:
	mov	r0, #0x0
	bl	allocSprite
	ldr	r1, .L17 + 4
	ldr	r1, [r1]
	lsl	r2, r6, #0x2
	add	r1, r2, r1
	str	r0, [r1]
	add	r5, r2, #0
	cmp	r0, #0
	beq	.L14	@cond_branch
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L15	@cond_branch
	add	r0, r6, #0
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x17
	b	.L16
.L18:
	.align	2, 0
.L17:
	.4byte	0x86fd25c
	.4byte	0x300012c
.L15:
	add	r0, r6, #0
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x1
	add	r2, r0, #0
.L16:
	ldr	r0, .L20
	ldr	r0, [r0]
	add	r0, r5, r0
	ldr	r0, [r0]
	lsl	r3, r6, #0xa
	mov	r1, #0xac
	lsl	r1, r1, #0x7
	add	r3, r3, r1
	mov	r1, #0x0
	str	r1, [sp]
	str	r1, [sp, #0x4]
	str	r1, [sp, #0x8]
	str	r2, [sp, #0xc]
	ldr	r1, .L20 + 4
	mov	r2, #0x0
	bl	LoadSpriteSheet
	b	.L19
.L21:
	.align	2, 0
.L20:
	.4byte	0x300012c
	.4byte	0x823c150
.L14:
	ldr	r0, .L27
	bl	printf
.L19:
	add	r6, r4, #0
	cmp	r6, #0x4
	bgt	.L22	@cond_branch
	b	.L23
.L22:
	ldr	r4, .L27 + 4
	ldr	r0, [r4]
	ldr	r1, .L27 + 8
	ldr	r2, .L27 + 12
	mov	r3, #0x28
	str	r3, [sp]
	mov	r3, #0x70
	str	r3, [sp, #0x4]
	mov	r3, #0x10
	str	r3, [sp, #0x8]
	mov	r3, #0x70
	bl	allocFont
	ldr	r0, [r4]
	mov	r1, #0x1
	bl	sub_8061E58
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L27 + 16
	str	r4, [r0]
	cmp	r4, #0
	beq	.L24	@cond_branch
	ldr	r1, .L27 + 20
	mov	r2, #0xc6
	lsl	r2, r2, #0x8
	mov	r3, #0xbe
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L24:
	mov	r0, #0x0
	bl	allocSprite
	add	r2, r0, #0
	ldr	r0, .L27 + 24
	str	r2, [r0]
	cmp	r2, #0
	beq	.L25	@cond_branch
	ldr	r1, .L27 + 28
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	mov	r0, #0x62
	str	r0, [sp, #0xc]
	add	r0, r2, #0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	LoadSpriteSheet
.L25:
	ldr	r0, .L27 + 32
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L27 + 36
	str	r1, [r0]
	ldr	r1, .L27 + 40
	ldr	r2, .L27 + 44
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x2f
	strh	r0, [r1]
	ldr	r0, .L27 + 48
	mov	r2, #0xf0
	strh	r2, [r0]
	sub	r1, r1, #0x6
	ldr	r3, .L27 + 52
	add	r0, r3, #0
	strh	r0, [r1]
	ldr	r0, .L27 + 56
	strh	r2, [r0]
	add	r1, r1, #0x2
	mov	r0, #0x47
	strh	r0, [r1]
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r0, [r2]
	mov	r3, #0xc0
	lsl	r3, r3, #0x7
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	ldr	r0, .L27 + 60
	bl	sub_8055C4C
	b	.L112
.L28:
	.align	2, 0
.L27:
	.4byte	0x86fd264
	.4byte	0x3000128
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	0x3000130
	.4byte	0x823c260
	.4byte	0x3000134
	.4byte	0x82b1a84
	.4byte	0x3000138
	.4byte	0x300013c
	.4byte	0x4000048
	.4byte	0x3f3f
	.4byte	0x4000040
	.4byte	0x5692
	.4byte	0x4000042
	.4byte	0x3000140
.L2:
	ldr	r0, .L39
	ADD r0, r8
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	.L29	@cond_branch
	b	.L36
.L29:
	ldr	r1, .L39 + 4
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r2, .L39 + 8
	ldr	r1, .L39 + 12
	ldr	r3, [r1]
	mov	r0, #0x10
	sub	r0, r0, r3
	lsl	r0, r0, #0x8
	orr	r0, r0, r3
	strh	r0, [r2]
	ldr	r0, .L39 + 16
	ldr	r0, [r0]
	cmp	r3, r0
	beq	.L31	@cond_branch
	sub	r2, r3, #1
	cmp	r0, r3
	ble	.L32	@cond_branch
	add	r2, r3, #1
.L32:
	str	r2, [r1]
.L31:
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L33	@cond_branch
	b	.L36
.L33:
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L35	@cond_branch
	b	.L36
.L35:
	ldr	r4, .L39 + 20
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L37	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r4]
	b	.L38
.L40:
	.align	2, 0
.L39:
	.4byte	0x584
	.4byte	0x4000050
	.4byte	0x4000052
	.4byte	0x3000118
	.4byte	0x300011c
	.4byte	0x3000138
.L37:
	bl	sub_8060A60
.L38:
	ldr	r5, .L44
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L43	@cond_branch
	ldr	r4, .L44 + 4
	ldr	r7, .L44 + 8
	ldr	r0, [r7]
	bl	sub_8057094
	add	r1, r0, #0
	add	r0, r4, #0
	bl	getDecompressorData
	add	r1, r0, #0
	ldr	r0, [r5]
	mov	r2, #0xa4
	lsl	r2, r2, #0x6
	mov	r3, #0x80
	lsl	r3, r3, #0x4
	mov	r4, #0x1
	str	r4, [sp]
	mov	r4, #0x0
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r2, [r5]
	ldr	r0, .L44 + 12
	ldrh	r3, [r2, #0x14]
	and	r0, r0, r3
	mov	r3, #0xc0
	lsl	r3, r3, #0x6
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2, #0x14]
	ldr	r4, .L44 + 16
	ldr	r0, [r7]
	bl	sub_8057068
	ldr	r1, .L44 + 20
	ldr	r3, [r4]
	mov	r2, #0x20
	bl	call_via_r3
	ldr	r0, [r7]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L42	@cond_branch
	ldr	r6, .L44 + 24
	ldr	r5, [r6]
	ldr	r4, .L44 + 28
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r6]
	ldr	r0, [r7]
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	b	.L43
.L45:
	.align	2, 0
.L44:
	.4byte	0x3000138
	.4byte	0x3000140
	.4byte	0x3000114
	.4byte	0xfff
	.4byte	0x807d974
	.4byte	0x5000260
	.4byte	0x3000128
	.4byte	0x806e8b0
.L42:
	ldr	r0, .L50
	ldr	r0, [r0]
	bl	sub_8061228
.L43:
	ldr	r4, .L50 + 4
	ldr	r0, [r4]
	bl	sub_805703C
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L47	@cond_branch
	ldr	r0, [r4]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L47	@cond_branch
	ldr	r4, .L50 + 8
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L48	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	b	.L49
.L51:
	.align	2, 0
.L50:
	.4byte	0x3000128
	.4byte	0x3000114
	.4byte	0x300013c
.L48:
	bl	sub_8060A60
	b	.L52
.L47:
	ldr	r4, .L74
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L54	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
.L49:
	str	r0, [r4]
.L52:
	ldr	r0, .L74
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L54	@cond_branch
	ldr	r1, .L74 + 4
	mov	r2, #0xb0
	lsl	r2, r2, #0x7
	mov	r3, #0xdc
	lsl	r3, r3, #0x6
	mov	r0, #0x1
	str	r0, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	ldr	r0, .L74 + 8
	ldrh	r0, [r0]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L54:
	ldr	r1, .L74 + 12
	mov	r0, #0x10
	str	r0, [r1]
.L36:
	mov	r0, #0xa0
	lsl	r0, r0, #0x1
	ADD r0, r8
	bl	sub_80439A0
	ldr	r0, .L74 + 16
	ldr	r5, .L74 + 20
	ldr	r4, [r0]
	ldr	r0, [r5]
	cmp	r4, r0
	beq	.L55	@cond_branch
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, r8
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
.L55:
	ldr	r1, .L74 + 24
	mov	r0, #0x40
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L57	@cond_branch
	ldr	r1, .L74 + 8
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L57	@cond_branch
	sub	r0, r0, #0x1
	str	r0, [r1]
	ldr	r1, .L74 + 12
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L57:
	ldr	r1, .L74 + 24
	mov	r0, #0x80
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L59	@cond_branch
	ldr	r1, .L74 + 8
	ldr	r0, [r1]
	cmp	r0, #0x6b
	bgt	.L59	@cond_branch
	add	r0, r0, #0x1
	str	r0, [r1]
	ldr	r1, .L74 + 12
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L59:
	ldr	r1, .L74 + 28
	mov	r0, #0x40
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L63	@cond_branch
	ldr	r4, .L74 + 8
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L63	@cond_branch
	mov	r0, #0x6
	bl	sub_805A914
	ldr	r0, [r0, #0x8]
	cmp	r0, #0xf0
	bls	.L63	@cond_branch
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x3
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L63	@cond_branch
	ldr	r0, [r4]
	sub	r0, r0, #0x1
	str	r0, [r4]
	ldr	r0, .L74 + 12
	str	r1, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
.L63:
	ldr	r1, .L74 + 28
	mov	r0, #0x80
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L67	@cond_branch
	ldr	r4, .L74 + 8
	ldr	r0, [r4]
	cmp	r0, #0x6b
	bgt	.L67	@cond_branch
	mov	r0, #0x7
	bl	sub_805A914
	ldr	r0, [r0, #0x8]
	cmp	r0, #0xf0
	bls	.L67	@cond_branch
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x3
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L67	@cond_branch
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	ldr	r0, .L74 + 12
	str	r1, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
.L67:
	ldr	r0, .L74 + 8
	ldr	r0, [r0]
	sub	r0, r0, #0x2
	lsl	r1, r0, #0x4
	sub	r1, r1, r0
	lsl	r1, r1, #0x8
	ldr	r0, .L74 + 32
	sub	r0, r0, r1
	ldr	r1, .L74 + 36
	ldr	r4, .L74 + 40
	ldr	r2, [r4]
	sub	r0, r0, r2
	asr	r0, r0, #0x2
	str	r0, [r1]
	ldr	r3, .L74 + 44
	ldr	r1, [r3]
	add	r1, r1, r0
	str	r1, [r3]
	add	r2, r2, r0
	str	r2, [r4]
	cmp	r1, #0
	bgt	.L68	@cond_branch
	b	.L84
.L68:
	ldr	r2, .L74 + 48
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L70	@cond_branch
	b	.L71
.L70:
	sub	r0, r0, #0x1
	str	r0, [r2]
	ldr	r2, .L74 + 52
	add	r0, r1, r2
	str	r0, [r3]
	ldr	r1, .L74 + 56
	ldr	r0, [r1]
	cmp	r0, #0
	ble	.L72	@cond_branch
	sub	r0, r0, #0x1
	b	.L73
.L75:
	.align	2, 0
.L74:
	.4byte	0x300013c
	.4byte	0x823c2c8
	.4byte	0x3000114
	.4byte	0x300011c
	.4byte	0x30000f8
	.4byte	0x30000fc
	.4byte	0x3005da0
	.4byte	0x3005ca0
	.4byte	0xfffffc00
	.4byte	0x3000108
	.4byte	0x3000104
	.4byte	0x3000100
	.4byte	0x3000110
	.4byte	0xfffff100
	.4byte	0x300010c
.L72:
	mov	r0, #0x4
.L73:
	str	r0, [r1]
	ldr	r6, .L78
	ldr	r0, [r6]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L76	@cond_branch
	ldr	r2, .L78 + 4
	ldr	r0, .L78 + 8
	ldr	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	ldr	r4, [r2]
	add	r4, r4, r0
	ldr	r0, [r6]
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	b	.L77
.L79:
	.align	2, 0
.L78:
	.4byte	0x3000110
	.4byte	0x3000124
	.4byte	0x300010c
.L76:
	ldr	r5, .L82
	ldr	r4, .L82 + 4
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, .L82 + 8
	mov	r2, #0xc
	bl	sub_8061660
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, [r6]
	add	r1, r1, #0x1
	mov	r2, #0xc
	bl	showNumber
.L77:
	ldr	r0, .L82 + 4
	ldr	r0, [r0]
	ldr	r1, .L82 + 12
	ldr	r1, [r1]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r5, [r0]
	ldr	r4, .L82 + 16
	ldr	r0, [r4]
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80	@cond_branch
	ldr	r0, [r4]
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	b	.L81
.L83:
	.align	2, 0
.L82:
	.4byte	0x3000124
	.4byte	0x300010c
	.4byte	0x86fd25c
	.4byte	0x300012c
	.4byte	0x3000110
.L80:
	ldr	r0, [r4]
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x1
.L81:
	strh	r0, [r5, #0x18]
	b	.L84
.L71:
	str	r0, [r3]
	str	r0, [r4]
.L84:
	ldr	r2, .L90
	ldr	r1, [r2]
	ldr	r0, .L90 + 4
	cmp	r1, r0
	ble	.L85	@cond_branch
	b	.L86
.L85:
	ldr	r6, .L90 + 8
	ldr	r0, [r6]
	add	r0, r0, #0x5
	cmp	r0, #0x6c
	bgt	.L87	@cond_branch
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L88	@cond_branch
	ldr	r2, .L90 + 12
	ldr	r0, .L90 + 16
	ldr	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	ldr	r4, [r2]
	add	r4, r4, r0
	ldr	r0, [r6]
	add	r0, r0, #0x5
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	b	.L89
.L91:
	.align	2, 0
.L90:
	.4byte	0x3000100
	.4byte	0xfffff100
	.4byte	0x3000110
	.4byte	0x3000124
	.4byte	0x300010c
.L88:
	ldr	r5, .L94
	ldr	r4, .L94 + 4
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, .L94 + 8
	mov	r2, #0xc
	bl	sub_8061660
	ldr	r0, [r4]
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r1, [r6]
	add	r1, r1, #0x6
	mov	r2, #0xc
	bl	showNumber
.L89:
	ldr	r0, .L94 + 4
	ldr	r0, [r0]
	ldr	r1, .L94 + 12
	ldr	r1, [r1]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r5, [r0]
	ldr	r4, .L94 + 16
	ldr	r0, [r4]
	add	r0, r0, #0x5
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L92	@cond_branch
	ldr	r0, [r4]
	add	r0, r0, #0x5
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	b	.L93
.L95:
	.align	2, 0
.L94:
	.4byte	0x3000124
	.4byte	0x300010c
	.4byte	0x86fd25c
	.4byte	0x300012c
	.4byte	0x3000110
.L92:
	ldr	r0, [r4]
	add	r0, r0, #0x5
	bl	sub_805703C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x17
	add	r0, r0, #0x1
.L93:
	strh	r0, [r5, #0x18]
	ldr	r1, .L98
	ldr	r0, [r1]
	mov	r3, #0xf0
	lsl	r3, r3, #0x4
	add	r0, r0, r3
	str	r0, [r1]
	ldr	r1, .L98 + 4
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	ldr	r1, .L98 + 8
	ldr	r0, [r1]
	cmp	r0, #0x3
	bgt	.L96	@cond_branch
	add	r0, r0, #0x1
	b	.L100
.L99:
	.align	2, 0
.L98:
	.4byte	0x3000100
	.4byte	0x3000110
	.4byte	0x300010c
.L96:
	mov	r0, #0x0
	b	.L100
.L87:
	ldr	r0, .L109
	str	r0, [r2]
	ldr	r1, .L109 + 4
	ldr	r0, .L109 + 8
.L100:
	str	r0, [r1]
.L86:
	mov	r6, #0x0
	mov	r3, #0xac
	lsl	r3, r3, #0x7
	mov	r7, #0x56
	ldr	r0, .L109 + 12
	mov	r9, r0
.L103:
	ldr	r0, .L109 + 16
	ldr	r0, [r0]
	add	r4, r6, r0
	cmp	r4, #0x4
	ble	.L101	@cond_branch
	sub	r4, r4, #0x5
.L101:
	lsl	r1, r4, #0x1
	add	r1, r1, r4
	lsl	r1, r1, #0x4
	mov	r2, r9
	ldr	r0, [r2]
	add	r0, r0, r1
	ldr	r1, .L109 + 20
	mov	r8, r1
	ldr	r1, [r1]
	asr	r1, r1, #0x8
	NEG	r1, r1
	add	r1, r1, #0x42
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldr	r5, .L109 + 24
	ldr	r2, [r5]
	asr	r2, r2, #0x8
	add	r2, r2, r7
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	str	r3, [sp, #0x10]
	bl	sub_8061844
	ldr	r0, .L109 + 28
	ldr	r1, [r0]
	lsl	r0, r4, #0x2
	add	r0, r0, r1
	ldr	r1, [r0]
	ldr	r3, [sp, #0x10]
	cmp	r1, #0
	beq	.L102	@cond_branch
	mov	r2, r8
	ldr	r0, [r2]
	NEG	r0, r0
	mov	r2, #0xd8
	lsl	r2, r2, #0x6
	add	r0, r0, r2
	str	r0, [r1, #0x8]
	ldr	r0, [r5]
	add	r0, r0, r3
	str	r0, [r1, #0xc]
.L102:
	mov	r0, #0xf0
	lsl	r0, r0, #0x4
	add	r3, r3, r0
	add	r7, r7, #0xf
	add	r6, r6, #0x1
	cmp	r6, #0x4
	ble	.L103	@cond_branch
	ldr	r0, .L109 + 32
	ldr	r0, [r0]
	mov	r5, r8
	ldr	r1, [r5]
	asr	r1, r1, #0x8
	NEG	r1, r1
	add	r1, r1, #0x70
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	mov	r2, #0x28
	bl	sub_8061844
	ldr	r0, .L109 + 36
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L104	@cond_branch
	ldr	r1, [r5]
	mov	r0, #0xc6
	lsl	r0, r0, #0x8
	sub	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, .L109 + 40
	ldr	r1, [r0]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x5
	mov	r1, #0xbe
	lsl	r1, r1, #0x7
	add	r0, r0, r1
	str	r0, [r2, #0xc]
.L104:
	ldr	r4, .L109 + 44
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L105	@cond_branch
	bl	sub_8057C40
	ldr	r3, [r4]
	ldr	r2, [r5]
	ldr	r1, .L109 + 48
	asr	r0, r0, #0x7
	lsl	r0, r0, #0x1d
	lsr	r0, r0, #0x17
	add	r0, r0, #0x80
	add	r0, r0, r1
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	mov	r1, #0x98
	lsl	r1, r1, #0x6
	add	r0, r0, r1
	sub	r0, r0, r2
	str	r0, [r3, #0x8]
	ldr	r0, .L109 + 52
	ldr	r0, [r0]
	lsl	r1, r0, #0x4
	sub	r1, r1, r0
	lsl	r1, r1, #0x8
	ldr	r0, .L109 + 4
	ldr	r0, [r0]
	add	r0, r0, r1
	mov	r2, #0xa4
	lsl	r2, r2, #0x7
	add	r0, r0, r2
	str	r0, [r3, #0xc]
.L105:
	ldr	r0, .L109 + 56
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L106	@cond_branch
	ldr	r1, [r5]
	mov	r0, #0xa4
	lsl	r0, r0, #0x6
	sub	r0, r0, r1
	str	r0, [r2, #0x8]
.L106:
	ldr	r0, .L109 + 60
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L112	@cond_branch
	mov	r3, r8
	ldr	r1, [r3]
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	sub	r0, r0, r1
	str	r0, [r2, #0x8]
	b	.L112
.L110:
	.align	2, 0
.L109:
	.4byte	0xfffff101
	.4byte	0x3000104
	.4byte	0xfff9d901
	.4byte	0x3000124
	.4byte	0x300010c
	.4byte	0x30000fc
	.4byte	0x3000100
	.4byte	0x300012c
	.4byte	0x3000128
	.4byte	0x3000130
	.4byte	0x3000110
	.4byte	0x3000134
	.4byte	0x874cc3c
	.4byte	0x3000114
	.4byte	0x3000138
	.4byte	0x300013c
.L5:
	ldr	r1, .L113
	mov	r0, #0xb
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L112	@cond_branch
	bl	sub_8049178
	ldr	r1, .L113 + 4
	ldr	r0, .L113 + 8
	str	r0, [r1]
	mov	r0, #0x9
	bl	sub_804ABFC
	b	.L112
.L114:
	.align	2, 0
.L113:
	.4byte	0x3005da0
	.4byte	0x30000f8
	.4byte	0xffff0000
.L7:
	mov	r6, #0x0
	ldr	r5, .L122
	mov	r4, #0x0
.L116:
	ldr	r0, [r5]
	add	r0, r0, r4
	bl	sub_8061204
	ldr	r0, .L122 + 4
	ldr	r1, [r0]
	lsl	r0, r6, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L115	@cond_branch
	bl	sub_8060A94
.L115:
	add	r4, r4, #0x30
	add	r6, r6, #0x1
	cmp	r6, #0x4
	ble	.L116	@cond_branch
	ldr	r0, .L122 + 8
	ldr	r0, [r0]
	bl	sub_8061204
	ldr	r0, .L122 + 12
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L117	@cond_branch
	bl	sub_8060A94
.L117:
	ldr	r0, .L122 + 16
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L118	@cond_branch
	bl	sub_8060A94
.L118:
	ldr	r0, .L122 + 20
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L119	@cond_branch
	bl	sub_8060A94
.L119:
	ldr	r0, .L122 + 24
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L120	@cond_branch
	bl	sub_8060A94
.L120:
	ldr	r0, .L122 + 28
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L121	@cond_branch
	bl	deallocateBlock
.L121:
	ldr	r0, .L122 + 32
	bl	sub_8055CA0
.L112:
	add	sp, sp, #0x14
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L123:
	.align	2, 0
.L122:
	.4byte	0x3000124
	.4byte	0x300012c
	.4byte	0x3000128
	.4byte	0x3000130
	.4byte	0x3000134
	.4byte	0x3000138
	.4byte	0x300013c
	.4byte	0x3000120
	.4byte	0x3000140
	thumb_func_end collectionListFrontendHandler

.align 2, 0 @ Don't pad with nop.
