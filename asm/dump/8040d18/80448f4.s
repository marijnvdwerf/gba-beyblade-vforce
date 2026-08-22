	.include "asm/common.inc"

	thumb_func_start sub_80448F4
sub_80448F4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	add	r4, r1, #0
	bl	isMultiplayer
	ldr	r1, .L8044938
	mov	r9, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r5, #0x1
	sub	r0, r5, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L8044938 + 4
	add	r0, r0, r2
	ldr	r1, [r1]
	add	r0, r0, r1
	mov	r8, r0
	ldr	r3, .L8044938 + 8
	add	r6, r1, r3
	cmp	r4, #0x1
	bne	.L8044928	@cond_branch
	b	.L8044A78
.L8044928:
	cmp	r4, #0x1
	bcc	.L8044944	@cond_branch
	cmp	r4, #0x2
	bne	.L8044932	@cond_branch
	b	.L8044B84
.L8044932:
	cmp	r4, #0x7
	beq	.L8044A14	@cond_branch
	b	.L8044C3A
.L8044938:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x15d4
	.4byte	0x15c4
.L8044944:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80449F4
	str	r4, [r0]
	cmp	r4, #0
	beq	.L804496C	@cond_branch
	ldr	r1, .L80449F4 + 4
	ldr	r2, .L80449F4 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804496C:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80449F4 + 12
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8044996	@cond_branch
	ldr	r1, .L80449F4 + 4
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8044996:
	ldr	r1, .L80449F4 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L80449F4 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r7, r0
	ldr	r1, .L80449F4 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	ldr	r1, .L80449F4 + 28
	mov	r0, #0x0
	strb	r0, [r1]
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80449D2	@cond_branch
	b	.L8044C3A
.L80449D2:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80449DE	@cond_branch
	b	.L8044C3A
.L80449DE:
	mov	r0, #0x10
	neg	r0, r0
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x8
	orr	r0, r0, r1
	mov	r1, #0xf
	and	r0, r0, r1
	strb	r0, [r6, #0x2]
	b	.L8044B32
.L80449F2:
	.align	2, 0
.L80449F4:
	.4byte	_unk30001F0
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk30001F4
	.4byte	_unk30001F8
	.4byte	_unk30001FC
	.4byte	_8069108
	.4byte	_unk3000200
.L8044A14:
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8051028
	ldr	r0, .L8044A64
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8044A2A	@cond_branch
	bl	sub_8060A94
.L8044A2A:
	ldr	r0, .L8044A64 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8044A36	@cond_branch
	bl	sub_8060A94
.L8044A36:
	ldr	r0, .L8044A64 + 8
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8044A40	@cond_branch
	b	.L8044C3A
.L8044A40:
	add	r0, r7, #0
	add	r0, r0, #0x7f
	mov	r2, #0x0
	strb	r2, [r0]
	mov	r3, r9
	ldr	r0, [r3]
	ldr	r4, .L8044A64 + 12
	add	r1, r0, r4
	strb	r2, [r1]
	ldr	r3, .L8044A64 + 16
	add	r1, r0, r3
	strb	r2, [r1]
	add	r4, r4, #0x2
	add	r0, r0, r4
	strb	r2, [r0]
	bl	sub_80600B4
	b	.L8044C3A
.L8044A64:
	.align	2, 0

	.4byte	_unk30001F0
	.4byte	_unk30001F4
	.4byte	_unk3000200
	.4byte	0x1618
	.4byte	0x1619
.L8044A78:
	ldr	r5, .L8044B3C
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8044AA4	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8044B3C + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8044B3C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8044AA4:
	ldr	r5, .L8044B3C + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8044AD0	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8044B3C + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8044B3C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8044AD0:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	bl	sub_80439A0
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r4, r7, r2
	add	r0, r4, #0
	bl	sub_8050C18
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8044AF2	@cond_branch
	b	.L8044C3A
.L8044AF2:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8044AFE	@cond_branch
	b	.L8044C3A
.L8044AFE:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044B58	@cond_branch
	ldr	r5, .L8044B3C + 20
	mov	r0, #0x20
	ldrh	r3, [r5]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L8044B1A	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
.L8044B1A:
	mov	r0, #0x10
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L8044B2A	@cond_branch
	add	r0, r4, #0
	bl	sub_8050E80
.L8044B2A:
	ldr	r4, .L8044B3C + 24
	add	r0, r7, r4
	ldr	r0, [r0]
	strb	r0, [r6, #0x4]
.L8044B32:
	add	r0, r6, #0
	bl	sub_8043960
	b	.L8044C3A
.L8044B3A:
	.align	2, 0
.L8044B3C:
	.4byte	_unk30001F0
	.4byte	_unk30001F8
	.4byte	Unk_874CC3C
	.4byte	_unk30001F4
	.4byte	_unk30001FC
	.4byte	_unk3005DA0
	.4byte	0x4b4
.L8044B58:
	mov	r0, r8
	mov	r1, #0x8
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044C3A	@cond_branch
	mov	r0, r8
	mov	r1, #0x4
	ldsb	r1, [r0, r1]
	ldr	r2, .L8044B80
	add	r0, r7, r2
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L8044C3A	@cond_branch
	add	r0, r4, #0
	bl	sub_8050DF8
	b	.L8044C3A
.L8044B7E:
	.align	2, 0
.L8044B80:
	.4byte	0x4b4
.L8044B84:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044C3A	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044C3A	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044BC0	@cond_branch
	ldr	r1, .L8044C1C
	add	r0, r5, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8044BC0	@cond_branch
	mov	r0, #0xf
	ldrb	r3, [r6, #0x2]
	and	r0, r0, r3
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	add	r0, r6, #0
	bl	sub_8043960
.L8044BC0:
	mov	r0, r8
	mov	r1, #0x8
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044C3A	@cond_branch
	mov	r0, #0xf0
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	cmp	r0, #0x10
	bne	.L8044C3A	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	add	r0, r6, #0
	bl	sub_8043960
	ldr	r1, .L8044C1C + 4
	ldr	r0, .L8044C1C + 8
	str	r0, [r1]
	ldr	r1, .L8044C1C + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8050F98
	ldr	r3, .L8044C1C + 16
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8044C34	@cond_branch
	ldr	r1, .L8044C1C + 20
	mov	r0, #0x1
	strb	r0, [r1]
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L8044C3A
.L8044C1C:
	.align	2, 0

	.4byte	_unk3005DA0
	.4byte	_unk30001F8
	.4byte	0xffff0000
	.4byte	_unk30001FC
	.4byte	0x4b4
	.4byte	_unk3000200
.L8044C34:
	mov	r0, #0x1b
	bl	sub_80490F8
.L8044C3A:
	add	sp, sp, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80448F4

.align 2, 0 @ Don't pad with nop.
