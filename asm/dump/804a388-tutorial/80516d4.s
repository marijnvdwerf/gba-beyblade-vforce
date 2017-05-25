	.include "asm/common.inc"

	thumb_func_start sub_80516D4
sub_80516D4:
	ldr	r1, .L1
	ldr	r1, [r1]
	strb	r0, [r1, #0x1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	thumb_func_end sub_80516D4

.align 2, 0 @ Don't pad with nop.
