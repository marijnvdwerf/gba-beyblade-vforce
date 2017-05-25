	.include "asm/common.inc"

	thumb_func_start sub_8066964
sub_8066964:
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
	mov	r1, #0x0
	ldr	r0, [sp]
	cmp	r0, #0x1
	bhi	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	cmp	r1, #0
	bne	.L2	@cond_branch
	mov	r1, #0x0
	ldr	r0, [sp, #0x10]
	cmp	r0, #0x1
	bhi	.L3	@cond_branch
	mov	r1, #0x1
.L3:
	cmp	r1, #0
	beq	.L4	@cond_branch
.L2:
	mov	r0, #0x1
	b	.L5
.L4:
	mov	r0, sp
	add	r1, r4, #0
	bl	sub_8066858
.L5:
	add	sp, sp, #0x28
	pop	{r4, pc}
	thumb_func_end sub_8066964

.align 2, 0 @ Don't pad with nop.
