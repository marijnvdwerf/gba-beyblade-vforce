	.include "asm/common.inc"

	thumb_func_start sub_8052514
sub_8052514:
	push	{lr}
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	mov	r1, #0xa0
	mov	r2, #0x20
	bl	newPolyTable
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0xb88
	thumb_func_end sub_8052514

.align 2, 0 @ Don't pad with nop.
