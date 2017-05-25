	.include "asm/common.inc"

	thumb_func_start sub_8060040
sub_8060040:
	push	{lr}
	ldr	r0, .L3
	ldr	r0, [r0]
	ldr	r1, [r0, #0x14]
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, #0x1
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005dc4
.L1:
	mov	r0, #0x10
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L5	@cond_branch
	ldr	r0, .L6
	bl	printf
.L5:
	mov	r0, #0x0
.L2:
	pop	{r1}
	bx	r1
.L7:
	.align	2, 0
.L6:
	.4byte	0x87558b4
	thumb_func_end sub_8060040

.align 2, 0 @ Don't pad with nop.
