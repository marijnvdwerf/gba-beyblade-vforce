	.include "asm/common.inc"

	thumb_func_start sub_8055674
sub_8055674:
	ldr	r0, .L8055684
	ldr	r0, [r0]
	ldr	r1, .L8055684 + 4
	add	r0, r0, r1
	mov	r1, #0xac
	lsl	r1, r1, #0x3
	strh	r1, [r0]
	bx	lr
.L8055684:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x1102
	thumb_func_end sub_8055674

.align 2, 0 @ Don't pad with nop.
