	.include "asm/common.inc"

	thumb_func_start sub_805B270
sub_805B270:
	ldr	r2, .L805B27C
	and	r2, r2, r1
	lsl	r2, r2, #0x5
	add	r0, r0, r2
	bx	lr
.L805B27A:
	.align	2, 0
.L805B27C:
	.4byte	0x3ff
	thumb_func_end sub_805B270

.align 2, 0 @ Don't pad with nop.
