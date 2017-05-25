	.include "asm/common.inc"

	thumb_func_start sub_805B7F0
sub_805B7F0:
	add	r2, r0, #0
	add	r0, r1, #0
	ldrb	r3, [r2, #0x6]
	LSL	r0, r3
	add	r0, r2, r0
	ldr	r1, [r2, #0x10]
	add	r0, r0, r1
	bx	lr
	thumb_func_end sub_805B7F0

.align 2, 0 @ Don't pad with nop.
