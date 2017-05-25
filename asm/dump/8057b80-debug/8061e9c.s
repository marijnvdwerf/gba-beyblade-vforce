	.include "asm/common.inc"

	thumb_func_start sub_8061E9C
sub_8061E9C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	mov	r9, r0
	add	r7, r1, #0
	mov	r8, r2
	ldr	r6, [sp, #0x34]
	ldr	r0, [sp, #0x38]
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	str	r3, [sp, #0x10]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	mov	r5, sp
	cmp	r6, #0x10
	ble	.L7	@cond_branch
	mov	r6, #0x10
.L7:
	add	r0, r7, #0
	mov	r1, r8
	bl	sub_8066238
	add	r4, r0, #0
	add	r0, r7, #0
	mov	r1, r8
	bl	sub_80661C0
	add	r7, r0, #0
	cmp	r4, #0x9
	bgt	.L2	@cond_branch
	add	r4, r4, #0x30
	b	.L5
.L2:
	mov	r0, sl
	cmp	r0, #0
	beq	.L4	@cond_branch
	add	r4, r4, #0x37
	b	.L5
.L4:
	add	r4, r4, #0x57
.L5:
	strb	r4, [r5]
	add	r5, r5, #0x1
	cmp	r7, #0
	beq	.L6	@cond_branch
	sub	r6, r6, #0x1
	cmp	r6, #0
	bne	.L7	@cond_branch
.L6:
	ldr	r0, [sp, #0x10]
	cmp	r0, #0
	beq	.L11	@cond_branch
	add	r0, r6, #0
	sub	r6, r6, #0x1
	cmp	r0, #0
	ble	.L11	@cond_branch
	mov	r1, #0x30
.L10:
	strb	r1, [r5]
	add	r5, r5, #0x1
	add	r0, r6, #0
	sub	r6, r6, #0x1
	cmp	r0, #0
	bgt	.L10	@cond_branch
	b	.L11
.L12:
	sub	r5, r5, #0x1
	ldrb	r1, [r5]
	mov	r0, r9
	bl	sub_8061E94
	mov	r9, r0
.L11:
	cmp	r5, sp
	bhi	.L12	@cond_branch
	mov	r0, r9
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8061E9C

.align 2, 0 @ Don't pad with nop.
