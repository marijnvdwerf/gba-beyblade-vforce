	.include "asm/common.inc"

	thumb_func_start sub_8048FCC
sub_8048FCC:
	ldr	r0, .L8048FD0
	bx	lr
.L8048FD0:
	.align	2, 0

	.4byte	_unk3000650
	thumb_func_end sub_8048FCC

.align 2, 0 @ Don't pad with nop.
