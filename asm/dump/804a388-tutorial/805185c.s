	.include "asm/common.inc"

	thumb_func_start sub_805185C
sub_805185C:
	ldr	r1, .L1
	ldr	r1, [r1]
	strb	r0, [r1, #0x2]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	thumb_func_end sub_805185C

.align 2, 0 @ Don't pad with nop.
