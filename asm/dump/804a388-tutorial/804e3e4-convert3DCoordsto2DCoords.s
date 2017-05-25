	.include "asm/common.inc"

	thumb_func_start convert3DCoordsto2DCoords
convert3DCoordsto2DCoords:
	push	{r4, lr}
	ldr	r2, [r0, #0x4]
	ldr	r4, [r0, #0x8]
	sub	r3, r2, r4
	str	r3, [r1]
	add	r2, r2, r4
	asr	r2, r2, #0x1
	ldr	r0, [r0, #0xc]
	sub	r2, r2, r0
	str	r2, [r1, #0x4]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end convert3DCoordsto2DCoords

.align 2, 0 @ Don't pad with nop.
