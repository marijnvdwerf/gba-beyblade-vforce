	.include "asm/common.inc"

	thumb_func_start sub_804DAA0
sub_804DAA0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r7, r0, #0
	mov	r8, r1
	mov	r4, #0x80
	lsl	r4, r4, #0x13
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L1	@cond_branch
	add	r0, r7, #0
	mov	r7, r8
	mov	r8, r0
.L1:
	add	r0, r7, #0
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	mov	r0, r8
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L6	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x1
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L6	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x40
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L6	@cond_branch
	ldr	r0, [r7]
	mov	r2, r8
	ldr	r1, [r2]
	ldr	r4, [r0, #0x4]
	ldr	r5, [r0, #0x8]
	ldr	r6, [r0, #0xc]
	ldr	r0, [r1, #0x4]
	ldr	r2, [r1, #0x8]
	ldr	r3, [r1, #0xc]
	sub	r0, r0, r4
	asr	r0, r0, #0x8
	sub	r2, r2, r5
	asr	r2, r2, #0x8
	sub	r3, r3, r6
	asr	r3, r3, #0x8
	add	r1, r0, #0
	mul	r1, r1, r0
	add	r0, r2, #0
	mul	r0, r0, r2
	add	r1, r1, r0
	add	r0, r3, #0
	mul	r0, r0, r3
	add	r1, r1, r0
	mov	r3, #0x84
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r1, r0
	bge	.L6	@cond_branch
	mov	r1, #0x88
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	ldr	r2, .L9
	add	r1, r7, r2
	mov	r3, #0x0
	ldsh	r2, [r0, r3]
	mov	r3, #0x0
	ldsh	r0, [r1, r3]
	cmp	r2, r0
	ble	.L7	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x40
	bl	SetRiderFlag
	ldr	r0, .L9 + 4
	add	r1, r7, r0
	mov	r0, #0x3c
	strh	r0, [r1]
	b	.L8
.L10:
	.align	2, 0
.L9:
	.4byte	0x222
	.4byte	0x21e
.L7:
	add	r0, r7, #0
	mov	r1, #0x1
	bl	SetRiderFlag
	mov	r1, #0x87
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	ldrh	r1, [r0]
	ldr	r2, .L11
	add	r0, r7, r2
	strh	r1, [r0]
.L8:
	mov	r3, #0x83
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	mov	r1, r8
	str	r1, [r0]
.L6:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L12:
	.align	2, 0
.L11:
	.4byte	0x21e
	thumb_func_end sub_804DAA0

.align 2, 0 @ Don't pad with nop.
