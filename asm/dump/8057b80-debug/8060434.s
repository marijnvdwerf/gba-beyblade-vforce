	.include "asm/common.inc"

	thumb_func_start sub_8060434
sub_8060434:
	push	{lr}
	ldr	r0, .L2
	ldr	r1, [r0]
	ldr	r2, [r1, #0xc]
	mov	r1, #0x0
	str	r1, [r0]
	cmp	r2, #0
	beq	.L1	@cond_branch
	add	r0, r2, #0
	bl	deallocateBlock
.L1:
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005dc4
	thumb_func_end sub_8060434

.align 2, 0 @ Don't pad with nop.
