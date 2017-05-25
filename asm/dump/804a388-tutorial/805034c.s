	.include "asm/common.inc"

	thumb_func_start sub_805034C
sub_805034C:
	mov	r1, #0x0
	str	r1, [r0, #0x18]
	mov	r2, #0x80
	str	r2, [r0, #0x1c]
	str	r1, [r0, #0xc]
	str	r1, [r0, #0x8]
	str	r1, [r0, #0x14]
	str	r1, [r0, #0x10]
	str	r1, [r0, #0x4]
	str	r1, [r0]
	strh	r1, [r0, #0x20]
	bx	lr
	thumb_func_end sub_805034C

.align 2, 0 @ Don't pad with nop.
