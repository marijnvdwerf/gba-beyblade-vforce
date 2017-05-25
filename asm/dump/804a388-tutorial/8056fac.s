	.include "asm/common.inc"

	thumb_func_start sub_8056FAC
sub_8056FAC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	ldr	r0, .L6
	ldr	r0, [r0]
	ldr	r1, .L6 + 4
	add	r7, r0, r1
	ldr	r3, .L6 + 8
	add	r6, r0, r3
	ldr	r1, .L6 + 12
	add	r1, r1, r0
	mov	r9, r1
	mov	r5, #0x0
	ldr	r0, [r7]
	cmp	r5, r0
	bge	.L1	@cond_branch
	mov	r8, r5
.L5:
	asr	r0, r5, #0x5
	lsl	r0, r0, #0x2
	mov	r3, #0x82
	lsl	r3, r3, #0x1
	add	r2, r7, r3
	add	r2, r2, r0
	mov	r0, #0x1f
	and	r0, r0, r5
	mov	r1, #0x1
	LSL	r1, r0
	ldr	r0, [r2]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L2	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L3	@cond_branch
.L2:
	ldr	r0, [r6, #0x4]
	lsl	r2, r0, #0x5
	mov	r3, r9
	ldr	r1, [r3, #0xc]
	add	r4, r1, r2
	bl	GetStruct4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L4	@cond_branch
	mov	r1, r8
	str	r1, [r0, #0x70]
.L4:
	mov	r3, r8
	strb	r3, [r4, #0x10]
.L3:
	add	r6, r6, #0x8
	add	r5, r5, #0x1
	ldr	r0, [r7]
	cmp	r5, r0
	blt	.L5	@cond_branch
.L1:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.4byte	0x3000fb0
	.4byte	0x12f4
	.4byte	0x12f8
	.4byte	0x65c
	thumb_func_end sub_8056FAC

.align 2, 0 @ Don't pad with nop.
