	.include "asm/common.inc"

	thumb_func_start sub_8046814
sub_8046814:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	add	r4, r1, #0
	cmp	r4, #0x1
	beq	.L8046900	@cond_branch
	cmp	r4, #0x1
	bcc	.L8046830	@cond_branch
	cmp	r4, #0x2
	bne	.L804682A	@cond_branch
	b	.L8046984
.L804682A:
	cmp	r4, #0x7
	beq	.L80468D0	@cond_branch
	b	.L8046A04
.L8046830:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80468B4
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8046858	@cond_branch
	ldr	r1, .L80468B4 + 4
	ldr	r2, .L80468B4 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8046858:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L80468B4 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8046884	@cond_branch
	ldr	r1, .L80468B4 + 4
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
.L8046884:
	ldr	r1, .L80468B4 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L80468B4 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L80468B4 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	bl	sub_8049168
	b	.L8046A04
.L80468B4:
	.align	2, 0

	.4byte	_unk30004A4
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk30004A8
	.4byte	_unk30004AC
	.4byte	_unk30004B0
	.4byte	_8069108
.L80468D0:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L80468F8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80468E6	@cond_branch
	bl	sub_8060A94
.L80468E6:
	ldr	r0, .L80468F8 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L80468F0	@cond_branch
	b	.L8046A04
.L80468F0:
	bl	sub_8060A94
	b	.L8046A04
.L80468F6:
	.align	2, 0
.L80468F8:
	.4byte	_unk30004A4
	.4byte	_unk30004A8
.L8046900:
	ldr	r5, .L8046970
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L804692C	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8046970 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8046970 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L804692C:
	ldr	r5, .L8046970 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8046958	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8046970 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8046970 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8046958:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050C18
	b	.L8046A04
.L804696E:
	.align	2, 0
.L8046970:
	.4byte	_unk30004A4
	.4byte	_unk30004AC
	.4byte	Unk_874CC3C
	.4byte	_unk30004A8
	.4byte	_unk30004B0
.L8046984:
	ldr	r5, .L80469E8
	mov	r0, #0x20
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804699A	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F0C
.L804699A:
	mov	r0, #0x10
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80469AE	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050E80
.L80469AE:
	ldrh	r0, [r5]
	and	r4, r4, r0
	cmp	r4, #0
	beq	.L80469C8	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050FC8
	ldr	r0, .L80469E8 + 4
	ldr	r0, [r0]
	bl	sub_80490F8
.L80469C8:
	mov	r0, #0x1
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L8046A04	@cond_branch
	ldr	r4, .L80469E8 + 8
	add	r0, r6, r4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80469F4	@cond_branch
	ldr	r0, .L80469E8 + 4
	ldr	r0, [r0]
	bl	sub_80490F8
	b	.L80469FA
.L80469E6:
	.align	2, 0
.L80469E8:
	.4byte	_unk3005DA0
	.4byte	_unk3000648
	.4byte	0x4b4
.L80469F4:
	mov	r0, #0x18
	bl	sub_80490F8
.L80469FA:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F98
.L8046A04:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8046814

.align 2, 0 @ Don't pad with nop.
