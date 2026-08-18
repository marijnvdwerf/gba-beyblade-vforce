	.include "asm/common.inc"

	thumb_func_start sub_80570C0
sub_80570C0:
	add	r1, r0, #0
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	ldr	r1, .L80570D0
	add	r0, r0, r1
	bx	lr
.L80570CE:
	.align	2, 0
.L80570D0:
	.4byte	0x8078f18
	thumb_func_end sub_80570C0

.align 2, 0 @ Don't pad with nop.
