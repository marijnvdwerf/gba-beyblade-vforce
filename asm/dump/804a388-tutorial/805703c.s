	.include "asm/common.inc"

	thumb_func_start sub_805703C
sub_805703C:
	ldr	r1, .L8057044
	add	r0, r0, r1
	ldrb	r0, [r0]
	bx	lr
.L8057044:
	.align	2, 0

	.4byte	_807a53c
	thumb_func_end sub_805703C

.align 2, 0 @ Don't pad with nop.
