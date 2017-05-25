	.include "asm/common.inc"

	thumb_func_start sub_804AD50
sub_804AD50:
	ldr	r1, .L1
	mov	r2, #0x18
	NEG	r2, r2
	add	r0, r2, #0
	strh	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f1c
	thumb_func_end sub_804AD50

.align 2, 0 @ Don't pad with nop.
