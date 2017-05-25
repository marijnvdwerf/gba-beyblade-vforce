	.include "asm/common.inc"

	thumb_func_start sub_805E068
sub_805E068:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r5, r0, #0
	mov	r8, r2
	mov	r9, r3
	ldr	r7, [sp, #0x1c]
	bl	GetSplineAtIndex
	add	r0, r0, #0x20
	mov	r1, r9
	lsl	r4, r1, #0x2
	add	r4, r4, r0
	ldr	r1, [r4]
	add	r0, r5, #0
	bl	GetPointAtIndex
	add	r6, r0, #0
	ldr	r1, [r4, #0x4]
	add	r0, r5, #0
	bl	GetPointAtIndex
	ldr	r1, [r0]
	ldr	r2, [r6]
	sub	r1, r1, r2
	mul	r1, r1, r7
	asr	r1, r1, #0xa
	add	r2, r2, r1
	mov	r1, r8
	str	r2, [r1]
	ldr	r1, [r0, #0x4]
	ldr	r2, [r6, #0x4]
	sub	r1, r1, r2
	mul	r1, r1, r7
	asr	r1, r1, #0xa
	add	r2, r2, r1
	mov	r1, r8
	str	r2, [r1, #0x4]
	ldr	r0, [r0, #0x8]
	ldr	r1, [r6, #0x8]
	sub	r0, r0, r1
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	add	r1, r1, r0
	mov	r0, r8
	str	r1, [r0, #0x8]
	str	r7, [r0, #0xc]
	mov	r1, r9
	str	r1, [r0, #0x10]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E068

.align 2, 0 @ Don't pad with nop.
