	.include "asm/common.inc"

	thumb_func_start sub_806611C
sub_806611C:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r1, .L3
	bl	sub_8066A3C
	cmp	r0, #0
	bge	.L1	@cond_branch
	add	r0, r4, #0
	bl	sub_8066B74
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x4f000000
.L1:
	ldr	r1, .L5
	add	r0, r4, #0
	bl	sub_80665A8
	bl	sub_8066B74
	mov	r1, #0x80
	lsl	r1, r1, #0x18
	add	r0, r0, r1
.L2:
	pop	{r4, pc}
.L6:
	.align	2, 0
.L5:
	.4byte	0xcf000000
	thumb_func_end sub_806611C

.align 2, 0 @ Don't pad with nop.
