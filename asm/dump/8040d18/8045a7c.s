	.include "asm/common.inc"

	thumb_func_start sub_8045A7C
sub_8045A7C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L8045B64	@cond_branch
	cmp	r1, #0x1
	bcc	.L8045A96	@cond_branch
	cmp	r1, #0x2
	bne	.L8045A90	@cond_branch
	b	.L8045C10
.L8045A90:
	cmp	r1, #0x7
	beq	.L8045B34	@cond_branch
	b	.L8045CAC
.L8045A96:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8045B18
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8045ABE	@cond_branch
	ldr	r1, .L8045B18 + 4
	ldr	r2, .L8045B18 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8045ABE:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L8045B18 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8045AEA	@cond_branch
	ldr	r1, .L8045B18 + 4
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
.L8045AEA:
	ldr	r1, .L8045B18 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L8045B18 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L8045B18 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	b	.L8045CAC
.L8045B16:
	.align	2, 0
.L8045B18:
	.4byte	_unk30003B8
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk30003BC
	.4byte	_unk30003C0
	.4byte	_unk30003C4
	.4byte	_8069428
.L8045B34:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L8045B5C
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8045B4A	@cond_branch
	bl	sub_8060A94
.L8045B4A:
	ldr	r0, .L8045B5C + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8045B54	@cond_branch
	b	.L8045CAC
.L8045B54:
	bl	sub_8060A94
	b	.L8045CAC
.L8045B5A:
	.align	2, 0
.L8045B5C:
	.4byte	_unk30003B8
	.4byte	_unk30003BC
.L8045B64:
	ldr	r5, .L8045BF0
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8045B90	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8045BF0 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8045BF0 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8045B90:
	ldr	r5, .L8045BF0 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8045BBC	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8045BF0 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8045BF0 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8045BBC:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	add	r0, r4, #0
	bl	sub_8050C18
	ldr	r0, .L8045BF0 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8045CAC	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8045C08	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L8045CAC
.L8045BEE:
	.align	2, 0
.L8045BF0:
	.4byte	_unk30003B8
	.4byte	_unk30003C0
	.4byte	Unk_874CC3C
	.4byte	_unk30003BC
	.4byte	_unk30003C4
	.4byte	_unk3005DA0
.L8045C08:
	add	r0, r4, #0
	bl	sub_8050E80
	b	.L8045CAC
.L8045C10:
	ldr	r4, .L8045C70
	ldrh	r0, [r4]
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L8045C38	@cond_branch
	ldr	r1, .L8045C70 + 4
	ldr	r0, .L8045C70 + 8
	str	r0, [r1]
	ldr	r1, .L8045C70 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050FC8
	mov	r0, #0xa
	bl	sub_80490F8
.L8045C38:
	mov	r0, #0x1
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L8045CAC	@cond_branch
	ldr	r1, .L8045C70 + 4
	ldr	r0, .L8045C70 + 8
	str	r0, [r1]
	ldr	r1, .L8045C70 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050F98
	ldr	r1, .L8045C70 + 16
	add	r0, r6, r1
	ldr	r0, [r0]
	cmp	r0, #0x1
	beq	.L8045C96	@cond_branch
	cmp	r0, #0x1
	bgt	.L8045C84	@cond_branch
	cmp	r0, #0
	beq	.L8045C8E	@cond_branch
	b	.L8045CAC
.L8045C6E:
	.align	2, 0
.L8045C70:
	.4byte	_unk3005DA0
	.4byte	_unk30003C0
	.4byte	0xffff0000
	.4byte	_unk30003C4
	.4byte	0x4b4
.L8045C84:
	cmp	r0, #0x2
	beq	.L8045C9E	@cond_branch
	cmp	r0, #0x3
	beq	.L8045CA6	@cond_branch
	b	.L8045CAC
.L8045C8E:
	mov	r0, #0xd
	bl	sub_80490F8
	b	.L8045CAC
.L8045C96:
	mov	r0, #0x29
	bl	sub_80490F8
	b	.L8045CAC
.L8045C9E:
	mov	r0, #0x1a
	bl	sub_80490F8
	b	.L8045CAC
.L8045CA6:
	mov	r0, #0xe
	bl	sub_80490F8
.L8045CAC:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8045A7C

.align 2, 0 @ Don't pad with nop.
