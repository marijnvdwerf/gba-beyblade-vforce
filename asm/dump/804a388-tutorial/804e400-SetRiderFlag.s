	.include "asm/common.inc"

	thumb_func_start SetRiderFlag
SetRiderFlag:
	add	r0, r0, #0x9c
	ldr	r2, [r0]
	orr	r2, r2, r1
	str	r2, [r0]
	bx	lr
	thumb_func_end SetRiderFlag

.align 2, 0 @ Don't pad with nop.
