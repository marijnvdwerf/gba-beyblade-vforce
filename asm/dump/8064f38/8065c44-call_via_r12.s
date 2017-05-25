	.include "asm/common.inc"

	thumb_func_start call_via_r12
call_via_r12:
	bx	ip
	thumb_func_end call_via_r12
