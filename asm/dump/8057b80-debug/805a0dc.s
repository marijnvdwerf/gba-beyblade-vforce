	.include "asm/common.inc"

	thumb_func_start sub_805A0DC
sub_805A0DC:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r0, [r5]
	add	r1, r0, #0
	mul	r1, r1, r0
	add	r0, r1, #0
	ldr	r1, [r5, #0x4]
	add	r2, r1, #0
	mul	r2, r2, r1
	add	r1, r2, #0
	add	r0, r0, r1
	ldr	r1, [r5, #0x8]
	add	r2, r1, #0
	mul	r2, r2, r1
	add	r1, r2, #0
	add	r0, r0, r1
	ldr	r1, [r5, #0xc]
	add	r2, r1, #0
	mul	r2, r2, r1
	add	r1, r2, #0
	add	r0, r0, r1
	bl	Sqrt
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r0, [r5]
	lsl	r0, r0, #0x8
	add	r1, r4, #0
	bl	__divsi3
	str	r0, [r5]
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x8
	add	r1, r4, #0
	bl	__divsi3
	str	r0, [r5, #0x4]
	ldr	r0, [r5, #0x8]
	lsl	r0, r0, #0x8
	add	r1, r4, #0
	bl	__divsi3
	str	r0, [r5, #0x8]
	ldr	r0, [r5, #0xc]
	lsl	r0, r0, #0x8
	add	r1, r4, #0
	bl	__divsi3
	str	r0, [r5, #0xc]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805A0DC

.align 2, 0 @ Don't pad with nop.
