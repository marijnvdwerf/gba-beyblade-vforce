	.include "asm/common.inc"

	thumb_func_start sub_8050894
sub_8050894:
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r3, [r0, #0x6]
	lsl	r1, r3, #0x8
	ldrh	r0, [r0, #0x8]
	orr	r1, r1, r0
	strh	r1, [r2]
	bx	lr
	thumb_func_end sub_8050894

.align 2, 0 @ Don't pad with nop.
