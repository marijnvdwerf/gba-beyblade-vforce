	.include "asm/common.inc"

	thumb_func_start sub_80611FC
sub_80611FC:
	add	r0, r0, #0x28
	strb	r1, [r0]
	bx	lr
	thumb_func_end sub_80611FC

.align 2, 0 @ Don't pad with nop.
