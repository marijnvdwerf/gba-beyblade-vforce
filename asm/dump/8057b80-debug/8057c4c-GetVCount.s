	.include "asm/common.inc"

	thumb_func_start GetVCount
GetVCount:
	ldr	r0, .L8057C54
	ldrh	r0, [r0]
	bx	lr
.L8057C52:
	.align	2, 0
.L8057C54:
	.4byte	0x4000006
	thumb_func_end GetVCount

.align 2, 0 @ Don't pad with nop.
