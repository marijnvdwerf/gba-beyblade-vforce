	.include "asm/common.inc"

	thumb_func_start call_via_r0
call_via_r0:
	bx	r0
	thumb_func_end call_via_r0
