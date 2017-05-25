	.include "asm/common.inc"

	thumb_func_start nullsub_10
nullsub_10:
	bx	lr
	thumb_func_end nullsub_10

.align 2, 0 @ Don't pad with nop.
