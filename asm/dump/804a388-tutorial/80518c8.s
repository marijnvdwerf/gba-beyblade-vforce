	.include "asm/common.inc"

	thumb_func_start sub_80518C8
sub_80518C8:
	push	{lr}
	bl	sub_8051720
	ldr	r1, [r0, #0x10]
	mov	r2, #0x0
	cmp	r1, #0
	beq	.L80518E8	@cond_branch
	mov	r3, #0x1
.L80518D8:
	add	r0, r1, #0
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L80518E2	@cond_branch
	add	r2, r2, #0x1
.L80518E2:
	lsr	r1, r1, #0x1
	cmp	r1, #0
	bne	.L80518D8	@cond_branch
.L80518E8:
	add	r0, r2, #0
	pop	{r1}
	bx	r1
	thumb_func_end sub_80518C8

.align 2, 0 @ Don't pad with nop.
