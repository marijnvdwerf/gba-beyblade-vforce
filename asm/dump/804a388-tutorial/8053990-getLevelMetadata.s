	.include "asm/common.inc"

	thumb_func_start getLevelMetadata
getLevelMetadata:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	getLevelDescription
	ldr	r0, [r0, #0x2c]
	pop	{r1}
	bx	r1
	thumb_func_end getLevelMetadata

.align 2, 0 @ Don't pad with nop.
