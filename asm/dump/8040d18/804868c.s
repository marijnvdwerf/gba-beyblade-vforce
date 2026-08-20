	.include "asm/common.inc"

	thumb_func_start sub_804868C
sub_804868C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	add	r4, r1, #0
	bl	isMultiplayer
	ldr	r1, .L80486CC
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, #0x1
	mov	r8, r2
	sub	r0, r2, r0
	lsl	r0, r0, #0x4
	ldr	r5, .L80486CC + 4
	add	r0, r0, r5
	ldr	r1, [r1]
	add	r5, r1, r0
	ldr	r0, .L80486CC + 8
	add	r6, r1, r0
	cmp	r4, #0x1
	bne	.L80486BC	@cond_branch
	b	.L80487C4
.L80486BC:
	cmp	r4, #0x1
	bcc	.L80486D8	@cond_branch
	cmp	r4, #0x2
	bne	.L80486C6	@cond_branch
	b	.L80488BC
.L80486C6:
	cmp	r4, #0x7
	beq	.L8048794	@cond_branch
	b	.L8048A62
.L80486CC:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x15d4
	.4byte	0x15c4
.L80486D8:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8048778
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8048700	@cond_branch
	ldr	r1, .L8048778 + 4
	ldr	r2, .L8048778 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8048700:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8048778 + 12
	str	r4, [r0]
	cmp	r4, #0
	beq	.L804872C	@cond_branch
	ldr	r1, .L8048778 + 4
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	mov	r5, r8
	str	r5, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804872C:
	ldr	r1, .L8048778 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L8048778 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r7, r0
	ldr	r1, .L8048778 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	bl	sub_8049168
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8048766	@cond_branch
	b	.L8048A62
.L8048766:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8048772	@cond_branch
	b	.L8048A62
.L8048772:
	mov	r0, #0x6
	strb	r0, [r6, #0x2]
	b	.L8048A36
.L8048778:
	.align	2, 0

	.4byte	_unk30005D0
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk30005D4
	.4byte	_unk30005D8
	.4byte	_unk30005DC
	.4byte	_8069D9C
.L8048794:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r7, r1
	bl	sub_8051028
	ldr	r0, .L80487BC
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80487AA	@cond_branch
	bl	sub_8060A94
.L80487AA:
	ldr	r0, .L80487BC + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L80487B4	@cond_branch
	b	.L8048A62
.L80487B4:
	bl	sub_8060A94
	b	.L8048A62
.L80487BA:
	.align	2, 0
.L80487BC:
	.4byte	_unk30005D0
	.4byte	_unk30005D4
.L80487C4:
	ldr	r5, .L804886C
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L80487F0	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L804886C + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L804886C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L80487F0:
	ldr	r5, .L804886C + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804881C	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L804886C + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L804886C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L804881C:
	mov	r5, #0xa0
	lsl	r5, r5, #0x1
	add	r0, r7, r5
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r7, r0
	add	r0, r4, #0
	bl	sub_8050C18
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804888A	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804888A	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804888A	@cond_branch
	ldr	r0, .L804886C + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804888A	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8048884	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L804888A
.L804886C:
	.align	2, 0

	.4byte	_unk30005D0
	.4byte	_unk30005D8
	.4byte	Unk_874CC3C
	.4byte	_unk30005D4
	.4byte	_unk30005DC
	.4byte	_unk3005DA0
.L8048884:
	add	r0, r4, #0
	bl	sub_8050E80
.L804888A:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8048896	@cond_branch
	b	.L8048A62
.L8048896:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80488A2	@cond_branch
	b	.L8048A62
.L80488A2:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80488AE	@cond_branch
	b	.L8048A36
.L80488AE:
	ldr	r1, .L80488B8
	add	r0, r7, r1
	ldr	r0, [r0]
	strb	r0, [r6, #0x4]
	b	.L8048A36
.L80488B8:
	.align	2, 0

	.4byte	0x4b4
.L80488BC:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80488C8	@cond_branch
	b	.L8048A54
.L80488C8:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80488D4	@cond_branch
	b	.L8048A54
.L80488D4:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804890A	@cond_branch
	ldr	r2, .L8048968
	mov	r0, r8
	ldrh	r1, [r2]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80488F6	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
.L80488F6:
	ldrh	r2, [r2]
	and	r4, r4, r2
	cmp	r4, #0
	beq	.L804890A	@cond_branch
	mov	r0, #0xf
	ldrb	r2, [r6, #0x2]
	and	r0, r0, r2
	mov	r1, #0x20
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
.L804890A:
	add	r0, r5, #0
	mov	r1, #0x6
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L804891A	@cond_branch
	b	.L8048A62
.L804891A:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L804893C	@cond_branch
	mov	r1, #0x4
	ldsb	r1, [r5, r1]
	ldr	r4, .L8048968 + 4
	add	r0, r7, r4
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L804893C	@cond_branch
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8050DF8
.L804893C:
	mov	r0, #0xf0
	ldrb	r4, [r5, #0x2]
	and	r0, r0, r4
	cmp	r0, #0x10
	bne	.L8048A02	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	ldr	r2, .L8048968 + 4
	add	r0, r7, r2
	ldr	r0, [r0]
	cmp	r0, #0x4
	bhi	.L80489E4	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L8048968 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8048966:
	.align	2, 0
.L8048968:
	.4byte	_unk3005DA0
	.4byte	0x4b4
	.4byte	.L8048974
.L8048974:
	.4byte	.L8048988
	.4byte	.L804899C
	.4byte	.L80489B0
	.4byte	.L80489C4
	.4byte	.L80489D8
.L8048988:
	ldr	r0, .L8048994
	ldr	r0, [r0]
	ldr	r4, .L8048994 + 4
	add	r0, r0, r4
	mov	r1, #0x1
	b	.L80489E2
.L8048994:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6a5
.L804899C:
	ldr	r0, .L80489A8
	ldr	r0, [r0]
	ldr	r1, .L80489A8 + 4
	add	r0, r0, r1
	mov	r1, #0x3
	b	.L80489E2
.L80489A8:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6a5
.L80489B0:
	ldr	r0, .L80489BC
	ldr	r0, [r0]
	ldr	r2, .L80489BC + 4
	add	r0, r0, r2
	mov	r1, #0x5
	b	.L80489E2
.L80489BC:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6a5
.L80489C4:
	ldr	r0, .L80489D0
	ldr	r0, [r0]
	ldr	r4, .L80489D0 + 4
	add	r0, r0, r4
	mov	r1, #0x7
	b	.L80489E2
.L80489D0:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6a5
.L80489D8:
	ldr	r0, .L8048A40
	ldr	r0, [r0]
	ldr	r1, .L8048A40 + 4
	add	r0, r0, r1
	mov	r1, #0x9
.L80489E2:
	strb	r1, [r0]
.L80489E4:
	ldr	r1, .L8048A40 + 8
	ldr	r0, .L8048A40 + 12
	str	r0, [r1]
	ldr	r1, .L8048A40 + 16
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8050F98
	mov	r0, #0x1b
	bl	sub_80490F8
.L8048A02:
	mov	r0, #0xf0
	ldrb	r5, [r5, #0x2]
	and	r0, r0, r5
	cmp	r0, #0x20
	bne	.L8048A36	@cond_branch
	mov	r0, #0xf
	ldrb	r4, [r6, #0x2]
	and	r0, r0, r4
	mov	r1, #0x20
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	ldr	r1, .L8048A40 + 8
	ldr	r0, .L8048A40 + 12
	str	r0, [r1]
	ldr	r1, .L8048A40 + 16
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r5, #0x96
	lsl	r5, r5, #0x3
	add	r0, r7, r5
	bl	sub_8050FC8
	mov	r0, #0x20
	bl	sub_80490F8
.L8048A36:
	add	r0, r6, #0
	bl	sub_8043960
	b	.L8048A62
.L8048A3E:
	.align	2, 0
.L8048A40:
	.4byte	_currentGameState
	.4byte	0x6a5
	.4byte	_unk30005D8
	.4byte	0xffff0000
	.4byte	_unk30005DC
.L8048A54:
	ldr	r0, .L8048A70
	ldrh	r0, [r0]
	cmp	r0, #0x1
	bne	.L8048A62	@cond_branch
	mov	r0, #0x1b
	bl	sub_80490F8
.L8048A62:
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8048A6E:
	.align	2, 0
.L8048A70:
	.4byte	_unk3005DA0
	thumb_func_end sub_804868C

.align 2, 0 @ Don't pad with nop.
