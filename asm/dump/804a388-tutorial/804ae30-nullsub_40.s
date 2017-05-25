	.include "asm/common.inc"

	thumb_func_start nullsub_40
nullsub_40:
	bx	lr
	thumb_func_end nullsub_40

.align 2, 0 @ Don't pad with nop.
