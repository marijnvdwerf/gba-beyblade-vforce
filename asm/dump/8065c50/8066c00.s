	.include "asm/common.inc"

	thumb_func_start sub_8066C00
sub_8066C00:
	push	{lr}
	add	sp, sp, #0xfffffff0
	str	r0, [sp]
	str	r1, [sp, #0x4]
	str	r2, [sp, #0x8]
	str	r3, [sp, #0xc]
	mov	r0, sp
	bl	sub_80662F8
	add	sp, sp, #0x10
	pop	{pc}
	thumb_func_end sub_8066C00

.align 2, 0 @ Don't pad with nop.
