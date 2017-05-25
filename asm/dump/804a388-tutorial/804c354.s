	.include "asm/common.inc"

	thumb_func_start sub_804C354
sub_804C354:
	str	r1, [r0, #0x1c]
	str	r2, [r0, #0x20]
	str	r3, [r0, #0x24]
	bx	lr
	thumb_func_end sub_804C354

.align 2, 0 @ Don't pad with nop.
