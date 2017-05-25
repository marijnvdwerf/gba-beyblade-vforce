	.include "asm/common.inc"

	thumb_func_start actor_80585F0
actor_80585F0:
	add	r0, r0, #0x8d
	strb	r1, [r0]
	bx	lr
	thumb_func_end actor_80585F0

.align 2, 0 @ Don't pad with nop.
