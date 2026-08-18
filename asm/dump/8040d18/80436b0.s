	.include "asm/common.inc"

	thumb_func_start sub_80436B0
sub_80436B0:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	mov	r1, #0xa4
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	ldr	r5, [r0]
	sub	r1, r1, #0x90
	add	r0, r6, r1
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L8043710	@cond_branch
	sub	r4, r4, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r4, r0
	beq	.L80436E0	@cond_branch
	add	r7, r0, #0
.L80436D2:
	add	r0, r5, #0
	bl	sub_8050584
	add	r5, r5, #0x18
	sub	r4, r4, #0x1
	cmp	r4, r7
	bne	.L80436D2	@cond_branch
.L80436E0:
	mov	r1, #0xa5
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80436FC	@cond_branch
	add	r1, r1, #0x34
	add	r0, r6, r1
	bl	sub_8050584
	ldr	r1, .L8043718
	add	r0, r6, r1
	bl	sub_8061204
.L80436FC:
	ldr	r1, .L8043718 + 4
	add	r0, r6, r1
	ldr	r0, [r0]
	bl	deallocateBlock
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r0, r6, r1
	bl	sub_805AD9C
.L8043710:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8043716:
	.align	2, 0
.L8043718:
	.4byte	0x52c
	.4byte	0x524
	thumb_func_end sub_80436B0

.align 2, 0 @ Don't pad with nop.
