	.include "asm/common.inc"

	thumb_func_start sub_804B4FC
sub_804B4FC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r8, r0
	add	r5, r1, #0
	ldr	r4, .L8
	ldr	r0, [r4]
	mov	r1, r8
	bl	sub_804B8F0
	ldr	r0, .L8 + 4
	ldrh	r0, [r0]
	ldr	r1, [r4]
	ldr	r2, .L8 + 8
	add	r0, r1, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r5, #0x0
	mov	r2, #0x86
	lsl	r2, r2, #0x3
	add	r0, r1, r2
	ldr	r0, [r0]
	cmp	r5, r0
	bge	.L2	@cond_branch
	add	r7, r4, #0
	mov	r6, #0x0
.L6:
	ldr	r0, [r7]
	ldr	r1, .L8 + 12
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r4, r0, r6
	mov	r2, #0xf2
	lsl	r2, r2, #0x2
	add	r1, r4, r2
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L4	@cond_branch
	mov	r1, #0x84
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L4	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L5	@cond_branch
.L4:
	add	r0, r4, #0
	mov	r1, r8
	bl	sub_804B8F0
.L5:
	mov	r2, #0x85
	lsl	r2, r2, #0x3
	add	r6, r6, r2
	add	r5, r5, #0x1
	ldr	r0, [r7]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r5, r0
	blt	.L6	@cond_branch
.L2:
	ldr	r0, .L8 + 4
	ldrh	r0, [r0]
	b	.L7
.L9:
	.align	2, 0
.L8:
	.4byte	0x3000fb0
	.4byte	0x4000006
	.4byte	0x1618
	.4byte	0x42c
.L1:
	ldr	r2, .L10
	add	r0, r1, r2
	ldr	r1, [r0]
	add	r0, r5, #0
	bl	sub_80501F8
.L7:
	bl	sub_804B754
	bl	sub_804B624
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.4byte	0x42c
	thumb_func_end sub_804B4FC

.align 2, 0 @ Don't pad with nop.
