	.include "asm/common.inc"

	thumb_func_start getLanguage
getLanguage:
	ldr	r1, .L1
	ldr	r0, .L1 + 4
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3005e80
	.4byte	0x3005e98
	thumb_func_end getLanguage

.align 2, 0 @ Don't pad with nop.
