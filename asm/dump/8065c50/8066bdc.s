	.include "asm/common.inc"

	thumb_func_start sub_8066BDC
sub_8066BDC:
	push	{lr}
	add	sp, sp, #0xffffffec
	str	r0, [sp, #0x10]
	add	r0, sp, #0x10
	mov	r1, sp
	bl	sub_80663B0
	mov	r1, #0x0
	ldr	r0, [sp, #0x4]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	str	r1, [sp, #0x4]
	mov	r0, sp
	bl	sub_80662F8
	add	sp, sp, #0x14
	pop	{pc}
	thumb_func_end sub_8066BDC

.align 2, 0 @ Don't pad with nop.
