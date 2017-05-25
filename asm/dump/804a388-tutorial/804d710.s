	.include "asm/common.inc"

	thumb_func_start sub_804D710
sub_804D710:
	push	{r4, r5, lr}
	add	r4, r0, #0
	mov	r1, #0xce
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	ldr	r0, [r0]
	cmp	r0, #0x4
	bne	.L1	@cond_branch
	mov	r0, #0x2
	bl	sub_804ABFC
.L1:
	mov	r5, #0x80
	lsl	r5, r5, #0xc
	add	r0, r4, #0
	add	r1, r5, #0
	bl	sub_804E440
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L3	@cond_branch
	add	r0, r4, #0
	add	r1, r5, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L3	@cond_branch
	mov	r0, #0x11
	bl	sub_804ABFC
.L3:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804D710

.align 2, 0 @ Don't pad with nop.
