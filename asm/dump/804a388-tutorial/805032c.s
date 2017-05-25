	.include "asm/common.inc"

	thumb_func_start sub_805032C
sub_805032C:
	str	r1, [r0, #0x10]
	str	r2, [r0, #0x14]
	bx	lr
	thumb_func_end sub_805032C

.align 2, 0 @ Don't pad with nop.
