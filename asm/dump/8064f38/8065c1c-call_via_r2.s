	.include "asm/common.inc"

	thumb_func_start call_via_r2
call_via_r2:
	bx	r2
	thumb_func_end call_via_r2
