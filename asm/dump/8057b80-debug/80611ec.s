	.include "asm/common.inc"

	thumb_func_start sub_80611EC
sub_80611EC:
	add	r0, r0, #0x2a
	strb	r1, [r0]
	bx	lr
	thumb_func_end sub_80611EC

.align 2, 0 @ Don't pad with nop.
