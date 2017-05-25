	.include "asm/common.inc"

	thumb_func_start sub_805FCC8
sub_805FCC8:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r0, [r4, #0x28]
	bl	deallocateBlock
	ldr	r0, [r4, #0x18]
	bl	deallocateBlock
	ldr	r0, [r4, #0x1c]
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r4, #0x28]
	str	r0, [r4, #0x18]
	str	r0, [r4, #0x1c]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805FCC8

.align 2, 0 @ Don't pad with nop.
