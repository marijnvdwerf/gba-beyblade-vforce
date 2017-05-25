	.include "asm/common.inc"

	thumb_func_start sub_8041324
sub_8041324:
	push	{r4, r5, lr}
	mov	r4, #0x0
	lsl	r5, r0, #0x18
.L1:
	add	r0, r4, #0
	bl	sub_804A0E0
	lsr	r1, r5, #0x18
	bl	sub_8061E58
	add	r4, r4, #0x1
	cmp	r4, #0x5
	ble	.L1	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8041324

.align 2, 0 @ Don't pad with nop.
