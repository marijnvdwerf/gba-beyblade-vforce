	.include "asm/common.inc"

	thumb_func_start sub_805F23C
sub_805F23C:
	add	r3, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r0, r0, #0x4c
	mov	r2, #0x0
	strb	r2, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r2, [r0]
	bx	lr
	thumb_func_end sub_805F23C

.align 2, 0 @ Don't pad with nop.
