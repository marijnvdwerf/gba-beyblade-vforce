	.include "asm/common.inc"

	thumb_func_start sub_8051720
sub_8051720:
	ldr	r2, .L1
	lsl	r1, r0, #0x1
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, #0x4
	ldr	r0, [r2]
	add	r0, r0, r1
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	thumb_func_end sub_8051720

.align 2, 0 @ Don't pad with nop.
