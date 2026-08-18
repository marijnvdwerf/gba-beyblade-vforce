	.include "asm/common.inc"

	thumb_func_start sub_8054278
sub_8054278:
	push	{r4, lr}
	lsl	r1, r1, #0x10
	lsr	r4, r1, #0x10
	add	r1, r4, #0
	bl	handleEventListeners
	ldr	r0, .L80542A0
	ldr	r0, [r0]
	ldr	r1, .L80542A0 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8054298	@cond_branch
	add	r0, r4, #0
	bl	sub_804FF88
.L8054298:
	pop	{r4}
	pop	{r0}
	bx	r0
.L805429E:
	.align	2, 0
.L80542A0:
	.4byte	0x3000fb0
	.4byte	0x1618
	thumb_func_end sub_8054278

.align 2, 0 @ Don't pad with nop.
