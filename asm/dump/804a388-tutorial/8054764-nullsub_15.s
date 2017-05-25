	.include "asm/common.inc"

	thumb_func_start nullsub_15
nullsub_15:
	bx	lr
	thumb_func_end nullsub_15

.align 2, 0 @ Don't pad with nop.
