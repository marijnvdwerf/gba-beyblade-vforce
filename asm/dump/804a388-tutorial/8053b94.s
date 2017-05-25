	.include "asm/common.inc"

	thumb_func_start sub_8053B94
sub_8053B94:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	bl	getLevelDescription2
	mov	r8, r0
	bl	sub_8051734
	add	r5, r0, #0
	ldr	r0, .L5
	ldr	r1, [r0]
	ldr	r0, .L5 + 4
	add	r4, r1, r0
	ldr	r6, .L5 + 8
	ldr	r7, [r6]
	ldr	r2, .L5 + 12
	add	r1, r1, r2
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	sub_805AB38
.L1:
	ldr	r1, [r6]
	ldr	r2, .L5 + 16
	add	r0, r1, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L3	@cond_branch
	add	r2, r2, #0x26
	add	r0, r1, r2
	ldrb	r1, [r0]
	cmp	r1, #0
	bne	.L3	@cond_branch
	mov	r0, #0x2
	strh	r0, [r4, #0xc]
	str	r1, [r4]
	b	.L16
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000f48
	.4byte	0x6ec
	.4byte	0x3000fb0
	.4byte	0x6bc
	.4byte	0x161b
.L3:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L16	@cond_branch
	mov	r0, #0x1
	strh	r0, [r4, #0xc]
	ldr	r0, .L10
	ldr	r0, [r0]
	ldr	r1, .L10 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8	@cond_branch
	mov	r2, #0x8d
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	ldr	r0, [r0]
	lsl	r1, r0, #0x4
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3000fb0
	.4byte	0x1641
.L8:
	mov	r1, #0xfa
	lsl	r1, r1, #0x2
.L9:
	str	r1, [r4]
	ldr	r0, [r5, #0x4]
	cmp	r1, r0
	bge	.L12	@cond_branch
	mov	r0, #0x4
	ldrh	r2, [r4, #0xc]
	orr	r0, r0, r2
	strh	r0, [r4, #0xc]
	str	r1, [r5, #0x4]
	mov	r0, #0x0
	bl	sub_8051640
.L12:
	ldrh	r1, [r5]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L16	@cond_branch
	mov	r0, #0x1
	orr	r0, r0, r1
	strh	r0, [r5]
	mov	r0, #0x0
	bl	sub_8051640
	bl	sub_8051744
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L14	@cond_branch
	mov	r0, #0x29
	bl	StoreLevelVar14
	mov	r0, #0x1c
	bl	sub_8049234
	b	.L16
.L14:
	mov	r1, r8
	ldrb	r0, [r1, #0x11]
	cmp	r0, #0
	beq	.L16	@cond_branch
	bl	getLevelDescription2
	ldr	r0, [r0, #0x18]
	bl	StoreLevelVar14
	mov	r0, #0x1c
	bl	sub_8049234
.L16:
	ldr	r0, .L17
	ldr	r0, [r0]
	ldr	r2, .L17 + 4
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r0, r0, #0x1
	str	r0, [r4, #0x4]
	bl	sub_80518F0
	str	r0, [r4, #0x8]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L18:
	.align	2, 0
.L17:
	.4byte	0x3000fb0
	.4byte	0x163c
	thumb_func_end sub_8053B94

.align 2, 0 @ Don't pad with nop.
