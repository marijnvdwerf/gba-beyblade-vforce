	.include "asm/common.inc"

	thumb_func_start sub_805AC68
sub_805AC68:
	push	{lr}
	ldr	r0, .L2
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r1, [r0]
	bl	call_via_r1
.L1:
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005dc0
	thumb_func_end sub_805AC68

.align 2, 0 @ Don't pad with nop.
