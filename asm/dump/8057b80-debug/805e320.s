	.include "asm/common.inc"

	thumb_func_start sub_805E320
sub_805E320:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe4
	str	r0, [sp, #0x10]
	str	r1, [sp, #0x14]
	mov	r9, r2
	mov	sl, r3
	mov	r0, #0x0
	str	r0, [sp, #0x18]
	ldr	r0, [sp, #0x44]
	add	r0, r0, #0x20
	ldr	r1, [sp, #0x3c]
	cmp	r1, r9
	ble	.L1	@cond_branch
	mov	r3, r9
	add	r5, r1, #0
	b	.L2
.L1:
	ldr	r3, [sp, #0x3c]
	mov	r5, r9
.L2:
	ldr	r2, [sp, #0x40]
	cmp	r2, sl
	ble	.L3	@cond_branch
	mov	r6, sl
	add	r7, r2, #0
	b	.L4
.L3:
	ldr	r6, [sp, #0x40]
	mov	r7, sl
.L4:
	ldr	r4, [sp, #0x48]
	lsl	r1, r4, #0x2
	add	r1, r1, r0
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	ldr	r4, [sp, #0x10]
	ldr	r2, [r4, #0x4]
	add	r0, r0, r2
	mov	ip, r0
	ldr	r0, [r1, #0x4]
	lsl	r0, r0, #0x4
	add	r2, r2, r0
	mov	r8, r2
	mov	r4, #0x0
	mov	r1, ip
	ldr	r0, [r1]
	cmp	r0, r3
	bge	.L5	@cond_branch
	mov	r4, #0x1
	b	.L7
.L5:
	cmp	r0, r5
	ble	.L7	@cond_branch
	mov	r4, #0x2
.L7:
	mov	r2, ip
	ldr	r0, [r2, #0x4]
	cmp	r0, r6
	bge	.L8	@cond_branch
	mov	r0, #0x4
	orr	r4, r4, r0
	b	.L10
.L8:
	cmp	r0, r7
	ble	.L10	@cond_branch
	mov	r0, #0x8
	orr	r4, r4, r0
	lsl	r0, r4, #0x18
	lsr	r4, r0, #0x18
.L10:
	mov	r2, #0x0
	mov	r1, r8
	ldr	r0, [r1]
	cmp	r0, r3
	bge	.L11	@cond_branch
	mov	r2, #0x1
	b	.L13
.L11:
	cmp	r0, r5
	ble	.L13	@cond_branch
	mov	r2, #0x2
.L13:
	mov	r1, r8
	ldr	r0, [r1, #0x4]
	cmp	r0, r6
	bge	.L14	@cond_branch
	mov	r0, #0x4
	orr	r2, r2, r0
	b	.L16
.L14:
	cmp	r0, r7
	ble	.L16	@cond_branch
	mov	r0, #0x8
	orr	r2, r2, r0
	lsl	r0, r2, #0x18
	lsr	r2, r0, #0x18
.L16:
	mov	r5, #0x0
	mov	r1, #0x3
	add	r3, r4, #0
	and	r3, r3, r1
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r3, r0
	bne	.L17	@cond_branch
	cmp	r3, #0
	bne	.L18	@cond_branch
.L17:
	mov	r5, #0x1
.L18:
	mov	r0, #0xc
	add	r1, r0, #0
	and	r1, r1, r4
	and	r2, r2, r0
	cmp	r1, r2
	bne	.L19	@cond_branch
	cmp	r1, #0
	bne	.L20	@cond_branch
.L19:
	mov	r0, #0x2
	orr	r5, r5, r0
.L20:
	cmp	r5, #0x3
	bne	.L23	@cond_branch
	mov	r2, ip
	ldr	r0, [r2]
	str	r0, [sp]
	ldr	r0, [r2, #0x4]
	str	r0, [sp, #0x4]
	mov	r4, r8
	ldr	r0, [r4]
	str	r0, [sp, #0x8]
	ldr	r0, [r4, #0x4]
	str	r0, [sp, #0xc]
	mov	r0, r9
	mov	r1, sl
	ldr	r2, [sp, #0x3c]
	ldr	r3, [sp, #0x40]
	bl	sub_805E474
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0
	beq	.L22	@cond_branch
	mov	r0, #0x1
	str	r0, [sp, #0x18]
.L22:
	ldr	r1, [sp, #0x18]
	cmp	r1, #0
	beq	.L23	@cond_branch
	mov	r2, r9
	str	r2, [sp]
	mov	r0, sl
	str	r0, [sp, #0x4]
	ldr	r1, [sp, #0x3c]
	str	r1, [sp, #0x8]
	ldr	r2, [sp, #0x40]
	str	r2, [sp, #0xc]
	ldr	r0, [sp, #0x10]
	ldr	r1, [sp, #0x44]
	ldr	r2, [sp, #0x14]
	ldr	r3, [sp, #0x48]
	bl	sub_805E0D8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L24	@cond_branch
	mov	r0, #0x0
	b	.L25
.L24:
	ldr	r0, [sp, #0x48]
	ldr	r1, [sp, #0x14]
	str	r0, [r1, #0x10]
	strb	r4, [r1, #0x14]
.L23:
	ldr	r0, [sp, #0x18]
.L25:
	add	sp, sp, #0x1c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E320

.align 2, 0 @ Don't pad with nop.
