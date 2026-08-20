	.include "asm/common.inc"

	thumb_func_start sub_8043AA0
sub_8043AA0:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L8043B94	@cond_branch
	cmp	r1, #0x1
	bcc	.L8043ABA	@cond_branch
	cmp	r1, #0x2
	bne	.L8043AB4	@cond_branch
	b	.L8043C5C
.L8043AB4:
	cmp	r1, #0x7
	beq	.L8043B64	@cond_branch
	b	.L8043CEA
.L8043ABA:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8043B44
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8043AE2	@cond_branch
	ldr	r1, .L8043B44 + 4
	ldr	r2, .L8043B44 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8043AE2:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L8043B44 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8043B0E	@cond_branch
	ldr	r1, .L8043B44 + 4
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
.L8043B0E:
	ldr	r1, .L8043B44 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L8043B44 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L8043B44 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	ldr	r1, .L8043B44 + 28
	mov	r0, #0x0
	str	r0, [r1]
	bl	sub_8049168
	b	.L8043CEA
.L8043B44:
	.align	2, 0

	.4byte	_unk3000158
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk300015C
	.4byte	_unk3000160
	.4byte	_unk3000164
	.4byte	_80689A4
	.4byte	_unk3000168
.L8043B64:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L8043B8C
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8043B7A	@cond_branch
	bl	sub_8060A94
.L8043B7A:
	ldr	r0, .L8043B8C + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8043B84	@cond_branch
	b	.L8043CEA
.L8043B84:
	bl	sub_8060A94
	b	.L8043CEA
.L8043B8A:
	.align	2, 0
.L8043B8C:
	.4byte	_unk3000158
	.4byte	_unk300015C
.L8043B94:
	ldr	r5, .L8043C20
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8043BC0	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8043C20 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8043C20 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8043BC0:
	ldr	r5, .L8043C20 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8043BEC	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8043C20 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8043C20 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8043BEC:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	add	r0, r4, #0
	bl	sub_8050C18
	ldr	r0, .L8043C20 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043C3E	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043C38	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L8043C3E
.L8043C1E:
	.align	2, 0
.L8043C20:
	.4byte	_unk3000158
	.4byte	_unk3000160
	.4byte	Unk_874CC3C
	.4byte	_unk300015C
	.4byte	_unk3000164
	.4byte	_unk3005DA0
.L8043C38:
	add	r0, r4, #0
	bl	sub_8050E80
.L8043C3E:
	ldr	r1, .L8043C58
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L8043CEA	@cond_branch
	sub	r0, r0, #0x1
	str	r0, [r1]
	cmp	r0, #0
	bne	.L8043CEA	@cond_branch
	mov	r0, #0x7
	bl	sub_80490F8
	b	.L8043CEA
.L8043C56:
	.align	2, 0
.L8043C58:
	.4byte	_unk3000168
.L8043C5C:
	ldr	r1, .L8043C9C
	mov	r0, #0x9
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043CEA	@cond_branch
	ldr	r0, .L8043C9C + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8043CEA	@cond_branch
	ldr	r1, .L8043C9C + 8
	ldr	r0, .L8043C9C + 12
	str	r0, [r1]
	ldr	r1, .L8043C9C + 16
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F98
	ldr	r1, .L8043C9C + 20
	add	r0, r6, r1
	ldr	r0, [r0]
	cmp	r0, #0x4
	bhi	.L8043CDE	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L8043C9C + 24
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8043C9C:
	.align	2, 0

	.4byte	_unk3005DA0
	.4byte	_unk3000168
	.4byte	_unk3000160
	.4byte	0xffff0000
	.4byte	_unk3000164
	.4byte	0x4b4
	.4byte	.L8043CB8
.L8043CB8:
	.4byte	.L8043CCC
	.4byte	.L8043CD0
	.4byte	.L8043CD4
	.4byte	.L8043CD8
	.4byte	.L8043CDC
.L8043CCC:
	mov	r4, #0x0
	b	.L8043CDE
.L8043CD0:
	mov	r4, #0x3
	b	.L8043CDE
.L8043CD4:
	mov	r4, #0x4
	b	.L8043CDE
.L8043CD8:
	mov	r4, #0x5
	b	.L8043CDE
.L8043CDC:
	mov	r4, #0x7
.L8043CDE:
	add	r0, r4, #0
	bl	sub_8063A7C
	ldr	r1, .L8043CF4
	mov	r0, #0x20
	str	r0, [r1]
.L8043CEA:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8043CF2:
	.align	2, 0
.L8043CF4:
	.4byte	_unk3000168
	thumb_func_end sub_8043AA0

.align 2, 0 @ Don't pad with nop.
