	.include "asm/common.inc"

	thumb_func_start sub_8063CD0
sub_8063CD0:
	add	r3, r0, #0
	add	r1, r3, #0
	add	r1, r1, #0xac
	mov	r0, #0x0
	str	r0, [r1]
	add	r2, r3, #0
	add	r2, r2, #0xb0
	ldrb	r0, [r3, #0xe]
	lsl	r1, r0, #0x8
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r2]
	add	r1, r3, #0
	add	r1, r1, #0xbe
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	bx	lr
	thumb_func_end sub_8063CD0

.align 2, 0 @ Don't pad with nop.
