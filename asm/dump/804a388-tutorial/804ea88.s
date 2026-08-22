	.include "asm/common.inc"

	thumb_func_start sub_804EA88
sub_804EA88:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	mov	r2, #0x4
	ldsh	r1, [r0, r2]
	mov	ip, r1
	ldr	r3, [r0, #0x8]
	ldr	r4, [r0, #0xc]
	mov	r8, r4
	ldr	r5, [r0, #0x10]
	str	r5, [sp]
	ldr	r1, [r0, #0x14]
	str	r1, [sp, #0x4]
	ldr	r2, [r0, #0x18]
	mov	sl, r2
	ldr	r1, [r0, #0x24]
	sub	r1, r1, r5
	str	r1, [sp, #0x8]
	ldr	r1, [r0, #0x28]
	ldr	r4, [sp, #0x4]
	sub	r1, r1, r4
	str	r1, [sp, #0xc]
	ldr	r0, [r0, #0x2c]
	mov	r5, sl
	sub	r5, r0, r5
	str	r5, [sp, #0x10]
	b	.L804EBC6
.L804EAC4:
	mov	r2, #0x1a
	ldsh	r0, [r3, r2]
	ldrh	r4, [r3, #0x1a]
	mov	r9, r4
	cmp	r0, #0
	beq	.L804EBC4	@cond_branch
	ldr	r0, [r3, #0x4]
	ldr	r5, [sp, #0x8]
	add	r1, r0, r5
	str	r1, [r3, #0x4]
	ldr	r0, [r3, #0x8]
	ldr	r2, [sp, #0xc]
	add	r4, r0, r2
	str	r4, [r3, #0x8]
	ldr	r0, [r3, #0xc]
	ldr	r2, [sp, #0x10]
	add	r5, r0, r2
	str	r5, [r3, #0xc]
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L804EBC4	@cond_branch
	mov	r0, #0x10
	ldsh	r2, [r3, r0]
	add	r2, r1, r2
	str	r2, [r3, #0x4]
	mov	r0, #0x12
	ldsh	r1, [r3, r0]
	add	r1, r4, r1
	str	r1, [r3, #0x8]
	mov	r4, #0x14
	ldsh	r0, [r3, r4]
	add	r0, r5, r0
	str	r0, [r3, #0xc]
	ldr	r5, [sp]
	add	r2, r2, r5
	ldr	r5, [sp, #0x4]
	add	r4, r1, r5
	mov	r1, sl
	add	r7, r0, r1
	mov	r5, r8
	cmp	r5, #0
	beq	.L804EB32	@cond_branch
	sub	r1, r2, r4
	mov	r5, #0x16
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	add	r5, r1, r0
	add	r1, r2, r4
	asr	r1, r1, #0x1
	sub	r1, r1, r7
	mov	r2, #0x18
	ldsh	r0, [r3, r2]
	lsl	r0, r0, #0x8
	add	r2, r1, r0
	b	.L804EB42
.L804EB32:
	mov	r5, #0x16
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	add	r5, r2, r0
	mov	r1, #0x18
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x8
	add	r2, r4, r0
.L804EB42:
	mov	r4, r8
	cmp	r4, #0
	beq	.L804EB56	@cond_branch
	ldr	r0, [r4, #0x40]
	ldr	r1, .L804EB80
	and	r0, r0, r1
	sub	r5, r5, r0
	ldr	r0, [r4, #0x44]
	and	r0, r0, r1
	sub	r2, r2, r0
.L804EB56:
	mov	r4, r9
	sub	r4, r4, #0x1
	strh	r4, [r3, #0x1a]
	ldr	r0, .L804EB80 + 4
	add	r1, r5, r0
	ldr	r0, .L804EB80 + 8
	cmp	r1, r0
	bhi	.L804EB94	@cond_branch
	ldr	r1, .L804EB80 + 12
	cmp	r2, r1
	ble	.L804EB94	@cond_branch
	ldr	r0, .L804EB80 + 16
	cmp	r2, r0
	bgt	.L804EB94	@cond_branch
	lsl	r0, r4, #0x10
	cmp	r0, #0
	beq	.L804EB94	@cond_branch
	add	r0, r5, r1
	str	r0, [r6, #0x8]
	add	r0, r2, r1
	b	.L804EB98
.L804EB80:
	.align	2, 0

	.4byte	0xffffff00
	.4byte	0x3ff
	.4byte	0xf7fe
	.4byte	0xfffffc00
	.4byte	0xa3ff
.L804EB94:
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
.L804EB98:
	str	r0, [r6, #0xc]
	ldrh	r0, [r3, #0x20]
	cmp	r0, #0x10
	bls	.L804EBA6	@cond_branch
	sub	r0, r0, #0x10
	strh	r0, [r3, #0x20]
	b	.L804EBC4
.L804EBA6:
	ldr	r1, .L804EBE4
	add	r0, r0, r1
	ldrh	r2, [r3, #0x22]
	add	r0, r2, r0
	strh	r0, [r3, #0x20]
	ldrh	r0, [r6, #0x18]
	add	r0, r0, #0x1
	strh	r0, [r6, #0x18]
	ldrh	r1, [r3, #0x1c]
	ldrh	r4, [r3, #0x1e]
	add	r0, r4, r1
	ldrh	r5, [r6, #0x18]
	cmp	r5, r0
	blt	.L804EBC4	@cond_branch
	strh	r1, [r6, #0x18]
.L804EBC4:
	add	r3, r3, #0x24
.L804EBC6:
	mov	r0, ip
	mov	r1, #0x1
	neg	r1, r1
	add ip, r1
	cmp	r0, #0
	beq	.L804EBD4	@cond_branch
	b	.L804EAC4
.L804EBD4:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804EBE4:
	.align	2, 0

	.4byte	0xfff0
	thumb_func_end sub_804EA88

.align 2, 0 @ Don't pad with nop.
