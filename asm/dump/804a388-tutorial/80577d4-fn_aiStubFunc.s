	.include "asm/common.inc"

	thumb_func_start fn_aiStubFunc
fn_aiStubFunc:
	bx	lr
	thumb_func_end fn_aiStubFunc

.align 2, 0 @ Don't pad with nop.
