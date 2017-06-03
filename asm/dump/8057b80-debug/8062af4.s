	.include "asm/common.inc"

	thumb_func_start sub_8062AF4
sub_8062AF4:
	push	{r4, lr}
	add	r4, r1, #0
	bl	sub_8062A50
	add	r2, r0, #0
	cmp	r2, #0
	beq	.L1	@cond_branch
	cmp	r4, #0x7f
	bls	.L2	@cond_branch
	mov	r4, #0x7f
.L2:
	ldr	r0, .L3
	ldr	r1, [r0]
	lsl	r0, r4, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	str	r0, [r2, #0x8]
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000d98
	thumb_func_end sub_8062AF4

.align 2, 0 @ Don't pad with nop.