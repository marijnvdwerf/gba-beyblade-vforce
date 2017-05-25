	.include "asm/common.inc"

	thumb_func_start sub_804C34C
sub_804C34C:
	str	r1, [r0, #0x10]
	str	r2, [r0, #0x14]
	str	r3, [r0, #0x18]
	bx	lr
	thumb_func_end sub_804C34C

.align 2, 0 @ Don't pad with nop.
