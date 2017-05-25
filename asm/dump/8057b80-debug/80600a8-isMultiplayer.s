	.include "asm/common.inc"

	thumb_func_start isMultiplayer
isMultiplayer:
	ldr	r0, .L1
	ldr	r0, [r0]
	ldrb	r0, [r0, #0x2]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005dc4
	thumb_func_end isMultiplayer

.align 2, 0 @ Don't pad with nop.
