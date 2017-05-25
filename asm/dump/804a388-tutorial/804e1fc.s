	.include "asm/common.inc"

	thumb_func_start sub_804E1FC
sub_804E1FC:
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x14
	str	r1, [r0, #0x10]
	str	r1, [r0, #0x1c]
	mov	r1, #0x0
	str	r1, [r0, #0x14]
	bx	lr
	thumb_func_end sub_804E1FC

.align 2, 0 @ Don't pad with nop.
