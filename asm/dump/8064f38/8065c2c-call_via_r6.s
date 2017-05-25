	.include "asm/common.inc"

	thumb_func_start call_via_r6
call_via_r6:
	bx	r6
	thumb_func_end call_via_r6
