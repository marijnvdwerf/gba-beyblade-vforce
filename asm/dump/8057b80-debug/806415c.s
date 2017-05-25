	.include "asm/common.inc"

	thumb_func_start sub_806415C
sub_806415C:
	push	{r4, lr}
	add	r4, r0, #0
	bl	sub_8063CF4
	add	r4, r4, #0xba
	ldr	r0, .L1
	ldrh	r1, [r4]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strh	r0, [r4]
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0xfffb
	thumb_func_end sub_806415C

.align 2, 0 @ Don't pad with nop.
