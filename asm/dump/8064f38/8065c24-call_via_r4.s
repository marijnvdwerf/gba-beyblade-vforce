	.include "asm/common.inc"

	thumb_func_start call_via_r4
call_via_r4:
	bx	r4
	thumb_func_end call_via_r4
