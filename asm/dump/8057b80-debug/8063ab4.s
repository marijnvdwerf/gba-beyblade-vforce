	.include "asm/common.inc"

	thumb_func_start sub_8063AB4
sub_8063AB4:
	push	{r4, r5, lr}
	add	r1, r0, #0
	add	r1, r1, #0xec
	ldr	r5, [r1]
	add	r0, r0, #0xf4
	ldr	r4, [r0]
	b	.L1
.L2:
	add	r0, r5, #0
	bl	sub_8060A60
	ldr	r5, [r5, #0x4]
.L1:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063AB4

.align 2, 0 @ Don't pad with nop.
