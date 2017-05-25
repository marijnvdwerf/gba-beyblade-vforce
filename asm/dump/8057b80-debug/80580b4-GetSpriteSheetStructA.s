	.include "asm/common.inc"

	thumb_func_start GetSpriteSheetStructA
GetSpriteSheetStructA:
	ldr	r0, [r0]
	add	r0, r0, #0x20
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	bx	lr
	thumb_func_end GetSpriteSheetStructA

.align 2, 0 @ Don't pad with nop.
