	.include "asm/common.inc"

	thumb_func_start sub_8050384
sub_8050384:
	mov	r1, #0x0
	str	r1, [r0, #0x4]
	strh	r1, [r0, #0xe]
	str	r1, [r0, #0x8]
	strh	r1, [r0, #0xc]
	str	r1, [r0, #0x14]
	str	r1, [r0, #0x10]
	bx	lr
	thumb_func_end sub_8050384

.align 2, 0 @ Don't pad with nop.
