	.include "asm/common.inc"

	thumb_func_start isMultiplayer
isMultiplayer:
	ldr	r0, .L80600B0
	ldr	r0, [r0]
	ldrb	r0, [r0, #0x2]
	bx	lr
.L80600B0:
	.align	2, 0

	.4byte	_unk3005DC4
	thumb_func_end isMultiplayer

.align 2, 0 @ Don't pad with nop.
