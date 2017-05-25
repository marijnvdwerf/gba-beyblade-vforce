	.include "asm/common.inc"

	thumb_func_start nullsub_9
nullsub_9:
	bx	lr
	thumb_func_end nullsub_9

.align 2, 0 @ Don't pad with nop.
