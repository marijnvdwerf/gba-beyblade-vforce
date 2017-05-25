	.include "asm/common.inc"

	thumb_func_start sub_8043970
sub_8043970:
	push	{r4, r5, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	bl	sub_804393C
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldrb	r1, [r4, #0x3]
	cmp	r1, r0
	bne	.L2	@cond_branch
	ldrb	r4, [r4, #0x2]
	lsl	r0, r4, #0x1c
	lsr	r0, r0, #0x1c
	cmp	r0, r5
	bne	.L2	@cond_branch
	mov	r0, #0x1
	b	.L3
.L2:
	bl	sub_80603E8
	mov	r0, #0x0
.L3:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8043970

.align 2, 0 @ Don't pad with nop.
