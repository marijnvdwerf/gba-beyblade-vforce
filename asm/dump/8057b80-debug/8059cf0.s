	.include "asm/common.inc"

	thumb_func_start sub_8059CF0
sub_8059CF0:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	GetBGLayerCntPtr
	ldr	r0, [r0]
	lsl	r0, r0, #0x1e
	lsr	r0, r0, #0x1e
	pop	{r1}
	bx	r1
	thumb_func_end sub_8059CF0

.align 2, 0 @ Don't pad with nop.
