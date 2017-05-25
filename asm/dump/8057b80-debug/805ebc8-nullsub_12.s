	.include "asm/common.inc"

	thumb_func_start nullsub_12
nullsub_12:
	bx	lr
	thumb_func_end nullsub_12

.align 2, 0 @ Don't pad with nop.
