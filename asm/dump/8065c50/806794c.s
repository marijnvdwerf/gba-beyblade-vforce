	.include "asm/common.inc"

	thumb_func_start sub_806794C
sub_806794C:
	push	{lr}
	add	sp, sp, #0xffffffe4
	str	r0, [sp, #0x14]
	str	r1, [sp, #0x18]
	add	r0, sp, #0x14
	mov	r1, sp
	bl	sub_8066D8C
	mov	r1, #0x0
	ldr	r0, [sp, #0x4]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	str	r1, [sp, #0x4]
	mov	r0, sp
	bl	sub_8066C44
	add	sp, sp, #0x1c
	pop	{pc}
	thumb_func_end sub_806794C

.align 2, 0 @ Don't pad with nop.
