	.include "asm/common.inc"

	thumb_func_start ActorSetSpriteOffset
ActorSetSpriteOffset:
	add	r3, r0, #0
	add	r3, r3, #0xa0
	strh	r1, [r3]
	add	r0, r0, #0xa2
	strh	r2, [r0]
	bx	lr
	thumb_func_end ActorSetSpriteOffset

.align 2, 0 @ Don't pad with nop.
