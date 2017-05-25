	.include "asm/common.inc"

	thumb_func_start sub_804E20C
sub_804E20C:
	mov	r3, #0x0
	str	r3, [r0, #0x2c]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x10
	str	r1, [r0, #0x30]
	str	r1, [r0, #0x28]
	str	r3, [r0, #0x38]
	lsl	r2, r2, #0x18
	asr	r2, r2, #0x10
	str	r2, [r0, #0x3c]
	str	r2, [r0, #0x34]
	bx	lr
	thumb_func_end sub_804E20C

.align 2, 0 @ Don't pad with nop.
