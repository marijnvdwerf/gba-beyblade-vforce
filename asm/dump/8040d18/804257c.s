	.include "asm/common.inc"

	thumb_func_start sub_804257C
sub_804257C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
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
	.4byte	.L42
	.4byte	.L14
.L6:
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L16
	strb	r1, [r0]
	ldr	r0, .L16 + 4
	strb	r1, [r0]
	ldr	r0, .L16 + 8
	mov	r2, #0x0
	str	r2, [r0]
	ldr	r0, .L16 + 12
	str	r2, [r0]
	ldr	r0, .L16 + 16
	str	r2, [r0]
	ldr	r0, .L16 + 20
	mov	r1, #0x10
	str	r1, [r0]
	ldr	r0, .L16 + 24
	str	r1, [r0]
	ldr	r0, .L16 + 28
	str	r2, [r0]
	ldr	r1, .L16 + 32
	ldr	r3, .L16 + 36
	add	r0, r3, #0
	strh	r0, [r1]
	ldr	r0, .L16 + 40
	strh	r2, [r0]
	sub	r1, r1, #0x8
	mov	r0, #0xf0
	strh	r0, [r1]
	ldr	r0, .L16 + 44
	strh	r2, [r0]
	b	.L42
.L17:
	.align	2, 0
.L16:
	.4byte	0x30000dc
	.4byte	0x30000dd
	.4byte	0x30000e0
	.4byte	0x30000e4
	.4byte	0x30000e8
	.4byte	0x30000ec
	.4byte	0x30000f0
	.4byte	0x30000f4
	.4byte	0x4000048
	.4byte	0x1f3f
	.4byte	0x400004a
	.4byte	0x4000044
.L7:
	ldr	r2, .L23
	ldr	r3, .L23 + 4
	ldr	r0, [r3]
	ldr	r1, [r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r2]
	ldr	r2, .L23 + 8
	asr	r1, r1, #0x9
	mov	r0, #0x34
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	add	r1, r1, #0x34
	orr	r0, r0, r1
	strh	r0, [r2]
	ldr	r1, .L23 + 12
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L18	@cond_branch
	b	.L42
.L18:
	sub	r0, r0, #0x1
	str	r0, [r1]
	cmp	r0, #0
	beq	.L20	@cond_branch
	b	.L42
.L20:
	str	r0, [r3]
	ldr	r1, .L23 + 16
	mov	r0, #0x10
	str	r0, [r1]
	b	.L42
.L24:
	.align	2, 0
.L23:
	.4byte	0x30000e4
	.4byte	0x30000e8
	.4byte	0x4000044
	.4byte	0x30000f4
	.4byte	0x30000f0
.L14:
	ldr	r1, .L29
	mov	r0, #0x9f
	strh	r0, [r1]
	ldr	r0, .L29 + 4
	ldr	r3, .L29 + 8
	ldr	r1, [r3]
	strh	r1, [r0]
	ldr	r0, .L29 + 12
	ldr	r0, [r0]
	cmp	r1, r0
	bne	.L25	@cond_branch
	b	.L42
.L25:
	sub	r2, r1, #1
	cmp	r1, r0
	bge	.L27	@cond_branch
	add	r2, r1, #1
.L27:
	str	r2, [r3]
	b	.L42
.L30:
	.align	2, 0
.L29:
	.4byte	0x4000050
	.4byte	0x4000054
	.4byte	0x30000ec
	.4byte	0x30000f0
.L8:
	ldr	r3, .L36
	ldrb	r0, [r3]
	ldr	r4, .L36 + 4
	cmp	r0, #0
	beq	.L32	@cond_branch
	ldrb	r2, [r4]
	cmp	r2, #0
	bne	.L32	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r5, #0xc5
	lsl	r5, r5, #0x6
	add	r0, r5, #0
	strh	r0, [r1]
	strb	r2, [r3]
.L32:
	ldr	r1, .L36 + 8
	ldr	r0, [r1]
	asr	r2, r0, #0x8
	add	r3, r1, #0
	cmp	r2, #0
	bne	.L35	@cond_branch
	ldr	r0, .L36 + 12
	ldr	r0, [r0]
	cmp	r0, #0x4
	bgt	.L34	@cond_branch
	ldr	r1, .L36
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L36 + 16
	mov	r0, #0xb0
	lsl	r0, r0, #0x7
	str	r0, [r1]
	ldr	r0, .L36 + 20
	str	r2, [r0]
	b	.L35
.L37:
	.align	2, 0
.L36:
	.4byte	0x30000dc
	.4byte	0x30000dd
	.4byte	0x30000e4
	.4byte	0x30000e0
	.4byte	0x30000e8
	.4byte	0x30000f0
.L34:
	mov	r0, #0x1
	strb	r0, [r4]
.L35:
	ldr	r1, .L43
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L38	@cond_branch
	ldr	r1, .L43 + 4
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r1, .L43 + 8
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x1
	strb	r0, [r4]
.L38:
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L40	@cond_branch
	ldr	r0, [r3]
	asr	r1, r0, #0x8
	cmp	r1, #0
	bne	.L40	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	strh	r1, [r0]
	mov	r0, #0x8
	bl	sub_80490F8
	mov	r0, #0x1a
	bl	sub_804924C
.L40:
	ldr	r0, .L43 + 12
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L42	@cond_branch
	ldr	r0, .L43 + 16
	ldrb	r7, [r0]
	cmp	r7, #0
	bne	.L42	@cond_branch
	add	r6, r6, #0xb8
	ldr	r5, .L43 + 20
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	strh	r7, [r0]
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	mov	r8, r0
	strh	r7, [r0]
	bl	sub_8059934
	ldr	r4, .L43 + 24
	ldr	r0, [r4]
	lsl	r0, r0, #0x3
	add	r0, r0, r5
	ldr	r2, [r0]
	str	r7, [sp]
	add	r0, r6, #0
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_8058A28
	ldr	r0, [r4]
	lsl	r0, r0, #0x3
	add	r0, r0, r5
	ldr	r0, [r0, #0x4]
	bl	loadPalette
	mov	r3, r8
	strh	r7, [r3]
	ldr	r1, .L43 + 28
	mov	r0, #0x96
	lsl	r0, r0, #0x1
	str	r0, [r1]
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
.L42:
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L44:
	.align	2, 0
.L43:
	.4byte	0x3005da0
	.4byte	0x30000f0
	.4byte	0x30000e8
	.4byte	0x30000dc
	.4byte	0x30000dd
	.4byte	0x80687f0
	.4byte	0x30000e0
	.4byte	0x30000f4
	thumb_func_end sub_804257C

.align 2, 0 @ Don't pad with nop.
