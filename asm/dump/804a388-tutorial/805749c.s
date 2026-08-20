	.include "asm/common.inc"

	thumb_func_start sub_805749C
sub_805749C:
	ldr	r1, .L80574A4
	add	r0, r0, r1
	ldrb	r0, [r0]
	bx	lr
.L80574A4:
	.align	2, 0

	.4byte	byte_807D7C0
	thumb_func_end sub_805749C

.align 2, 0 @ Don't pad with nop.
