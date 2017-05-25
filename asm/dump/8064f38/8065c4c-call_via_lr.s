	.include "asm/common.inc"

	thumb_func_start call_via_lr
call_via_lr:
	bx	lr
	thumb_func_end call_via_lr
