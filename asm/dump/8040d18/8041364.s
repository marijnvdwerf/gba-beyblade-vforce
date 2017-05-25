	.include "asm/common.inc"

	thumb_func_start sub_8041364
sub_8041364:
	push	{r4, r5, lr}
	add	r5, r0, #0
	mov	r4, #0x0
.L1:
	add	r0, r4, #0
	bl	sub_804A0E0
	bl	sub_8061228
	add	r4, r4, #0x1
	cmp	r4, #0x5
	ble	.L1	@cond_branch
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5]
.L2:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8041364

.align 2, 0 @ Don't pad with nop.
