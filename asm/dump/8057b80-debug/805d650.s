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
	neg	r0, r0
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
	add r0, sl
	str	r0, [r7, #0x38]
	ldr	r2, [r7, #0x18]
	lsl	r0, r2, #0x4
	ldr	r3, [r7, #0x38]
	add	r0, r0, r3
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bge	.L805D6D0	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x2
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D6D4	@cond_branch
.L805D6D0:
	ldr	r0, [r5, #0x40]
	b	.L805D6D8
.L805D6D4:
	ldr	r0, [r5, #0x40]
	neg	r0, r0
.L805D6D8:
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
	ldr	r3, .L805D750
	and	r2, r2, r3
	ldr	r3, [r7, #0x44]
	add	r4, r2, r3
	mov	r9, r0
	str	r1, [r7, #0x40]
	ldr	r0, .L805D750
	cmp	r4, r0
	ble	.L805D776	@cond_branch
	mov	r0, #0x2
	orr	r6, r6, r0
	ldr	r1, .L805D750
	sub	r2, r1, r2
	str	r2, [r7, #0x20]
	ldr	r1, [r7, #0x18]
	add	r1, r1, #0x1
	mov	r2, sl
	ldr	r0, [r2]
	sub	r0, r0, #0x1
	cmp	r1, r0
	blt	.L805D768	@cond_branch
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
	beq	.L805D754	@cond_branch
	mov	r0, #0x4
	orr	r6, r6, r0
	ldr	r3, [r7, #0x34]
	ldr	r3, [r3, #0x10]
	mov	r8, r3
	ldr	r0, [r7, #0x34]
	ldr	r0, [r0, #0x4]
	str	r0, [r7, #0x28]
	b	.L805D7E2
.L805D750:
	.align	2, 0

	.4byte	0x3ffff
.L805D754:
	mov	r0, #0x1
	orr	r6, r6, r0
	mov	r1, r9
	ldr	r1, [r1]
	ldr	r2, .L805D764
	and	r1, r1, r2
	str	r1, [r7, #0x1c]
	b	.L805D7E2
.L805D764:
	.align	2, 0

	.4byte	0x3ffff
.L805D768:
	ldr	r0, [r7, #0x40]
	add	r0, r0, #0x10
	ldr	r3, [r7, #0x38]
	add	r3, r3, r0
	mov	r8, r3
	str	r1, [r7, #0x30]
	b	.L805D7E2
.L805D776:
	cmp	r4, #0
	bge	.L805D7E2	@cond_branch
	mov	r0, #0x2
	orr	r6, r6, r0
	str	r4, [r7, #0x20]
	ldr	r0, [r7, #0x18]
	sub	r0, r0, #0x1
	cmp	r0, #0
	bge	.L805D7D4	@cond_branch
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
	beq	.L805D7BE	@cond_branch
	mov	r0, #0x4
	orr	r6, r6, r0
	ldr	r0, [r7, #0x34]
	ldr	r0, [r0, #0xc]
	mov	r8, r0
	ldr	r1, [r7, #0x34]
	ldr	r0, [r1, #0x4]
	sub	r0, r0, #0x1
	str	r0, [r7, #0x28]
	b	.L805D7E2
.L805D7BE:
	mov	r0, #0x1
	orr	r6, r6, r0
	mov	r2, r9
	ldr	r2, [r2]
	ldr	r3, .L805D7D0
	and	r2, r2, r3
	str	r2, [r7, #0x1c]
	b	.L805D7E2
.L805D7CE:
	.align	2, 0
.L805D7D0:
	.4byte	0x3ffff
.L805D7D4:
	ldr	r0, [r7, #0x40]
	sub	r0, r0, #0x10
	ldr	r1, [r7, #0x38]
	add	r1, r1, r0
	mov	r8, r1
	ldr	r2, [r7, #0x18]
	str	r2, [r7, #0x30]
.L805D7E2:
	mov	r1, #0x3
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0x2
	beq	.L805D7EE	@cond_branch
	b	.L805D932
.L805D7EE:
	ldr	r3, [r7, #0x44]
	cmp	r3, #0
	blt	.L805D812	@cond_branch
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
	b	.L805D82E
.L805D812:
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
.L805D82E:
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
	ble	.L805D846	@cond_branch
	sub	r2, r2, #0xff
.L805D846:
	mov	r0, #0x0
	ldsb	r0, [r3, r0]
	cmp	r0, #0
	blt	.L805D864	@cond_branch
	mov	r3, r8
	mov	r0, #0x0
	ldsb	r0, [r3, r0]
	cmp	r0, #0
	bge	.L805D87A	@cond_branch
	mov	r0, #0x8
	orr	r6, r6, r0
	ldr	r0, [r7, #0x44]
	cmp	r0, #0
	blt	.L805D87A	@cond_branch
	b	.L805D878
.L805D864:
	mov	r1, r8
	mov	r0, #0x0
	ldsb	r0, [r1, r0]
	cmp	r0, #0
	blt	.L805D87A	@cond_branch
	mov	r0, #0x8
	orr	r6, r6, r0
	ldr	r3, [r7, #0x44]
	cmp	r3, #0
	bge	.L805D87A	@cond_branch
.L805D878:
	neg	r2, r2
.L805D87A:
	mov	r1, #0x8
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D910	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x2
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L805D910	@cond_branch
	cmp	r2, #0
	blt	.L805D8A2	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x8c
	ldrb	r0, [r0]
	cmp	r0, #0x1
	beq	.L805D8AC	@cond_branch
	b	.L805D8E0
.L805D8A2:
	add	r0, r5, #0
	add	r0, r0, #0x8c
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L805D8E0	@cond_branch
.L805D8AC:
	ldr	r0, [r7, #0x2c]
	cmp	r0, #0
	ble	.L805D8C8	@cond_branch
	mov	r1, r9
	ldr	r0, [r1]
	ldr	r1, .L805D8C0
	and	r0, r0, r1
	ldr	r1, .L805D8C0 + 4
	sub	r0, r1, r0
	b	.L805D902
.L805D8C0:
	.align	2, 0

	.4byte	0x3ffff
	.4byte	0x40100
.L805D8C8:
	mov	r2, r9
	ldr	r0, [r2]
	ldr	r1, .L805D8D8
	and	r0, r0, r1
	ldr	r1, .L805D8D8 + 4
	sub	r0, r1, r0
	b	.L805D902
.L805D8D6:
	.align	2, 0
.L805D8D8:
	.4byte	0x3ffff
	.4byte	0xffffff00
.L805D8E0:
	ldr	r3, [r7, #0x2c]
	cmp	r3, #0
	ble	.L805D8F8	@cond_branch
	mov	r1, r9
	ldr	r0, [r1]
	ldr	r2, .L805D8F4
	bic	r2, r0
	str	r2, [r7, #0x44]
	b	.L805D904
.L805D8F2:
	.align	2, 0
.L805D8F4:
	.4byte	0x3ffff
.L805D8F8:
	mov	r3, r9
	ldr	r0, [r3]
	ldr	r1, .L805D90C
	and	r0, r0, r1
	neg	r0, r0
.L805D902:
	str	r0, [r7, #0x44]
.L805D904:
	mov	r0, #0x0
	str	r0, [r5, #0x40]
	b	.L805D932
.L805D90A:
	.align	2, 0
.L805D90C:
	.4byte	0x3ffff
.L805D910:
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
.L805D932:
	mov	r0, r9
	ldr	r0, [r0]
	mov	r8, r0
	ldr	r0, [r7, #0x44]
	add r0, r8
	mov	r1, r9
	str	r0, [r1]
	mov	r1, #0x7
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0x2
	bne	.L805D972	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x90
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L805D972	@cond_branch
	ldr	r0, [r2, #0x8]
	cmp	r0, #0
	beq	.L805D972	@cond_branch
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
	bl	_call_via_r4
.L805D972:
	mov	r1, #0x5
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0x1
	bne	.L805DA4E	@cond_branch
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x8
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805D9E2	@cond_branch
	ldr	r0, [r5, #0x40]
	cmp	r0, #0
	ble	.L805D9A8	@cond_branch
	mov	r1, sl
	ldr	r0, [r1]
	lsl	r0, r0, #0x12
	ldr	r2, .L805D9A4
	add	r0, r0, r2
	mov	r3, r9
	str	r0, [r3]
	ldr	r0, [r1]
	sub	r4, r0, #1
	b	.L805D9B0
.L805D9A4:
	.align	2, 0

	.4byte	0xfffbff00
.L805D9A8:
	mov	r0, #0x0
	mov	r6, r9
	str	r0, [r6]
	mov	r4, #0x0
.L805D9B0:
	ldr	r0, [r5, #0x40]
	neg	r0, r0
	str	r0, [r5, #0x40]
	add	r0, r5, #0
	add	r0, r0, #0x90
	ldr	r2, [r0]
	cmp	r2, #0
	bne	.L805D9C2	@cond_branch
	b	.L805DB56
.L805D9C2:
	ldr	r0, [r2, #0x8]
	cmp	r0, #0
	bne	.L805D9CA	@cond_branch
	b	.L805DB56
.L805D9CA:
	add	r0, r5, #0
	add	r0, r0, #0x80
	ldr	r1, [r0]
	add	r0, r0, #0x4
	ldr	r3, [r0]
	str	r4, [sp]
	ldr	r4, [r2, #0x8]
	add	r0, r5, #0
	mov	r2, sl
	bl	_call_via_r4
	b	.L805DB56
.L805D9E2:
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
	b	.L805DB56
.L805DA4E:
	mov	r1, #0x4
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805DABC	@cond_branch
	mov	r0, r9
	ldr	r3, [r0]
	ldr	r1, .L805DAB8
	and	r3, r3, r1
	mov	r2, r8
	and	r2, r2, r1
	mov	r8, r2
	mov	r0, #0x8
	and	r6, r6, r0
	cmp	r6, #0
	beq	.L805DA70	@cond_branch
	sub	r3, r1, r3
.L805DA70:
	ldr	r6, [r7, #0x44]
	cmp	r6, #0
	bge	.L805DA80	@cond_branch
	mov	r2, r8
	sub	r0, r3, r2
	cmp	r0, #0
	bge	.L805DA80	@cond_branch
	sub	r3, r1, r3
.L805DA80:
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
	beq	.L805DB56	@cond_branch
	ldr	r3, [r0, #0xc]
	cmp	r3, #0
	beq	.L805DB56	@cond_branch
	ldr	r1, [r4]
	ldr	r0, [r7, #0x34]
	ldr	r2, [r0, #0x8]
	add	r0, r5, #0
	bl	_call_via_r3
	b	.L805DB56
.L805DAB6:
	.align	2, 0
.L805DAB8:
	.4byte	0x3ffff
.L805DABC:
	add	r1, r5, #0
	add	r1, r1, #0x8d
	mov	r0, #0x4
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805DAE4	@cond_branch
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
	b	.L805DAFC
.L805DAE4:
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
.L805DAFC:
	cmp	r0, #0
	beq	.L805DB56	@cond_branch
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
.L805DB56:
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
