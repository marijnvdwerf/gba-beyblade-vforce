	.include "asm/common.inc"

	thumb_func_start pushTeletypeStringPalette
pushTeletypeStringPalette:
	push	{lr}
	add	r2, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldrb	r0, [r2, #0x13]
	cmp	r0, #0x7
	bhi	.L8064122	@cond_branch
	add	r0, r0, #0x1
	strb	r0, [r2, #0x13]
	add	r0, r2, #0
	add	r0, r0, #0x14
	ldrb	r2, [r2, #0x13]
	add	r0, r2, r0
	strb	r1, [r0]
	b	.L8064128
.L8064122:
	ldr	r0, .L806412C
	bl	printf
.L8064128:
	pop	{r0}
	bx	r0
.L806412C:
	.align	2, 0

	.4byte	0x87567e8
	thumb_func_end pushTeletypeStringPalette

.align 2, 0 @ Don't pad with nop.
