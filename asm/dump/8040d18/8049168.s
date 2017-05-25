	.include "asm/common.inc"

	thumb_func_start sub_8049168
sub_8049168:
	ldr	r0, .L1
	add	r0, r0, #0x7c
	mov	r1, #0x0
	strb	r1, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	thumb_func_end sub_8049168

.align 2, 0 @ Don't pad with nop.
