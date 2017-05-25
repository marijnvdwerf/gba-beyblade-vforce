	.include "asm/common.inc"

	thumb_func_start sub_805295C
sub_805295C:
	push	{r4, lr}
	mov	r4, #0x1
.L1:
	bl	VBlankIntrWait
	bl	sub_80627F0
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L1	@cond_branch
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805295C

.align 2, 0 @ Don't pad with nop.
