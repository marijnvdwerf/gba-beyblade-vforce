	.include "asm/common.inc"

	thumb_func_start sub_8052534
sub_8052534:
	mov	r1, #0xa0
	lsl	r1, r1, #0x8
	str	r1, [r0, #0xc]
	bx	lr
	thumb_func_end sub_8052534

.align 2, 0 @ Don't pad with nop.
