	.include "asm/common.inc"

	thumb_func_start UnsetRiderFlag
UnsetRiderFlag:
	add	r0, r0, #0x9c
	ldr	r2, [r0]
	BIC	r2, r1
	str	r2, [r0]
	bx	lr
	thumb_func_end UnsetRiderFlag

.align 2, 0 @ Don't pad with nop.
