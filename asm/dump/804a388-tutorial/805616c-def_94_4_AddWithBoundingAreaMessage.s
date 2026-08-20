	.include "asm/common.inc"

	thumb_func_start def_94_4_AddWithBoundingAreaMessage
def_94_4_AddWithBoundingAreaMessage:
	push	{r4, lr}
	ldr	r4, .L8056180
	ldr	r3, [r4]
	cmp	r3, #0x1f
	ble	.L8056188	@cond_branch
	ldr	r0, .L8056180 + 4
	bl	printf
	b	.L8056194
.L805617E:
	.align	2, 0
.L8056180:
	.4byte	withBoundingAreaCount
	.4byte	Str_87297D0
.L8056188:
	ldr	r0, .L805619C
	lsl	r1, r3, #0x2
	add	r1, r1, r0
	str	r2, [r1]
	add	r0, r3, #1
	str	r0, [r4]
.L8056194:
	pop	{r4}
	pop	{r1}
	bx	r1
.L805619A:
	.align	2, 0
.L805619C:
	.4byte	withBoundingAreas
	thumb_func_end def_94_4_AddWithBoundingAreaMessage

.align 2, 0 @ Don't pad with nop.
