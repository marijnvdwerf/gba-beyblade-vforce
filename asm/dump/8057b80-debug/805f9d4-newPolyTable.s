	.include "asm/common.inc"

	thumb_func_start newPolyTable
newPolyTable:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r4, r0, #0
	lsl	r1, r1, #0x10
	lsr	r6, r1, #0x10
	mov	r8, r6
	lsl	r2, r2, #0x10
	lsr	r5, r2, #0x10
	add	r7, r5, #0
	ldr	r0, [r4, #0x10]
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r4, #0
	bl	sub_805FA4C
.L1:
	lsl	r0, r5, #0x2
	bl	fastAllocate
	str	r0, [r4, #0x10]
	lsl	r0, r6, #0x2
	bl	fastAllocate
	str	r0, [r4, #0x14]
	ldr	r0, [r4, #0x10]
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, .L4
	bl	printf
.L2:
	ldr	r0, [r4, #0x14]
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r0, .L4 + 4
	bl	printf
.L3:
	ldr	r0, [r4, #0x10]
	ldr	r0, [r0]
	str	r0, [r4, #0x8]
	ldr	r0, [r4, #0x14]
	ldr	r0, [r0]
	str	r0, [r4, #0xc]
	mov	r0, #0x0
	strh	r7, [r4]
	mov	r1, r8
	strh	r1, [r4, #0x2]
	strh	r0, [r4, #0x4]
	add	r0, r4, #0
	bl	sub_805FA68
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x87556b0
	.4byte	0x87556f4
	thumb_func_end newPolyTable

.align 2, 0 @ Don't pad with nop.
