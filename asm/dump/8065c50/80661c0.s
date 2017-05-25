	.include "asm/common.inc"

	thumb_func_start sub_80661C0
sub_80661C0:
	cmp	r1, #0
	beq	.L1	@cond_branch
	mov	r3, #0x1
	mov	r2, #0x0
	push	{r4}
	cmp	r0, r1
	bcc	.L14	@cond_branch
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
	cmp	r0, r1
	bcc	.L9	@cond_branch
	sub	r0, r0, r1
	orr	r2, r2, r3
.L9:
	lsr	r4, r1, #0x1
	cmp	r0, r4
	bcc	.L10	@cond_branch
	sub	r0, r0, r4
	lsr	r4, r3, #0x1
	orr	r2, r2, r4
.L10:
	lsr	r4, r1, #0x2
	cmp	r0, r4
	bcc	.L11	@cond_branch
	sub	r0, r0, r4
	lsr	r4, r3, #0x2
	orr	r2, r2, r4
.L11:
	lsr	r4, r1, #0x3
	cmp	r0, r4
	bcc	.L12	@cond_branch
	sub	r0, r0, r4
	lsr	r4, r3, #0x3
	orr	r2, r2, r4
.L12:
	cmp	r0, #0
	beq	.L14	@cond_branch
	lsr	r3, r3, #0x4
	beq	.L14	@cond_branch
	lsr	r1, r1, #0x4
	b	.L15
.L14:
	add	r0, r2, #0
	pop	{r4}
	mov	pc, lr
.L1:
	push	{lr}
	bl	nullsub_13
	mov	r0, #0x0
	pop	{pc}
	thumb_func_end sub_80661C0

.align 2, 0 @ Don't pad with nop.
