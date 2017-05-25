	.include "asm/common.inc"

	thumb_func_start sub_805FA4C
sub_805FA4C:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r0, [r4, #0x10]
	bl	deallocateBlock
	ldr	r0, [r4, #0x14]
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r4, #0x10]
	str	r0, [r4, #0x14]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805FA4C

.align 2, 0 @ Don't pad with nop.
