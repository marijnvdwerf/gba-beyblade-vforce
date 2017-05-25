	.include "asm/common.inc"

	thumb_func_start def_94_4_AddWithBoundingAreaMessage
def_94_4_AddWithBoundingAreaMessage:
	push	{r4, lr}
	ldr	r4, .L3
	ldr	r3, [r4]
	cmp	r3, #0x1f
	ble	.L1	@cond_branch
	ldr	r0, .L3 + 4
	bl	printf
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000c18
	.4byte	0x87297d0
.L1:
	ldr	r0, .L5
	lsl	r1, r3, #0x2
	add	r1, r1, r0
	str	r2, [r1]
	add	r0, r3, #1
	str	r0, [r4]
.L2:
	pop	{r4}
	pop	{r1}
	bx	r1
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000c20
	thumb_func_end def_94_4_AddWithBoundingAreaMessage

.align 2, 0 @ Don't pad with nop.
