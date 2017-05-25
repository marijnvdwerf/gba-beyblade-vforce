	.include "asm/common.inc"

	thumb_func_start sub_804C870
sub_804C870:
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r0, r0, r2
	lsl	r2, r1, #0x1
	add	r2, r2, r1
	lsl	r2, r2, #0x6
	asr	r2, r2, #0x8
	mov	r1, #0xc0
	lsl	r1, r1, #0x3
	add	r2, r2, r1
	str	r2, [r0]
	bx	lr
	thumb_func_end sub_804C870

.align 2, 0 @ Don't pad with nop.
