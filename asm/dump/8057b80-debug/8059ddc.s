	.include "asm/common.inc"

	thumb_func_start sub_8059DDC
sub_8059DDC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	mov	sl, r1
	add	r6, r3, #0
	ldr	r4, [sp, #0x20]
	ldr	r1, [sp, #0x24]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r9, r1
	add	r1, r0, #0
	add	r1, r1, #0x5c
	ldrb	r1, [r1]
	lsl	r3, r1, #0xb
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	add	r3, r3, r1
	add	r0, r0, #0x5f
	ldrb	r1, [r0]
	mov	r0, #0x1
	LSL	r0, r1
	sub	r0, r0, r6
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	add	r0, r2, #0
	LSL	r0, r1
	ADD r0, sl
	lsl	r0, r0, #0x1
	add	r3, r3, r0
	add	r1, r2, r4
	cmp	r2, r1
	bcs	.L1	@cond_branch
	lsl	r5, r5, #0x1
	mov	ip, r5
	add	r5, r1, #0
	ldr	r0, .L5
	mov	r8, r0
.L4:
	mov	r1, sl
	add	r0, r1, r6
	add	r2, r2, #0x1
	cmp	r1, r0
	bcs	.L2	@cond_branch
	mov	r4, r9
	mov	r7, r8
	and	r4, r4, r7
.L3:
	strh	r4, [r3]
	add	r3, r3, #0x2
	add	r1, r1, #0x1
	cmp	r1, r0
	bcc	.L3	@cond_branch
.L2:
	ADD r3, ip
	cmp	r2, r5
	bcc	.L4	@cond_branch
.L1:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x3ff
	thumb_func_end sub_8059DDC

.align 2, 0 @ Don't pad with nop.
