	.include "asm/common.inc"

	thumb_func_start sub_8063DAC
sub_8063DAC:
	push	{r4, lr}
	add	r3, r0, #0
	add	r0, r0, #0xec
	ldr	r2, [r0]
	add	r0, r0, #0x8
	ldr	r1, [r0]
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r4, #0xa0
	lsl	r4, r4, #0x8
.L2:
	str	r4, [r2, #0xc]
	ldr	r2, [r2, #0x4]
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	add	r0, r3, #0
	bl	sub_8063AB4
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063DAC

.align 2, 0 @ Don't pad with nop.
