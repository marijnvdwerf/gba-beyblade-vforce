	.include "asm/common.inc"

	thumb_func_start sub_805D650
sub_805D650:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffb4
	add	r7, sp, #0x4
	add	r5, r0, #0
	mov	r1, sp
	add	r0, r1, #0
	str	r0, [r7, #0x3c]
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r0, [r0]
	asr	r0, r0, #0x12
	str	r0, [r7, #0x18]
	mov	r2, #0x0
	str	r2, [r7, #0x30]
	add	sp, sp, #0xffffffb0
	mov	r3, sp
	add	r3, r3, #0x4
	str	r3, [r7, #0x34]
	mov	r0, #0x2
	NEG	r0, r0
	and	r6, r6, r0
	sub	r0, r0, #0x1
	and	r6, r6, r0
	sub	r0, r0, #0x2
	and	r6, r6, r0
	sub	r0, r0, #0x4
	and	r6, r6, r0
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	add	r1, r5, #0
	add	r1, r1, #0x84
	ldr	r1, [r1]
	bl	GetSplineAtIndex
	mov	sl, r0
	add	r0, r0, #0x20
	str	r0, [r7, #0x24]
	mov	r1, sl
	ldr	r0, [r1]
	lsl	r0, r0, #0x2
	add	r0, r0, #0x20
	ADD r0, sl
	str	r0, [r7, #0x38]
	ldr	r2, [r7, #0x18]
	lsl	r0, r2, #0x4
	ldr	r3, [r7, #0x38]
	add	r0, r0, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bge	.L1	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x2
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L2	@cond_branch
.L1:
	ldr	r0, [r5, #0x40]
	b	.L3
.L2:
	ldr	r0, [r5, #0x40]
	NEG	r0, r0
.L3:
	str	r0, [r7, #0x2c]
	ldr	r2, [r7, #0x18]
	lsl	r1, r2, #0x4
	ldr	r3, [r7, #0x38]
	add	r0, r1, r3
	ldr	r0, [r0, #0xc]
	ldr	r2, [r7, #0x2c]
	mul	r0, r0, r2
	asr	r0, r0, #0x8
	str	r0, [r7, #0x44]
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r2, [r0]
	ldr	r3, .L8
	and	r2, r2, r3
	ldr	r3, [r7, #0x44]
	add	r4, r2, r3
	mov	r9, r0
	str	r1, [r7, #0x40]
	ldr	r0, .L8
	cmp	r4, r0
	ble	.L4	@cond_branch
	mov	r0, #0x2
	orr	r6, r6, r0
	ldr	r1, .L8
	sub	r2, r1, r2
	str	r2, [r7, #0x20]
	ldr	r1, [r7, #0x18]
	add	r1, r1, #0x1
	mov	r2, sl
	ldr	r0, [r2]
	sub	r0, r0, #0x1
	cmp	r1, r0
	blt	.L5	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	ldr	r3, [r7, #0x18]
	lsl	r1, r3, #0x2
	ldr	r2, [r7, #0x24]
	add	r1, r1, r2
	ldr	r1, [r1, #0x4]
	str	r1, [sp]
	ldr	r1, [r7, #0x34]
	mov	r2, sl
	mov	r3, #0x4
	bl	sub_805DBF0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	mov	r0, #0x4
	orr	r6, r6, r0
	ldr	r3, [r7, #0x34]
	ldr	r3, [r3, #0x10]
	mov	r8, r3
	ldr	r0, [r7, #0x34]
	ldr	r0, [r0, #0x4]
	str	r0, [r7, #0x28]
	b	.L18
.L9:
	.align	2, 0
.L8:
	.4byte	0x3ffff
.L6:
	mov	r0, #0x1
	orr	r6, r6, r0
	mov	r1, r9
	ldr	r1, [r1]
	ldr	r2, .L11
	and	r1, r1, r2
	str	r1, [r7, #0x1c]
	b	.L18
.L12:
	.align	2, 0
.L11:
	.4byte	0x3ffff
.L5:
	ldr	r0, [r7, #0x40]
	add	r0, r0, #0x10
	ldr	r3, [r7, #0x38]
	add	r3, r3, r0
	mov	r8, r3
	str	r1, [r7, #0x30]
	b	.L18
.L4:
	cmp	r4, #0
	bge	.L18	@cond_branch
	mov	r0, #0x2
	orr	r6, r6, r0
	str	r4, [r7, #0x20]
	ldr	r0, [r7, #0x18]
	sub	r0, r0, #0x1
	cmp	r0, #0
	bge	.L15	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	ldr	r2, [r7, #0x18]
	lsl	r1, r2, #0x2
	ldr	r3, [r7, #0x24]
	add	r1, r1, r3
	ldr	r1, [r1]
	str	r1, [sp]
	ldr	r1, [r7, #0x34]
	mov	r2, sl
	mov	r3, #0x4
	bl	sub_805DBF0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L16	@cond_branch
	mov	r0, #0x4
	orr	r6, r6, r0
	ldr	r0, [r7, #0x34]
	ldr	r0, [r0, #0xc]
	mov	r8, r0
	ldr	r1, [r7, #0x34]
	ldr	r0, [r1, #0x4]
	sub	r0, r0, #0x1
	str	r0, [r7, #0x28]
	b	.L18
.L16:
	mov	r0, #0x1
	orr	r6, r6, r0
	mov	r2, r9
	ldr	r2, [r2]
	ldr	r3, .L19
	and	r2, r2, r3
	str	r2, [r7, #0x1c]
	b	.L18
.L20:
	.align	2, 0
.L19:
	.4byte	0x3ffff
.L15:
	ldr	r0, [r7, #0x40]
	sub	r0, r0, #0x10
	ldr	r1, [r7, #0x38]
	add	r1, r1, r0
	mov	r8, r1
	ldr	r2, [r7, #0x18]
	str	r2, [r7, #0x30]
.L18:
	mov	r1, #0x3
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0x2
	beq	.L21	@cond_branch
	b	.L49
.L21:
	ldr	r3, [r7, #0x44]
	cmp	r3, #0
	blt	.L23	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	ldr	r2, [r7, #0x18]
	lsl	r1, r2, #0x2
	ldr	r3, [r7, #0x24]
	add	r1, r1, r3
	ldr	r1, [r1, #0x4]
	str	r1, [sp]
	ldr	r1, [r7, #0x34]
	mov	r2, sl
	mov	r3, #0x4
	bl	sub_805DBF0
	b	.L24
.L23:
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	ldr	r2, [r7, #0x18]
	lsl	r1, r2, #0x2
	ldr	r3, [r7, #0x24]
	add	r1, r1, r3
	ldr	r1, [r1]
	str	r1, [sp]
	ldr	r1, [r7, #0x34]
	mov	r2, sl
	mov	r3, #0x4
	bl	sub_805DBF0
.L24:
	mov	r0, r8
	mov	r2, #0x8
	ldsh	r1, [r0, r2]
	ldr	r0, [r7, #0x40]
	ldr	r2, [r7, #0x38]
	add	r3, r0, r2
	mov	r2, #0x8
	ldsh	r0, [r3, r2]
	sub	r2, r1, r0
	cmp	r2, #0x80
	ble	.L25	@cond_branch
	sub	r2, r2, #0xff
.L25:
	mov	r0, #0x0
	ldsb	r0, [r3, r0]
	cmp	r0, #0
	blt	.L26	@cond_branch
	mov	r3, r8
	mov	r0, #0x0
	ldsb	r0, [r3, r0]
	cmp	r0, #0
	bge	.L31	@cond_branch
	mov	r0, #0x8
	orr	r6, r6, r0
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	blt	.L31	@cond_branch
	b	.L29
.L26:
	mov	r1, r8
	mov	r0, #0x0
	ldsb	r0, [r1, r0]
	cmp	r0, #0
	blt	.L31	@cond_branch
	mov	r0, #0x8
	orr	r6, r6, r0
	ldr	r3, [r7, #0x44]
	cmp	r3, #0
	bge	.L31	@cond_branch
.L29:
	NEG	r2, r2
.L31:
	mov	r1, #0x8
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L33	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x2
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L33	@cond_branch
	cmp	r2, #0
	blt	.L34	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x8c
	ldrb	r0, [r0]
	cmp	r0, #0x1
	beq	.L35	@cond_branch
	b	.L37
.L34:
	add	r0, r5, #0
	add	r0, r0, #0x8c
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L37	@cond_branch
.L35:
	ldr	r0, [r7, #0x2c]
	cmp	r0, #0
	ble	.L38	@cond_branch
	mov	r1, r9
	ldr	r0, [r1]
	ldr	r1, .L40
	and	r0, r0, r1
	ldr	r1, .L40 + 4
	sub	r0, r1, r0
	b	.L42
.L41:
	.align	2, 0
.L40:
	.4byte	0x3ffff
	.4byte	0x40100
.L38:
	mov	r2, r9
	ldr	r0, [r2]
	ldr	r1, .L43
	and	r0, r0, r1
	ldr	r1, .L43 + 4
	sub	r0, r1, r0
	b	.L42
.L44:
	.align	2, 0
.L43:
	.4byte	0x3ffff
	.4byte	0xffffff00
.L37:
	ldr	r3, [r7, #0x2c]
	cmp	r3, #0
	ble	.L45	@cond_branch
	mov	r1, r9
	ldr	r0, [r1]
	ldr	r2, .L47
	BIC	r2, r0
	str	r2, [r7, #0x44]
	b	.L46
.L48:
	.align	2, 0
.L47:
	.4byte	0x3ffff
.L45:
	mov	r3, r9
	ldr	r0, [r3]
	ldr	r1, .L50
	and	r0, r0, r1
	NEG	r0, r0
.L42:
	str	r0, [r7, #0x44]
.L46:
	mov	r0, #0x0
	str	r0, [r5, #0x40]
	b	.L49
.L51:
	.align	2, 0
.L50:
	.4byte	0x3ffff
.L33:
	ldr	r1, [r7, #0x20]
	lsl	r0, r1, #0x8
	ldr	r2, [r7, #0x40]
	ldr	r3, [r7, #0x38]
	add	r1, r2, r3
	ldr	r1, [r1, #0xc]
	bl	Div
	ldr	r1, [r7, #0x2c]
	sub	r0, r1, r0
	mov	r2, r8
	ldr	r1, [r2, #0xc]
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	ldr	r3, [r7, #0x20]
	add	r0, r3, r0
	str	r0, [r7, #0x44]
.L49:
	mov	r0, r9
	ldr	r0, [r0]
	mov	r8, r0
	ldr	r0, [r7, #0x44]
	ADD r0, r8
	mov	r1, r9
	str	r0, [r1]
	mov	r1, #0x7
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0x2
	bne	.L54	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x90
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L54	@cond_branch
	ldr	r0, [r2, #0x8]
	cmp	r0, #0
	beq	.L54	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r1, [r0]
	add	r0, r0, #0x4
	ldr	r3, [r0]
	ldr	r0, [r7, #0x30]
	str	r0, [sp]
	ldr	r4, [r2, #0x8]
	add	r0, r5, #0
	mov	r2, sl
	bl	call_via_r4
.L54:
	mov	r1, #0x5
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0x1
	bne	.L55	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x8
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L56	@cond_branch
	ldr	r0, [r5, #0x40]
	cmp	r0, #0
	ble	.L57	@cond_branch
	mov	r1, sl
	ldr	r0, [r1]
	lsl	r0, r0, #0x12
	ldr	r2, .L59
	add	r0, r0, r2
	mov	r3, r9
	str	r0, [r3]
	ldr	r0, [r1]
	sub	r4, r0, #1
	b	.L58
.L60:
	.align	2, 0
.L59:
	.4byte	0xfffbff00
.L57:
	mov	r0, #0x0
	mov	r6, r9
	str	r0, [r6]
	mov	r4, #0x0
.L58:
	ldr	r0, [r5, #0x40]
	NEG	r0, r0
	str	r0, [r5, #0x40]
	add	r0, r5, #0
	add	r0, r0, #0x90
	ldr	r2, [r0]
	cmp	r2, #0
	bne	.L61	@cond_branch
	b	.L78
.L61:
	ldr	r0, [r2, #0x8]
	cmp	r0, #0
	bne	.L63	@cond_branch
	b	.L78
.L63:
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r1, [r0]
	add	r0, r0, #0x4
	ldr	r3, [r0]
	str	r4, [sp]
	ldr	r4, [r2, #0x8]
	add	r0, r5, #0
	mov	r2, sl
	bl	call_via_r4
	b	.L78
.L56:
	ldr	r0, [r7, #0x1c]
	ldr	r1, [r7, #0x44]
	add	r0, r0, r1
	str	r0, [r7, #0x1c]
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	add	r1, r5, #0
	add	r1, r1, #0x84
	ldr	r1, [r1]
	ldr	r3, [r7, #0x1c]
	asr	r2, r3, #0x8
	str	r2, [sp]
	add	r2, r7, #0
	ldr	r3, [r7, #0x18]
	bl	sub_805E068
	add	r0, r5, #0
	bl	sub_805D610
	ldr	r2, [r7]
	lsl	r2, r2, #0x5
	add	r0, r5, #0
	add	r0, r0, #0x9a
	mov	r6, #0x0
	ldsh	r1, [r0, r6]
	lsl	r1, r1, #0x8
	ldr	r0, [r5, #0x4]
	add	r0, r0, r1
	sub	r2, r2, r0
	str	r2, [r5, #0x40]
	ldr	r2, [r7, #0x4]
	lsl	r2, r2, #0x5
	add	r0, r5, #0
	add	r0, r0, #0x9c
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	lsl	r1, r1, #0x8
	ldr	r0, [r5, #0x8]
	add	r0, r0, r1
	sub	r2, r2, r0
	str	r2, [r5, #0x44]
	ldr	r2, [r7, #0x8]
	lsl	r2, r2, #0x5
	add	r0, r5, #0
	add	r0, r0, #0x9e
	mov	r6, #0x0
	ldsh	r1, [r0, r6]
	lsl	r1, r1, #0x8
	ldr	r0, [r5, #0xc]
	add	r0, r0, r1
	sub	r2, r2, r0
	str	r2, [r5, #0x48]
	b	.L78
.L55:
	mov	r1, #0x4
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L67	@cond_branch
	mov	r0, r9
	ldr	r3, [r0]
	ldr	r1, .L74
	and	r3, r3, r1
	mov	r2, r8
	and	r2, r2, r1
	mov	r8, r2
	mov	r0, #0x8
	and	r6, r6, r0
	cmp	r6, #0
	beq	.L68	@cond_branch
	sub	r3, r1, r3
.L68:
	ldr	r6, [r7, #0x44]
	cmp	r6, #0
	bge	.L70	@cond_branch
	mov	r2, r8
	sub	r0, r3, r2
	cmp	r0, #0
	bge	.L70	@cond_branch
	sub	r3, r1, r3
.L70:
	add	r4, r5, #0
	add	r4, r4, #0x80
	ldr	r0, [r4]
	ldr	r6, [r7, #0x34]
	ldr	r2, [r6, #0x8]
	asr	r3, r3, #0x8
	ldr	r6, [r7, #0x28]
	lsl	r1, r6, #0xa
	orr	r3, r3, r1
	add	r1, r5, #0
	bl	sub_805C3BC
	add	r0, r5, #0
	add	r0, r0, #0x90
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L78	@cond_branch
	ldr	r3, [r0, #0xc]
	cmp	r3, #0
	beq	.L78	@cond_branch
	ldr	r1, [r4]
	ldr	r0, [r7, #0x34]
	ldr	r2, [r0, #0x8]
	add	r0, r5, #0
	bl	call_via_r3
	b	.L78
.L75:
	.align	2, 0
.L74:
	.4byte	0x3ffff
.L67:
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x4
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L76	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	add	r1, r5, #0
	add	r1, r1, #0x84
	ldr	r1, [r1]
	mov	r2, r9
	ldr	r3, [r2]
	asr	r3, r3, #0x8
	add	r2, r7, #0
	bl	sub_805DD18
	b	.L77
.L76:
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r0, [r0]
	add	r1, r5, #0
	add	r1, r1, #0x84
	ldr	r1, [r1]
	mov	r6, r9
	ldr	r3, [r6]
	asr	r3, r3, #0x8
	add	r2, r7, #0
	bl	sub_805DFD4
.L77:
	cmp	r0, #0
	beq	.L78	@cond_branch
	ldr	r3, [r7, #0x4]
	lsl	r3, r3, #0x5
	add	r4, r5, #0
	add	r4, r4, #0x9c
	mov	r0, #0x0
	ldsh	r1, [r4, r0]
	lsl	r1, r1, #0x8
	ldr	r0, [r5, #0x8]
	add	r0, r0, r1
	sub	r0, r3, r0
	str	r0, [r5, #0x44]
	ldr	r2, [r7, #0x8]
	lsl	r2, r2, #0x5
	mov	r1, #0x9e
	add	r1, r1, r5
	mov	r8, r1
	mov	r6, #0x0
	ldsh	r1, [r1, r6]
	lsl	r1, r1, #0x8
	ldr	r0, [r5, #0xc]
	add	r0, r0, r1
	sub	r0, r2, r0
	str	r0, [r5, #0x48]
	ldr	r1, [r7]
	lsl	r1, r1, #0x5
	add	r0, r5, #0
	add	r0, r0, #0x9a
	mov	r6, #0x0
	ldsh	r0, [r0, r6]
	lsl	r0, r0, #0x8
	sub	r1, r1, r0
	str	r1, [r5, #0x4]
	mov	r1, #0x0
	ldsh	r0, [r4, r1]
	lsl	r0, r0, #0x8
	sub	r3, r3, r0
	str	r3, [r5, #0x8]
	mov	r3, r8
	mov	r6, #0x0
	ldsh	r0, [r3, r6]
	lsl	r0, r0, #0x8
	sub	r2, r2, r0
	str	r2, [r5, #0xc]
.L78:
	ldr	r0, [r7, #0x3c]
	mov	sp, r0
	add	sp, sp, #0x4c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805D650

.align 2, 0 @ Don't pad with nop.
