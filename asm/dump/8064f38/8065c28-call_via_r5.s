	.include "asm/common.inc"

	thumb_func_start call_via_r5
call_via_r5:
	bx	r5
	thumb_func_end call_via_r5
