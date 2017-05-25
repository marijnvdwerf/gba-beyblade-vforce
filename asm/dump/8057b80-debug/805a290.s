	.include "asm/common.inc"

	thumb_func_start sub_805A290
sub_805A290:
	push	{r4, r5, r6, lr}
	ldr	r6, [r0]
	ldr	r3, [r1]
	mul	r3, r3, r6
	ldr	r5, [r0, #0x4]
	ldr	r4, [r1, #0xc]
	mul	r4, r4, r5
	add	r3, r3, r4
	ldr	r4, [r0, #0x8]
	ldr	r0, [r1, #0x18]
	mul	r0, r0, r4
	add	r3, r3, r0
	asr	r3, r3, #0x8
	str	r3, [r2]
	ldr	r0, [r1, #0x4]
	mul	r0, r0, r6
	ldr	r3, [r1, #0x10]
	mul	r3, r3, r5
	add	r0, r0, r3
	ldr	r3, [r1, #0x1c]
	mul	r3, r3, r4
	add	r0, r0, r3
	asr	r0, r0, #0x8
	str	r0, [r2, #0x4]
	ldr	r0, [r1, #0x8]
	mul	r0, r0, r6
	ldr	r3, [r1, #0x14]
	mul	r3, r3, r5
	add	r0, r0, r3
	ldr	r1, [r1, #0x20]
	mul	r1, r1, r4
	add	r0, r0, r1
	asr	r0, r0, #0x8
	str	r0, [r2, #0x8]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805A290

.align 2, 0 @ Don't pad with nop.
