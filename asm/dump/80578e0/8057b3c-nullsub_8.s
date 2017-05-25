	.include "asm/common.inc"

	thumb_func_start nullsub_8
nullsub_8:
	bx	lr
	thumb_func_end nullsub_8

.align 2, 0 @ Don't pad with nop.
