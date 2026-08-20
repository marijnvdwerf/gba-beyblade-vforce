	.include "asm/common.inc"

	thumb_func_start sub_8051798
sub_8051798:
	ldr	r1, .L80517A4
	ldr	r1, [r1]
	ldr	r2, .L80517A4 + 4
	add	r1, r1, r2
	str	r0, [r1]
	bx	lr
.L80517A4:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6b4
	thumb_func_end sub_8051798

.align 2, 0 @ Don't pad with nop.
