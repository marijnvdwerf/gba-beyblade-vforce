	.include "asm/common.inc"

	thumb_func_start sub_804B4A4
sub_804B4A4:
	push	{r4, r5, lr}
	add	r4, r0, #0
	mov	r1, #0x8e
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	bl	sub_80588A8
	mov	r1, #0xbf
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	bl	sub_80588A8
	mov	r0, #0x84
	lsl	r0, r0, #0x3
	add	r5, r4, r0
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
	mov	r0, #0x0
	str	r0, [r5]
.L1:
	mov	r1, #0xfa
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r1, r1, #0x4
	add	r0, r4, r1
	bl	sub_804EBE8
.L2:
	mov	r1, #0xf1
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L3	@cond_branch
	bl	sub_8060A94
.L3:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804B4A4

.align 2, 0 @ Don't pad with nop.
