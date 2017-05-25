	.include "asm/common.inc"

	thumb_func_start sub_805AC28
sub_805AC28:
	push	{r4, r5, r6, r7, lr}
	add	r7, r0, #0
	add	r5, r1, #0
	add	r6, r2, #0
	lsl	r3, r3, #0x10
	lsr	r4, r3, #0x10
	mov	r0, #0x10
	bl	slowAllocate
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	str	r5, [r0, #0xc]
	str	r7, [r0]
	str	r6, [r0, #0x4]
	strh	r4, [r0, #0x8]
	b	.L2
.L1:
	ldr	r0, .L3
	bl	nullsub_8
	mov	r0, #0x0
.L2:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L4:
	.align	2, 0
.L3:
	.4byte	0x8755348
	thumb_func_end sub_805AC28

.align 2, 0 @ Don't pad with nop.
