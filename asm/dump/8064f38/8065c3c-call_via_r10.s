	.include "asm/common.inc"

	thumb_func_start call_via_r10
call_via_r10:
	bx	sl
	thumb_func_end call_via_r10
