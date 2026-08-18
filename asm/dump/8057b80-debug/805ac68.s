	.include "asm/common.inc"

	thumb_func_start sub_805AC68
sub_805AC68:
	push	{lr}
	ldr	r0, .L805AC7C
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L805AC78	@cond_branch
	ldr	r1, [r0]
	bl	_call_via_r1
.L805AC78:
	pop	{r0}
	bx	r0
.L805AC7C:
	.align	2, 0

	.4byte	0x3005dc0
	thumb_func_end sub_805AC68

.align 2, 0 @ Don't pad with nop.
