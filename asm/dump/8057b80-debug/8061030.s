	.include "asm/common.inc"

	thumb_func_start sub_8061030
sub_8061030:
	push	{r4, r5, lr}
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r4, r2, #0x10
	ldr	r3, [r0, #0x30]
	cmp	r3, #0
	beq	.L1	@cond_branch
	ldrh	r2, [r3, #0x14]
	add	r1, r2, r1
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	ldrh	r5, [r3, #0x16]
	add	r2, r5, r4
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	ldrb	r3, [r3, #0x18]
	bl	sub_8060F64
	b	.L2
.L1:
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	add	r2, r3, #0
	add	r1, r1, r2
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r2, r4, r2
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r3, #0x0
	bl	sub_8060F64
.L2:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061030

.align 2, 0 @ Don't pad with nop.
