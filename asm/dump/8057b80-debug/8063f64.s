	.include "asm/common.inc"

	thumb_func_start sub_8063F64
sub_8063F64:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r0, #0x0
	str	r0, [r4]
	add	r0, r4, #0
	add	r0, r0, #0xec
	bl	sub_8060CDC
	add	r4, r4, #0xc4
	ldr	r0, [r4]
	bl	deallocateBlock
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063F64

.align 2, 0 @ Don't pad with nop.
