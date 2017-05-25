	.include "asm/common.inc"

	thumb_func_start processMetadata_D
processMetadata_D:
	ldr	r0, [sp]
	ldrb	r0, [r0, #0x8]
	strb	r0, [r1, #0x10]
	bx	lr
	thumb_func_end processMetadata_D

.align 2, 0 @ Don't pad with nop.
