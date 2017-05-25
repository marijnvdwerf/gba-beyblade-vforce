	.include "asm/common.inc"

	thumb_func_start call_via_r7
call_via_r7:
	bx	r7
	thumb_func_end call_via_r7
