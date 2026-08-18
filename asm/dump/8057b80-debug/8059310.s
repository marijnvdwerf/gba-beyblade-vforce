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
	beq	.L8059350	@cond_branch
	ldr	r1, .L805934C
	mov	r9, r1
	b	.L8059356
.L805934C:
	.align	2, 0

	.4byte	sub_80594FC + 1
.L8059350:
	ldr	r0, .L80593D8
	ldr	r0, [r0]
	mov	r9, r0
.L8059356:
	ldr	r0, [sp, #0x40]
	add	r5, r4, r0
	ldr	r1, [r6]
	cmp	r5, r1
	ble	.L8059376	@cond_branch
	mov	r2, #0x0
	cmp	r4, r1
	bge	.L8059368	@cond_branch
	sub	r2, r1, r4
.L8059368:
	ldr	r0, [sp, #0x40]
	sub	r0, r0, r2
	mov	r8, r0
	add	r0, r4, r2
	sub	r0, r0, r1
	str	r0, [sp, #0x14]
	add	r7, r7, r2
.L8059376:
	cmp	r4, #0
	bge	.L8059390	@cond_branch
	add	r2, r5, #0
	cmp	r2, #0
	bge	.L8059382	@cond_branch
	mov	r2, #0x0
.L8059382:
	ldr	r0, [sp, #0x40]
	sub	r0, r0, r2
	mov	r8, r0
	add	r4, r4, r1
	str	r4, [sp, #0x14]
	mov	r4, #0x0
	ADD r3, r8
.L8059390:
	cmp	r2, #0
	ble	.L80593A8	@cond_branch
	mov	r1, ip
	str	r1, [sp]
	str	r2, [sp, #0x4]
	mov	r0, sl
	str	r0, [sp, #0x8]
	add	r0, r6, #0
	add	r1, r4, #0
	ldr	r2, [sp, #0xc]
	bl	_call_via_r9
.L80593A8:
	mov	r1, r8
	cmp	r1, #0
	ble	.L80593F0	@cond_branch
	add	r1, r6, #0
	add	r1, r1, #0x7c
	mov	r0, #0x8
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80593DC	@cond_branch
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
	b	.L80593F0
.L80593D6:
	.align	2, 0
.L80593D8:
	.4byte	0x807d944
.L80593DC:
	ldr	r0, .L8059400
	ldr	r1, [sp, #0x10]
	str	r1, [sp]
	ldr	r4, [r0]
	add	r0, r6, #0
	add	r1, r7, #0
	ldr	r2, [sp, #0x18]
	mov	r3, r8
	bl	_call_via_r4
.L80593F0:
	add	sp, sp, #0x1c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8059400:
	.align	2, 0

	.4byte	0x807d948
	thumb_func_end sub_8059310

.align 2, 0 @ Don't pad with nop.
