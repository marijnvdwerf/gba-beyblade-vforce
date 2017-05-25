	.include "asm/common.inc"

	thumb_func_start nullsub_11
nullsub_11:
	bx	lr
	thumb_func_end nullsub_11

.align 2, 0 @ Don't pad with nop.
