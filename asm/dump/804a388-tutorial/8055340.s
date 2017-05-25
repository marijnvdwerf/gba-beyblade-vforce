	.include "asm/common.inc"

	thumb_func_start sub_8055340
sub_8055340:
	push	{r4, r5, lr}
	ldr	r0, .L7
	ldr	r4, [r0]
	ldr	r0, .L7 + 4
	add	r5, r4, r0
	add	r0, r5, #0
	bl	sub_804C208
	ldr	r2, .L7 + 8
	add	r1, r4, r2
	ldrh	r2, [r1]
	mov	r3, #0x0
	ldsh	r0, [r1, r3]
	cmp	r0, #0
	bne	.L1	@cond_branch
	b	.L29
.L1:
	mov	r3, #0x0
	sub	r0, r2, #1
	strh	r0, [r1]
	mov	r1, #0x1f
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r0, .L7 + 12
	add	r1, r4, r0
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	mov	r3, #0x1
.L3:
	cmp	r3, #0
	bne	.L4	@cond_branch
	b	.L29
.L4:
	ldr	r1, .L7 + 12
	add	r0, r4, r1
	ldr	r0, [r0]
	sub	r0, r0, #0x1
	cmp	r0, #0x4
	bhi	.L6	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L7 + 16
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x3000fb0
	.4byte	0x1084
	.4byte	0x10fe
	.4byte	0x1108
	.4byte	.L9
.L9:
	.4byte	.L10
	.4byte	.L11
	.4byte	.L12
	.4byte	.L13
	.4byte	.L14
.L10:
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r2, [r0]
	mov	r3, #0x8e
	lsl	r3, r3, #0x2
	add	r2, r2, r3
	mov	r0, #0x5
	mov	r1, #0x0
	bl	sub_8055734
	add	r1, r5, #0
	add	r1, r1, #0x74
	mov	r0, #0x8
	strh	r0, [r1]
	bl	sub_8051868
	bl	sub_804FC00
	mov	r0, #0x14
	bl	sub_804ABFC
	b	.L29
.L11:
	add	r4, r5, #0
	add	r4, r4, #0x88
	ldr	r0, [r4]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	bl	SetRiderFlag
	ldr	r1, [r4]
	mov	r4, #0x8e
	lsl	r4, r4, #0x2
	add	r1, r1, r4
	mov	r0, #0x6
	mov	r2, #0x0
	bl	sub_8055734
	b	.L29
.L12:
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r4, [r0]
	add	r1, r5, #0
	add	r1, r1, #0x74
	mov	r0, #0x8
	strh	r0, [r1]
	bl	sub_8051868
	cmp	r0, #0x1
	beq	.L17	@cond_branch
	cmp	r0, #0x1
	bgt	.L18	@cond_branch
	cmp	r0, #0
	beq	.L19	@cond_branch
	b	.L26
.L18:
	cmp	r0, #0x2
	beq	.L21	@cond_branch
	cmp	r0, #0x3
	beq	.L22	@cond_branch
	b	.L26
.L19:
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_804CEF4
	b	.L26
.L17:
	add	r0, r4, #0
	mov	r1, #0x2
	bl	sub_804CEF4
	b	.L26
.L21:
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_804CEF4
	b	.L26
.L22:
	add	r0, r4, #0
	mov	r1, #0x4
	bl	sub_804CEF4
.L26:
	mov	r0, #0x1
	bl	sub_804ABFC
	b	.L29
.L13:
	bl	sub_80558D0
	b	.L29
.L14:
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r0, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	bl	UnsetRiderFlag
	b	.L29
.L6:
	mov	r0, #0x1
	bl	sub_804F84C
.L29:
	ldr	r0, .L34
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L30	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0x74
	ldrh	r1, [r4]
	mov	r0, #0x0
	ldsh	r2, [r4, r0]
	cmp	r2, #0
	beq	.L31	@cond_branch
	add	r3, r5, #0
	add	r3, r3, #0x34
	mov	r0, #0x1
	and	r0, r0, r1
	mov	r2, #0x0
	cmp	r0, #0
	bne	.L32	@cond_branch
	mov	r2, #0x7
.L32:
	add	r0, r3, #0
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	bl	sub_80631EC
	ldrh	r0, [r4]
	sub	r0, r0, #0x1
	strh	r0, [r4]
	b	.L41
.L35:
	.align	2, 0
.L34:
	.4byte	0x3000e30
.L31:
	add	r3, r5, #0
	add	r3, r3, #0x76
	ldrh	r0, [r3]
	mov	r1, #0x0
	ldsh	r4, [r3, r1]
	cmp	r4, #0
	beq	.L36	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x78
	ldrh	r4, [r1]
	add	r0, r4, r0
	strh	r0, [r3]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x7
	ble	.L37	@cond_branch
	mov	r0, #0x7
	strh	r0, [r3]
	strh	r2, [r1]
	add	r2, r5, #0
	add	r2, r2, #0x80
	ldr	r0, [r2]
	mov	r1, #0x1
	orr	r0, r0, r1
	str	r0, [r2]
.L37:
	add	r0, r5, #0
	add	r0, r0, #0x5c
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r4, #0x0
	ldsh	r2, [r3, r4]
	bl	sub_80631EC
	b	.L41
.L36:
	add	r2, r5, #0
	add	r2, r2, #0x70
	ldrh	r1, [r2]
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	cmp	r0, #0
	beq	.L39	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r2]
	add	r0, r5, #0
	add	r0, r0, #0x34
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r3, #0x0
	ldsh	r2, [r2, r3]
	bl	sub_80631EC
	add	r0, r5, #0
	add	r0, r0, #0x72
	strh	r4, [r0]
	b	.L41
.L39:
	add	r2, r5, #0
	add	r2, r2, #0x72
	ldrh	r1, [r2]
	mov	r4, #0x0
	ldsh	r0, [r2, r4]
	cmp	r0, #0
	beq	.L41	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r2]
	add	r0, r5, #0
	add	r0, r0, #0x48
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r3, #0x0
	ldsh	r2, [r2, r3]
	bl	sub_80631EC
.L41:
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r0, #0x0
	strh	r0, [r1]
.L30:
	ldr	r0, [r5, #0x7c]
	cmp	r0, #0
	beq	.L43	@cond_branch
	add	r3, r5, #0
	add	r3, r3, #0x7c
	add	r0, r5, #0
	add	r0, r0, #0x7e
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	mov	r2, #0x0
	ldsh	r1, [r3, r2]
	sub	r0, r0, r1
	asr	r0, r0, #0x3
	ldrh	r4, [r3]
	add	r0, r4, r0
	mov	r1, #0x0
	strh	r0, [r3]
	ldr	r0, .L44
	strh	r1, [r0]
	ldr	r1, .L44 + 4
	ldr	r2, .L44 + 8
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r0, .L44 + 12
	mov	r1, #0xf0
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	ldr	r1, .L44 + 16
	ldrh	r4, [r3]
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x14
	strh	r0, [r1]
	ldr	r2, .L44 + 20
	ldrh	r1, [r3]
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x14
	mov	r1, #0xa0
	sub	r0, r1, r0
	lsl	r0, r0, #0x8
	orr	r0, r0, r1
	strh	r0, [r2]
	sub	r2, r2, #0x46
	ldrh	r0, [r2]
	mov	r4, #0xc0
	lsl	r4, r4, #0x7
	add	r1, r4, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	ldrh	r1, [r3]
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x14
	cmp	r0, #0
	bne	.L43	@cond_branch
	strh	r0, [r3]
	ldrh	r1, [r2]
	ldr	r0, .L44 + 24
	and	r0, r0, r1
	strh	r0, [r2]
.L43:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L45:
	.align	2, 0
.L44:
	.4byte	0x4000048
	.4byte	0x400004a
	.4byte	0xffff
	.4byte	0x4000040
	.4byte	0x4000044
	.4byte	0x4000046
	.4byte	0x9fff
	thumb_func_end sub_8055340

.align 2, 0 @ Don't pad with nop.
