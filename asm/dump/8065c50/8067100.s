	.include "asm/common.inc"

	thumb_func_start sub_8067100
sub_8067100:
	push	{r4, lr}
	add	sp, sp, #0xffffffb4
	str	r0, [sp, #0x3c]
	str	r1, [sp, #0x40]
	str	r2, [sp, #0x44]
	str	r3, [sp, #0x48]
	add	r0, sp, #0x3c
	mov	r1, sp
	bl	sub_8066D8C
	add	r0, sp, #0x44
	add	r4, sp, #0x14
	add	r1, r4, #0
	bl	sub_8066D8C
	ldr	r0, [r4, #0x4]
	mov	r1, #0x1
	EOR	r0, r1
	str	r0, [r4, #0x4]
	add	r2, sp, #0x28
	mov	r0, sp
	add	r1, r4, #0
	bl	sub_8066E64
	bl	sub_8066C44
	add	sp, sp, #0x4c
	pop	{r4, pc}
	thumb_func_end sub_8067100

.align 2, 0 @ Don't pad with nop.
