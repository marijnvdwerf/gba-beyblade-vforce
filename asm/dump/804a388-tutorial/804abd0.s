	.include "asm/common.inc"

	thumb_func_start sub_804ABD0
sub_804ABD0:
	str	r1, [r0, #0x10]
	str	r2, [r0, #0x14]
	bx	lr
	thumb_func_end sub_804ABD0

.align 2, 0 @ Don't pad with nop.
