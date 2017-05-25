	.include "asm/common.inc"

	thumb_func_start sub_8057B30
sub_8057B30:
	str	r1, [r0]
	str	r2, [r0, #0x4]
	bx	lr
	thumb_func_end sub_8057B30

.align 2, 0 @ Don't pad with nop.
