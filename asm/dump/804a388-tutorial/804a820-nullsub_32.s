	.include "asm/common.inc"

	thumb_func_start nullsub_32
nullsub_32:
	bx	lr
	thumb_func_end nullsub_32

.align 2, 0 @ Don't pad with nop.
