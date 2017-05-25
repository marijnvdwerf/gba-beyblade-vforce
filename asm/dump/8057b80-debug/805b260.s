	.include "asm/common.inc"

	thumb_func_start sub_805B260
sub_805B260:
	str	r1, [r0, #0x8]
	strb	r3, [r0, #0xc]
	str	r2, [r0, #0x4]
	bx	lr
	thumb_func_end sub_805B260

.align 2, 0 @ Don't pad with nop.
