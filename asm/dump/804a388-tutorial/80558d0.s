	.include "asm/common.inc"

	thumb_func_start sub_80558D0
sub_80558D0:
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	mov	r1, #0x20
	strh	r1, [r0, #0x28]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1084
	thumb_func_end sub_80558D0

.align 2, 0 @ Don't pad with nop.
