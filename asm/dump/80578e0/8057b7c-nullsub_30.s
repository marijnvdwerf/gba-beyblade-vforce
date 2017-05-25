	.include "asm/common.inc"

	thumb_func_start nullsub_30
nullsub_30:
	bx	lr
	thumb_func_end nullsub_30

.align 2, 0 @ Don't pad with nop.
