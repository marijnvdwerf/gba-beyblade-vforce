	.include "asm/common.inc"

	thumb_func_start sub_8061204
sub_8061204:
	push	{r4, lr}
	add	r4, r0, #0
	add	r0, r0, #0x14
	bl	sub_8060CDC
	ldr	r0, [r4, #0x2c]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	sub_8061160
	ldr	r0, [r4, #0x2c]
	bl	sub_8060B38
	mov	r0, #0x0
	str	r0, [r4, #0x2c]
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061204

.align 2, 0 @ Don't pad with nop.
