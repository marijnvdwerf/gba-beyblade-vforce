	.include "asm/common.inc"

	thumb_func_start nullsub_26
nullsub_26:
	bx	lr
	thumb_func_end nullsub_26

.align 2, 0 @ Don't pad with nop.
