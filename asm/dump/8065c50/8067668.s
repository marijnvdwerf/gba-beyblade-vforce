	.include "asm/common.inc"

	thumb_func_start sub_8067668
sub_8067668:
	push	{r4, lr}
	add	sp, sp, #0xffffffc8
	str	r0, [sp, #0x28]
	str	r1, [sp, #0x2c]
	str	r2, [sp, #0x30]
	str	r3, [sp, #0x34]
	add	r0, sp, #0x28
	mov	r1, sp
	bl	sub_8066D8C
	add	r0, sp, #0x30
	add	r4, sp, #0x14
	add	r1, r4, #0
	bl	sub_8066D8C
	mov	r0, sp
	add	r1, r4, #0
	bl	sub_8067568
	add	sp, sp, #0x38
	pop	{r4, pc}
	thumb_func_end sub_8067668

.align 2, 0 @ Don't pad with nop.
