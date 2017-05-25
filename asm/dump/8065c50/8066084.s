	.include "asm/common.inc"

	thumb_func_start sub_8066084
sub_8066084:
	cmp	r1, #0
	beq	.L1	@cond_branch
	push	{r4}
	add	r4, r0, #0
	EOR	r4, r1
	mov	ip, r4
	mov	r3, #0x1
	mov	r2, #0x0
	cmp	r1, #0
	bpl	.L2	@cond_branch
	NEG	r1, r1
.L2:
	cmp	r0, #0
	bpl	.L3	@cond_branch
	NEG	r0, r0
.L3:
	cmp	r0, r1
	bcc	.L16	@cond_branch
	mov	r4, #0x1
	lsl	r4, r4, #0x1c
.L7:
	cmp	r1, r4
	bcs	.L6	@cond_branch
	cmp	r1, r0
	bcs	.L6	@cond_branch
	lsl	r1, r1, #0x4
	lsl	r3, r3, #0x4
	b	.L7
.L6:
	lsl	r4, r4, #0x3
.L10:
	cmp	r1, r4
	bcs	.L17	@cond_branch
	cmp	r1, r0
	bcs	.L17	@cond_branch
	lsl	r1, r1, #0x1
	lsl	r3, r3, #0x1
	b	.L10
.L17:
	cmp	r0, r1
	bcc	.L11	@cond_branch
	sub	r0, r0, r1
	orr	r2, r2, r3
.L11:
	lsr	r4, r1, #0x1
	cmp	r0, r4
	bcc	.L12	@cond_branch
	sub	r0, r0, r4
	lsr	r4, r3, #0x1
	orr	r2, r2, r4
.L12:
	lsr	r4, r1, #0x2
	cmp	r0, r4
	bcc	.L13	@cond_branch
	sub	r0, r0, r4
	lsr	r4, r3, #0x2
	orr	r2, r2, r4
.L13:
	lsr	r4, r1, #0x3
	cmp	r0, r4
	bcc	.L14	@cond_branch
	sub	r0, r0, r4
	lsr	r4, r3, #0x3
	orr	r2, r2, r4
.L14:
	cmp	r0, #0
	beq	.L16	@cond_branch
	lsr	r3, r3, #0x4
	beq	.L16	@cond_branch
	lsr	r1, r1, #0x4
	b	.L17
.L16:
	add	r0, r2, #0
	mov	r4, ip
	cmp	r4, #0
	bpl	.L18	@cond_branch
	NEG	r0, r0
.L18:
	pop	{r4}
	mov	pc, lr
.L1:
	push	{lr}
	bl	nullsub_13
	mov	r0, #0x0
	pop	{pc}
	thumb_func_end sub_8066084

.align 2, 0 @ Don't pad with nop.
