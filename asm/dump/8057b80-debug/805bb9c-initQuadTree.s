	.include "asm/common.inc"

	thumb_func_start initQuadTree
initQuadTree:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff4
	ldr	r4, [sp, #0x18]
	ldr	r5, [sp, #0x1c]
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r5, r5, #0x10
	lsr	r5, r5, #0x10
	str	r4, [sp]
	str	r5, [sp, #0x4]
	mov	r4, #0x0
	str	r4, [sp, #0x8]
	bl	allocQuadTree
	add	sp, sp, #0xc
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end initQuadTree

.align 2, 0 @ Don't pad with nop.
