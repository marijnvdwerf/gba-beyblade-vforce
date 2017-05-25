	.include "asm/common.inc"

	thumb_func_start sub_8061684
sub_8061684:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r6, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r9, r1
	mov	r8, r9
	lsl	r2, r2, #0x10
	lsr	r5, r2, #0x10
	add	r7, r5, #0
	ldr	r1, [r6, #0x1c]
	cmp	r1, #0
	bne	.L1	@cond_branch
	b	.L2
.L1:
	mov	r0, #0x4
	ldrh	r2, [r6, #0x8]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r5, [r6, #0x14]
	sub	r4, r1, #1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r4, r0
	bne	.L4	@cond_branch
	b	.L28
.L4:
	mov	r9, r0
.L6:
	add	r0, r5, #0
	mov	r1, r8
	add	r2, r7, #0
	bl	sub_806100C
	ldr	r5, [r5, #0x4]
	sub	r4, r4, #0x1
	cmp	r4, r9
	bne	.L6	@cond_branch
	b	.L28
.L3:
	ldr	r4, [r6, #0x2c]
	cmp	r4, #0
	beq	.L8	@cond_branch
	add	r0, r4, #0
	bl	sub_8061160
	ldrb	r3, [r4, #0x18]
	add	r0, r4, #0
	mov	r1, r9
	add	r2, r5, #0
	bl	sub_8060E8C
	str	r0, [r6, #0x2c]
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L9	@cond_branch
	ldr	r1, [r6, #0x14]
	ldr	r2, [r6, #0x1c]
	sub	r2, r2, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r2, r0
	bne	.L10	@cond_branch
	b	.L28
.L10:
	mov	r5, #0x0
	ldr	r4, .L14
	add	r3, r0, #0
.L12:
	str	r5, [r1, #0x30]
	ldr	r0, [r1, #0x10]
	and	r0, r0, r4
	str	r0, [r1, #0x10]
	ldr	r1, [r1, #0x4]
	sub	r2, r2, #0x1
	cmp	r2, r3
	bne	.L12	@cond_branch
	b	.L28
.L15:
	.align	2, 0
.L14:
	.4byte	0xc1fffcff
.L9:
	ldr	r0, [r4, #0x8]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r0, r0, r1
	lsl	r3, r0, #0x14
	mov	r5, #0x80
	lsl	r5, r5, #0x1
	orr	r3, r3, r5
	ldr	r1, [r6, #0x14]
	ldr	r2, [r6, #0x1c]
	mov	r0, #0x8
	ldrh	r7, [r6, #0x8]
	and	r0, r0, r7
	cmp	r0, #0
	bne	.L22	@cond_branch
	ldrb	r0, [r4, #0x18]
	cmp	r0, #0
	beq	.L17	@cond_branch
	ldrh	r0, [r4, #0x14]
	cmp	r0, #0xb0
	bhi	.L21	@cond_branch
	ldrh	r7, [r4, #0x16]
	cmp	r7, #0xb0
	bls	.L22	@cond_branch
	b	.L21
.L17:
	ldrh	r0, [r4, #0x14]
	cmp	r0, r5
	bhi	.L21	@cond_branch
	ldrh	r7, [r4, #0x16]
	cmp	r7, r5
	bls	.L22	@cond_branch
.L21:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	orr	r3, r3, r0
.L22:
	sub	r2, r2, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r2, r0
	beq	.L23	@cond_branch
	ldr	r7, .L26
	add	r5, r0, #0
.L24:
	str	r4, [r1, #0x30]
	ldr	r0, [r1, #0x10]
	and	r0, r0, r7
	orr	r0, r0, r3
	str	r0, [r1, #0x10]
	ldr	r1, [r1, #0x4]
	sub	r2, r2, #0x1
	cmp	r2, r5
	bne	.L24	@cond_branch
.L23:
	add	r0, r4, #0
	bl	sub_8061158
	b	.L28
.L27:
	.align	2, 0
.L26:
	.4byte	0xc1fffcff
.L8:
	mov	r0, #0x0
	mov	r1, r8
	add	r2, r7, #0
	mov	r3, #0x0
	bl	sub_8060E8C
	str	r0, [r6, #0x2c]
	add	r4, r0, #0
	cmp	r4, #0
	beq	.L28	@cond_branch
	ldr	r0, [r4, #0x8]
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	and	r0, r0, r1
	lsl	r3, r0, #0x14
	mov	r5, #0x80
	lsl	r5, r5, #0x1
	orr	r3, r3, r5
	ldr	r1, [r6, #0x14]
	ldr	r2, [r6, #0x1c]
	mov	r0, #0x8
	ldrh	r7, [r6, #0x8]
	and	r0, r0, r7
	cmp	r0, #0
	bne	.L35	@cond_branch
	ldrb	r0, [r4, #0x18]
	cmp	r0, #0
	beq	.L30	@cond_branch
	ldrh	r0, [r4, #0x14]
	cmp	r0, #0xb0
	bhi	.L34	@cond_branch
	ldrh	r7, [r4, #0x16]
	cmp	r7, #0xb0
	bls	.L35	@cond_branch
	b	.L34
.L30:
	ldrh	r0, [r4, #0x14]
	cmp	r0, r5
	bhi	.L34	@cond_branch
	ldrh	r7, [r4, #0x16]
	cmp	r7, r5
	bls	.L35	@cond_branch
.L34:
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	orr	r3, r3, r0
.L35:
	sub	r2, r2, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r2, r0
	beq	.L36	@cond_branch
	ldr	r7, .L38
	add	r5, r0, #0
.L37:
	str	r4, [r1, #0x30]
	ldr	r0, [r1, #0x10]
	and	r0, r0, r7
	orr	r0, r0, r3
	str	r0, [r1, #0x10]
	ldr	r1, [r1, #0x4]
	sub	r2, r2, #0x1
	cmp	r2, r5
	bne	.L37	@cond_branch
.L36:
	add	r0, r4, #0
	bl	sub_8061158
.L28:
	add	r0, r6, #0
	bl	sub_806123C
.L2:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L39:
	.align	2, 0
.L38:
	.4byte	0xc1fffcff
	thumb_func_end sub_8061684

.align 2, 0 @ Don't pad with nop.
