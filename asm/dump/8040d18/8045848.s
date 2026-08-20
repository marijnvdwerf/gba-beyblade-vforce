	.include "asm/common.inc"

	thumb_func_start sub_8045848
sub_8045848:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L8045934	@cond_branch
	cmp	r1, #0x1
	bcc	.L8045862	@cond_branch
	cmp	r1, #0x2
	bne	.L804585C	@cond_branch
	b	.L80459E0
.L804585C:
	cmp	r1, #0x7
	beq	.L8045904	@cond_branch
	b	.L8045A72
.L8045862:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80458E8
	str	r4, [r0]
	cmp	r4, #0
	beq	.L804588A	@cond_branch
	ldr	r1, .L80458E8 + 4
	ldr	r2, .L80458E8 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L804588A:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L80458E8 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L80458B6	@cond_branch
	ldr	r1, .L80458E8 + 4
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
.L80458B6:
	ldr	r1, .L80458E8 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L80458E8 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L80458E8 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	bl	sub_8049168
	b	.L8045A72
.L80458E6:
	.align	2, 0
.L80458E8:
	.4byte	_unk30003A8
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk30003AC
	.4byte	_unk30003B0
	.4byte	_unk30003B4
	.4byte	_80693DC
.L8045904:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L804592C
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804591A	@cond_branch
	bl	sub_8060A94
.L804591A:
	ldr	r0, .L804592C + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8045924	@cond_branch
	b	.L8045A72
.L8045924:
	bl	sub_8060A94
	b	.L8045A72
.L804592A:
	.align	2, 0
.L804592C:
	.4byte	_unk30003A8
	.4byte	_unk30003AC
.L8045934:
	ldr	r5, .L80459C0
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8045960	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L80459C0 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L80459C0 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8045960:
	ldr	r5, .L80459C0 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804598C	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L80459C0 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L80459C0 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L804598C:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	add	r0, r4, #0
	bl	sub_8050C18
	ldr	r0, .L80459C0 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8045A72	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80459D8	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L8045A72
.L80459BE:
	.align	2, 0
.L80459C0:
	.4byte	_unk30003A8
	.4byte	_unk30003B0
	.4byte	Unk_874CC3C
	.4byte	_unk30003AC
	.4byte	_unk30003B4
	.4byte	_unk3005DA0
.L80459D8:
	add	r0, r4, #0
	bl	sub_8050E80
	b	.L8045A72
.L80459E0:
	ldr	r1, .L8045A18
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8045A72	@cond_branch
	ldr	r1, .L8045A18 + 4
	ldr	r0, .L8045A18 + 8
	str	r0, [r1]
	ldr	r1, .L8045A18 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F98
	ldr	r4, .L8045A18 + 16
	add	r0, r6, r4
	ldr	r0, [r0]
	cmp	r0, #0x4
	bhi	.L8045A72	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L8045A18 + 20
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8045A18:
	.align	2, 0

	.4byte	_unk3005DA0
	.4byte	_unk30003B0
	.4byte	0xffff0000
	.4byte	_unk30003B4
	.4byte	0x4b4
	.4byte	.L8045A30
.L8045A30:
	.4byte	.L8045A44
	.4byte	.L8045A56
	.4byte	.L8045A52
	.4byte	.L8045A6C
	.4byte	.L8045A64
.L8045A44:
	mov	r0, #0x1
	bl	sub_8051798
	mov	r0, #0x19
	bl	sub_80490F8
	b	.L8045A72
.L8045A52:
	mov	r0, #0x1
	b	.L8045A58
.L8045A56:
	mov	r0, #0x4
.L8045A58:
	bl	sub_8051798
	mov	r0, #0xf
	bl	sub_80490F8
	b	.L8045A72
.L8045A64:
	mov	r0, #0x28
	bl	sub_80490F8
	b	.L8045A72
.L8045A6C:
	mov	r0, #0xc
	bl	sub_80490F8
.L8045A72:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8045848

.align 2, 0 @ Don't pad with nop.
