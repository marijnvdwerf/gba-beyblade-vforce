	.include "asm/common.inc"

	thumb_func_start sub_804AB50
sub_804AB50:
	lsl	r1, r1, #0x18
	mov	r2, #0xf0
	lsl	r2, r2, #0x14
	and	r2, r2, r1
	lsr	r2, r2, #0x18
	strh	r2, [r0, #0x2c]
	bx	lr
	thumb_func_end sub_804AB50

.align 2, 0 @ Don't pad with nop.
