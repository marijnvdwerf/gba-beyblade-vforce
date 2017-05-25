	.include "asm/common.inc"

	thumb_func_start sub_8066C18
sub_8066C18:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xffffffe8
	str	r0, [sp, #0x14]
	add	r0, sp, #0x14
	add	r1, sp, #0x4
	bl	sub_80663B0
	ldr	r0, [sp, #0x4]
	ldr	r1, [sp, #0x8]
	ldr	r2, [sp, #0xc]
	ldr	r3, [sp, #0x10]
	mov	r4, #0x0
	lsr	r6, r3, #0x2
	lsl	r5, r4, #0x1e
	add	r4, r6, #0
	orr	r4, r4, r5
	lsl	r3, r3, #0x1e
	str	r4, [sp]
	bl	sub_8067974
	add	sp, sp, #0x18
	pop	{r4, r5, r6, pc}
	thumb_func_end sub_8066C18

.align 2, 0 @ Don't pad with nop.
