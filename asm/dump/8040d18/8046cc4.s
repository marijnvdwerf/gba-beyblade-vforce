	.include "asm/common.inc"

	thumb_func_start sub_8046CC4
sub_8046CC4:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	add	r4, r1, #0
	cmp	r4, #0x1
	bne	.L1	@cond_branch
	b	.L2
.L1:
	cmp	r4, #0x1
	bcc	.L3	@cond_branch
	cmp	r4, #0x2
	bne	.L4	@cond_branch
	b	.L5
.L4:
	cmp	r4, #0x7
	beq	.L6	@cond_branch
	b	.L36
.L3:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L13
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8	@cond_branch
	ldr	r1, .L13 + 4
	ldr	r2, .L13 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L13 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L9	@cond_branch
	ldr	r1, .L13 + 4
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
.L9:
	ldr	r1, .L13 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L13 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	bl	sub_80515E0
	ldr	r1, .L13 + 24
	strb	r0, [r1]
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L11	@cond_branch
	bl	sub_8051558
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L11	@cond_branch
	bl	sub_8051618
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	NEG	r2, r0
	orr	r2, r2, r0
	asr	r2, r2, #0x1f
	mov	r0, #0x2
	and	r2, r2, r0
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	ldr	r1, .L13 + 28
	bl	newIconMenu
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x30004d0
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x30004d4
	.4byte	0x30004d8
	.4byte	0x30004dc
	.4byte	0x30004e0
	.4byte	0x806980c
.L11:
	bl	sub_8051618
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	NEG	r2, r0
	orr	r2, r2, r0
	lsr	r2, r2, #0x1f
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	ldr	r1, .L16
	bl	newIconMenu
.L12:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	bl	sub_8050FEC
	b	.L36
.L17:
	.align	2, 0
.L16:
	.4byte	0x8069830
.L6:
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8051028
	ldr	r0, .L22
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L18	@cond_branch
	bl	sub_8060A94
.L18:
	ldr	r0, .L22 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L19	@cond_branch
	b	.L36
.L19:
	bl	sub_8060A94
	b	.L36
.L23:
	.align	2, 0
.L22:
	.4byte	0x30004d0
	.4byte	0x30004d4
.L2:
	ldr	r5, .L27
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L24	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L27 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L27 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L24:
	ldr	r5, .L27 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L25	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L27 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L27 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L25:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050C18
	b	.L36
.L28:
	.align	2, 0
.L27:
	.4byte	0x30004d0
	.4byte	0x30004d8
	.4byte	0x874cc3c
	.4byte	0x30004d4
	.4byte	0x30004dc
.L5:
	ldr	r5, .L37
	mov	r0, #0x20
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L29	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F0C
.L29:
	mov	r0, #0x10
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L30	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050E80
.L30:
	ldrh	r0, [r5]
	and	r4, r4, r0
	cmp	r4, #0
	beq	.L31	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050FC8
	bl	sub_8049178
.L31:
	mov	r0, #0x1
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L36	@cond_branch
	mov	r4, #0x96
	lsl	r4, r4, #0x3
	add	r0, r6, r4
	bl	sub_8050F98
	ldr	r0, .L37 + 4
	add	r4, r6, r0
	ldr	r0, [r4]
	cmp	r0, #0x2
	bne	.L33	@cond_branch
	bl	sub_8051488
.L33:
	ldr	r0, [r4]
	cmp	r0, #0x1
	bne	.L34	@cond_branch
	bl	sub_80510FC
.L34:
	ldr	r0, .L37 + 8
	ldr	r0, [r0]
	ldr	r1, .L37 + 12
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L35	@cond_branch
	mov	r0, #0xf
	bl	sub_80490F8
	b	.L36
.L38:
	.align	2, 0
.L37:
	.4byte	0x3005da0
	.4byte	0x4b4
	.4byte	0x3000f48
	.4byte	0xc64
.L35:
	mov	r0, #0x1b
	bl	sub_80490F8
.L36:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8046CC4

.align 2, 0 @ Don't pad with nop.
