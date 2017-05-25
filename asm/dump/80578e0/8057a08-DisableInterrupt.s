	.include "asm/common.inc"

	thumb_func_start DisableInterrupt
DisableInterrupt:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r2, .L1
	ldrh	r1, [r2]
	BIC	r1, r0
	strh	r1, [r2]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000200
	thumb_func_end DisableInterrupt

.align 2, 0 @ Don't pad with nop.
