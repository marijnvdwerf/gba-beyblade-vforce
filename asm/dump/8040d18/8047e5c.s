	.include "asm/common.inc"

	thumb_func_start sub_8047E5C
sub_8047E5C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x1
	bne	.L8047E70	@cond_branch
	b	.L8047FB4
.L8047E70:
	cmp	r1, #0x1
	bcc	.L8047E82	@cond_branch
	cmp	r1, #0x2
	bne	.L8047E7A	@cond_branch
	b	.L80480B4
.L8047E7A:
	cmp	r1, #0x7
	bne	.L8047E80	@cond_branch
	b	.L8048078
.L8047E80:
	b	.L80480CE
.L8047E82:
	bl	sub_8049168
	add	r0, r7, #0
	add	r0, r0, #0x7f
	mov	r4, #0x0
	strb	r4, [r0]
	ldr	r0, .L8047F74
	ldr	r0, [r0]
	ldr	r2, .L8047F74 + 4
	add	r1, r0, r2
	strb	r4, [r1]
	ldr	r3, .L8047F74 + 8
	add	r1, r0, r3
	strb	r4, [r1]
	ldr	r1, .L8047F74 + 12
	add	r0, r0, r1
	strb	r4, [r0]
	bl	sub_80600B4
	mov	r0, #0x0
	bl	allocSprite
	ldr	r5, .L8047F74 + 16
	str	r0, [r5]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r2, .L8047F74 + 20
	mov	sl, r2
	str	r0, [r2]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r6, .L8047F74 + 24
	str	r0, [r6]
	ldr	r1, .L8047F74 + 28
	mov	r0, #0xa0
	lsl	r0, r0, #0x5
	str	r0, [r1]
	ldr	r0, [r5]
	ldr	r3, .L8047F74 + 32
	mov	r8, r3
	mov	r5, #0x80
	lsl	r5, r5, #0x9
	mov	r1, #0xd8
	lsl	r1, r1, #0x6
	mov	r9, r1
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	mov	r1, r8
	add	r2, r5, #0
	mov	r3, r9
	bl	LoadSpriteSheet
	mov	r2, sl
	ldr	r0, [r2]
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	mov	r1, r8
	mov	r3, r9
	bl	LoadSpriteSheet
	ldr	r0, [r6]
	ldr	r1, .L8047F74 + 36
	mov	r2, #0xa0
	lsl	r2, r2, #0x9
	mov	r3, #0x80
	lsl	r3, r3, #0x7
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
	ldr	r1, [r6]
	mov	r0, #0x8
	strh	r0, [r1, #0x18]
	ldr	r0, .L8047F74 + 40
	str	r4, [r0]
	ldr	r0, .L8047F74 + 44
	str	r5, [r0]
	mov	r3, #0x94
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	NEG	r5, r5
	add	r1, r5, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r5, .L8047F74 + 48
	ldr	r1, .L8047F74 + 52
	ldr	r2, .L8047F74 + 56
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	mov	r0, #0x69
	str	r0, [sp]
	mov	r0, #0xc8
	str	r0, [sp, #0x4]
	mov	r0, #0x2
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	bl	allocFont
	ldr	r4, .L8047F74 + 60
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xf
	bl	sub_8061660
	b	.L80480CE
.L8047F72:
	.align	2, 0
.L8047F74:
	.4byte	_gameData
	.4byte	0x1618
	.4byte	0x1619
	.4byte	0x161a
	.4byte	_unk3000568
	.4byte	_unk300056C
	.4byte	_unk3000570
	.4byte	_unk3000574
	.4byte	SpriteSheet_8251F40
	.4byte	SpriteSheet_8252994
	.4byte	_unk3000578
	.4byte	_unk300057C
	.4byte	_unk3000580
	.4byte	SpriteSheet_82B05EC
	.4byte	ShadowFontMeta
	.4byte	_806E3B0
.L8047FB4:
	ldr	r5, .L804805C
	ldr	r4, [r5]
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	bl	sub_80439A0
	ldr	r6, .L804805C + 4
	ldr	r0, [r6]
	sub	r0, r0, r4
	asr	r0, r0, #0x2
	add	r4, r4, r0
	lsl	r4, r4, #0x8
	asr	r4, r4, #0x10
	add	r0, r5, #0
	add	r1, r4, #0
	mov	r2, #0x69
	bl	sub_8061844
	ldr	r0, .L804805C + 8
	ldr	r3, [r0]
	ldr	r2, [r6]
	ldr	r1, [r3, #0x8]
	sub	r0, r2, r1
	mov	r4, #0x80
	lsl	r4, r4, #0x3
	add	r0, r0, r4
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r3, #0x8]
	ldr	r0, .L804805C + 12
	ldr	r3, [r0]
	ldr	r1, [r3, #0x8]
	sub	r0, r2, r1
	mov	r4, #0x84
	lsl	r4, r4, #0x8
	add	r0, r0, r4
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r3, #0x8]
	ldr	r6, .L804805C + 16
	ldr	r1, [r6]
	ldr	r0, [r1, #0x8]
	sub	r2, r2, r0
	mov	r3, #0x88
	lsl	r3, r3, #0x7
	add	r2, r2, r3
	asr	r2, r2, #0x2
	add	r0, r0, r2
	str	r0, [r1, #0x8]
	ldr	r0, .L804805C + 20
	ldr	r5, .L804805C + 24
	ldr	r4, [r0]
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
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0xf
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L80480CE	@cond_branch
	ldr	r1, [r6]
	ldrh	r0, [r1, #0x18]
	add	r0, r0, #0x1
	strh	r0, [r1, #0x18]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0xa
	bls	.L80480CE	@cond_branch
	mov	r0, #0x8
	strh	r0, [r1, #0x18]
	b	.L80480CE
.L804805C:
	.align	2, 0

	.4byte	_unk3000580
	.4byte	_unk3000574
	.4byte	_unk3000568
	.4byte	_unk300056C
	.4byte	_unk3000570
	.4byte	_unk3000578
	.4byte	_unk300057C
.L8048078:
	ldr	r0, .L80480A4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8048084	@cond_branch
	bl	sub_8060A94
.L8048084:
	ldr	r0, .L80480A4 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8048090	@cond_branch
	bl	sub_8060A94
.L8048090:
	ldr	r0, .L80480A4 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804809C	@cond_branch
	bl	sub_8060A94
.L804809C:
	ldr	r0, .L80480A4 + 12
	bl	sub_8061204
	b	.L80480CE
.L80480A4:
	.align	2, 0

	.4byte	_unk3000568
	.4byte	_unk300056C
	.4byte	_unk3000570
	.4byte	_unk3000580
.L80480B4:
	ldr	r0, .L80480E0
	ldrh	r0, [r0]
	cmp	r0, #0x1
	bne	.L80480CE	@cond_branch
	ldr	r0, .L80480E0 + 4
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L80480E0 + 8
	str	r1, [r0]
	mov	r0, #0xa
	bl	sub_80490F8
.L80480CE:
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80480DE:
	.align	2, 0
.L80480E0:
	.4byte	_unk3005DA0
	.4byte	_unk3000574
	.4byte	_unk3000578
	thumb_func_end sub_8047E5C

.align 2, 0 @ Don't pad with nop.
