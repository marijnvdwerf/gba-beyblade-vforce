	.include "asm/common.inc"

	thumb_func_start sub_804F478
sub_804F478:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	mov	r0, #0x82
	lsl	r0, r0, #0x1
	add	r4, r5, r0
	ldrh	r1, [r4]
	mov	r2, #0x0
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	bne	.L1	@cond_branch
	b	.L4
.L1:
	sub	r0, r1, #1
	mov	r7, #0x0
	strh	r0, [r4]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L3	@cond_branch
	b	.L4
.L3:
	mov	r3, #0x87
	lsl	r3, r3, #0x1
	add	r1, r5, r3
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L5	@cond_branch
	add	r0, r5, #0
	bl	sub_804F37C
.L5:
	mov	r0, #0x86
	lsl	r0, r0, #0x1
	add	r6, r5, r0
	ldrh	r0, [r6]
	cmp	r0, #0x2
	bne	.L6	@cond_branch
	b	.L7
.L6:
	cmp	r0, #0x2
	bgt	.L8	@cond_branch
	cmp	r0, #0x1
	beq	.L9	@cond_branch
	b	.L47
.L8:
	cmp	r0, #0x3
	beq	.L11	@cond_branch
	cmp	r0, #0x4
	bne	.L12	@cond_branch
	b	.L13
.L12:
	b	.L47
.L9:
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r3, [r0]
	ldr	r1, [r3, #0xc]
	mov	r2, #0xb0
	lsl	r2, r2, #0x6
	sub	r0, r2, r1
	asr	r0, r0, #0x3
	add	r1, r1, r0
	str	r1, [r3, #0xc]
	add	r3, r5, #0
	add	r3, r3, #0xf8
	ldr	r1, [r3]
	ldr	r0, [r1, #0xc]
	sub	r2, r2, r0
	asr	r2, r2, #0x3
	add	r0, r0, r2
	str	r0, [r1, #0xc]
	add	r0, r5, #0
	add	r0, r0, #0xfc
	ldr	r2, [r0]
	ldr	r0, [r3]
	ldr	r0, [r0, #0xc]
	ldr	r1, .L17
	and	r0, r0, r1
	str	r0, [r2, #0xc]
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	ldr	r2, [r0]
	ldr	r0, [r3]
	ldr	r0, [r0, #0xc]
	and	r0, r0, r1
	ldr	r3, .L17 + 4
	add	r0, r0, r3
	str	r0, [r2, #0xc]
	mov	r0, #0x0
	ldsh	r1, [r4, r0]
	ldr	r0, .L17 + 8
	cmp	r1, r0
	bgt	.L15	@cond_branch
	mov	r0, #0x3
	strh	r0, [r6]
	mov	r0, #0xb
	bl	sub_804ABFC
.L15:
	mov	r2, #0x84
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	mov	r0, #0x30
	strh	r0, [r1]
	b	.L47
.L18:
	.align	2, 0
.L17:
	.4byte	0xffffff00
	.4byte	0xfffffc00
	.4byte	0x171
.L11:
	mov	r3, #0x83
	lsl	r3, r3, #0x1
	add	r6, r5, r3
	mov	r0, #0x84
	lsl	r0, r0, #0x1
	add	r4, r5, r0
	ldrh	r1, [r6]
	ldrh	r2, [r4]
	add	r0, r1, r2
	strh	r0, [r6]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	ldr	r1, .L24
	cmp	r0, r1
	ble	.L19	@cond_branch
	strh	r1, [r6]
	ldrh	r3, [r4]
	NEG	r0, r3
	strh	r0, [r4]
	mov	r0, #0xb
	bl	sub_804ABFC
.L19:
	mov	r1, #0x0
	ldsh	r0, [r6, r1]
	cmp	r0, #0
	bge	.L20	@cond_branch
	strh	r7, [r6]
	ldrh	r2, [r4]
	NEG	r0, r2
	strh	r0, [r4]
	mov	r0, #0xb
	bl	sub_804ABFC
.L20:
	ldrh	r6, [r6]
	lsl	r0, r6, #0x10
	asr	r6, r0, #0x17
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r2, [r0]
	add	r1, r6, #0
	add	r3, r0, #0
	cmp	r6, #0x8
	ble	.L21	@cond_branch
	mov	r1, #0x8
.L21:
	strh	r1, [r2, #0x18]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r0, [r0]
	cmp	r6, #0x8
	ble	.L22	@cond_branch
	add	r1, r6, #0
	sub	r1, r1, #0x8
	b	.L23
.L25:
	.align	2, 0
.L24:
	.4byte	0x80f
.L22:
	mov	r1, #0x0
.L23:
	strh	r1, [r0, #0x18]
	mov	r4, #0x80
	lsl	r4, r4, #0x1
	add	r0, r5, r4
	ldr	r2, [r0]
	ldr	r0, [r3]
	ldr	r1, [r0, #0x8]
	ldr	r0, .L32
	and	r1, r1, r0
	mov	r3, #0x83
	lsl	r3, r3, #0x1
	add	r0, r5, r3
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	lsl	r0, r0, #0x4
	ldr	r3, .L32 + 4
	add	r0, r0, r3
	add	r1, r1, r0
	str	r1, [r2, #0x8]
	mov	r4, #0x82
	lsl	r4, r4, #0x1
	add	r7, r5, r4
	mov	r1, #0x0
	ldsh	r0, [r7, r1]
	cmp	r0, #0x3b
	bgt	.L26	@cond_branch
	mov	r2, #0x86
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	mov	r0, #0x2
	strh	r0, [r1]
	ldr	r4, .L32 + 8
	ldr	r0, [r4]
	mov	r1, #0x0
	bl	sub_804C888
	mov	r0, #0x1
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	mov	r0, #0x1
	bl	sub_804F84C
	ldr	r0, [r4]
	mov	r1, #0x0
	bl	sub_804C870
.L26:
	ldr	r1, .L32 + 12
	mov	r0, #0x3
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L27	@cond_branch
	b	.L47
.L27:
	mov	r0, #0x78
	strh	r0, [r7]
	mov	r3, #0x86
	lsl	r3, r3, #0x1
	add	r1, r5, r3
	mov	r0, #0x4
	strh	r0, [r1]
	ldr	r0, .L32 + 8
	ldr	r0, [r0]
	mov	r1, #0x0
	bl	sub_804C888
	mov	r0, #0x1
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	mov	r0, #0x1
	bl	sub_804F84C
	cmp	r6, #0x10
	bne	.L29	@cond_branch
	bl	sub_804FB6C
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L30	@cond_branch
	bl	sub_8053954
.L30:
	mov	r0, #0x5
	bl	sub_804ABFC
	b	.L31
.L33:
	.align	2, 0
.L32:
	.4byte	0xffffff00
	.4byte	0xfffff800
	.4byte	0x3000fb0
	.4byte	0x3005da0
.L29:
	mov	r0, #0x4
	bl	sub_804ABFC
.L31:
	ldr	r0, .L35
	ldr	r0, [r0]
	mov	r4, #0x83
	lsl	r4, r4, #0x1
	add	r1, r5, r4
	mov	r2, #0x0
	ldsh	r1, [r1, r2]
	bl	sub_804C870
	b	.L47
.L36:
	.align	2, 0
.L35:
	.4byte	0x3000fb0
.L13:
	mov	r3, #0x83
	lsl	r3, r3, #0x1
	add	r0, r5, r3
	ldrh	r0, [r0]
	lsl	r0, r0, #0x10
	asr	r2, r0, #0x17
	mov	r0, #0x3
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0x1
	bgt	.L37	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r0, [r0]
	strh	r7, [r0, #0x18]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r0, [r0]
	strh	r7, [r0, #0x18]
	b	.L38
.L37:
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r0, [r0]
	add	r1, r2, #0
	cmp	r2, #0x8
	ble	.L39	@cond_branch
	mov	r1, #0x8
.L39:
	strh	r1, [r0, #0x18]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r0, [r0]
	cmp	r2, #0x8
	ble	.L40	@cond_branch
	add	r1, r2, #0
	sub	r1, r1, #0x8
	b	.L41
.L40:
	mov	r1, #0x0
.L41:
	strh	r1, [r0, #0x18]
.L38:
	mov	r4, #0x82
	lsl	r4, r4, #0x1
	add	r0, r5, r4
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0x3b
	bgt	.L47	@cond_branch
	mov	r2, #0x86
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	mov	r0, #0x2
	strh	r0, [r1]
	b	.L47
.L7:
	add	r3, r5, #0
	add	r3, r3, #0xf4
	ldr	r2, [r3]
	ldr	r1, [r2, #0x8]
	ldr	r0, .L45
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r2, #0x8]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r1, [r0]
	ldr	r0, [r3]
	ldr	r0, [r0, #0x8]
	ldr	r2, .L45 + 4
	and	r0, r0, r2
	mov	r4, #0x80
	lsl	r4, r4, #0x7
	add	r0, r0, r4
	str	r0, [r1, #0x8]
	add	r0, r5, #0
	add	r0, r0, #0xfc
	ldr	r1, [r0]
	ldr	r0, [r3]
	ldr	r0, [r0, #0x8]
	and	r0, r0, r2
	ldr	r4, .L45 + 8
	add	r0, r0, r4
	str	r0, [r1, #0x8]
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldr	r4, [r0]
	ldr	r0, [r3]
	ldr	r1, [r0, #0x8]
	and	r1, r1, r2
	mov	r2, #0x83
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	lsl	r0, r0, #0x4
	ldr	r2, .L45 + 12
	add	r0, r0, r2
	add	r1, r1, r0
	str	r1, [r4, #0x8]
	b	.L47
.L46:
	.align	2, 0
.L45:
	.4byte	0xffff6000
	.4byte	0xffffff00
	.4byte	0xffffc000
	.4byte	0xfffff800
.L4:
	mov	r3, #0x87
	lsl	r3, r3, #0x1
	add	r1, r5, r3
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L47	@cond_branch
	add	r0, r5, #0
	bl	sub_804F794
.L47:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804F478

.align 2, 0 @ Don't pad with nop.
