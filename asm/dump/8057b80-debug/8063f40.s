	.include "asm/common.inc"

	thumb_func_start sub_8063F40
sub_8063F40:
	push	{r4, lr}
	mov	ip, r0
	ldr	r4, [sp, #0x8]
	add	r0, r0, #0xdc
	str	r1, [r0]
	add	r0, r0, #0x8
	str	r2, [r0]
	sub	r0, r0, #0x4
	str	r3, [r0]
	add	r0, r0, #0x8
	str	r4, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063F40

.align 2, 0 @ Don't pad with nop.
