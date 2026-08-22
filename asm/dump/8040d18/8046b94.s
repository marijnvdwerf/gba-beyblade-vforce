	.include "asm/common.inc"

	thumb_func_start sub_8046B94
sub_8046B94:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L8046BF4	@cond_branch
	cmp	r1, #0x1
	bcc	.L8046BA6	@cond_branch
	cmp	r1, #0x2
	beq	.L8046C74	@cond_branch
	b	.L8046CAE
.L8046BA6:
	ldr	r0, .L8046BD4
	ldr	r1, .L8046BD4 + 4
	str	r1, [r0]
	ldr	r0, .L8046BD4 + 8
	mov	r4, #0x0
	str	r4, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, .L8046BD4 + 12
	str	r4, [r0]
	bl	sub_804915C
	add	r1, r0, #0
	cmp	r1, #0xc
	bne	.L8046BE8	@cond_branch
	ldr	r0, .L8046BD4 + 16
	str	r1, [r0]
	b	.L8046CAE
.L8046BD2:
	.align	2, 0
.L8046BD4:
	.4byte	_unk30004C8
	.4byte	0xffff0000
	.4byte	_unk30004C4
	.4byte	_unk30004CC
	.4byte	_unk3000648
.L8046BE8:
	ldr	r1, .L8046BF0
	mov	r0, #0x15
	b	.L8046CAC
.L8046BEE:
	.align	2, 0
.L8046BF0:
	.4byte	_unk3000648
.L8046BF4:
	ldr	r7, .L8046C64
	ldr	r0, [r7]
	cmp	r0, #0x1
	bne	.L8046C1A	@cond_branch
	mov	r0, #0x0
	bl	sub_804A0E0
	add	r5, r0, #0
	ldr	r4, .L8046C64 + 4
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, #0x3c
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xf
	bl	sub_8061660
.L8046C1A:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r5, .L8046C64 + 8
	ldr	r1, [r5]
	asr	r1, r1, #0x8
	neg	r1, r1
	add	r1, r1, #0x10
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	mov	r2, #0x4a
	bl	sub_8061844
	ldr	r0, .L8046C64 + 12
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	ldr	r0, [r7]
	add	r0, r0, #0x1
	str	r0, [r7]
	b	.L8046CAE
.L8046C64:
	.align	2, 0

	.4byte	_unk30004CC
	.4byte	_806E0DC
	.4byte	_unk30004C8
	.4byte	_unk30004C4
.L8046C74:
	ldr	r1, .L8046CB4
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8046C8C	@cond_branch
	ldr	r0, .L8046CB4 + 4
	ldr	r1, [r0]
	mov	r0, #0x96
	lsl	r0, r0, #0x2
	cmp	r1, r0
	ble	.L8046C98	@cond_branch
.L8046C8C:
	mov	r0, #0x17
	bl	sub_80490F8
	ldr	r1, .L8046CB4 + 8
	ldr	r0, .L8046CB4 + 12
	str	r0, [r1]
.L8046C98:
	ldr	r1, .L8046CB4
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046CAE	@cond_branch
	bl	sub_8049178
	ldr	r1, .L8046CB4 + 8
	ldr	r0, .L8046CB4 + 12
.L8046CAC:
	str	r0, [r1]
.L8046CAE:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8046CB4:
	.align	2, 0

	.4byte	_unk3005DA0
	.4byte	_unk30004CC
	.4byte	_unk30004C4
	.4byte	0xffff0000
	thumb_func_end sub_8046B94

.align 2, 0 @ Don't pad with nop.
