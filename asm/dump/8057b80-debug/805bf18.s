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
	ble	.L805BF3A	@cond_branch
	add	r0, r3, #0
	add	r3, r2, #0
	add	r2, r0, #0
.L805BF3A:
	cmp	r4, r5
	ble	.L805BF44	@cond_branch
	add	r0, r5, #0
	add	r5, r4, #0
	add	r4, r0, #0
.L805BF44:
	cmp	r2, r6
	blt	.L805BF4E	@cond_branch
	cmp	r2, r7
	bge	.L805BF4E	@cond_branch
	mov	r1, #0x1
.L805BF4E:
	cmp	r3, r6
	blt	.L805BF5A	@cond_branch
	cmp	r3, r7
	bge	.L805BF5A	@cond_branch
	mov	r0, #0x1
	orr	r1, r1, r0
.L805BF5A:
	cmp	r4, ip
	blt	.L805BF6A	@cond_branch
	cmp	r4, r8
	bge	.L805BF6A	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L805BF6A:
	cmp	r5, ip
	blt	.L805BF7A	@cond_branch
	cmp	r5, r8
	bge	.L805BF7A	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	lsl	r0, r1, #0x10
	lsr	r1, r0, #0x10
.L805BF7A:
	cmp	r2, r6
	bge	.L805BF8C	@cond_branch
	cmp	r3, r7
	blt	.L805BF8C	@cond_branch
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805BF8C	@cond_branch
	mov	r1, #0x3
.L805BF8C:
	cmp	r4, ip
	bge	.L805BF9E	@cond_branch
	cmp	r5, r8
	blt	.L805BF9E	@cond_branch
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805BF9E	@cond_branch
	mov	r1, #0x3
.L805BF9E:
	cmp	r2, r6
	bge	.L805BFB0	@cond_branch
	cmp	r3, r7
	blt	.L805BFB0	@cond_branch
	cmp	r4, ip
	bge	.L805BFB0	@cond_branch
	cmp	r5, r8
	blt	.L805BFB0	@cond_branch
	mov	r1, #0x3
.L805BFB0:
	cmp	r1, #0x3
	beq	.L805BFB8	@cond_branch
	mov	r0, #0x0
	b	.L805BFBA
.L805BFB8:
	mov	r0, #0x1
.L805BFBA:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805BF18

.align 2, 0 @ Don't pad with nop.
