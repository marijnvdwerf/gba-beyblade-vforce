	.include "asm/common.inc"

	thumb_func_start sub_805162C
sub_805162C:
	ldr	r0, .L8051638
	ldr	r0, [r0]
	ldr	r1, .L8051638 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	bx	lr
.L8051638:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6ab
	thumb_func_end sub_805162C

.align 2, 0 @ Don't pad with nop.
