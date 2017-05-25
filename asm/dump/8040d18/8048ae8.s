	.include "asm/common.inc"

	thumb_func_start sub_8048AE8
sub_8048AE8:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x8
	bls	.L1	@cond_branch
	b	.L42
.L1:
	lsl	r0, r1, #0x2
	ldr	r1, .L4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L5:
	.align	2, 0
.L4:
	.4byte	.L3
.L3:
	.4byte	.L6
	.4byte	.L7
	.4byte	.L8
	.4byte	.L42
	.4byte	.L42
	.4byte	.L42
	.4byte	.L42
	.4byte	.L13
	.4byte	.L14
.L6:
	mov	r0, #0x0
	bl	allocSprite
	ldr	r6, .L19
	str	r0, [r6]
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r6, #0x4]
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r6, #0x8]
	ldr	r4, [r6]
	cmp	r4, #0
	beq	.L15	@cond_branch
	ldr	r1, .L19 + 4
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
.L15:
	ldr	r4, [r6, #0x4]
	cmp	r4, #0
	beq	.L16	@cond_branch
	ldr	r1, .L19 + 4
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
.L16:
	ldr	r4, [r6, #0x8]
	cmp	r4, #0
	beq	.L17	@cond_branch
	ldr	r1, .L19 + 8
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
.L17:
	mov	r4, #0x0
	mov	r5, #0x0
	mov	r0, #0x1
	strh	r0, [r6, #0xc]
	strh	r5, [r6, #0xe]
	bl	sub_8049168
	ldr	r1, .L19 + 12
	mov	r0, #0x40
	strh	r0, [r1]
	ldr	r0, .L19 + 16
	strb	r4, [r0]
	ldr	r0, .L19 + 20
	ldr	r0, [r0]
	ldr	r2, .L19 + 24
	add	r1, r0, r2
	strb	r4, [r1]
	add	r2, r2, #0x1
	add	r1, r0, r2
	strb	r4, [r1]
	ldr	r1, .L19 + 28
	add	r0, r0, r1
	strb	r4, [r0]
	ldr	r0, .L19 + 32
	strh	r5, [r0]
	ldr	r0, .L19 + 36
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L19 + 40
	str	r5, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	NEG	r1, r1
	mov	r2, #0x0
	bl	sub_80596AC
	b	.L42
.L20:
	.align	2, 0
.L19:
	.4byte	0x30005f0
	.4byte	0x8251f40
	.4byte	0x8252994
	.4byte	0x30005e2
	.4byte	0x30005ec
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x161a
	.4byte	0x30005e0
	.4byte	0x30005e8
	.4byte	0x30005e4
.L13:
	ldr	r4, .L26
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L21	@cond_branch
	bl	sub_8060A94
.L21:
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	beq	.L22	@cond_branch
	bl	sub_8060A94
.L22:
	ldr	r0, [r4, #0x8]
	cmp	r0, #0
	bne	.L23	@cond_branch
	b	.L42
.L23:
	bl	sub_8060A94
	b	.L42
.L27:
	.align	2, 0
.L26:
	.4byte	0x30005f0
.L7:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	bl	sub_80439A0
	ldr	r0, .L30
	ldr	r5, .L30 + 4
	ldr	r4, [r0]
	ldr	r0, [r5]
	cmp	r4, r0
	beq	.L28	@cond_branch
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
.L28:
	ldr	r0, .L30 + 8
	ldr	r1, [r5]
	bl	sub_8048A74
	b	.L42
.L31:
	.align	2, 0
.L30:
	.4byte	0x30005e4
	.4byte	0x30005e8
	.4byte	0x30005f0
.L14:
	cmp	r2, #0x1
	bne	.L42	@cond_branch
	ldr	r0, .L34
	strb	r2, [r0]
	b	.L42
.L35:
	.align	2, 0
.L34:
	.4byte	0x30005ec
.L8:
	add	r0, r7, #0
	add	r0, r0, #0x7f
	mov	r1, #0x1
	strb	r1, [r0]
	ldr	r1, .L43
	add	r5, r0, #0
	ldrh	r1, [r1]
	cmp	r1, #0x2
	bne	.L37	@cond_branch
	ldr	r0, .L43 + 4
	ldr	r0, [r0]
	ldr	r1, .L43 + 8
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L37	@cond_branch
	strb	r0, [r5]
	bl	sub_80600B4
	mov	r0, #0xa
	bl	sub_80490F8
	mov	r0, #0x9
	bl	sub_804ABFC
	ldr	r1, .L43 + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L37:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L41	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L41	@cond_branch
	ldr	r4, .L43 + 16
	mov	r3, #0x0
	mov	r0, #0x2
	strh	r0, [r4, #0xc]
	ldr	r2, .L43 + 4
	ldr	r0, [r2]
	ldr	r1, .L43 + 8
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
	ldr	r0, [r2]
	ldr	r2, .L43 + 20
	add	r0, r0, r2
	strb	r3, [r0]
	ldr	r1, .L43 + 24
	ldrh	r0, [r1]
	cmp	r0, #0x40
	bne	.L40	@cond_branch
	mov	r0, #0x0
	strh	r0, [r4, #0xe]
.L40:
	ldrh	r0, [r1]
	sub	r0, r0, #0x1
	strh	r0, [r1]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L41	@cond_branch
	mov	r0, #0x20
	bl	sub_80490F8
	mov	r0, #0x8
	bl	sub_804ABFC
	ldr	r1, .L43 + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L41:
	ldr	r0, .L43 + 28
	ldrh	r1, [r0]
	add	r1, r1, #0x1
	strh	r1, [r0]
	lsl	r1, r1, #0x10
	ldr	r0, .L43 + 32
	cmp	r1, r0
	bls	.L42	@cond_branch
	mov	r1, #0x0
	strb	r1, [r5]
	ldr	r0, .L43 + 4
	ldr	r0, [r0]
	ldr	r2, .L43 + 8
	add	r0, r0, r2
	strb	r1, [r0]
	bl	sub_80600B4
	mov	r0, #0x1e
	bl	sub_80490F8
	ldr	r1, .L43 + 12
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L42:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L44:
	.align	2, 0
.L43:
	.4byte	0x3005da0
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x30005e4
	.4byte	0x30005f0
	.4byte	0x1619
	.4byte	0x30005e2
	.4byte	0x30005e0
	.4byte	0x3e70000
	thumb_func_end sub_8048AE8

.align 2, 0 @ Don't pad with nop.
