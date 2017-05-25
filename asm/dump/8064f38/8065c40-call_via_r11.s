	.include "asm/common.inc"

	thumb_func_start call_via_r11
call_via_r11:
	bx	fp
	thumb_func_end call_via_r11
