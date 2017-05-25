	.include "asm/common.inc"

	thumb_func_start sub_805A93C
sub_805A93C:
	push	{r4, r5, r6, r7, lr}
	add	r5, r1, #0
	add	r7, r2, #0
	ldr	r2, [sp, #0x14]
	ldr	r4, [sp, #0x18]
	ldr	r1, [sp, #0x1c]
	str	r1, [r0, #0xc]
	lsl	r3, r3, #0x10
	lsr	r6, r3, #0x10
	mov	r1, #0x0
	strh	r1, [r0, #0x4]
	strh	r6, [r0, #0x6]
	str	r5, [r0, #0x10]
	str	r7, [r0, #0x14]
	strh	r2, [r0, #0x8]
	str	r4, [r0]
	mov	r4, #0x0
	cmp	r4, r6
	bcs	.L1	@cond_branch
.L2:
	lsl	r0, r4, #0x1
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	add	r0, r7, r0
	lsl	r1, r4, #0x2
	add	r1, r5, r1
	bl	sub_805A930
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, r6
	bcc	.L2	@cond_branch
.L1:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805A93C

.align 2, 0 @ Don't pad with nop.
