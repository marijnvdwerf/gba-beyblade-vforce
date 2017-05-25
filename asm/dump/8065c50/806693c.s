	.include "asm/common.inc"

	thumb_func_start sub_806693C
sub_806693C:
	push	{r4, lr}
	add	sp, sp, #0xffffffd8
	str	r0, [sp, #0x20]
	str	r1, [sp, #0x24]
	add	r0, sp, #0x20
	mov	r1, sp
	bl	sub_80663B0
	add	r0, sp, #0x24
	add	r4, sp, #0x10
	add	r1, r4, #0
	bl	sub_80663B0
	mov	r0, sp
	add	r1, r4, #0
	bl	sub_8066858
	add	sp, sp, #0x28
	pop	{r4, pc}
	thumb_func_end sub_806693C

.align 2, 0 @ Don't pad with nop.
