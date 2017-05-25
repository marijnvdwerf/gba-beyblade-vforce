	.include "asm/common.inc"

	thumb_func_start sub_805E50C
sub_805E50C:
	str	r1, [r0]
	str	r2, [r0, #0x4]
	str	r3, [r0, #0x8]
	bx	lr
	thumb_func_end sub_805E50C

.align 2, 0 @ Don't pad with nop.
