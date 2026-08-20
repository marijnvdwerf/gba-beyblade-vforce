	.include "asm/common.inc"

	thumb_func_start sub_804ACF0
sub_804ACF0:
	ldr	r2, .L804AD10
	ldr	r0, .L804AD10 + 4
	ldr	r1, [r0]
	ldr	r3, .L804AD10 + 8
	add	r0, r1, r3
	ldrh	r0, [r0]
	strh	r0, [r2]
	ldr	r2, .L804AD10 + 12
	ldr	r0, .L804AD10 + 16
	add	r1, r1, r0
	ldrh	r0, [r1]
	strh	r0, [r2]
	ldr	r1, .L804AD10 + 20
	mov	r0, #0x0
	strh	r0, [r1]
	bx	lr
.L804AD10:
	.align	2, 0

	.4byte	_unk3000F18
	.4byte	_currentGameState
	.4byte	0x6e4
	.4byte	_unk3000F14
	.4byte	0x6e6
	.4byte	_unk3000F1C
	thumb_func_end sub_804ACF0

.align 2, 0 @ Don't pad with nop.
