	.include "asm/common.inc"

	thumb_func_start sub_8056CFC
sub_8056CFC:
	push	{r4, lr}
	ldr	r3, [r2]
	lsl	r3, r3, #0x4
	ldr	r4, [r1, #0x4]
	add	r3, r4, r3
	ldr	r1, [r2, #0x4]
	lsl	r1, r1, #0x4
	add	r4, r4, r1
	ldr	r2, [r3]
	ldr	r1, [r4]
	add	r2, r2, r1
	lsl	r2, r2, #0x4
	ldr	r1, [r3, #0x4]
	ldr	r3, [r4, #0x4]
	add	r1, r1, r3
	lsl	r1, r1, #0x4
	ldr	r3, [r0, #0x4]
	sub	r2, r2, r3
	asr	r2, r2, #0x8
	ldr	r0, [r0, #0x8]
	sub	r1, r1, r0
	asr	r1, r1, #0x8
	add	r0, r2, #0
	mul	r0, r0, r2
	add	r2, r1, #0
	mul	r2, r2, r1
	add	r1, r2, #0
	add	r0, r0, r1
	bl	Sqrt
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8056CFC

.align 2, 0 @ Don't pad with nop.
