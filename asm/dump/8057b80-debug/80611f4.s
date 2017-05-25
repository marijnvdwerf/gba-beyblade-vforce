	.include "asm/common.inc"

	thumb_func_start sub_80611F4
sub_80611F4:
	add	r0, r0, #0x29
	strb	r1, [r0]
	bx	lr
	thumb_func_end sub_80611F4

.align 2, 0 @ Don't pad with nop.
