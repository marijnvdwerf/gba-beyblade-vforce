	.include "asm/common.inc"

	thumb_func_start sub_80622D0
sub_80622D0:
	push	{r2, r3}
	push	{lr}
	ldr	r2, [sp, #0x4]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r3, sp, #0x8
	bl	sub_8061F3C
	pop	{r3}
	add	sp, sp, #0x8
	bx	r3
	thumb_func_end sub_80622D0

.align 2, 0 @ Don't pad with nop.
