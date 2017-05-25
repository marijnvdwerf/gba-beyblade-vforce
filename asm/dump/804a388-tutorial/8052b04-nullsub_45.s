	.include "asm/common.inc"

	thumb_func_start nullsub_45
nullsub_45:
	bx	lr
	thumb_func_end nullsub_45

.align 2, 0 @ Don't pad with nop.
