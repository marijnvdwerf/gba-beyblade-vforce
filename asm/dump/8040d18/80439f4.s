	.include "asm/common.inc"

	thumb_func_start sub_80439F4
sub_80439F4:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	add	r0, r4, #0
	bl	sub_80502A4
	ldr	r0, [r4, #0xc]
	NEG	r0, r0
	str	r0, [r5, #0x18]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80439F4

.align 2, 0 @ Don't pad with nop.
