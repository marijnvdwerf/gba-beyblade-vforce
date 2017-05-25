	.include "asm/common.inc"

	thumb_func_start sub_8058144
sub_8058144:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r0, [r4]
	ldr	r1, [r0, #0x18]
	add	r0, r0, r1
	ldrh	r1, [r4, #0x1c]
	add	r0, r1, r0
	ldrh	r1, [r0, #0x8]
	add	r0, r4, #0
	bl	GetSpriteSheetStructA
	add	r1, r0, #0
	mov	r2, #0x22
	ldsh	r0, [r4, r2]
	ldrh	r1, [r1]
	sub	r0, r0, r1
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8058144

.align 2, 0 @ Don't pad with nop.
