	.include "asm/common.inc"

	thumb_func_start sub_80573C8
sub_80573C8:
	add	r1, r0, #0
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L1
	add	r0, r0, r1
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x807b858
	thumb_func_end sub_80573C8

.align 2, 0 @ Don't pad with nop.
