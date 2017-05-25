	.include "asm/common.inc"

	thumb_func_start sub_8046814
sub_8046814:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	add	r4, r1, #0
	cmp	r4, #0x1
	beq	.L1	@cond_branch
	cmp	r4, #0x1
	bcc	.L2	@cond_branch
	cmp	r4, #0x2
	bne	.L3	@cond_branch
	b	.L4
.L3:
	cmp	r4, #0x7
	beq	.L5	@cond_branch
	b	.L26
.L2:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L10
	str	r4, [r0]
	cmp	r4, #0
	beq	.L7	@cond_branch
	ldr	r1, .L10 + 4
	ldr	r2, .L10 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L7:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L10 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8	@cond_branch
	ldr	r1, .L10 + 4
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
.L8:
	ldr	r1, .L10 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L10 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r1, .L10 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	bl	sub_8049168
	b	.L26
.L11:
	.align	2, 0
.L10:
	.4byte	0x30004a4
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x30004a8
	.4byte	0x30004ac
	.4byte	0x30004b0
	.4byte	0x8069108
.L5:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L16
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L12	@cond_branch
	bl	sub_8060A94
.L12:
	ldr	r0, .L16 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L13	@cond_branch
	b	.L26
.L13:
	bl	sub_8060A94
	b	.L26
.L17:
	.align	2, 0
.L16:
	.4byte	0x30004a4
	.4byte	0x30004a8
.L1:
	ldr	r5, .L21
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L18	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L21 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L21 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L18:
	ldr	r5, .L21 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L19	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L21 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L21 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L19:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050C18
	b	.L26
.L22:
	.align	2, 0
.L21:
	.4byte	0x30004a4
	.4byte	0x30004ac
	.4byte	0x874cc3c
	.4byte	0x30004a8
	.4byte	0x30004b0
.L4:
	ldr	r5, .L29
	mov	r0, #0x20
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L23	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F0C
.L23:
	mov	r0, #0x10
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L24	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050E80
.L24:
	ldrh	r0, [r5]
	and	r4, r4, r0
	cmp	r4, #0
	beq	.L25	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050FC8
	ldr	r0, .L29 + 4
	ldr	r0, [r0]
	bl	sub_80490F8
.L25:
	mov	r0, #0x1
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L26	@cond_branch
	ldr	r4, .L29 + 8
	add	r0, r6, r4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L27	@cond_branch
	ldr	r0, .L29 + 4
	ldr	r0, [r0]
	bl	sub_80490F8
	b	.L28
.L30:
	.align	2, 0
.L29:
	.4byte	0x3005da0
	.4byte	0x3000648
	.4byte	0x4b4
.L27:
	mov	r0, #0x18
	bl	sub_80490F8
.L28:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F98
.L26:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8046814

.align 2, 0 @ Don't pad with nop.
