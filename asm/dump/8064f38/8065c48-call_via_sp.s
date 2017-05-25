	.include "asm/common.inc"

	thumb_func_start call_via_sp
call_via_sp:
	bx	sp
	thumb_func_end call_via_sp
