	.include "asm/common.inc"

	thumb_func_start sub_8058068
sub_8058068:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r7, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r0, #0x0
	mov	r8, r0
	add	r0, r7, #0
	bl	sub_8058038
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L1:
	mov	r6, #0x0
	ldrh	r0, [r5, #0x4]
	cmp	r8, r0
	bcs	.L3	@cond_branch
	add	r4, r5, #0
.L4:
	ldrh	r1, [r4, #0x8]
	add	r0, r7, #0
	bl	sub_8057FDC
	ADD r8, r0
	add	r4, r4, #0x2
	add	r6, r6, #0x1
	ldrh	r0, [r5, #0x4]
	cmp	r6, r0
	bcc	.L4	@cond_branch
.L3:
	mov	r0, r8
.L2:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8058068

.align 2, 0 @ Don't pad with nop.
