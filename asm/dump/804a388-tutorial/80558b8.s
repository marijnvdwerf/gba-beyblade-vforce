	.include "asm/common.inc"

	thumb_func_start sub_80558B8
sub_80558B8:
	ldr	r0, .L80558C8
	ldr	r0, [r0]
	ldr	r1, .L80558C8 + 4
	add	r0, r0, r1
	mov	r1, #0x6
	strh	r1, [r0, #0x28]
	bx	lr
.L80558C6:
	.align	2, 0
.L80558C8:
	.4byte	_gameData
	.4byte	0x1084
	thumb_func_end sub_80558B8

.align 2, 0 @ Don't pad with nop.
