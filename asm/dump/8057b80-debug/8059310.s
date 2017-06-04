	.include "asm/common.inc"

	thumb_func_start sub_8059310
sub_8059310:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe4
	add	r6, r0, #0
	add	r4, r1, #0
	str	r2, [sp, #0xc]
	ldr	r2, [sp, #0x40]
	ldr	r0, [sp, #0x44]
	mov	sl, r0
	mov	r1, #0x0
	mov	r8, r1
	str	r0, [sp, #0x10]
	ldr	r1, [sp, #0x3c]
	mov	ip, r1
	add	r7, r3, #0
	mov	r0, ip
	str	r0, [sp, #0x18]
	add	r1, r6, #0
	add	r1, r1, #0x64
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r1, .L3
	mov	r9, r1
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	sub_80594FC + 1
.L1:
	ldr	r0, .L13
	ldr	r0, [r0]
	mov	r9, r0
.L2:
	ldr	r0, [sp, #0x40]
	add	r5, r4, r0
	ldr	r1, [r6]
	cmp	r5, r1
	ble	.L5	@cond_branch
	mov	r2, #0x0
	cmp	r4, r1
	bge	.L6	@cond_branch
	sub	r2, r1, r4
.L6:
	ldr	r0, [sp, #0x40]
	sub	r0, r0, r2
	mov	r8, r0
	add	r0, r4, r2
	sub	r0, r0, r1
	str	r0, [sp, #0x14]
	add	r7, r7, r2
.L5:
	cmp	r4, #0
	bge	.L7	@cond_branch
	add	r2, r5, #0
	cmp	r2, #0
	bge	.L8	@cond_branch
	mov	r2, #0x0
.L8:
	ldr	r0, [sp, #0x40]
	sub	r0, r0, r2
	mov	r8, r0
	add	r4, r4, r1
	str	r4, [sp, #0x14]
	mov	r4, #0x0
	ADD r3, r8
.L7:
	cmp	r2, #0
	ble	.L9	@cond_branch
	mov	r1, ip
	str	r1, [sp]
	str	r2, [sp, #0x4]
	mov	r0, sl
	str	r0, [sp, #0x8]
	add	r0, r6, #0
	add	r1, r4, #0
	ldr	r2, [sp, #0xc]
	bl	_call_via_r9
.L9:
	mov	r1, r8
	cmp	r1, #0
	ble	.L12	@cond_branch
	add	r1, r6, #0
	add	r1, r1, #0x7c
	mov	r0, #0x8
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r0, [sp, #0x18]
	str	r0, [sp]
	mov	r1, r8
	str	r1, [sp, #0x4]
	ldr	r0, [sp, #0x10]
	str	r0, [sp, #0x8]
	add	r0, r6, #0
	ldr	r1, [sp, #0x14]
	ldr	r2, [sp, #0xc]
	add	r3, r7, #0
	bl	_call_via_r9
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x807d944
.L11:
	ldr	r0, .L15
	ldr	r1, [sp, #0x10]
	str	r1, [sp]
	ldr	r4, [r0]
	add	r0, r6, #0
	add	r1, r7, #0
	ldr	r2, [sp, #0x18]
	mov	r3, r8
	bl	_call_via_r4
.L12:
	add	sp, sp, #0x1c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L16:
	.align	2, 0
.L15:
	.4byte	0x807d948
	thumb_func_end sub_8059310

.align 2, 0 @ Don't pad with nop.
