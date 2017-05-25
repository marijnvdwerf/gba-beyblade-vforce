	.include "asm/common.inc"

	thumb_func_start sub_8062AD4
sub_8062AD4:
	push	{r4, lr}
	add	r4, r1, #0
	bl	sub_8062A50
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	cmp	r4, r1
	bls	.L2	@cond_branch
	add	r4, r1, #0
.L2:
	strh	r4, [r0, #0x10]
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8062AD4

.align 2, 0 @ Don't pad with nop.
