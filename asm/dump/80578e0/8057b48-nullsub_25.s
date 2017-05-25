	.include "asm/common.inc"

	thumb_func_start nullsub_25
nullsub_25:
	bx	lr
	thumb_func_end nullsub_25

.align 2, 0 @ Don't pad with nop.
