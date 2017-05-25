	.include "asm/common.inc"

	thumb_func_start sub_805E8B0
sub_805E8B0:
	push	{r4, lr}
	add	sp, sp, #0xffffffe0
	ldr	r4, [sp, #0x28]
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	str	r3, [sp]
	str	r4, [sp, #0x4]
	str	r3, [sp, #0x8]
	str	r4, [sp, #0xc]
	str	r3, [sp, #0x10]
	str	r4, [sp, #0x14]
	str	r3, [sp, #0x18]
	str	r4, [sp, #0x1c]
	mov	r3, sp
	bl	sub_805E8D8
	add	sp, sp, #0x20
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805E8B0

.align 2, 0 @ Don't pad with nop.
