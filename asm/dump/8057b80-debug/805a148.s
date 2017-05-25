	.include "asm/common.inc"

	thumb_func_start sub_805A148
sub_805A148:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	ldr	r6, [r0, #0x4]
	ldr	r3, [r1, #0x8]
	mul	r3, r3, r6
	ldr	r4, [r0, #0x8]
	mov	r8, r4
	ldr	r4, [r1, #0x4]
	mov	r5, r8
	mul	r5, r5, r4
	add	r4, r5, #0
	sub	r3, r3, r4
	ldr	r5, [r0, #0xc]
	ldr	r4, [r1]
	mul	r4, r4, r5
	add	r3, r3, r4
	ldr	r4, [r0]
	ldr	r0, [r1, #0xc]
	mul	r0, r0, r4
	add	r3, r3, r0
	asr	r3, r3, #0x8
	str	r3, [r2]
	ldr	r0, [r1]
	mov	r7, r8
	mul	r7, r7, r0
	add	r0, r7, #0
	ldr	r3, [r1, #0x8]
	mul	r3, r3, r4
	sub	r0, r0, r3
	ldr	r3, [r1, #0x4]
	mul	r3, r3, r5
	add	r0, r0, r3
	ldr	r3, [r1, #0xc]
	mul	r3, r3, r6
	add	r0, r0, r3
	asr	r0, r0, #0x8
	str	r0, [r2, #0x4]
	ldr	r0, [r1, #0x4]
	mul	r0, r0, r4
	ldr	r3, [r1]
	mul	r3, r3, r6
	sub	r0, r0, r3
	ldr	r3, [r1, #0x8]
	mul	r3, r3, r5
	add	r0, r0, r3
	ldr	r3, [r1, #0xc]
	mov	r7, r8
	mul	r7, r7, r3
	add	r3, r7, #0
	add	r0, r0, r3
	asr	r0, r0, #0x8
	str	r0, [r2, #0x8]
	ldr	r0, [r1, #0xc]
	mul	r0, r0, r5
	ldr	r3, [r1]
	mul	r3, r3, r4
	sub	r0, r0, r3
	ldr	r3, [r1, #0x4]
	mul	r3, r3, r6
	sub	r0, r0, r3
	ldr	r1, [r1, #0x8]
	mov	r3, r8
	mul	r3, r3, r1
	add	r1, r3, #0
	sub	r0, r0, r1
	asr	r0, r0, #0x8
	str	r0, [r2, #0xc]
	add	r0, r2, #0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805A148

.align 2, 0 @ Don't pad with nop.
