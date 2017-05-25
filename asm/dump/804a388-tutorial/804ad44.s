	.include "asm/common.inc"

	thumb_func_start sub_804AD44
sub_804AD44:
	ldr	r1, .L1
	mov	r0, #0x1
	strh	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f1c
	thumb_func_end sub_804AD44

.align 2, 0 @ Don't pad with nop.
