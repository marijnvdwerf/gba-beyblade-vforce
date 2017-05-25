	.include "asm/common.inc"

	thumb_func_start nullsub_6
nullsub_6:
	bx	lr
	thumb_func_end nullsub_6

.align 2, 0 @ Don't pad with nop.
