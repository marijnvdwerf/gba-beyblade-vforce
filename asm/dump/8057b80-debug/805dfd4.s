	.include "asm/common.inc"

	thumb_func_start sub_805DFD4
sub_805DFD4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r6, r0, #0
	mov	r8, r2
	add	r7, r3, #0
	bl	GetSplineAtIndex
	add	r1, r0, #0
	add	r2, r1, #0
	add	r2, r2, #0x20
	cmp	r7, #0
	bge	.L1	@cond_branch
	mov	r7, #0x0
.L1:
	asr	r0, r7, #0xa
	ldr	r1, [r1]
	cmp	r0, r1
	blt	.L2	@cond_branch
	sub	r0, r1, #1
	lsl	r0, r0, #0xa
	ldr	r1, .L3
	and	r7, r7, r1
	orr	r7, r7, r0
.L2:
	asr	r0, r7, #0xa
	mov	r9, r0
	lsl	r4, r0, #0x2
	add	r4, r4, r2
	ldr	r1, [r4]
	add	r0, r6, #0
	bl	GetPointAtIndex
	add	r5, r0, #0
	ldr	r1, [r4, #0x4]
	add	r0, r6, #0
	bl	GetPointAtIndex
	ldr	r1, [r0]
	ldr	r2, [r5]
	sub	r1, r1, r2
	ldr	r3, .L3
	and	r3, r3, r7
	mul	r1, r1, r3
	asr	r1, r1, #0xa
	add	r2, r2, r1
	mov	r1, r8
	str	r2, [r1]
	ldr	r1, [r0, #0x4]
	ldr	r2, [r5, #0x4]
	sub	r1, r1, r2
	mul	r1, r1, r3
	asr	r1, r1, #0xa
	add	r2, r2, r1
	mov	r1, r8
	str	r2, [r1, #0x4]
	ldr	r0, [r0, #0x8]
	ldr	r1, [r5, #0x8]
	sub	r0, r0, r1
	mul	r0, r0, r3
	asr	r0, r0, #0xa
	add	r1, r1, r0
	mov	r0, r8
	str	r1, [r0, #0x8]
	str	r3, [r0, #0xc]
	mov	r1, r9
	str	r1, [r0, #0x10]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L4:
	.align	2, 0
.L3:
	.4byte	0x3ff
	thumb_func_end sub_805DFD4

.align 2, 0 @ Don't pad with nop.
