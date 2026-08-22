	.include "asm/common.inc"

	thumb_func_start sub_8046CC4
sub_8046CC4:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	add	r4, r1, #0
	cmp	r4, #0x1
	bne	.L8046CD2	@cond_branch
	b	.L8046E00
.L8046CD2:
	cmp	r4, #0x1
	bcc	.L8046CE2	@cond_branch
	cmp	r4, #0x2
	bne	.L8046CDC	@cond_branch
	b	.L8046E84
.L8046CDC:
	cmp	r4, #0x7
	beq	.L8046DD0	@cond_branch
	b	.L8046F22
.L8046CE2:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L8046D80
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8046D0A	@cond_branch
	ldr	r1, .L8046D80 + 4
	ldr	r2, .L8046D80 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8046D0A:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L8046D80 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8046D36	@cond_branch
	ldr	r1, .L8046D80 + 4
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
.L8046D36:
	ldr	r1, .L8046D80 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L8046D80 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	bl	sub_80515E0
	ldr	r1, .L8046D80 + 24
	strb	r0, [r1]
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8046DA0	@cond_branch
	bl	sub_8051558
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8046DA0	@cond_branch
	bl	sub_8051618
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	asr	r2, r2, #0x1f
	mov	r0, #0x2
	and	r2, r2, r0
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	ldr	r1, .L8046D80 + 28
	bl	newIconMenu
	b	.L8046DBA
.L8046D7E:
	.align	2, 0
.L8046D80:
	.4byte	_unk30004D0
	.4byte	SpriteSheet_823BF04
	.4byte	0xffff0000
	.4byte	_unk30004D4
	.4byte	_unk30004D8
	.4byte	_unk30004DC
	.4byte	_unk30004E0
	.4byte	_806980C
.L8046DA0:
	bl	sub_8051618
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	neg	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	ldr	r1, .L8046DCC
	bl	newIconMenu
.L8046DBA:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	bl	sub_8050FEC
	b	.L8046F22
.L8046DCA:
	.align	2, 0
.L8046DCC:
	.4byte	_8069830
.L8046DD0:
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8051028
	ldr	r0, .L8046DF8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8046DE6	@cond_branch
	bl	sub_8060A94
.L8046DE6:
	ldr	r0, .L8046DF8 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8046DF0	@cond_branch
	b	.L8046F22
.L8046DF0:
	bl	sub_8060A94
	b	.L8046F22
.L8046DF6:
	.align	2, 0
.L8046DF8:
	.4byte	_unk30004D0
	.4byte	_unk30004D4
.L8046E00:
	ldr	r5, .L8046E70
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8046E2C	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8046E70 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8046E70 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8046E2C:
	ldr	r5, .L8046E70 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L8046E58	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L8046E70 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L8046E70 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L8046E58:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050C18
	b	.L8046F22
.L8046E6E:
	.align	2, 0
.L8046E70:
	.4byte	_unk30004D0
	.4byte	_unk30004D8
	.4byte	Unk_874CC3C
	.4byte	_unk30004D4
	.4byte	_unk30004DC
.L8046E84:
	ldr	r5, .L8046F0C
	mov	r0, #0x20
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046E9A	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F0C
.L8046E9A:
	mov	r0, #0x10
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046EAE	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050E80
.L8046EAE:
	ldrh	r0, [r5]
	and	r4, r4, r0
	cmp	r4, #0
	beq	.L8046EC4	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050FC8
	bl	sub_8049178
.L8046EC4:
	mov	r0, #0x1
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L8046F22	@cond_branch
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050F98
	ldr	r0, .L8046F0C + 4
	add	r4, r6, r0
	ldr	r0, [r4]
	cmp	r0, #0x2
	bne	.L8046EE6	@cond_branch
	bl	sub_8051488
.L8046EE6:
	ldr	r0, [r4]
	cmp	r0, #0x1
	bne	.L8046EF0	@cond_branch
	bl	sub_80510FC
.L8046EF0:
	ldr	r0, .L8046F0C + 8
	ldr	r0, [r0]
	ldr	r1, .L8046F0C + 12
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046F1C	@cond_branch
	mov	r0, #0xf
	bl	sub_80490F8
	b	.L8046F22
.L8046F0A:
	.align	2, 0
.L8046F0C:
	.4byte	_unk3005DA0
	.4byte	0x4b4
	.4byte	_currentGameState
	.4byte	0xc64
.L8046F1C:
	mov	r0, #0x1b
	bl	sub_80490F8
.L8046F22:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8046CC4

.align 2, 0 @ Don't pad with nop.
