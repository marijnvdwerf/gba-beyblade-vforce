	.include "asm/common.inc"

	thumb_func_start sub_8055674
sub_8055674:
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	mov	r1, #0xac
	lsl	r1, r1, #0x3
	strh	r1, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1102
	thumb_func_end sub_8055674

.align 2, 0 @ Don't pad with nop.
