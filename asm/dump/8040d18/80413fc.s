	.include "asm/common.inc"

	thumb_func_start sub_80413FC
sub_80413FC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	mov	sl, r0
	add	r4, r1, #0
	bl	isMultiplayer
	ldr	r2, .L8041448
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x1
	sub	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, .L8041448 + 4
	add	r1, r1, r0
	ldr	r0, [r2]
	add	r1, r1, r0
	mov	r9, r1
	ldr	r1, .L8041448 + 8
	add	r1, r1, r0
	mov	r8, r1
	cmp	r4, #0x1
	bne	.L8041432	@cond_branch
	b	.L8041734
.L8041432:
	cmp	r4, #0x1
	bcc	.L8041454	@cond_branch
	cmp	r4, #0x2
	bne	.L804143C	@cond_branch
	b	.L80419E4
.L804143C:
	cmp	r4, #0x7
	bne	.L8041442	@cond_branch
	b	.L8041700
.L8041442:
	bl	.L8041E7C
.L8041446:
	.align	2, 0
.L8041448:
	.4byte	_gameData
	.4byte	0x15d4
	.4byte	0x15c4
.L8041454:
	mov	r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L8041478	@cond_branch
	ldr	r1, .L804146C
	ldr	r0, .L804146C + 4
	ldr	r0, [r0]
	ldr	r2, .L804146C + 8
	add	r0, r0, r2
	b	.L80414D2
.L804146A:
	.align	2, 0
.L804146C:
	.4byte	_unk3000074
	.4byte	_currentGameState
	.4byte	0x5a4
.L8041478:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L804149C	@cond_branch
	ldr	r1, .L8041490
	ldr	r0, .L8041490 + 4
	ldr	r0, [r0]
	ldr	r3, .L8041490 + 8
	add	r0, r0, r3
	b	.L80414D2
.L8041490:
	.align	2, 0

	.4byte	_unk3000074
	.4byte	_currentGameState
	.4byte	0x5e4
.L804149C:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L80414D4	@cond_branch
	ldr	r0, .L80414BC
	ldr	r2, [r0]
	ldr	r4, .L80414BC + 4
	add	r0, r2, r4
	ldrb	r0, [r0]
	cmp	r0, #0x1
	bne	.L80414CC	@cond_branch
	ldr	r1, .L80414BC + 8
	ldr	r3, .L80414BC + 12
	add	r0, r2, r3
	b	.L80414D2
.L80414BC:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6a4
	.4byte	_unk3000074
	.4byte	0x624
.L80414CC:
	ldr	r1, .L8041580
	ldr	r4, .L8041580 + 4
	add	r0, r2, r4
.L80414D2:
	str	r0, [r1]
.L80414D4:
	ldr	r0, .L8041580
	ldr	r2, [r0]
	ldr	r1, .L8041580 + 8
	mov	r0, #0x0
	strb	r0, [r1]
	mov	r0, #0x0
	ldsb	r0, [r2, r0]
	mov	r3, #0x1
	neg	r3, r3
	add	r2, r2, #0x1
	add	r4, r1, #0
	mov	r1, #0x80
	add r1, sl
	mov	r9, r1
	cmp	r0, r3
	beq	.L8041506	@cond_branch
	add	r1, r4, #0
.L80414F6:
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x0
	ldsb	r0, [r2, r0]
	add	r2, r2, #0x1
	cmp	r0, r3
	bne	.L80414F6	@cond_branch
.L8041506:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8041580 + 12
	str	r4, [r0]
	cmp	r4, #0
	beq	.L804152E	@cond_branch
	ldr	r1, .L8041580 + 16
	ldr	r2, .L8041580 + 20
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804152E:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L8041580 + 24
	str	r5, [r0]
	cmp	r5, #0
	beq	.L804155A	@cond_branch
	ldr	r1, .L8041580 + 16
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
.L804155A:
	ldr	r1, .L8041580 + 28
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L8041580 + 32
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L80415AC	@cond_branch
	ldr	r0, .L8041580 + 36
	ldr	r0, [r0]
	ldr	r2, .L8041580 + 40
	add	r0, r0, r2
	ldrb	r3, [r0]
	b	.L80415B2
.L8041580:
	.align	2, 0

	.4byte	_unk3000074
	.4byte	0x664
	.4byte	_unk3000078
	.4byte	_unk300005C
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk3000060
	.4byte	_unk3000064
	.4byte	_unk3000068
	.4byte	_currentGameState
	.4byte	0x6a9
.L80415AC:
	bl	sub_805137C
	add	r3, r0, #0
.L80415B2:
	mov	r2, #0x0
	ldr	r0, .L80416D4
	add	r4, r0, #0
	ldr	r6, .L80416D4 + 4
	ldr	r7, .L80416D4 + 8
	ldrb	r0, [r4]
	cmp	r2, r0
	bge	.L80415EC	@cond_branch
	ldr	r0, .L80416D4 + 12
	ldr	r1, [r0]
	ldrb	r1, [r1]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	add	r5, r0, #0
	cmp	r1, r3
	beq	.L80415E8	@cond_branch
.L80415D2:
	add	r2, r2, #0x1
	ldrb	r1, [r4]
	cmp	r2, r1
	bge	.L80415EC	@cond_branch
	ldr	r0, [r5]
	add	r0, r0, r2
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, r3
	bne	.L80415D2	@cond_branch
.L80415E8:
	ldr	r0, .L80416D4 + 16
	strb	r2, [r0, #0x1d]
.L80415EC:
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r6]
	mov	r5, #0x0
	str	r5, [r7]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	add r0, sl
	neg	r1, r1
	mov	r2, #0x90
	lsl	r2, r2, #0x6
	bl	sub_80596AC
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r4, .L80416D4 + 16
	str	r0, [r4, #0x4]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x8]
	mov	r0, #0x2
	bl	sub_804A0E0
	str	r0, [r4, #0xc]
	mov	r0, #0x3
	bl	sub_804A0E0
	str	r0, [r4, #0x10]
	mov	r0, #0x4
	bl	sub_804A0E0
	str	r0, [r4, #0x14]
	mov	r0, #0x5
	bl	sub_804A0E0
	str	r0, [r4, #0x18]
	strb	r5, [r4, #0x1e]
	ldr	r0, [r4, #0x4]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x8]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0xc]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x10]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x14]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x18]
	mov	r1, #0x1
	bl	sub_8062318
	str	r5, [r4]
	ldr	r0, .L80416D4 + 20
	strb	r5, [r0]
	ldr	r0, .L80416D4 + 24
	strb	r5, [r0]
	ldr	r0, .L80416D4 + 28
	strb	r5, [r0]
	mov	r0, #0x30
	mov	r2, r9
	ldrb	r2, [r2]
	orr	r0, r0, r2
	mov	r3, r9
	strb	r0, [r3]
	bl	sub_8049168
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80416C6	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80416C6	@cond_branch
	mov	r0, #0x10
	neg	r0, r0
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x4
	orr	r0, r0, r1
	mov	r1, #0xf
	and	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
	ldr	r0, .L80416D4 + 32
	add	r1, r1, #0x4
	ldr	r3, [r0]
	mov	r0, #0x0
	mov	r2, #0xc
	bl	_call_via_r3
	mov	r0, r8
	bl	sub_8043960
.L80416C6:
	ldr	r1, .L80416D4 + 36
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r1, .L80416D4 + 40
	mov	r0, #0x10
	bl	.L8041E7A
.L80416D4:
	.align	2, 0

	.4byte	_unk3000078
	.4byte	_3000030
	.4byte	_300002C
	.4byte	_unk3000074
	.4byte	_3000038
	.4byte	_unk3000058
	.4byte	_unk3000059
	.4byte	_unk300005A
	.4byte	__fastMemoryClearARM
	.4byte	_unk300006C
	.4byte	_unk3000070
.L8041700:
	ldr	r0, .L8041728
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804170C	@cond_branch
	bl	sub_8060A94
.L804170C:
	ldr	r0, .L8041728 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8041718	@cond_branch
	bl	sub_8060A94
.L8041718:
	ldr	r0, .L8041728 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8041722	@cond_branch
	b	.L8041E7C
.L8041722:
	bl	sub_8060A94
	b	.L8041E7C
.L8041728:
	.align	2, 0

	.4byte	_unk300005C
	.4byte	_unk3000060
	.4byte	_3000038
.L8041734:
	ldr	r0, .L80419A4
	add r0, sl
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	.L8041740	@cond_branch
	b	.L804185A
.L8041740:
	ldr	r1, .L80419A4 + 4
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r3, .L80419A4 + 8
	ldr	r2, [r3]
	mov	r0, #0x10
	sub	r0, r0, r2
	lsl	r0, r0, #0x8
	orr	r0, r0, r2
	strh	r0, [r1]
	ldr	r0, .L80419A4 + 12
	ldr	r0, [r0]
	cmp	r2, r0
	beq	.L804176C	@cond_branch
	sub	r1, r2, #1
	cmp	r0, r2
	ble	.L804176A	@cond_branch
	add	r1, r2, #1
.L804176A:
	str	r1, [r3]
.L804176C:
	ldr	r7, .L80419A4 + 16
	ldrb	r0, [r7]
	cmp	r0, #0
	bne	.L8041830	@cond_branch
	ldr	r4, .L80419A4 + 20
	add	r0, r4, #0
	bl	sub_8041078
	mov	r0, #0x1
	bl	sub_8041324
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r5, .L80419A4 + 24
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	add	r0, r4, #0
	add	r1, r6, #0
	bl	displayFrontendLevel
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	sub_8041288
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	sub_8041188
	mov	r0, #0x1
	strb	r0, [r7]
.L8041830:
	ldr	r4, .L80419A4 + 8
	ldr	r0, [r4]
	cmp	r0, #0x10
	bne	.L8041840	@cond_branch
	ldr	r0, .L80419A4 + 20
	mov	r1, #0x0
	bl	sub_8041344
.L8041840:
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L804185A	@cond_branch
	ldr	r0, .L80419A4 + 28
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L804185A	@cond_branch
	ldr	r1, .L80419A4 + 32
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L80419A4 + 12
	mov	r0, #0x10
	str	r0, [r1]
.L804185A:
	ldr	r0, .L80419A4 + 16
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L80418DE	@cond_branch
	ldr	r7, .L80419A4 + 32
	ldrb	r0, [r7]
	cmp	r0, #0
	beq	.L80418DE	@cond_branch
	ldr	r4, .L80419A4 + 20
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r5, .L80419A4 + 24
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	add	r0, r4, #0
	add	r1, r6, #0
	bl	displayFrontendLevel
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	sub_8041188
	mov	r0, #0x0
	strb	r0, [r7]
.L80418DE:
	mov	r0, #0xa0
	lsl	r0, r0, #0x1
	add r0, sl
	bl	sub_80439A0
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804191C	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804191C	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804190E	@cond_branch
	ldr	r0, .L80419A4 + 20
	ldrb	r0, [r0, #0x1d]
	mov	r3, r8
	strb	r0, [r3, #0x4]
.L804190E:
	bl	sub_8051820
	mov	r4, r8
	strb	r0, [r4, #0x5]
	mov	r0, r8
	bl	sub_8043960
.L804191C:
	ldr	r5, .L80419A4 + 36
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804194E	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L80419A4 + 40
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L80419A4 + 44
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	ldr	r0, .L80419A4 + 48
	ldr	r0, [r0]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L804194E:
	ldr	r5, .L80419A4 + 52
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8041980	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L80419A4 + 56
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L80419A4 + 44
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	ldr	r0, .L80419A4 + 48
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8041980:
	ldr	r0, .L80419A4 + 48
	ldr	r5, .L80419A4 + 60
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	add r0, sl
	neg	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	b	.L8041E7C
.L80419A2:
	.align	2, 0
.L80419A4:
	.4byte	0x584
	.4byte	0x4000050
	.4byte	_unk300006C
	.4byte	_unk3000070
	.4byte	_unk3000059
	.4byte	_3000038
	.4byte	_unk3000074
	.4byte	_unk300005A
	.4byte	_unk3000058
	.4byte	_unk300005C
	.4byte	_unk3000064
	.4byte	Unk_874CC3C
	.4byte	_300002C
	.4byte	_unk3000060
	.4byte	_unk3000068
	.4byte	_3000030
.L80419E4:
	ldr	r5, .L8041A70
	mov	r0, #0x30
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L80419F2	@cond_branch
	b	.L8041B96
.L80419F2:
	ldr	r0, .L8041A70 + 4
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L80419FC	@cond_branch
	b	.L8041B96
.L80419FC:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8041A2A	@cond_branch
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8041A12	@cond_branch
	b	.L8041B96
.L8041A12:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8041A1E	@cond_branch
	b	.L8041B96
.L8041A1E:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8041A2A	@cond_branch
	b	.L8041B96
.L8041A2A:
	mov	r4, #0x20
	add	r0, r4, #0
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L8041ADA	@cond_branch
	mov	r0, #0x5
	bl	sub_805A914
	add	r2, r0, #0
	ldr	r1, .L8041A70 + 8
	add	r0, r4, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8041A5E	@cond_branch
	ldr	r0, [r2, #0x8]
	cmp	r0, #0xf0
	bls	.L8041ADA	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8041ADA	@cond_branch
.L8041A5E:
	ldr	r0, .L8041A70 + 12
	ldrb	r2, [r0, #0x1d]
	mov	r1, #0x1d
	ldsb	r1, [r0, r1]
	add	r6, r0, #0
	cmp	r1, #0
	ble	.L8041A80	@cond_branch
	sub	r0, r2, #1
	b	.L8041A86
.L8041A70:
	.align	2, 0

	.4byte	_keyInput
	.4byte	_unk300005A
	.4byte	_unk3005DA0
	.4byte	_3000038
.L8041A80:
	ldr	r0, .L8041B28
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
.L8041A86:
	strb	r0, [r6, #0x1d]
	add	r0, r6, #0
	mov	r1, #0x0
	bl	sub_8041344
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r4, .L8041B28 + 4
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r5, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8041288
	ldr	r1, .L8041B28 + 8
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L8041ADA:
	ldr	r1, .L8041B28 + 12
	mov	r4, #0x10
	add	r0, r4, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8041B96	@cond_branch
	mov	r0, #0x4
	bl	sub_805A914
	add	r2, r0, #0
	ldr	r1, .L8041B28 + 16
	add	r0, r4, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8041B10	@cond_branch
	ldr	r0, [r2, #0x8]
	cmp	r0, #0xf0
	bls	.L8041B96	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8041B96	@cond_branch
.L8041B10:
	ldr	r1, .L8041B28 + 20
	mov	r2, #0x1d
	ldsb	r2, [r1, r2]
	ldr	r0, .L8041B28
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
	add	r6, r1, #0
	cmp	r2, r0
	bge	.L8041B40	@cond_branch
	ldrb	r0, [r6, #0x1d]
	add	r0, r0, #0x1
	b	.L8041B42
.L8041B28:
	.align	2, 0

	.4byte	_unk3000078
	.4byte	_unk3000074
	.4byte	_unk3000070
	.4byte	_keyInput
	.4byte	_unk3005DA0
	.4byte	_3000038
.L8041B40:
	mov	r0, #0x0
.L8041B42:
	strb	r0, [r6, #0x1d]
	add	r0, r6, #0
	mov	r1, #0x0
	bl	sub_8041344
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r4, .L8041CFC
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r5, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8041288
	ldr	r1, .L8041CFC + 4
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L8041B96:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8041BA2	@cond_branch
	b	.L8041D20
.L8041BA2:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8041BAE	@cond_branch
	b	.L8041D20
.L8041BAE:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8041BFC	@cond_branch
	ldr	r2, .L8041CFC + 8
	mov	r0, #0x1
	ldrh	r3, [r2]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L8041BD4	@cond_branch
	mov	r0, #0xf
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x10
	orr	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
.L8041BD4:
	mov	r0, #0x2
	ldrh	r2, [r2]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L8041BFC	@cond_branch
	ldr	r0, .L8041CFC + 12
	ldr	r0, [r0]
	ldr	r2, .L8041CFC + 16
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8041BFC	@cond_branch
	mov	r0, #0xf
	mov	r3, r8
	ldrb	r3, [r3, #0x2]
	and	r0, r0, r3
	mov	r1, #0x20
	orr	r0, r0, r1
	mov	r4, r8
	strb	r0, [r4, #0x2]
.L8041BFC:
	mov	r0, r9
	mov	r1, #0x4
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8041C0C	@cond_branch
	b	.L8041D7A
.L8041C0C:
	ldr	r0, .L8041CFC + 20
	ldr	r0, [r0]
	mov	r2, r9
	mov	r1, #0x5
	ldsb	r1, [r2, r1]
	mov	r3, #0xae
	lsl	r3, r3, #0x5
	add	r0, r0, r3
	strh	r1, [r0]
	bl	sub_8060040
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	cmp	r7, #0
	bne	.L8041C7C	@cond_branch
	ldr	r6, .L8041CFC + 24
	mov	r4, r9
	ldrb	r0, [r4, #0x4]
	add	r1, r0, #0
	ldrb	r2, [r6, #0x1d]
	cmp	r1, r2
	beq	.L8041C7C	@cond_branch
	strb	r0, [r6, #0x1d]
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r4, .L8041CFC
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r5, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8041288
	ldr	r0, .L8041CFC + 4
	str	r7, [r0]
.L8041C7C:
	mov	r6, #0xf0
	add	r0, r6, #0
	mov	r3, r9
	ldrb	r3, [r3, #0x2]
	and	r0, r0, r3
	cmp	r0, #0x10
	bne	.L8041CD0	@cond_branch
	ldr	r1, .L8041CFC + 28
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L8041CFC + 4
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0xf
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x10
	orr	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
	ldr	r5, .L8041CFC + 24
	mov	r1, #0x1d
	ldsb	r1, [r5, r1]
	ldr	r4, .L8041CFC
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051688
	ldr	r0, .L8041CFC + 12
	ldr	r1, [r0]
	mov	r2, #0x1d
	ldsb	r2, [r5, r2]
	ldr	r0, [r4]
	add	r0, r0, r2
	ldrb	r0, [r0]
	ldr	r2, .L8041CFC + 32
	add	r1, r1, r2
	strb	r0, [r1]
.L8041CD0:
	add	r0, r6, #0
	mov	r3, r9
	ldrb	r3, [r3, #0x2]
	and	r0, r0, r3
	cmp	r0, #0x20
	bne	.L8041D7A	@cond_branch
	mov	r0, #0xf
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x20
	orr	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
	ldr	r1, .L8041CFC + 28
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, .L8041CFC + 4
	mov	r0, #0x0
	str	r0, [r1]
	b	.L8041D7A
.L8041CFA:
	.align	2, 0
.L8041CFC:
	.4byte	_unk3000074
	.4byte	_unk3000070
	.4byte	_unk3005DA0
	.4byte	_currentGameState
	.4byte	0x6a6
	.4byte	_gameData
	.4byte	_3000038
	.4byte	_unk300005A
	.4byte	0x6a9
.L8041D20:
	ldr	r4, .L8041DB8
	mov	r0, #0x2
	ldrh	r2, [r4]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L8041D40	@cond_branch
	ldr	r1, .L8041DB8 + 4
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, .L8041DB8 + 8
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r0, .L8041DB8 + 12
	mov	r1, #0x1
	bl	sub_8041344
.L8041D40:
	mov	r0, #0x1
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L8041D7A	@cond_branch
	ldr	r4, .L8041DB8 + 12
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, .L8041DB8 + 16
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_80517E8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8041D7A	@cond_branch
	ldr	r1, .L8041DB8 + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L8041DB8 + 8
	mov	r0, #0x0
	str	r0, [r1]
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_8041344
.L8041D7A:
	ldr	r4, .L8041DB8 + 4
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L8041D84	@cond_branch
	b	.L8041E7C
.L8041D84:
	ldr	r0, .L8041DB8 + 20
	ldr	r1, .L8041DB8 + 8
	ldr	r2, [r0]
	ldr	r0, [r1]
	cmp	r2, r0
	bne	.L8041E7C	@cond_branch
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8041DDE	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8041DDE	@cond_branch
	ldrb	r4, [r4]
	cmp	r4, #0x1
	bne	.L8041DD0	@cond_branch
	mov	r0, #0x13
	bl	sub_804924C
	mov	r0, #0x8
	bl	sub_8049234
	b	.L8041E4C
.L8041DB8:
	.align	2, 0

	.4byte	_unk3005DA0
	.4byte	_unk300005A
	.4byte	_unk3000070
	.4byte	_3000038
	.4byte	_unk3000074
	.4byte	_unk300006C
.L8041DD0:
	mov	r0, #0x21
	bl	sub_80490F8
	mov	r0, #0x9
	bl	sub_804ABFC
	b	.L8041E60
.L8041DDE:
	ldr	r0, .L8041E3C
	ldrb	r5, [r0]
	cmp	r5, #0x1
	bne	.L8041E54	@cond_branch
	ldr	r0, .L8041E3C + 4
	mov	r1, #0x1d
	ldsb	r1, [r0, r1]
	ldr	r0, .L8041E3C + 8
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051688
	bl	sub_8051734
	add	r6, r0, #0
	bl	getLevelDescription2
	add	r4, r0, #0
	mov	r0, #0x8
	bl	sub_8049234
	mov	r0, #0x11
	bl	sub_804924C
	ldrb	r0, [r4, #0x10]
	cmp	r0, #0
	beq	.L8041E4C	@cond_branch
	ldrh	r6, [r6]
	and	r5, r5, r6
	cmp	r5, #0
	bne	.L8041E4C	@cond_branch
	bl	getLevelDescription2
	ldr	r0, [r0, #0x14]
	bl	StoreLevelVar14
	ldr	r0, .L8041E3C + 12
	bl	StoreFunction
	mov	r0, #0x1c
	bl	sub_80490F8
	b	.L8041E60
.L8041E3A:
	.align	2, 0
.L8041E3C:
	.4byte	_unk300005A
	.4byte	_3000038
	.4byte	_unk3000074
	.4byte	sub_8049DE0 + 1
.L8041E4C:
	mov	r0, #0x9
	bl	sub_80490F8
	b	.L8041E60
.L8041E54:
	mov	r0, #0xa
	bl	sub_80490F8
	mov	r0, #0x9
	bl	sub_804ABFC
.L8041E60:
	ldr	r0, .L8041E8C
	bl	sub_8041364
	ldr	r1, .L8041E8C + 4
	ldr	r0, .L8041E8C + 8
	str	r0, [r1]
	ldr	r1, .L8041E8C + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L8041E8C + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x9
.L8041E7A:
	str	r0, [r1]
.L8041E7C:
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8041E8C:
	.align	2, 0

	.4byte	_3000038
	.4byte	_unk3000064
	.4byte	0xffff0000
	.4byte	_unk3000068
	.4byte	_300002C
	thumb_func_end sub_80413FC

.align 2, 0 @ Don't pad with nop.
