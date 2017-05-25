	.include "asm/common.inc"

	thumb_func_start sub_805F1E4
sub_805F1E4:
	str	r1, [r0, #0x6c]
	str	r2, [r0, #0x70]
	bx	lr
	thumb_func_end sub_805F1E4

.align 2, 0 @ Don't pad with nop.
