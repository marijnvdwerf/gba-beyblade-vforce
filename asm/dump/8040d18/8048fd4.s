	.include "asm/common.inc"

	thumb_func_start sub_8048FD4
sub_8048FD4:
	ldr	r1, .L8048FE0
	mov	r2, #0xb5
	lsl	r2, r2, #0x3
	add	r1, r1, r2
	str	r0, [r1]
	bx	lr
.L8048FE0:
	.align	2, 0

	.4byte	_unk3000650
	thumb_func_end sub_8048FD4

.align 2, 0 @ Don't pad with nop.
