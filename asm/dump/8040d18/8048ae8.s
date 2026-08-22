	.include "asm/common.inc"

	thumb_func_start sub_8048AE8
sub_8048AE8:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x8
	bls	.L8048AF4	@cond_branch
	b	.L8048D5E
.L8048AF4:
	lsl	r0, r1, #0x2
	ldr	r1, .L8048B00
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8048AFE:
	.align	2, 0
.L8048B00:
	.4byte	.L8048B04
.L8048B04:
	.4byte	.L8048B28
	.4byte	.L8048C44
	.4byte	.L8048C98
	.4byte	.L8048D5E
	.4byte	.L8048D5E
	.4byte	.L8048D5E
	.4byte	.L8048D5E
	.4byte	.L8048C1C
	.4byte	.L8048C88
.L8048B28:
	mov	r0, #0x0
	bl	allocSprite
	ldr	r6, .L8048BF0
	str	r0, [r6]
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r6, #0x4]
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r6, #0x8]
	ldr	r4, [r6]
	cmp	r4, #0
	beq	.L8048B62	@cond_branch
	ldr	r1, .L8048BF0 + 4
	mov	r2, #0x80
	lsl	r2, r2, #0x9
	mov	r3, #0x80
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8048B62:
	ldr	r4, [r6, #0x4]
	cmp	r4, #0
	beq	.L8048B82	@cond_branch
	ldr	r1, .L8048BF0 + 4
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0x80
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8048B82:
	ldr	r4, [r6, #0x8]
	cmp	r4, #0
	beq	.L8048BA2	@cond_branch
	ldr	r1, .L8048BF0 + 8
	mov	r2, #0xa0
	lsl	r2, r2, #0x9
	mov	r3, #0x94
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8048BA2:
	mov	r4, #0x0
	mov	r5, #0x0
	mov	r0, #0x1
	strh	r0, [r6, #0xc]
	strh	r5, [r6, #0xe]
	bl	sub_8049168
	ldr	r1, .L8048BF0 + 12
	mov	r0, #0x40
	strh	r0, [r1]
	ldr	r0, .L8048BF0 + 16
	strb	r4, [r0]
	ldr	r0, .L8048BF0 + 20
	ldr	r0, [r0]
	ldr	r2, .L8048BF0 + 24
	add	r1, r0, r2
	strb	r4, [r1]
	add	r2, r2, #0x1
	add	r1, r0, r2
	strb	r4, [r1]
	ldr	r1, .L8048BF0 + 28
	add	r0, r0, r1
	strb	r4, [r0]
	ldr	r0, .L8048BF0 + 32
	strh	r5, [r0]
	ldr	r0, .L8048BF0 + 36
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L8048BF0 + 40
	str	r5, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	neg	r1, r1
	mov	r2, #0x0
	bl	sub_80596AC
	b	.L8048D5E
.L8048BF0:
	.align	2, 0

	.4byte	_unk30005F0
	.4byte	SpriteSheet_8251F40
	.4byte	SpriteSheet_8252994
	.4byte	_unk30005E2
	.4byte	_unk30005EC
	.4byte	_gameData
	.4byte	0x1618
	.4byte	0x161a
	.4byte	_unk30005E0
	.4byte	_unk30005E8
	.4byte	_unk30005E4
.L8048C1C:
	ldr	r4, .L8048C40
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8048C28	@cond_branch
	bl	sub_8060A94
.L8048C28:
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	beq	.L8048C32	@cond_branch
	bl	sub_8060A94
.L8048C32:
	ldr	r0, [r4, #0x8]
	cmp	r0, #0
	bne	.L8048C3A	@cond_branch
	b	.L8048D5E
.L8048C3A:
	bl	sub_8060A94
	b	.L8048D5E
.L8048C40:
	.align	2, 0

	.4byte	_unk30005F0
.L8048C44:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	bl	sub_80439A0
	ldr	r0, .L8048C7C
	ldr	r5, .L8048C7C + 4
	ldr	r4, [r0]
	ldr	r0, [r5]
	cmp	r4, r0
	beq	.L8048C72	@cond_branch
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	neg	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
.L8048C72:
	ldr	r0, .L8048C7C + 8
	ldr	r1, [r5]
	bl	sub_8048A74
	b	.L8048D5E
.L8048C7C:
	.align	2, 0

	.4byte	_unk30005E4
	.4byte	_unk30005E8
	.4byte	_unk30005F0
.L8048C88:
	cmp	r2, #0x1
	bne	.L8048D5E	@cond_branch
	ldr	r0, .L8048C94
	strb	r2, [r0]
	b	.L8048D5E
.L8048C92:
	.align	2, 0
.L8048C94:
	.4byte	_unk30005EC
.L8048C98:
	add	r0, r7, #0
	add	r0, r0, #0x7f
	mov	r1, #0x1
	strb	r1, [r0]
	ldr	r1, .L8048D68
	add	r5, r0, #0
	ldrh	r1, [r1]
	cmp	r1, #0x2
	bne	.L8048CD2	@cond_branch
	ldr	r0, .L8048D68 + 4
	ldr	r0, [r0]
	ldr	r1, .L8048D68 + 8
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8048CD2	@cond_branch
	strb	r0, [r5]
	bl	sub_80600B4
	mov	r0, #0xa
	bl	sub_80490F8
	mov	r0, #0x9
	bl	sub_804ABFC
	ldr	r1, .L8048D68 + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L8048CD2:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8048D2E	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8048D2E	@cond_branch
	ldr	r4, .L8048D68 + 16
	mov	r3, #0x0
	mov	r0, #0x2
	strh	r0, [r4, #0xc]
	ldr	r2, .L8048D68 + 4
	ldr	r0, [r2]
	ldr	r1, .L8048D68 + 8
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
	ldr	r0, [r2]
	ldr	r2, .L8048D68 + 20
	add	r0, r0, r2
	strb	r3, [r0]
	ldr	r1, .L8048D68 + 24
	ldrh	r0, [r1]
	cmp	r0, #0x40
	bne	.L8048D0E	@cond_branch
	mov	r0, #0x0
	strh	r0, [r4, #0xe]
.L8048D0E:
	ldrh	r0, [r1]
	sub	r0, r0, #0x1
	strh	r0, [r1]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L8048D2E	@cond_branch
	mov	r0, #0x20
	bl	sub_80490F8
	mov	r0, #0x8
	bl	sub_804ABFC
	ldr	r1, .L8048D68 + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L8048D2E:
	ldr	r0, .L8048D68 + 28
	ldrh	r1, [r0]
	add	r1, r1, #0x1
	strh	r1, [r0]
	lsl	r1, r1, #0x10
	ldr	r0, .L8048D68 + 32
	cmp	r1, r0
	bls	.L8048D5E	@cond_branch
	mov	r1, #0x0
	strb	r1, [r5]
	ldr	r0, .L8048D68 + 4
	ldr	r0, [r0]
	ldr	r2, .L8048D68 + 8
	add	r0, r0, r2
	strb	r1, [r0]
	bl	sub_80600B4
	mov	r0, #0x1e
	bl	sub_80490F8
	ldr	r1, .L8048D68 + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L8048D5E:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8048D66:
	.align	2, 0
.L8048D68:
	.4byte	_unk3005DA0
	.4byte	_gameData
	.4byte	0x1618
	.4byte	_unk30005E4
	.4byte	_unk30005F0
	.4byte	0x1619
	.4byte	_unk30005E2
	.4byte	_unk30005E0
	.4byte	0x3e70000
	thumb_func_end sub_8048AE8

.align 2, 0 @ Don't pad with nop.
