	.include "asm/common.inc"

	thumb_func_start sub_8060A60
sub_8060A60:
	push	{r4, lr}
	add	r4, r0, #0
	cmp	r4, #0
	beq	.L8060A8C	@cond_branch
	ldr	r2, [r4, #0x24]
	cmp	r2, #0
	blt	.L8060A86	@cond_branch
	mov	r1, #0x1
	add	r0, r1, #0
	ldrh	r3, [r4, #0x20]
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L8060A86	@cond_branch
	ldrh	r0, [r4, #0x16]
	sub	r0, r0, #0x5
	lsl	r1, r0
	add	r0, r2, #0
	bl	freeSpriteVramLocation
.L8060A86:
	mov	r0, #0x1
	neg	r0, r0
	str	r0, [r4, #0x24]
.L8060A8C:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8060A60

.align 2, 0 @ Don't pad with nop.
