	.include "asm/common.inc"

	thumb_func_start EnableInterrupt
EnableInterrupt:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r2, .L8057A04
	ldrh	r1, [r2]
	orr	r0, r0, r1
	strh	r0, [r2]
	bx	lr
.L8057A02:
	.align	2, 0
.L8057A04:
	.4byte	0x4000200
	thumb_func_end EnableInterrupt

.align 2, 0 @ Don't pad with nop.
