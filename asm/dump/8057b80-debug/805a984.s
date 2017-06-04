	.include "asm/common.inc"

	thumb_func_start sub_805A984
sub_805A984:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	mov	r0, #0x0
	mov	ip, r0
	ldrh	r4, [r5, #0x4]
	lsl	r0, r4, #0x1
	add	r0, r0, r4
	lsl	r0, r0, #0x2
	ldr	r1, [r5, #0x14]
	add	r2, r1, r0
	cmp	r4, #0
	beq	.L1	@cond_branch
	sub	r0, r0, #0xc
	add	r1, r1, r0
	mov	ip, r1
.L1:
	ldr	r1, .L8
	mov	r8, r1
	ldrh	r3, [r2, #0x8]
	add	r7, r3, #0
	add	r0, r7, #0
	ldrh	r6, [r1]
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldrh	r0, [r2, #0xa]
	ldr	r6, .L8 + 4
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r0, [r6]
	str	r0, [r2]
.L3:
	ldr	r1, [r6]
	ldr	r0, [r2]
	sub	r0, r1, r0
	cmp	r0, #0x64
	bls	.L4	@cond_branch
	str	r1, [r2]
	mov	r0, #0x0
	strh	r0, [r2, #0xa]
.L4:
	mov	r0, r8
	ldrh	r1, [r0]
	and	r1, r1, r3
	ldrh	r0, [r2, #0xa]
	orr	r1, r1, r0
	strh	r1, [r2, #0xa]
	and	r1, r1, r7
	lsl	r0, r3, #0x10
	lsr	r0, r0, #0x10
	cmp	r1, r0
	bne	.L6	@cond_branch
	ldr	r1, [r6]
	ldr	r0, [r2]
	sub	r0, r1, r0
	cmp	r0, #0x41
	bhi	.L6	@cond_branch
	str	r1, [r2, #0x4]
	mov	r0, #0x0
	strh	r0, [r2, #0xa]
	mov	r0, #0x1
	b	.L7
.L9:
	.align	2, 0
.L8:
	.4byte	0x3005da0
	.4byte	0x3000e30
.L6:
	mov	r0, #0x0
.L7:
	cmp	r0, #0
	beq	.L13	@cond_branch
	mov	r1, ip
	cmp	r1, #0
	beq	.L11	@cond_branch
	ldr	r0, [r1, #0x4]
	ldrh	r6, [r5, #0x8]
	add	r0, r6, r0
	ldr	r1, [r2, #0x4]
	add	r4, r4, #0x1
	cmp	r0, r1
	bcs	.L13	@cond_branch
	mov	r4, #0x0
	b	.L13
.L11:
	add	r4, r4, #0x1
.L13:
	ldrh	r0, [r5, #0x6]
	cmp	r4, r0
	blt	.L14	@cond_branch
	mov	r4, #0x0
	ldr	r1, [r5]
	cmp	r1, #0
	beq	.L15	@cond_branch
	ldr	r0, [r5, #0xc]
	bl	_call_via_r1
.L15:
	strh	r4, [r5, #0x4]
	mov	r0, #0x1
	b	.L16
.L14:
	strh	r4, [r5, #0x4]
	mov	r0, #0x0
.L16:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805A984

.align 2, 0 @ Don't pad with nop.
