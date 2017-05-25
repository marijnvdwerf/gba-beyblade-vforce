	.include "asm/common.inc"

	thumb_func_start sub_8056ADC
sub_8056ADC:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r6, r0, #0
	add	r4, r1, #0
	add	r5, r2, #0
	ldr	r1, [r4]
	bl	GetPointAtIndex
	mov	r8, r0
	ldr	r1, [r4, #0x4]
	add	r0, r6, #0
	bl	GetPointAtIndex
	add	r1, r0, #0
	mov	r2, r8
	ldr	r0, [r2, #0x8]
	lsl	r0, r0, #0x5
	ldr	r2, [r1, #0x8]
	lsl	r2, r2, #0x5
	mov	r3, #0x1c
	ldsh	r1, [r4, r3]
	lsl	r1, r1, #0x5
	add	r3, r0, r1
	mov	r6, #0x12
	ldsh	r4, [r4, r6]
	lsl	r4, r4, #0x5
	add	r2, r2, r4
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add	r0, r0, r1
	sub	r1, r2, r3
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add	r3, r3, r1
	NEG	r4, r4
	add	r1, r4, #0
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add	r2, r2, r1
	sub	r1, r3, r0
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add	r0, r0, r1
	sub	r2, r2, r3
	add	r1, r2, #0
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add	r3, r3, r1
	sub	r3, r3, r0
	add	r1, r3, #0
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add	r0, r0, r1
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8056ADC

.align 2, 0 @ Don't pad with nop.
