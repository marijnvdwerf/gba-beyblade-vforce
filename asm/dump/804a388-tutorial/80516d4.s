	.include "asm/common.inc"

	thumb_func_start sub_80516D4
sub_80516D4:
	ldr	r1, .L80516DC
	ldr	r1, [r1]
	strb	r0, [r1, #0x1]
	bx	lr
.L80516DC:
	.align	2, 0

	.4byte	_currentGameState
	thumb_func_end sub_80516D4

.align 2, 0 @ Don't pad with nop.
