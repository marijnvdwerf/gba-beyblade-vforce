	.include "asm/common.inc"

	thumb_func_start sub_8050340
sub_8050340:
	str	r1, [r0, #0x18]
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	str	r2, [r0, #0x1c]
	bx	lr
	thumb_func_end sub_8050340

.align 2, 0 @ Don't pad with nop.
