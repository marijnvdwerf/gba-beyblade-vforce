	.include "asm/common.inc"

	thumb_func_start call_via_r1
call_via_r1:
	bx	r1
	thumb_func_end call_via_r1
