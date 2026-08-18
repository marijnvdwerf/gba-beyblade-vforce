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
	ble	.L805E348	@cond_branch
	mov	r3, r9
	add	r5, r1, #0
	b	.L805E34C
.L805E348:
	ldr	r3, [sp, #0x3c]
	mov	r5, r9
.L805E34C:
	ldr	r2, [sp, #0x40]
	cmp	r2, sl
	ble	.L805E358	@cond_branch
	mov	r6, sl
	add	r7, r2, #0
	b	.L805E35C
.L805E358:
	ldr	r6, [sp, #0x40]
	mov	r7, sl
.L805E35C:
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
	bge	.L805E384	@cond_branch
	mov	r4, #0x1
	b	.L805E38A
.L805E384:
	cmp	r0, r5
	ble	.L805E38A	@cond_branch
	mov	r4, #0x2
.L805E38A:
	mov	r2, ip
	ldr	r0, [r2, #0x4]
	cmp	r0, r6
	bge	.L805E398	@cond_branch
	mov	r0, #0x4
	orr	r4, r4, r0
	b	.L805E3A4
.L805E398:
	cmp	r0, r7
	ble	.L805E3A4	@cond_branch
	mov	r0, #0x8
	orr	r4, r4, r0
	lsl	r0, r4, #0x18
	lsr	r4, r0, #0x18
.L805E3A4:
	mov	r2, #0x0
	mov	r1, r8
	ldr	r0, [r1]
	cmp	r0, r3
	bge	.L805E3B2	@cond_branch
	mov	r2, #0x1
	b	.L805E3B8
.L805E3B2:
	cmp	r0, r5
	ble	.L805E3B8	@cond_branch
	mov	r2, #0x2
.L805E3B8:
	mov	r1, r8
	ldr	r0, [r1, #0x4]
	cmp	r0, r6
	bge	.L805E3C6	@cond_branch
	mov	r0, #0x4
	orr	r2, r2, r0
	b	.L805E3D2
.L805E3C6:
	cmp	r0, r7
	ble	.L805E3D2	@cond_branch
	mov	r0, #0x8
	orr	r2, r2, r0
	lsl	r0, r2, #0x18
	lsr	r2, r0, #0x18
.L805E3D2:
	mov	r5, #0x0
	mov	r1, #0x3
	add	r3, r4, #0
	and	r3, r3, r1
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r3, r0
	bne	.L805E3E6	@cond_branch
	cmp	r3, #0
	bne	.L805E3E8	@cond_branch
.L805E3E6:
	mov	r5, #0x1
.L805E3E8:
	mov	r0, #0xc
	add	r1, r0, #0
	and	r1, r1, r4
	and	r2, r2, r0
	cmp	r1, r2
	bne	.L805E3F8	@cond_branch
	cmp	r1, #0
	bne	.L805E3FC	@cond_branch
.L805E3F8:
	mov	r0, #0x2
	orr	r5, r5, r0
.L805E3FC:
	cmp	r5, #0x3
	bne	.L805E460	@cond_branch
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
	beq	.L805E42C	@cond_branch
	mov	r0, #0x1
	str	r0, [sp, #0x18]
.L805E42C:
	ldr	r1, [sp, #0x18]
	cmp	r1, #0
	beq	.L805E460	@cond_branch
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
	bne	.L805E458	@cond_branch
	mov	r0, #0x0
	b	.L805E462
.L805E458:
	ldr	r0, [sp, #0x48]
	ldr	r1, [sp, #0x14]
	str	r0, [r1, #0x10]
	strb	r4, [r1, #0x14]
.L805E460:
	ldr	r0, [sp, #0x18]
.L805E462:
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
