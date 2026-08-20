	.include "asm/common.inc"

	thumb_func_start sub_8049168
sub_8049168:
	ldr	r0, .L8049174
	add	r0, r0, #0x7c
	mov	r1, #0x0
	strb	r1, [r0]
	bx	lr
.L8049172:
	.align	2, 0
.L8049174:
	.4byte	_unk3000650
	thumb_func_end sub_8049168

.align 2, 0 @ Don't pad with nop.
