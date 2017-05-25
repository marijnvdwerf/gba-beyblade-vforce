	.include "asm/common.inc"

	thumb_func_start sub_805EEFC
sub_805EEFC:
	push	{r4, lr}
	add	r3, r0, #0
	mov	r4, #0xd9
	lsl	r4, r4, #0x2
	add	r0, r3, r4
	str	r1, [r0]
	mov	r1, #0xda
	lsl	r1, r1, #0x2
	add	r0, r3, r1
	str	r2, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805EEFC

.align 2, 0 @ Don't pad with nop.
