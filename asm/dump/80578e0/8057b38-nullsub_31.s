	.include "asm/common.inc"

	thumb_func_start nullsub_31
nullsub_31:
	bx	lr
	thumb_func_end nullsub_31

.align 2, 0 @ Don't pad with nop.
