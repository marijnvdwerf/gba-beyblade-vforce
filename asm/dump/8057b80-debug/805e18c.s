	.include "asm/common.inc"

	thumb_func_start sub_805E18C
sub_805E18C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd0
	str	r0, [sp, #0x10]
	str	r2, [sp, #0x14]
	mov	sl, r3
	mov	r0, #0x0
	str	r0, [sp, #0x2c]
	lsl	r1, r1, #0x2
	ldr	r0, [sp, #0x10]
	add	r0, r0, #0x14
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r9, r0
	cmp	r0, #0
	bne	.L1	@cond_branch
.L28:
	mov	r0, #0x0
	b	.L2
.L1:
	mov	r1, r9
	add	r1, r1, #0x20
	str	r1, [sp, #0x18]
	ldr	r2, [sp, #0x54]
	cmp	r2, sl
	ble	.L3	@cond_branch
	mov	r0, sl
	str	r0, [sp, #0x1c]
	b	.L4
.L3:
	ldr	r1, [sp, #0x54]
	str	r1, [sp, #0x1c]
	mov	r2, sl
.L4:
	str	r2, [sp, #0x20]
	ldr	r0, [sp, #0x58]
	ldr	r1, [sp, #0x50]
	cmp	r0, r1
	ble	.L5	@cond_branch
	str	r1, [sp, #0x24]
	b	.L6
.L5:
	ldr	r2, [sp, #0x58]
	str	r2, [sp, #0x24]
	ldr	r0, [sp, #0x50]
.L6:
	str	r0, [sp, #0x28]
	ldr	r1, [sp, #0x18]
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	ldr	r2, [sp, #0x10]
	ldr	r1, [r2, #0x4]
	add	r7, r1, r0
	mov	r5, #0x0
	ldr	r0, [r7]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bge	.L7	@cond_branch
	mov	r5, #0x1
	b	.L9
.L7:
	ldr	r2, [sp, #0x20]
	cmp	r0, r2
	ble	.L9	@cond_branch
	mov	r5, #0x2
.L9:
	ldr	r0, [r7, #0x4]
	ldr	r1, [sp, #0x24]
	cmp	r0, r1
	bge	.L10	@cond_branch
	mov	r0, #0x4
	b	.L11
.L10:
	ldr	r2, [sp, #0x28]
	cmp	r0, r2
	ble	.L12	@cond_branch
	mov	r0, #0x8
.L11:
	orr	r5, r5, r0
	lsl	r0, r5, #0x18
	lsr	r5, r0, #0x18
.L12:
	mov	r0, #0x1
	mov	r8, r0
	mov	r1, r9
	ldr	r0, [r1]
	cmp	r8, r0
	bge	.L29	@cond_branch
.L30:
	mov	r2, r8
	lsl	r0, r2, #0x2
	ldr	r1, [sp, #0x18]
	add	r0, r0, r1
	ldr	r0, [r0]
	lsl	r0, r0, #0x4
	ldr	r2, [sp, #0x10]
	ldr	r1, [r2, #0x4]
	add	r6, r1, r0
	mov	r4, #0x0
	ldr	r0, [r6]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bge	.L14	@cond_branch
	mov	r4, #0x1
	b	.L16
.L14:
	ldr	r2, [sp, #0x20]
	cmp	r0, r2
	ble	.L16	@cond_branch
	mov	r4, #0x2
.L16:
	ldr	r0, [r6, #0x4]
	ldr	r1, [sp, #0x24]
	cmp	r0, r1
	bge	.L17	@cond_branch
	mov	r0, #0x4
	orr	r4, r4, r0
	b	.L19
.L17:
	ldr	r2, [sp, #0x28]
	cmp	r0, r2
	ble	.L19	@cond_branch
	mov	r0, #0x8
	orr	r4, r4, r0
	lsl	r0, r4, #0x18
	lsr	r4, r0, #0x18
.L19:
	mov	r3, #0x0
	mov	r1, #0x3
	add	r2, r5, #0
	and	r2, r2, r1
	add	r0, r4, #0
	and	r0, r0, r1
	cmp	r2, r0
	bne	.L20	@cond_branch
	cmp	r2, #0
	bne	.L21	@cond_branch
.L20:
	mov	r3, #0x1
.L21:
	mov	r1, #0xc
	add	r2, r1, #0
	and	r2, r2, r5
	add	r0, r4, #0
	and	r0, r0, r1
	cmp	r2, r0
	bne	.L22	@cond_branch
	cmp	r2, #0
	bne	.L23	@cond_branch
.L22:
	mov	r0, #0x2
	orr	r3, r3, r0
.L23:
	cmp	r3, #0x3
	bne	.L26	@cond_branch
	ldr	r0, [r7]
	str	r0, [sp]
	ldr	r0, [r7, #0x4]
	str	r0, [sp, #0x4]
	ldr	r0, [r6]
	str	r0, [sp, #0x8]
	ldr	r0, [r6, #0x4]
	str	r0, [sp, #0xc]
	mov	r0, sl
	ldr	r1, [sp, #0x50]
	ldr	r2, [sp, #0x54]
	ldr	r3, [sp, #0x58]
	bl	sub_805E474
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0
	beq	.L25	@cond_branch
	mov	r0, #0x1
	str	r0, [sp, #0x2c]
.L25:
	ldr	r1, [sp, #0x2c]
	cmp	r1, #0x1
	bne	.L26	@cond_branch
	mov	r4, r8
	sub	r4, r4, #0x1
	mov	r2, sl
	str	r2, [sp]
	ldr	r0, [sp, #0x50]
	str	r0, [sp, #0x4]
	ldr	r1, [sp, #0x54]
	str	r1, [sp, #0x8]
	ldr	r2, [sp, #0x58]
	str	r2, [sp, #0xc]
	ldr	r0, [sp, #0x10]
	mov	r1, r9
	ldr	r2, [sp, #0x14]
	add	r3, r4, #0
	bl	sub_805E0D8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L27	@cond_branch
	b	.L28
.L27:
	ldr	r0, [sp, #0x14]
	str	r4, [r0, #0x10]
	strb	r5, [r0, #0x14]
	b	.L29
.L26:
	add	r7, r6, #0
	add	r5, r4, #0
	mov	r1, #0x1
	ADD r8, r1
	mov	r2, r9
	ldr	r0, [r2]
	cmp	r8, r0
	blt	.L30	@cond_branch
.L29:
	ldr	r0, [sp, #0x2c]
.L2:
	add	sp, sp, #0x30
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E18C

.align 2, 0 @ Don't pad with nop.
