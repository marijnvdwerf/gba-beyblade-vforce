	.include "asm/common.inc"

	thumb_func_start sub_804B754
sub_804B754:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	ldr	r2, .L804B770
	ldr	r7, [r2]
	ldr	r1, .L804B770 + 4
	add	r0, r7, r1
	ldrb	r0, [r0]
	cmp	r0, #0x4
	bhi	.L804B778	@cond_branch
	bl	sub_804FE30
	b	.L804B7F2
.L804B76E:
	.align	2, 0
.L804B770:
	.4byte	_gameData
	.4byte	0x1638
.L804B778:
	mov	r4, #0x0
	mov	r3, #0x86
	lsl	r3, r3, #0x3
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r4, r0
	bge	.L804B7F2	@cond_branch
	add	r5, r2, #0
	mov	r8, r1
	mov	r6, #0x0
.L804B78C:
	ldr	r0, [r5]
	ldr	r1, .L804B7D0
	add	r0, r0, r1
	ldr	r1, [r0]
	add	r1, r1, r6
	add	r0, r7, #0
	mov	r2, #0x80
	bl	sub_804DA48
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804B7D8	@cond_branch
	bl	sub_804FE14
	ldr	r1, .L804B7D0 + 4
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	add	r0, r2, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804B7F2	@cond_branch
	ldr	r0, [r5]
	ADD r0, r8
	mov	r1, #0x0
	strb	r1, [r0]
	ldr	r0, [r5]
	ADD r0, r8
	ldrb	r0, [r0]
	bl	sub_804F800
	bl	sub_805568C
	b	.L804B7F2
.L804B7D0:
	.align	2, 0

	.4byte	0x42c
	.4byte	_unk3005DA0
.L804B7D8:
	bl	sub_804FE30
	mov	r3, #0x85
	lsl	r3, r3, #0x3
	add	r6, r6, r3
	add	r4, r4, #0x1
	ldr	r0, [r5]
	mov	r1, #0x86
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r4, r0
	blt	.L804B78C	@cond_branch
.L804B7F2:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804B754

.align 2, 0 @ Don't pad with nop.
