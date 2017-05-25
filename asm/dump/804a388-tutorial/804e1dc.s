	.include "asm/common.inc"

	thumb_func_start sub_804E1DC
sub_804E1DC:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r5, [r4]
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	bl	UnsetRiderFlag
	mov	r0, #0x0
	str	r0, [r5, #0x4c]
	str	r0, [r5, #0x50]
	ldr	r0, [r4, #0x10]
	str	r0, [r4, #0x1c]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804E1DC

.align 2, 0 @ Don't pad with nop.
