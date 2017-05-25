	.include "asm/common.inc"

	thumb_func_start sub_8067974
sub_8067974:
	add	sp, sp, #0xfffffffc
	push	{r4, lr}
	add	sp, sp, #0xffffffec
	str	r3, [sp, #0x1c]
	ldr	r3, [sp, #0x1c]
	ldr	r4, [sp, #0x20]
	str	r0, [sp]
	str	r1, [sp, #0x4]
	str	r2, [sp, #0x8]
	str	r3, [sp, #0xc]
	str	r4, [sp, #0x10]
	mov	r0, sp
	bl	sub_8066C44
	add	sp, sp, #0x14
	pop	{r4}
	pop	{r3}
	add	sp, sp, #0x4
	bx	r3
	thumb_func_end sub_8067974

.align 2, 0 @ Don't pad with nop.
