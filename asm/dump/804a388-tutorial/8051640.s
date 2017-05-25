	.include "asm/common.inc"

	thumb_func_start sub_8051640
sub_8051640:
	ldr	r1, .L1
	ldr	r1, [r1]
	ldr	r2, .L1 + 4
	add	r1, r1, r2
	strb	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	.4byte	0x6ab
	thumb_func_end sub_8051640

.align 2, 0 @ Don't pad with nop.
