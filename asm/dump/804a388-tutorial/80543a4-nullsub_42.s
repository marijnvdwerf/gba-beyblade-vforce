	.include "asm/common.inc"

	thumb_func_start nullsub_42
nullsub_42:
	bx	lr
	thumb_func_end nullsub_42

.align 2, 0 @ Don't pad with nop.
