	.include "asm/common.inc"

	thumb_func_start selectBladeFrontendHandler
selectBladeFrontendHandler:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x8
	bls	.L80475F2	@cond_branch
	bl	.L8047E46
.L80475F2:
	lsl	r0, r1, #0x2
	ldr	r1, .L80475FC
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L80475FC:
	.align	2, 0

	.4byte	.L8047600
.L8047600:
	.4byte	.L8047624
	.4byte	.L80479A0
	.4byte	.L8047B44
	.4byte	.L8047E46
	.4byte	.L8047E46
	.4byte	.L8047E46
	.4byte	.L8047E46
	.4byte	.L8047928
	.4byte	.L8047990
.L8047624:
	mov	r6, #0x0
	mov	r0, #0x80
	add	r0, r0, r7
	mov	r8, r0
	b	.L8047630
.L804762E:
	add	r6, r6, #0x1
.L8047630:
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8047640	@cond_branch
	cmp	r6, #0x3b
	ble	.L804762E	@cond_branch
.L8047640:
	cmp	r6, #0x3c
	bne	.L804764A	@cond_branch
	ldr	r0, .L8047684
	bl	printf
.L804764A:
	ldr	r1, .L8047684 + 4
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
	ldr	r0, .L8047684 + 8
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8047698	@cond_branch
	ldr	r1, .L8047684 + 12
	ldr	r2, .L8047684 + 16
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
	b	.L804769E
.L8047682:
	.align	2, 0
.L8047684:
	.4byte	Str_86FD640
	.4byte	_unk30004F0
	.4byte	_unk300053C
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
.L8047698:
	ldr	r0, .L80476CC
	bl	printf
.L804769E:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L80476CC + 4
	str	r5, [r0]
	cmp	r5, #0
	beq	.L80476D8	@cond_branch
	ldr	r1, .L80476CC + 8
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
	b	.L80476DE
.L80476CC:
	.align	2, 0

	.4byte	Str_86FD68C
	.4byte	_unk3000540
	.4byte	SpriteSheet_823BF04
.L80476D8:
	ldr	r0, .L804770C
	bl	printf
.L80476DE:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L804770C + 4
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8047718	@cond_branch
	ldr	r1, .L804770C + 8
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
	b	.L804771E
.L804770C:
	.align	2, 0

	.4byte	Str_86FD6C8
	.4byte	_unk3000544
	.4byte	SpriteSheet_823BF04
.L8047718:
	ldr	r0, .L804774C
	bl	printf
.L804771E:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L804774C + 4
	str	r4, [r0, #0x8]
	cmp	r4, #0
	beq	.L8047758	@cond_branch
	ldr	r1, .L804774C + 8
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
	b	.L804775E
.L804774A:
	.align	2, 0
.L804774C:
	.4byte	Str_86FD704
	.4byte	_unk30004F0
	.4byte	SpriteSheet_825125C
.L8047758:
	ldr	r0, .L804778C
	bl	printf
.L804775E:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L804778C + 4
	str	r4, [r0, #0xc]
	cmp	r4, #0
	beq	.L8047798	@cond_branch
	ldr	r1, .L804778C + 8
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
	b	.L804779E
.L804778A:
	.align	2, 0
.L804778C:
	.4byte	Str_86FD740
	.4byte	_unk30004F0
	.4byte	SpriteSheet_82516A8
.L8047798:
	ldr	r0, .L80477CC
	bl	printf
.L804779E:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80477CC + 4
	str	r4, [r0, #0x10]
	cmp	r4, #0
	beq	.L80477D8	@cond_branch
	ldr	r1, .L80477CC + 8
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
	b	.L80477DE
.L80477CA:
	.align	2, 0
.L80477CC:
	.4byte	Str_86FD77C
	.4byte	_unk30004F0
	.4byte	SpriteSheet_8251AF4
.L80477D8:
	ldr	r0, .L80478E8
	bl	printf
.L80477DE:
	ldr	r1, .L80478E8 + 4
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L80478E8 + 8
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	ldr	r1, .L80478E8 + 12
	mov	r0, #0x90
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r1, .L80478E8 + 16
	mov	r0, #0xdc
	lsl	r0, r0, #0x8
	str	r0, [r1]
	ldr	r1, .L80478E8 + 20
	mov	r0, #0xd0
	lsl	r0, r0, #0x5
	str	r0, [r1]
	ldr	r1, .L80478E8 + 24
	mov	r0, #0xd8
	lsl	r0, r0, #0x5
	str	r0, [r1]
	ldr	r0, .L80478E8 + 28
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L80478E8 + 32
	mov	r5, #0x0
	str	r5, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	neg	r1, r1
	mov	r2, #0x90
	lsl	r2, r2, #0x6
	bl	sub_80596AC
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r4, .L80478E8 + 36
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
	ldr	r0, .L80478E8 + 40
	strb	r5, [r0]
	ldr	r1, .L80478E8 + 44
	mov	r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x30
	mov	r4, r8
	ldrb	r4, [r4]
	orr	r0, r0, r4
	mov	r1, r8
	strb	r0, [r1]
	ldr	r0, .L80478E8 + 48
	strb	r5, [r0]
	ldr	r0, .L80478E8 + 52
	strb	r5, [r0]
	ldr	r0, .L80478E8 + 56
	str	r5, [r0]
	ldr	r0, .L80478E8 + 60
	str	r5, [r0]
	b	.L8047E46
.L80478E6:
	.align	2, 0
.L80478E8:
	.4byte	Str_86FD7B8
	.4byte	_unk3000548
	.4byte	_unk300054C
	.4byte	_unk3000550
	.4byte	_unk3000554
	.4byte	_unk3000558
	.4byte	_unk300055C
	.4byte	_unk30004E8
	.4byte	_unk30004E4
	.4byte	_unk30004F0
	.4byte	_unk3000539
	.4byte	_unk3000538
	.4byte	_unk300053A
	.4byte	_unk300053B
	.4byte	_unk3000560
	.4byte	_unk3000564
.L8047928:
	ldr	r4, .L8047980
	ldr	r0, [r4, #0x8]
	cmp	r0, #0
	beq	.L8047934	@cond_branch
	bl	sub_8060A94
.L8047934:
	ldr	r0, [r4, #0xc]
	cmp	r0, #0
	beq	.L804793E	@cond_branch
	bl	sub_8060A94
.L804793E:
	ldr	r0, [r4, #0x10]
	cmp	r0, #0
	beq	.L8047948	@cond_branch
	bl	sub_8060A94
.L8047948:
	ldr	r0, .L8047980 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8047954	@cond_branch
	bl	sub_8060A94
.L8047954:
	ldr	r0, .L8047980 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8047960	@cond_branch
	bl	sub_8060A94
.L8047960:
	ldr	r0, .L8047980 + 12
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804796C	@cond_branch
	bl	sub_8060A94
.L804796C:
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8047976	@cond_branch
	bl	sub_8060A94
.L8047976:
	add	r0, r4, #0
	add	r0, r0, #0x38
	bl	sub_8055CA0
	b	.L8047E46
.L8047980:
	.align	2, 0

	.4byte	_unk30004F0
	.4byte	_unk300053C
	.4byte	_unk3000540
	.4byte	_unk3000544
.L8047990:
	cmp	r2, #0x1
	beq	.L8047996	@cond_branch
	b	.L8047E46
.L8047996:
	ldr	r0, .L804799C
	strb	r2, [r0]
	b	.L8047E46
.L804799C:
	.align	2, 0

	.4byte	_unk3000539
.L80479A0:
	mov	r2, #0xa0
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	bl	sub_80439A0
	ldr	r4, .L8047AF8
	add	r0, r7, r4
	ldrh	r0, [r0]
	cmp	r0, #0
	bne	.L8047A16	@cond_branch
	ldr	r1, .L8047AF8 + 4
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r2, .L8047AF8 + 8
	ldr	r1, .L8047AF8 + 12
	ldr	r3, [r1]
	mov	r0, #0x10
	sub	r0, r0, r3
	lsl	r0, r0, #0x8
	orr	r0, r0, r3
	strh	r0, [r2]
	ldr	r0, .L8047AF8 + 16
	ldr	r0, [r0]
	cmp	r3, r0
	beq	.L80479E0	@cond_branch
	sub	r2, r3, #1
	cmp	r0, r3
	ble	.L80479DE	@cond_branch
	add	r2, r3, #1
.L80479DE:
	str	r2, [r1]
.L80479E0:
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L80479FA	@cond_branch
	ldr	r0, .L8047AF8 + 20
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L80479FA	@cond_branch
	ldr	r0, .L8047AF8 + 24
	bl	initBBCollectionSprite
	ldr	r1, .L8047AF8 + 16
	mov	r0, #0x10
	str	r0, [r1]
.L80479FA:
	ldr	r5, .L8047AF8 + 28
	ldrb	r0, [r5]
	cmp	r0, #0
	bne	.L8047A16	@cond_branch
	ldr	r4, .L8047AF8 + 24
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_8047080
	add	r0, r4, #0
	bl	sub_804712C
	mov	r0, #0x1
	strb	r0, [r5]
.L8047A16:
	ldr	r5, .L8047AF8 + 32
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8047A48	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8047AF8 + 36
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L8047AF8 + 40
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	ldr	r0, .L8047AF8 + 44
	ldr	r0, [r0]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8047A48:
	ldr	r5, .L8047AF8 + 48
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8047A7A	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8047AF8 + 52
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L8047AF8 + 40
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	ldr	r0, .L8047AF8 + 44
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8047A7A:
	ldr	r0, .L8047AF8 + 56
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L8047AB8	@cond_branch
	ldr	r0, .L8047AF8 + 60
	ldr	r0, [r0]
	ldr	r2, [r4, #0x8]
	sub	r0, r0, r2
	asr	r0, r0, #0x2
	ldr	r1, .L8047AF8 + 44
	ldr	r1, [r1]
	sub	r0, r0, r1
	add	r2, r2, r0
	str	r2, [r4, #0x8]
	ldr	r0, .L8047AF8 + 64
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
	beq	.L8047AB6	@cond_branch
	mov	r1, #0x2
.L8047AB6:
	strh	r1, [r4, #0x18]
.L8047AB8:
	ldr	r0, .L8047AF8 + 68
	ldrb	r0, [r0]
	ldr	r5, .L8047AF8 + 72
	ldr	r4, .L8047AF8 + 44
	cmp	r0, #0
	beq	.L8047ADA	@cond_branch
	ldr	r0, [r5]
	asr	r0, r0, #0x8
	cmp	r0, #0xfe
	ble	.L8047ADA	@cond_branch
	ldr	r1, [r4]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	cmp	r1, r0
	bne	.L8047ADA	@cond_branch
	mov	r0, #0x0
	str	r0, [r4]
.L8047ADA:
	ldr	r4, [r4]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r1, #0x94
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	neg	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	b	.L8047E46
.L8047AF8:
	.align	2, 0

	.4byte	0x584
	.4byte	0x4000050
	.4byte	0x4000052
	.4byte	_unk3000560
	.4byte	_unk3000564
	.4byte	_unk300053B
	.4byte	_unk30004F0
	.4byte	_unk300053A
	.4byte	_unk300053C
	.4byte	_unk3000548
	.4byte	Unk_874CC3C
	.4byte	_unk30004E4
	.4byte	_unk3000540
	.4byte	_unk300054C
	.4byte	_unk3000544
	.4byte	_unk3000554
	.4byte	_unk300055C
	.4byte	_unk3000539
	.4byte	_unk30004E8
.L8047B44:
	ldr	r4, .L8047BE4
	mov	r0, #0x2
	ldrh	r2, [r4]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L8047B64	@cond_branch
	ldr	r1, .L8047BE4 + 4
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, .L8047BE4 + 8
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r0, .L8047BE4 + 12
	mov	r1, #0x1
	bl	sub_8047080
.L8047B64:
	mov	r0, #0x1
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L8047B82	@cond_branch
	ldr	r1, .L8047BE4 + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L8047BE4 + 8
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r0, .L8047BE4 + 12
	mov	r1, #0x1
	bl	sub_8047080
.L8047B82:
	ldr	r5, .L8047BE4 + 4
	ldrb	r0, [r5]
	cmp	r0, #0
	beq	.L8047C62	@cond_branch
	ldr	r0, .L8047BE4 + 16
	ldr	r1, .L8047BE4 + 8
	ldr	r2, [r0]
	ldr	r0, [r1]
	cmp	r2, r0
	bne	.L8047C62	@cond_branch
	ldr	r4, .L8047BE4 + 12
	add	r0, r4, #0
	bl	sub_80470C8
	ldr	r1, .L8047BE4 + 20
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L8047BE4 + 24
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, .L8047BE4 + 28
	ldr	r2, .L8047BE4 + 32
	str	r2, [r0]
	ldr	r0, .L8047BE4 + 36
	mov	r1, #0xf0
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L8047BE4 + 40
	str	r2, [r0]
	ldr	r0, .L8047BE4 + 44
	str	r1, [r0]
	ldrb	r5, [r5]
	cmp	r5, #0x1
	bne	.L8047C58	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8047C14	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_805185C
	mov	r0, #0x1f
	b	.L8047C36
.L8047BE4:
	.align	2, 0

	.4byte	_unk3005DA0
	.4byte	_unk300053B
	.4byte	_unk3000564
	.4byte	_unk30004F0
	.4byte	_unk3000560
	.4byte	_unk30004E4
	.4byte	_unk3000539
	.4byte	_unk3000548
	.4byte	0xffff0000
	.4byte	_unk300054C
	.4byte	_unk3000550
	.4byte	_unk3000554
.L8047C14:
	ldr	r0, .L8047C44
	ldr	r0, [r0]
	ldr	r1, .L8047C44 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8047C4C	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_805185C
	mov	r0, #0x1b
.L8047C36:
	bl	sub_80490F8
	mov	r0, #0x8
	bl	sub_804ABFC
	b	.L8047C62
.L8047C42:
	.align	2, 0
.L8047C44:
	.4byte	_currentGameState
	.4byte	0xc64
.L8047C4C:
	mov	r0, #0x9
	bl	sub_804ABFC
	bl	sub_8049178
	b	.L8047C62
.L8047C58:
	mov	r0, #0x9
	bl	sub_804ABFC
	bl	sub_8049178
.L8047C62:
	ldr	r5, .L8047CCC
	mov	r0, #0x30
	ldrh	r2, [r5]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L8047C70	@cond_branch
	b	.L8047DB8
.L8047C70:
	ldr	r0, .L8047CCC + 4
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8047C7A	@cond_branch
	b	.L8047DB8
.L8047C7A:
	mov	r0, #0x5
	bl	sub_805A914
	add	r4, r0, #0
	mov	r0, #0x4
	bl	sub_805A914
	add	r6, r0, #0
	ldr	r1, .L8047CCC + 8
	mov	r2, #0x20
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8047CB6	@cond_branch
	add	r0, r2, #0
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L8047D28	@cond_branch
	ldr	r0, [r4, #0x8]
	cmp	r0, #0xf0
	bls	.L8047D28	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8047D28	@cond_branch
.L8047CB6:
	mov	r4, #0x0
	ldr	r0, .L8047CCC + 12
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	sub	r6, r0, #1
	cmp	r6, #0
	bge	.L8047CE6	@cond_branch
	add	r6, r6, #0x3c
	b	.L8047CE6
.L8047CCC:
	.align	2, 0

	.4byte	_keyInput
	.4byte	_unk300053A
	.4byte	_unk3005DA0
	.4byte	_unk30004F0
.L8047CDC:
	sub	r6, r6, #0x1
	cmp	r6, #0
	bge	.L8047CE4	@cond_branch
	add	r6, r6, #0x3c
.L8047CE4:
	add	r4, r4, #0x1
.L8047CE6:
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8047CF6	@cond_branch
	cmp	r4, #0x3b
	ble	.L8047CDC	@cond_branch
.L8047CF6:
	ldr	r4, .L8047D20
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
	ldr	r0, .L8047D20 + 4
	str	r5, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
	b	.L8047DB8
.L8047D1E:
	.align	2, 0
.L8047D20:
	.4byte	_unk30004F0
	.4byte	_unk3000564
.L8047D28:
	ldr	r1, .L8047D6C
	mov	r2, #0x10
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8047D56	@cond_branch
	ldr	r1, .L8047D6C + 4
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8047DB8	@cond_branch
	ldr	r0, [r6, #0x8]
	cmp	r0, #0xf0
	bls	.L8047DB8	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8047DB8	@cond_branch
.L8047D56:
	mov	r4, #0x0
	ldr	r0, .L8047D6C + 8
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	add	r6, r0, #1
	cmp	r6, #0x3b
	ble	.L8047D82	@cond_branch
	sub	r6, r6, #0x3c
	b	.L8047D82
.L8047D6C:
	.align	2, 0

	.4byte	_unk3005DA0
	.4byte	_keyInput
	.4byte	_unk30004F0
.L8047D78:
	add	r6, r6, #0x1
	cmp	r6, #0x3b
	ble	.L8047D80	@cond_branch
	sub	r6, r6, #0x3c
.L8047D80:
	add	r4, r4, #0x1
.L8047D82:
	add	r0, r6, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8047D92	@cond_branch
	cmp	r4, #0x3b
	ble	.L8047D78	@cond_branch
.L8047D92:
	ldr	r4, .L8047DE4
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
	ldr	r0, .L8047DE4 + 4
	str	r5, [r0]
	mov	r0, #0x7
	bl	sub_804ABFC
.L8047DB8:
	ldr	r0, .L8047DE4 + 8
	ldrh	r1, [r0]
	mov	r0, #0xc0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8047E46	@cond_branch
	mov	r0, #0x40
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, #0
	beq	.L8047E10	@cond_branch
	ldr	r0, .L8047DE4
	add	r1, r0, #0
	add	r1, r1, #0x35
	ldrb	r2, [r1]
	mov	r0, #0x0
	ldsb	r0, [r1, r0]
	cmp	r0, #0
	ble	.L8047DF0	@cond_branch
	sub	r0, r2, #1
	b	.L8047DF2
.L8047DE4:
	.align	2, 0

	.4byte	_unk30004F0
	.4byte	_unk3000564
	.4byte	_unk3005DA0
.L8047DF0:
	mov	r0, #0x4
.L8047DF2:
	strb	r0, [r1]
	ldr	r0, .L8047E08
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L8047E08 + 4
	bl	sub_8047080
	mov	r0, #0x7
	bl	sub_804ABFC
	b	.L8047E40
.L8047E08:
	.align	2, 0

	.4byte	_unk3000564
	.4byte	_unk30004F0
.L8047E10:
	ldr	r0, .L8047E28
	add	r1, r0, #0
	add	r1, r1, #0x35
	ldrb	r2, [r1]
	mov	r0, #0x0
	ldsb	r0, [r1, r0]
	cmp	r0, #0x3
	bgt	.L8047E2C	@cond_branch
	add	r0, r2, #1
	strb	r0, [r1]
	b	.L8047E2E
.L8047E26:
	.align	2, 0
.L8047E28:
	.4byte	_unk30004F0
.L8047E2C:
	strb	r3, [r1]
.L8047E2E:
	ldr	r0, .L8047E54
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L8047E54 + 4
	bl	sub_8047080
	mov	r0, #0x7
	bl	sub_804ABFC
.L8047E40:
	ldr	r0, .L8047E54 + 4
	bl	sub_804712C
.L8047E46:
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8047E52:
	.align	2, 0
.L8047E54:
	.4byte	_unk3000564
	.4byte	_unk30004F0
	thumb_func_end selectBladeFrontendHandler

.align 2, 0 @ Don't pad with nop.
