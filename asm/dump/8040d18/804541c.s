	.include "asm/common.inc"

	thumb_func_start sub_804541C
sub_804541C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	cmp	r1, #0x2
	bne	.L3	@cond_branch
	b	.L4
.L3:
	cmp	r1, #0x7
	beq	.L5	@cond_branch
	b	.L39
.L2:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L11
	str	r4, [r0]
	cmp	r4, #0
	beq	.L7	@cond_branch
	ldr	r1, .L11 + 4
	ldr	r2, .L11 + 8
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
	ldr	r0, .L11 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8	@cond_branch
	ldr	r1, .L11 + 4
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
	ldr	r1, .L11 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L11 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	ldr	r5, .L11 + 24
	bl	sub_805162C
	lsl	r0, r0, #0x18
	mov	r2, #0x0
	cmp	r0, #0
	bne	.L9	@cond_branch
	mov	r2, #0x3
.L9:
	add	r0, r4, #0
	add	r1, r5, #0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	b	.L39
.L12:
	.align	2, 0
.L11:
	.4byte	0x300036c
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x3000370
	.4byte	0x3000374
	.4byte	0x3000378
	.4byte	0x80692a4
.L5:
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8051028
	ldr	r0, .L17
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L13	@cond_branch
	bl	sub_8060A94
.L13:
	ldr	r0, .L17 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L14	@cond_branch
	b	.L39
.L14:
	bl	sub_8060A94
	b	.L39
.L18:
	.align	2, 0
.L17:
	.4byte	0x300036c
	.4byte	0x3000370
.L1:
	ldr	r5, .L24
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L19	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L24 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L24 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L19:
	ldr	r5, .L24 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L20	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L24 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L24 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L20:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r6, r0
	add	r0, r4, #0
	bl	sub_8050C18
	ldr	r0, .L24 + 20
	ldrh	r1, [r0]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L39	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L22	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
	b	.L39
.L25:
	.align	2, 0
.L24:
	.4byte	0x300036c
	.4byte	0x3000374
	.4byte	0x874cc3c
	.4byte	0x3000370
	.4byte	0x3000378
	.4byte	0x3005da0
.L22:
	add	r0, r4, #0
	bl	sub_8050E80
	b	.L39
.L4:
	ldr	r1, .L32
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L39	@cond_branch
	ldr	r1, .L32 + 4
	ldr	r0, .L32 + 8
	str	r0, [r1]
	ldr	r1, .L32 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r1, #0x96
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_8050F98
	ldr	r4, .L32 + 16
	add	r0, r6, r4
	ldr	r0, [r0]
	cmp	r0, #0x1
	beq	.L28	@cond_branch
	cmp	r0, #0x1
	bgt	.L29	@cond_branch
	cmp	r0, #0
	beq	.L30	@cond_branch
	b	.L39
.L33:
	.align	2, 0
.L32:
	.4byte	0x3005da0
	.4byte	0x3000374
	.4byte	0xffff0000
	.4byte	0x3000378
	.4byte	0x4b4
.L29:
	cmp	r0, #0x2
	beq	.L34	@cond_branch
	cmp	r0, #0x3
	beq	.L35	@cond_branch
	b	.L39
.L30:
	mov	r0, #0x1b
	bl	sub_80490F8
	b	.L39
.L28:
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L39
.L34:
	mov	r0, #0x28
	bl	sub_80490F8
	b	.L39
.L35:
	mov	r0, #0x29
	bl	sub_80490F8
.L39:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804541C

.align 2, 0 @ Don't pad with nop.
