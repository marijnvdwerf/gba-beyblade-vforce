	.include "asm/common.inc"

	thumb_func_start call_via_r8
call_via_r8:
	bx	r8
	thumb_func_end call_via_r8
