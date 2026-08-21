	.include "asm/common.inc"

	thumb_func_start sub_805176C
sub_805176C:
	ldr	r0, .L805177C
	ldr	r0, [r0]
	mov	r1, #0xdd
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldrb	r0, [r0]
	bx	lr
.L805177A:
	.align	2, 0
.L805177C:
	.4byte	_currentGameState
	thumb_func_end sub_805176C

.align 2, 0 @ Don't pad with nop.
