	.include "asm/common.inc"

	thumb_func_start sub_806100C
sub_806100C:
	push	{lr}
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	ldr	r3, [r0, #0x30]
	cmp	r3, #0
	beq	.L1	@cond_branch
	ldrb	r3, [r3, #0x18]
	bl	sub_8060F64
	b	.L2
.L1:
	mov	r3, #0x0
	bl	sub_8060F64
.L2:
	pop	{r0}
	bx	r0
	thumb_func_end sub_806100C

.align 2, 0 @ Don't pad with nop.
