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
	bne	.L804F48E	@cond_branch
	b	.L804F778
.L804F48E:
	sub	r0, r1, #1
	mov	r7, #0x0
	strh	r0, [r4]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L804F49C	@cond_branch
	b	.L804F778
.L804F49C:
	mov	r3, #0x87
	lsl	r3, r3, #0x1
	add	r1, r5, r3
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L804F4B2	@cond_branch
	add	r0, r5, #0
	bl	sub_804F37C
.L804F4B2:
	mov	r0, #0x86
	lsl	r0, r0, #0x1
	add	r6, r5, r0
	ldrh	r0, [r6]
	cmp	r0, #0x2
	bne	.L804F4C0	@cond_branch
	b	.L804F70A
.L804F4C0:
	cmp	r0, #0x2
	bgt	.L804F4CA	@cond_branch
	cmp	r0, #0x1
	beq	.L804F4D6	@cond_branch
	b	.L804F78E
.L804F4CA:
	cmp	r0, #0x3
	beq	.L804F54C	@cond_branch
	cmp	r0, #0x4
	bne	.L804F4D4	@cond_branch
	b	.L804F6A4
.L804F4D4:
	b	.L804F78E
.L804F4D6:
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
	ldr	r1, .L804F540
	and	r0, r0, r1
	str	r0, [r2, #0xc]
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	ldr	r2, [r0]
	ldr	r0, [r3]
	ldr	r0, [r0, #0xc]
	and	r0, r0, r1
	ldr	r3, .L804F540 + 4
	add	r0, r0, r3
	str	r0, [r2, #0xc]
	mov	r0, #0x0
	ldsh	r1, [r4, r0]
	ldr	r0, .L804F540 + 8
	cmp	r1, r0
	bgt	.L804F532	@cond_branch
	mov	r0, #0x3
	strh	r0, [r6]
	mov	r0, #0xb
	bl	sub_804ABFC
.L804F532:
	mov	r2, #0x84
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	mov	r0, #0x30
	strh	r0, [r1]
	b	.L804F78E
.L804F53E:
	.align	2, 0
.L804F540:
	.4byte	0xffffff00
	.4byte	0xfffffc00
	.4byte	0x171
.L804F54C:
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
	ldr	r1, .L804F5B8
	cmp	r0, r1
	ble	.L804F578	@cond_branch
	strh	r1, [r6]
	ldrh	r3, [r4]
	NEG	r0, r3
	strh	r0, [r4]
	mov	r0, #0xb
	bl	sub_804ABFC
.L804F578:
	mov	r1, #0x0
	ldsh	r0, [r6, r1]
	cmp	r0, #0
	bge	.L804F58E	@cond_branch
	strh	r7, [r6]
	ldrh	r2, [r4]
	NEG	r0, r2
	strh	r0, [r4]
	mov	r0, #0xb
	bl	sub_804ABFC
.L804F58E:
	ldrh	r6, [r6]
	lsl	r0, r6, #0x10
	asr	r6, r0, #0x17
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r2, [r0]
	add	r1, r6, #0
	add	r3, r0, #0
	cmp	r6, #0x8
	ble	.L804F5A4	@cond_branch
	mov	r1, #0x8
.L804F5A4:
	strh	r1, [r2, #0x18]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r0, [r0]
	cmp	r6, #0x8
	ble	.L804F5BC	@cond_branch
	add	r1, r6, #0
	sub	r1, r1, #0x8
	b	.L804F5BE
.L804F5B6:
	.align	2, 0
.L804F5B8:
	.4byte	0x80f
.L804F5BC:
	mov	r1, #0x0
.L804F5BE:
	strh	r1, [r0, #0x18]
	mov	r4, #0x80
	lsl	r4, r4, #0x1
	add	r0, r5, r4
	ldr	r2, [r0]
	ldr	r0, [r3]
	ldr	r1, [r0, #0x8]
	ldr	r0, .L804F674
	and	r1, r1, r0
	mov	r3, #0x83
	lsl	r3, r3, #0x1
	add	r0, r5, r3
	mov	r4, #0x0
	ldsh	r0, [r0, r4]
	lsl	r0, r0, #0x4
	ldr	r3, .L804F674 + 4
	add	r0, r0, r3
	add	r1, r1, r0
	str	r1, [r2, #0x8]
	mov	r4, #0x82
	lsl	r4, r4, #0x1
	add	r7, r5, r4
	mov	r1, #0x0
	ldsh	r0, [r7, r1]
	cmp	r0, #0x3b
	bgt	.L804F61E	@cond_branch
	mov	r2, #0x86
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	mov	r0, #0x2
	strh	r0, [r1]
	ldr	r4, .L804F674 + 8
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
.L804F61E:
	ldr	r1, .L804F674 + 12
	mov	r0, #0x3
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L804F62C	@cond_branch
	b	.L804F78E
.L804F62C:
	mov	r0, #0x78
	strh	r0, [r7]
	mov	r3, #0x86
	lsl	r3, r3, #0x1
	add	r1, r5, r3
	mov	r0, #0x4
	strh	r0, [r1]
	ldr	r0, .L804F674 + 8
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
	bne	.L804F684	@cond_branch
	bl	sub_804FB6C
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L804F66A	@cond_branch
	bl	sub_8053954
.L804F66A:
	mov	r0, #0x5
	bl	sub_804ABFC
	b	.L804F68A
.L804F672:
	.align	2, 0
.L804F674:
	.4byte	0xffffff00
	.4byte	0xfffff800
	.4byte	0x3000fb0
	.4byte	0x3005da0
.L804F684:
	mov	r0, #0x4
	bl	sub_804ABFC
.L804F68A:
	ldr	r0, .L804F6A0
	ldr	r0, [r0]
	mov	r4, #0x83
	lsl	r4, r4, #0x1
	add	r1, r5, r4
	mov	r2, #0x0
	ldsh	r1, [r1, r2]
	bl	sub_804C870
	b	.L804F78E
.L804F69E:
	.align	2, 0
.L804F6A0:
	.4byte	0x3000fb0
.L804F6A4:
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
	bgt	.L804F6CC	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r0, [r0]
	strh	r7, [r0, #0x18]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r0, [r0]
	strh	r7, [r0, #0x18]
	b	.L804F6F0
.L804F6CC:
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r0, [r0]
	add	r1, r2, #0
	cmp	r2, #0x8
	ble	.L804F6DA	@cond_branch
	mov	r1, #0x8
.L804F6DA:
	strh	r1, [r0, #0x18]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r0, [r0]
	cmp	r2, #0x8
	ble	.L804F6EC	@cond_branch
	add	r1, r2, #0
	sub	r1, r1, #0x8
	b	.L804F6EE
.L804F6EC:
	mov	r1, #0x0
.L804F6EE:
	strh	r1, [r0, #0x18]
.L804F6F0:
	mov	r4, #0x82
	lsl	r4, r4, #0x1
	add	r0, r5, r4
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0x3b
	bgt	.L804F78E	@cond_branch
	mov	r2, #0x86
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	mov	r0, #0x2
	strh	r0, [r1]
	b	.L804F78E
.L804F70A:
	add	r3, r5, #0
	add	r3, r3, #0xf4
	ldr	r2, [r3]
	ldr	r1, [r2, #0x8]
	ldr	r0, .L804F768
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	add	r1, r1, r0
	str	r1, [r2, #0x8]
	add	r0, r5, #0
	add	r0, r0, #0xf8
	ldr	r1, [r0]
	ldr	r0, [r3]
	ldr	r0, [r0, #0x8]
	ldr	r2, .L804F768 + 4
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
	ldr	r4, .L804F768 + 8
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
	ldr	r2, .L804F768 + 12
	add	r0, r0, r2
	add	r1, r1, r0
	str	r1, [r4, #0x8]
	b	.L804F78E
.L804F768:
	.align	2, 0

	.4byte	0xffff6000
	.4byte	0xffffff00
	.4byte	0xffffc000
	.4byte	0xfffff800
.L804F778:
	mov	r3, #0x87
	lsl	r3, r3, #0x1
	add	r1, r5, r3
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804F78E	@cond_branch
	add	r0, r5, #0
	bl	sub_804F794
.L804F78E:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804F478

.align 2, 0 @ Don't pad with nop.
