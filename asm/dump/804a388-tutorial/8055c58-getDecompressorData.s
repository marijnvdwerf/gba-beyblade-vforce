	.include "asm/common.inc"

	thumb_func_start getDecompressorData
getDecompressorData:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	mov	r6, #0x0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
	str	r6, [r4]
.L1:
	str	r5, [r4, #0x4]
	ldr	r0, [r5]
	lsr	r0, r0, #0x8
	str	r0, [r4, #0xc]
	bl	slowAllocate
	str	r0, [r4]
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r6, [r0]
	add	r0, r5, #0
	add	r1, r6, #0
	bl	Lz77UnCompWram
	b	.L3
.L2:
	ldr	r0, .L4
	ldr	r1, [r4, #0xc]
	bl	printf
.L3:
	str	r6, [r4, #0x8]
	add	r0, r6, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L5:
	.align	2, 0
.L4:
	.4byte	0x8729780
	thumb_func_end getDecompressorData

.align 2, 0 @ Don't pad with nop.
