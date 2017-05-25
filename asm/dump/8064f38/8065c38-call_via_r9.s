	.include "asm/common.inc"

	thumb_func_start call_via_r9
call_via_r9:
	bx	r9
	thumb_func_end call_via_r9
