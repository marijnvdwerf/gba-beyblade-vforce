	.include "asm/common.inc"

	thumb_func_start call_via_r3
call_via_r3:
	bx	r3
	thumb_func_end call_via_r3
