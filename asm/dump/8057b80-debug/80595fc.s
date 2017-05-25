	.include "asm/common.inc"

	thumb_func_start sub_80595FC
sub_80595FC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	add	r7, r1, #0
	add	r6, r2, #0
	ldr	r0, [sp, #0x28]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	add	r0, r5, #0
	add	r0, r0, #0x5c
	ldrb	r0, [r0]
	lsl	r1, r0, #0xb
	add	r0, r5, #0
	add	r0, r0, #0x5f
	ldrb	r2, [r0]
	add	r0, r6, #0
	LSL	r0, r2
	lsl	r0, r0, #0x1
	mov	r4, #0xc0
	lsl	r4, r4, #0x13
	add	r0, r0, r4
	add	r4, r1, r0
	mov	r1, #0x1
	add	r0, r1, #0
	LSL	r0, r2
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	add	r0, r5, #0
	add	r0, r0, #0x64
	ldrh	r0, [r0]
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L2	@cond_branch
	lsl	r0, r6, #0x10
	lsr	r1, r0, #0x10
	ldr	r0, [sp, #0x24]
	add	r6, r6, r0
	mov	ip, r6
	cmp	r1, ip
	bcs	.L2	@cond_branch
	add	r5, r7, r3
	lsl	r2, r2, #0x1
	mov	r9, r2
	lsl	r7, r7, #0x10
	mov	r8, r7
.L5:
	mov	r6, r8
	lsr	r2, r6, #0x10
	add	r1, r1, #0x1
	str	r1, [sp]
	cmp	r2, r5
	bcs	.L3	@cond_branch
	ldr	r7, .L6
	mov	r0, sl
	lsl	r3, r0, #0xc
.L4:
	lsl	r0, r2, #0x1
	add	r0, r0, r4
	add	r1, r7, #0
	ldrh	r6, [r0]
	and	r1, r1, r6
	orr	r1, r1, r3
	strh	r1, [r0]
	add	r0, r2, #1
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	cmp	r2, r5
	bcc	.L4	@cond_branch
.L3:
	ADD r4, r9
	ldr	r1, [sp]
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, ip
	bcc	.L5	@cond_branch
.L2:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.4byte	0xfff
	thumb_func_end sub_80595FC

.align 2, 0 @ Don't pad with nop.
