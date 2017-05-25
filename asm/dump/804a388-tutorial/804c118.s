	.include "asm/common.inc"

	thumb_func_start sub_804C118
sub_804C118:
	push	{r4, lr}
	ldr	r1, .L3
	add	r4, r0, r1
	mov	r0, #0x0
	ldsh	r1, [r4, r0]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L2	@cond_branch
	add	r0, r1, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L2	@cond_branch
	mov	r1, #0x0
	ldsh	r0, [r4, r1]
	mov	r1, #0x1
	bl	sub_8057104
	mov	r1, #0x0
	ldsh	r0, [r4, r1]
	bl	getItem
.L2:
	pop	{r4}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x424
	thumb_func_end sub_804C118

.align 2, 0 @ Don't pad with nop.
