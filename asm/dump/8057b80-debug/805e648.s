	.include "asm/common.inc"

	thumb_func_start sub_805E648
sub_805E648:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	add	r5, r0, #0
	ldr	r0, [sp, #0x34]
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	str	r2, [sp]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r9, r3
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x4]
	ldr	r0, [r5, #0x4]
	str	r0, [sp, #0x8]
	ldr	r2, [r1]
	lsl	r2, r2, #0x4
	add	r2, r0, r2
	ldr	r0, [r1, #0x4]
	lsl	r0, r0, #0x4
	ldr	r1, [sp, #0x8]
	add	r0, r1, r0
	ldr	r3, [r2]
	mov	r8, r3
	ldr	r1, [r0]
	mov	ip, r1
	ldr	r7, [r2, #0x4]
	ldr	r6, [r0, #0x4]
	ldr	r4, [r5, #0xc]
	cmp	r8, ip
	ble	.L1	@cond_branch
	mov	r0, r8
	mov	r8, ip
	mov	ip, r0
.L1:
	cmp	r7, r6
	ble	.L2	@cond_branch
	add	r0, r7, #0
	add	r7, r6, #0
	add	r6, r0, #0
.L2:
	mov	r2, #0x0
	mov	sl, r2
	ldr	r0, [r5]
	ldr	r0, [r0, #0x8]
	cmp	sl, r0
	bge	.L3	@cond_branch
	mov	r3, r9
	mov	r5, #0xc
	and	r3, r3, r5
	str	r3, [sp, #0x10]
	str	r0, [sp, #0xc]
.L21:
	ldrb	r0, [r4, #0xf]
	ldr	r1, [sp]
	cmp	r0, r1
	bne	.L19	@cond_branch
	ldrb	r2, [r4, #0x11]
	lsl	r0, r2, #0x1e
	lsr	r0, r0, #0x1f
	ldr	r3, [sp, #0x4]
	cmp	r3, r0
	bne	.L19	@cond_branch
	mov	r2, #0x0
	ldr	r0, [r4]
	lsl	r0, r0, #0x4
	ldr	r5, [sp, #0x8]
	add	r1, r5, r0
	ldr	r0, [r4, #0x4]
	lsl	r0, r0, #0x4
	add	r3, r5, r0
	ldr	r0, [r1, #0x4]
	cmp	r0, r7
	beq	.L6	@cond_branch
	ldr	r0, [r3, #0x4]
	cmp	r0, r7
	bne	.L7	@cond_branch
.L6:
	mov	r2, #0x1
.L7:
	ldr	r0, [r1, #0x4]
	cmp	r0, r6
	beq	.L8	@cond_branch
	ldr	r0, [r3, #0x4]
	cmp	r0, r6
	bne	.L9	@cond_branch
.L8:
	mov	r0, #0x2
	orr	r2, r2, r0
.L9:
	ldr	r1, [r1]
	cmp	r1, r8
	beq	.L10	@cond_branch
	ldr	r0, [r3]
	cmp	r0, r8
	bne	.L11	@cond_branch
.L10:
	mov	r0, #0x4
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
	lsr	r2, r0, #0x10
.L11:
	cmp	r1, ip
	beq	.L12	@cond_branch
	ldr	r0, [r3]
	cmp	r0, ip
	bne	.L13	@cond_branch
.L12:
	mov	r0, #0x8
	orr	r2, r2, r0
	lsl	r0, r2, #0x10
	lsr	r2, r0, #0x10
.L13:
	mov	r3, #0x3
	mov	r1, r9
	and	r1, r1, r3
	cmp	r1, #0
	beq	.L14	@cond_branch
	add	r0, r2, #0
	mov	r5, #0xc
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L19	@cond_branch
	and	r2, r2, r3
	mov	r0, r9
	and	r2, r2, r0
	cmp	r2, r1
	bne	.L19	@cond_branch
	add	r0, r4, #0
	b	.L20
.L14:
	add	r0, r2, #0
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L19	@cond_branch
	mov	r1, #0xc
	and	r2, r2, r1
	mov	r3, r9
	and	r2, r2, r3
	ldr	r5, [sp, #0x10]
	cmp	r2, r5
	bne	.L19	@cond_branch
	add	r0, r4, #0
	b	.L20
.L19:
	add	r4, r4, #0x20
	mov	r0, sl
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	sl, r0
	ldr	r0, [sp, #0xc]
	cmp	sl, r0
	blt	.L21	@cond_branch
.L3:
	mov	r0, #0x0
.L20:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E648

.align 2, 0 @ Don't pad with nop.
