	.include "asm/common.inc"

	thumb_func_start nullsub_16
nullsub_16:
	bx	lr
	thumb_func_end nullsub_16

.align 2, 0 @ Don't pad with nop.
