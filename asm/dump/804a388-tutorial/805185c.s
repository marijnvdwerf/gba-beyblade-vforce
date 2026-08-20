	.include "asm/common.inc"

	thumb_func_start sub_805185C
sub_805185C:
	ldr	r1, .L8051864
	ldr	r1, [r1]
	strb	r0, [r1, #0x2]
	bx	lr
.L8051864:
	.align	2, 0

	.4byte	_currentGameState
	thumb_func_end sub_805185C

.align 2, 0 @ Don't pad with nop.
