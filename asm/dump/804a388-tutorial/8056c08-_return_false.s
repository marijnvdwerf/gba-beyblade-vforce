	.include "asm/common.inc"

	thumb_func_start _return_false
_return_false:
	mov	r0, #0x0
	bx	lr
	thumb_func_end _return_false

.align 2, 0 @ Don't pad with nop.
