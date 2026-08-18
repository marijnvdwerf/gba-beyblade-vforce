	.include "asm/common.inc"

	thumb_func_start sub_805AAD4
sub_805AAD4:
	ldr	r1, .L805AADC
	mov	r0, #0x1
	strh	r0, [r1]
	bx	lr
.L805AADC:
	.align	2, 0

	.4byte	0x3005ca4
	thumb_func_end sub_805AAD4

.align 2, 0 @ Don't pad with nop.
