	.include "asm/common.inc"

	thumb_func_start sub_805E878
sub_805E878:
	push	{lr}
	add	sp, sp, #0xffffffe0
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r3, #0x0
	str	r3, [sp]
	str	r3, [sp, #0x4]
	str	r3, [sp, #0x8]
	str	r3, [sp, #0xc]
	str	r3, [sp, #0x10]
	str	r3, [sp, #0x14]
	str	r3, [sp, #0x18]
	str	r3, [sp, #0x1c]
	mov	r3, sp
	bl	sub_805E8D8
	add	sp, sp, #0x20
	pop	{r0}
	bx	r0
	thumb_func_end sub_805E878

.align 2, 0 @ Don't pad with nop.
