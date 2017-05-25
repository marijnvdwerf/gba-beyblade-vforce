	.include "asm/common.inc"

	thumb_func_start sub_8065BD4
sub_8065BD4:
	push	{r4, r5, r6, lr}
	add	r5, r1, #0
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	mov	r6, #0x0
	b	.L1
.L4:
	add	r0, r6, #1
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
.L1:
	cmp	r6, #0x2
	bhi	.L2	@cond_branch
	add	r0, r4, #0
	add	r1, r5, #0
	bl	sub_8065AA0
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	cmp	r2, #0
	bne	.L4	@cond_branch
	add	r0, r4, #0
	add	r1, r5, #0
	bl	writeToBatteryBackup
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	cmp	r2, #0
	bne	.L4	@cond_branch
.L2:
	add	r0, r2, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8065BD4

.align 2, 0 @ Don't pad with nop.
