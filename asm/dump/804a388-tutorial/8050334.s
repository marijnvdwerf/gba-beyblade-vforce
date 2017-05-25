	.include "asm/common.inc"

	thumb_func_start sub_8050334
sub_8050334:
	str	r1, [r0, #0x8]
	str	r2, [r0, #0xc]
	bx	lr
	thumb_func_end sub_8050334

.align 2, 0 @ Don't pad with nop.
