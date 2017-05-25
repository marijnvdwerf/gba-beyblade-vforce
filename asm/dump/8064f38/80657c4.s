	.include "asm/common.inc"

	thumb_func_start sub_80657C4
sub_80657C4:
	push	{r4, r5, lr}
	add	r5, r0, #0
	mov	r4, #0x0
	b	.L1
.L2:
	mov	r0, #0xc4
	add	r1, r4, #0
	mul	r1, r1, r0
	ldr	r0, [r5]
	add	r0, r0, r1
	bl	sub_80588DC
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L1:
	ldrb	r0, [r5, #0x4]
	cmp	r4, r0
	bcc	.L2	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80657C4

.align 2, 0 @ Don't pad with nop.
