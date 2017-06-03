	.include "asm/common.inc"

	thumb_func_start sub_804A908
sub_804A908:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	ldrh	r0, [r7, #0x2]
	mov	r9, r0
	ldrh	r1, [r7, #0x4]
	mov	r8, r1
	mov	r2, #0x1
	NEG	r2, r2
	ADD r9, r2
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	mov	sl, r3
.L15:
	mov	r1, r8
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, [r7, #0x8]
	add	r4, r1, r0
	ldr	r5, [r4, #0x18]
	ldrh	r0, [r4, #0xc]
	sub	r0, r0, #0x1
	strh	r0, [r4, #0xc]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L2	@cond_branch
	mov	r2, #0xa0
	lsl	r2, r2, #0x8
	str	r2, [r5, #0xc]
	b	.L3
.L2:
	ldr	r3, [r7, #0x28]
	cmp	r3, #0
	beq	.L6	@cond_branch
	ldr	r1, [r3, #0xc]
	ldr	r2, .L7
	and	r1, r1, r2
	ldr	r0, [r4]
	sub	r6, r0, r1
	ldr	r0, [r3, #0x10]
	and	r0, r0, r2
	ldr	r1, [r4, #0x4]
	sub	r2, r1, r0
	str	r6, [r5, #0x8]
	ldr	r0, .L7 + 4
	cmp	r2, r0
	blt	.L5	@cond_branch
	str	r2, [r5, #0xc]
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0xffffff00
	.4byte	0xffffc000
.L5:
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	str	r3, [r5, #0xc]
.L6:
	ldrh	r1, [r4, #0xe]
	mov	r2, #0xe
	ldsh	r0, [r4, r2]
	cmp	r0, #0x10
	ble	.L9	@cond_branch
	add	r0, r1, #0
	sub	r0, r0, #0x10
	strh	r0, [r4, #0xe]
	b	.L13
.L9:
	add	r0, r1, #0
	add	r0, r0, #0x10
	ldrh	r3, [r4, #0x10]
	add	r0, r3, r0
	strh	r0, [r4, #0xe]
	ldrh	r0, [r5, #0x18]
	add	r0, r0, #0x1
	strh	r0, [r5, #0x18]
	ldrh	r2, [r5, #0x18]
	mov	r1, #0x12
	ldsh	r0, [r4, r1]
	mov	r3, #0x14
	ldsh	r1, [r4, r3]
	add	r0, r0, r1
	cmp	r2, r0
	bne	.L13	@cond_branch
	ldrh	r0, [r4, #0x16]
	ldrh	r1, [r7, #0x26]
	cmp	r0, r1
	bne	.L12	@cond_branch
	mov	r3, #0x24
	ldsh	r2, [r7, r3]
	add	r0, r7, #0
	add	r1, r4, #0
	bl	sub_804AB64
	b	.L13
.L12:
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r5, #0xc]
.L3:
	add	r0, r5, #0
	mov	r1, sl
	mov	r2, sl
	mov	r3, #0x0
	bl	sub_8060F64
	ldrh	r0, [r7, #0x2]
	sub	r0, r0, #0x1
	strh	r0, [r7, #0x2]
.L13:
	mov	r1, #0x1
	NEG	r1, r1
	ADD r8, r1
	mov	r2, r8
	cmp	r2, #0
	bge	.L14	@cond_branch
	ldrh	r3, [r7]
	sub	r3, r3, #0x1
	mov	r8, r3
.L14:
	mov	r0, r9
	mov	r1, #0x1
	NEG	r1, r1
	ADD r9, r1
	cmp	r0, #0
	bne	.L15	@cond_branch
.L1:
	ldr	r1, [r7, #0x10]
	ldr	r0, [r7, #0x18]
	sub	r5, r1, r0
	ldr	r1, [r7, #0x14]
	ldr	r0, [r7, #0x1c]
	sub	r6, r1, r0
	add	r1, r5, #0
	mul	r1, r1, r5
	add	r0, r6, #0
	mul	r0, r0, r6
	add	r4, r1, r0
	mov	r2, #0xd0
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	mul	r0, r0, r2
	cmp	r4, r0
	bgt	.L16	@cond_branch
	b	.L17
.L16:
	add	r0, r4, #0
	bl	Sqrt
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	lsl	r0, r5, #0x8
	add	r1, r4, #0
	bl	__divsi3
	mov	r8, r0
	lsl	r0, r6, #0x8
	add	r1, r4, #0
	bl	__divsi3
	add	r5, r0, #0
	mov	r0, r8
	add	r1, r5, #0
	bl	sub_804AB88
	mov	r9, r0
	mov	r3, #0xd0
	lsl	r3, r3, #0x4
	mov	r0, r8
	mul	r0, r0, r3
	asr	r0, r0, #0x8
	mov	r8, r0
	add	r0, r5, #0
	mul	r0, r0, r3
	asr	r5, r0, #0x8
	ldrh	r1, [r7, #0x4]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, [r7, #0x8]
	add	r4, r1, r0
	mov	r2, #0xc
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	beq	.L19	@cond_branch
	ldrh	r3, [r4, #0x16]
	ldrh	r0, [r7, #0x24]
	cmp	r3, r0
	beq	.L19	@cond_branch
	mov	r1, #0x24
	ldsh	r2, [r7, r1]
	add	r0, r7, #0
	add	r1, r4, #0
	bl	sub_804AB64
.L19:
	ldrh	r0, [r7, #0x4]
	add	r0, r0, #0x1
	strh	r0, [r7, #0x4]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldrh	r1, [r7]
	cmp	r0, r1
	bne	.L20	@cond_branch
	mov	r0, #0x0
	strh	r0, [r7, #0x4]
.L20:
	ldrh	r0, [r7, #0x2]
	cmp	r0, r1
	bcs	.L21	@cond_branch
	add	r0, r0, #0x1
	strh	r0, [r7, #0x2]
.L21:
	ldrh	r2, [r7, #0x4]
	lsl	r0, r2, #0x3
	sub	r0, r0, r2
	lsl	r0, r0, #0x2
	ldr	r1, [r7, #0x8]
	add	r4, r1, r0
	mov	r3, r8
	asr	r0, r3, #0x1
	ldr	r2, .L25
	add	r0, r0, r2
	ldr	r1, [r7, #0x18]
	add	r6, r1, r0
	asr	r0, r5, #0x1
	add	r0, r0, r2
	ldr	r1, [r7, #0x1c]
	add	r2, r1, r0
	str	r6, [r4]
	str	r2, [r4, #0x4]
	ldr	r3, [r7, #0x28]
	cmp	r3, #0
	beq	.L22	@cond_branch
	ldr	r0, [r3, #0xc]
	ldr	r1, .L25 + 4
	and	r0, r0, r1
	sub	r6, r6, r0
	ldr	r0, [r3, #0x10]
	and	r0, r0, r1
	sub	r2, r2, r0
.L22:
	ldr	r0, [r4, #0x18]
	str	r6, [r0, #0x8]
	ldr	r1, .L25 + 8
	add	r3, r0, #0
	cmp	r2, r1
	blt	.L23	@cond_branch
	str	r2, [r3, #0xc]
	b	.L24
.L26:
	.align	2, 0
.L25:
	.4byte	0xfffff800
	.4byte	0xffffff00
	.4byte	0xffffc000
.L23:
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r3, #0xc]
.L24:
	mov	r0, #0x0
	strh	r0, [r3, #0x18]
	ldr	r2, [r4, #0x18]
	ldr	r0, .L27
	ldrh	r1, [r2, #0x14]
	and	r0, r0, r1
	ldrh	r3, [r7, #0x2c]
	lsl	r1, r3, #0xc
	orr	r0, r0, r1
	strh	r0, [r2, #0x14]
	ldr	r0, [r4, #0x18]
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	mov	r1, r9
	lsl	r3, r1, #0x18
	lsr	r3, r3, #0x18
	add	r1, r2, #0
	bl	sub_8060F64
	ldrh	r0, [r7, #0x6]
	strh	r0, [r4, #0xc]
	add	r0, r7, #0
	add	r1, r4, #0
	mov	r2, #0x1
	bl	sub_804AB64
	ldr	r0, [r7, #0x18]
	ADD r0, r8
	str	r0, [r7, #0x18]
	ldr	r0, [r7, #0x1c]
	add	r0, r0, r5
	str	r0, [r7, #0x1c]
.L17:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L28:
	.align	2, 0
.L27:
	.4byte	0xfff
	thumb_func_end sub_804A908

.align 2, 0 @ Don't pad with nop.
