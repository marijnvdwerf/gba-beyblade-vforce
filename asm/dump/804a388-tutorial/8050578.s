	.include "asm/common.inc"

	thumb_func_start sub_8050578
sub_8050578:
	str	r1, [r0, #0x10]
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	str	r2, [r0, #0x14]
	bx	lr
	thumb_func_end sub_8050578

.align 2, 0 @ Don't pad with nop.
