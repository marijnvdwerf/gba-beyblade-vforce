	.include "asm/common.inc"

	thumb_func_start sub_80588A8
sub_80588A8:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r4, #0
	add	r5, r5, #0xb8
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5]
.L1:
	ldr	r0, [r4, #0x7c]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	deallocateBlock
.L2:
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4, #0x74]
	mov	r0, #0x0
	str	r0, [r4, #0x78]
	str	r0, [r4, #0x7c]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80588A8

.align 2, 0 @ Don't pad with nop.
