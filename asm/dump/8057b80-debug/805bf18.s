	.include "asm/common.inc"

	thumb_func_start sub_805BF18
sub_805BF18:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r6, r0, #0
	mov	ip, r1
	add	r7, r2, #0
	mov	r8, r3
	ldr	r2, [sp, #0x18]
	ldr	r4, [sp, #0x1c]
	ldr	r3, [sp, #0x20]
	ldr	r5, [sp, #0x24]
	mov	r1, #0x0
	cmp	r2, r3
	ble	.L1	@cond_branch
	add	r0, r3, #0
	add	r3, r2, #0
	add	r2, r0, #0
.L1:
	cmp	r4, r5
	ble	.L2	@cond_branch
	add	r0, r5, #0
	add	r5, r4, #0
	add	r4, r0, #0
.L2:
	cmp	r2, r6
	blt	.L4	@cond_branch
	cmp	r2, r7
	bge	.L4	@cond_branch
	mov	r1, #0x1
.L4:
	cmp	r3, r6
	blt	.L6	@cond_branch
	cmp	r3, r7
	bge	.L6	@cond_branch
	mov	r0, #0x1
	orr	r1, r1, r0
.L6:
	cmp	r4, ip
	blt	.L8	@cond_branch
	cmp	r4, r8
	bge	.L8	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L8:
	cmp	r5, ip
	blt	.L10	@cond_branch
	cmp	r5, r8
	bge	.L10	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L10:
	cmp	r2, r6
	bge	.L13	@cond_branch
	cmp	r3, r7
	blt	.L13	@cond_branch
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L13	@cond_branch
	mov	r1, #0x3
.L13:
	cmp	r4, ip
	bge	.L16	@cond_branch
	cmp	r5, r8
	blt	.L16	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L16	@cond_branch
	mov	r1, #0x3
.L16:
	cmp	r2, r6
	bge	.L20	@cond_branch
	cmp	r3, r7
	blt	.L20	@cond_branch
	cmp	r4, ip
	bge	.L20	@cond_branch
	cmp	r5, r8
	blt	.L20	@cond_branch
	mov	r1, #0x3
.L20:
	cmp	r1, #0x3
	beq	.L21	@cond_branch
	mov	r0, #0x0
	b	.L22
.L21:
	mov	r0, #0x1
.L22:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805BF18

.align 2, 0 @ Don't pad with nop.
