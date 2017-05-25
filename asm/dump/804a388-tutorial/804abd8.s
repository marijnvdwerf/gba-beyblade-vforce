	.include "asm/common.inc"

	thumb_func_start sub_804ABD8
sub_804ABD8:
	str	r1, [r0, #0x10]
	str	r2, [r0, #0x14]
	str	r1, [r0, #0x18]
	str	r2, [r0, #0x1c]
	bx	lr
	thumb_func_end sub_804ABD8

.align 2, 0 @ Don't pad with nop.
