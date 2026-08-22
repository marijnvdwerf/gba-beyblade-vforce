	.include "asm/common.inc"

	thumb_func_start turorial_804A488
turorial_804A488:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	ldr	r0, .L804A4FC
	ldr	r0, [r0]
	ldr	r1, .L804A4FC + 4
	add	r7, r0, r1
	add	r1, r1, #0x4
	add	r4, r0, r1
	bl	sub_8051734
	add	r1, r0, #0
	mov	r3, #0x0
	ldr	r0, [r4]
	sub	r0, r0, #0x1
	cmp	r0, r5
	beq	.L804A4BE	@cond_branch
	ldr	r2, [r7]
	cmp	r3, r2
	bge	.L804A4BE	@cond_branch
.L804A4AE:
	add	r3, r3, #0x1
	add	r4, r4, #0x8
	ldr	r0, [r4]
	sub	r0, r0, #0x1
	cmp	r0, r5
	beq	.L804A4BE	@cond_branch
	cmp	r3, r2
	blt	.L804A4AE	@cond_branch
.L804A4BE:
	ldr	r0, [r7]
	cmp	r3, r0
	beq	.L804A4F4	@cond_branch
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804A4F4	@cond_branch
	asr	r0, r3, #0x5
	lsl	r0, r0, #0x2
	add	r1, r1, #0x14
	add	r5, r1, r0
	mov	r0, #0x1f
	and	r3, r3, r0
	mov	r6, #0x1
	lsl	r6, r3
	ldr	r0, [r5]
	and	r0, r0, r6
	cmp	r0, #0
	bne	.L804A4F4	@cond_branch
	bl	sub_80555F4
	mov	r1, #0x82
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	str	r4, [r0]
	ldr	r0, [r5]
	orr	r0, r0, r6
	str	r0, [r5]
.L804A4F4:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804A4FA:
	.align	2, 0
.L804A4FC:
	.4byte	_gameData
	.4byte	0x13fc
	thumb_func_end turorial_804A488

.align 2, 0 @ Don't pad with nop.
