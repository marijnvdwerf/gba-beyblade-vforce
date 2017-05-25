	.include "asm/common.inc"

	thumb_func_start sub_8066238
sub_8066238:
	cmp	r1, #0
	beq	.L1	@cond_branch
	mov	r3, #0x1
	cmp	r0, r1
	bcs	.L2	@cond_branch
	mov	pc, lr
.L2:
	push	{r4}
	mov	r4, #0x1
	lsl	r4, r4, #0x1c
.L5:
	cmp	r1, r4
	bcs	.L4	@cond_branch
	cmp	r1, r0
	bcs	.L4	@cond_branch
	lsl	r1, r1, #0x4
	lsl	r3, r3, #0x4
	b	.L5
.L4:
	lsl	r4, r4, #0x3
.L8:
	cmp	r1, r4
	bcs	.L15	@cond_branch
	cmp	r1, r0
	bcs	.L15	@cond_branch
	lsl	r1, r1, #0x1
	lsl	r3, r3, #0x1
	b	.L8
.L15:
	mov	r2, #0x0
	cmp	r0, r1
	bcc	.L9	@cond_branch
	sub	r0, r0, r1
.L9:
	lsr	r4, r1, #0x1
	cmp	r0, r4
	bcc	.L10	@cond_branch
	sub	r0, r0, r4
	mov	ip, r3
	mov	r4, #0x1
	ROR	r3, r4
	orr	r2, r2, r3
	mov	r3, ip
.L10:
	lsr	r4, r1, #0x2
	cmp	r0, r4
	bcc	.L11	@cond_branch
	sub	r0, r0, r4
	mov	ip, r3
	mov	r4, #0x2
	ROR	r3, r4
	orr	r2, r2, r3
	mov	r3, ip
.L11:
	lsr	r4, r1, #0x3
	cmp	r0, r4
	bcc	.L12	@cond_branch
	sub	r0, r0, r4
	mov	ip, r3
	mov	r4, #0x3
	ROR	r3, r4
	orr	r2, r2, r3
	mov	r3, ip
.L12:
	mov	ip, r3
	cmp	r0, #0
	beq	.L14	@cond_branch
	lsr	r3, r3, #0x4
	beq	.L14	@cond_branch
	lsr	r1, r1, #0x4
	b	.L15
.L14:
	mov	r4, #0xe
	lsl	r4, r4, #0x1c
	and	r2, r2, r4
	bne	.L16	@cond_branch
	pop	{r4}
	mov	pc, lr
.L16:
	mov	r3, ip
	mov	r4, #0x3
	ROR	r3, r4
	TST	r2, r3
	beq	.L17	@cond_branch
	lsr	r4, r1, #0x3
	add	r0, r0, r4
.L17:
	mov	r3, ip
	mov	r4, #0x2
	ROR	r3, r4
	TST	r2, r3
	beq	.L18	@cond_branch
	lsr	r4, r1, #0x2
	add	r0, r0, r4
.L18:
	mov	r3, ip
	mov	r4, #0x1
	ROR	r3, r4
	TST	r2, r3
	beq	.L19	@cond_branch
	lsr	r4, r1, #0x1
	add	r0, r0, r4
.L19:
	pop	{r4}
	mov	pc, lr
.L1:
	push	{lr}
	bl	nullsub_13
	mov	r0, #0x0
	pop	{pc}
	thumb_func_end sub_8066238

.align 2, 0 @ Don't pad with nop.
