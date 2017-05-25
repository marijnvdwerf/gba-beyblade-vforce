	.include "asm/common.inc"

	thumb_func_start sub_804B8F0
sub_804B8F0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffdc
	add	r7, sp, #0x8
	add	r6, r0, #0
	str	r1, [r7]
	mov	r1, sp
	add	r0, r1, #0
	str	r0, [r7, #0xc]
	mov	sl, r6
	mov	r2, #0x8e
	lsl	r2, r2, #0x2
	add	r2, r2, r6
	mov	r8, r2
	ldr	r0, .L14
	ldr	r0, [r0]
	ldr	r3, .L14 + 4
	add	r3, r0, r3
	str	r3, [r7, #0x4]
	mov	r0, #0xf3
	lsl	r0, r0, #0x2
	add	r1, r6, r0
	mov	r0, #0x4
	ldrh	r1, [r1]
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0
	beq	.L1	@cond_branch
	b	.L27
.L1:
	ldr	r2, .L14 + 8
	add	r0, r6, r2
	strb	r1, [r0]
	ldr	r3, .L14 + 12
	add	r0, r6, r3
	strb	r1, [r0]
	mov	r0, #0xda
	lsl	r0, r0, #0x1
	add	r1, r6, r0
	ldr	r0, .L14 + 16
	str	r0, [r1]
	add	r0, r6, #0
	bl	sub_804D104
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	add	r0, r6, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L4	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	add	r0, r6, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L4	@cond_branch
	add	r0, r6, #0
	mov	r1, r8
	bl	sub_804CB08
.L4:
	mov	r1, #0x8e
	lsl	r1, r1, #0x2
	add	r1, r1, r6
	mov	r9, r1
	add	r0, r6, #0
	bl	sub_804D110
	mov	r2, r8
	ldr	r1, [r2, #0x4]
	asr	r5, r1, #0x5
	ldr	r2, [r2, #0x8]
	asr	r4, r2, #0x5
	mov	r3, r8
	ldr	r0, [r3, #0x40]
	add	r1, r1, r0
	asr	r1, r1, #0x5
	ldr	r0, [r3, #0x44]
	add	r2, r2, r0
	asr	r2, r2, #0x5
	ldr	r0, [r7, #0x4]
	bl	GetQuadTreeNodeForPos
	str	r0, [r7, #0x14]
	ldr	r0, [r7, #0x4]
	add	r1, r5, #0
	add	r2, r4, #0
	bl	GetQuadTreeNodeForPos
	add	r4, r0, #0
	mov	r1, #0xaf
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	ldr	r1, [r0]
	mov	r0, #0x1
	NEG	r0, r0
	mov	r2, r8
	add	r2, r2, #0x84
	str	r2, [r7, #0x10]
	cmp	r1, r0
	bne	.L5	@cond_branch
	ldr	r0, .L14 + 20
	ldrh	r0, [r0]
	ldr	r3, [r7, #0x14]
	cmp	r3, #0
	beq	.L8	@cond_branch
	str	r3, [sp]
	mov	r0, r9
	ldr	r1, [r7]
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_805C9A4
	mov	r1, #0x8e
	lsl	r1, r1, #0x1
	add	r5, r6, r1
	strh	r0, [r5]
	cmp	r4, #0
	beq	.L8	@cond_branch
	ldr	r2, [r7, #0x14]
	cmp	r4, r2
	beq	.L8	@cond_branch
	str	r4, [sp]
	mov	r0, r9
	ldr	r1, [r7]
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_805C9A4
	strh	r0, [r5]
.L8:
	ldr	r0, [r7, #0x4]
	add	r0, r0, #0x48
	ldrh	r1, [r0]
	add	r3, r0, #0
	mov	r0, r8
	add	r0, r0, #0x84
	str	r0, [r7, #0x10]
	cmp	r1, #0
	beq	.L9	@cond_branch
	mov	r2, sp
	add	r1, r2, #0
	str	r1, [r7, #0x8]
	ldrh	r1, [r3]
	lsl	r0, r1, #0x2
	sub	r2, r2, r0
	mov	sp, r2
	add	r0, sp, #0x8
	mov	r9, r0
	mov	r5, #0x0
	cmp	r5, r1
	bge	.L10	@cond_branch
	mov	r4, r9
.L16:
	ldr	r1, [r7, #0x4]
	ldr	r0, [r1, #0x4c]
	lsl	r1, r5, #0x2
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r3, [r7, #0x18]
	bl	GetStruct4
	add	r1, r0, #0
	ldr	r3, [r7, #0x18]
	cmp	r1, #0
	beq	.L11	@cond_branch
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L12	@cond_branch
.L11:
	mov	r0, #0x0
	b	.L13
.L15:
	.align	2, 0
.L14:
	.4byte	0x3000fb0
	.4byte	0x7a4
	.4byte	0x273
	.4byte	0x337
	.4byte	0xfffc0000
	.4byte	0x4000006
.L12:
	add	r0, r1, #0
	add	r0, r0, #0x40
.L13:
	str	r0, [r4]
	add	r4, r4, #0x4
	add	r5, r5, #0x1
	ldrh	r2, [r3]
	cmp	r5, r2
	blt	.L16	@cond_branch
.L10:
	mov	r1, #0x8e
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	ldr	r1, [r7, #0x4]
	ldr	r2, [r1, #0x4c]
	ldrh	r3, [r3]
	mov	r1, r9
	str	r1, [sp]
	ldr	r1, [r7]
	bl	sub_805CEB8
	mov	r2, #0x8e
	lsl	r2, r2, #0x1
	add	r1, r6, r2
	ldrh	r3, [r1]
	add	r0, r0, r3
	strh	r0, [r1]
	ldr	r0, [r7, #0x8]
	mov	sp, r0
.L9:
	mov	r0, r8
	ldr	r1, [r7]
	bl	sub_80561A0
	ldr	r0, .L19
	ldrh	r0, [r0]
.L5:
	mov	r0, r8
	mov	r1, sl
	bl	nullsub_6
	mov	r0, sl
	bl	nullsub_5
	mov	r2, r8
	ldr	r1, [r2, #0x4]
	ldr	r2, [r2, #0x8]
	mov	r0, r8
	ldr	r3, [r0, #0xc]
	mov	r0, #0xd4
	lsl	r0, r0, #0x1
	ADD r0, sl
	str	r1, [r0]
	mov	r0, #0xd6
	lsl	r0, r0, #0x1
	ADD r0, sl
	str	r2, [r0]
	mov	r0, #0xd8
	lsl	r0, r0, #0x1
	ADD r0, sl
	str	r3, [r0]
	mov	r0, r8
	bl	sub_80584B8
	mov	r2, #0xc0
	lsl	r2, r2, #0x2
	add	r1, r6, r2
	mov	r3, #0x8f
	lsl	r3, r3, #0x2
	add	r0, r6, r3
	ldr	r0, [r0]
	str	r0, [r1]
	mov	r0, #0xc1
	lsl	r0, r0, #0x2
	add	r1, r6, r0
	sub	r2, r2, #0xc0
	add	r0, r6, r2
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r3, [r7, #0x10]
	ldr	r1, [r3]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L17	@cond_branch
	mov	r1, #0xc2
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	mov	r1, #0xda
	lsl	r1, r1, #0x1
	ADD r1, sl
	ldr	r1, [r1]
	str	r1, [r0]
	b	.L18
.L20:
	.align	2, 0
.L19:
	.4byte	0x4000006
.L17:
	mov	r2, #0xc2
	lsl	r2, r2, #0x2
	add	r1, r6, r2
	ldr	r0, .L28
	str	r0, [r1]
.L18:
	mov	r3, #0xbf
	lsl	r3, r3, #0x2
	add	r0, r6, r3
	bl	sub_80584B8
	mov	r0, sl
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L27	@cond_branch
	mov	r0, sl
	add	r0, r0, #0x62
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	mov	r0, #0x80
	sub	r0, r0, r1
	mov	r3, #0xfa
	lsl	r3, r3, #0x2
	add	r0, r6, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L27	@cond_branch
	mov	r1, #0x82
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	ldr	r1, [r0]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r1, r0
	ble	.L27	@cond_branch
	mov	r2, #0xf3
	lsl	r2, r2, #0x2
	add	r1, r6, r2
	mov	r0, #0x8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L27	@cond_branch
	ldr	r5, .L28 + 4
	ldr	r0, [r5]
	lsr	r0, r0, #0x4
	mov	r4, #0x3
	and	r0, r0, r4
	cmp	r0, #0
	bne	.L25	@cond_branch
	add	r3, r3, #0x4
	add	r0, r6, r3
	mov	r1, #0x40
	NEG	r1, r1
	mov	r2, #0x96
	lsl	r2, r2, #0x1
	mov	r3, #0x78
	str	r3, [sp]
	mov	r3, #0x2
	str	r3, [sp, #0x4]
	mov	r3, #0x46
	bl	sub_804E594
.L25:
	mov	r0, #0xce
	lsl	r0, r0, #0x1
	ADD r0, sl
	ldr	r0, [r0]
	cmp	r0, #0x3
	bgt	.L27	@cond_branch
	ldr	r0, [r5]
	lsr	r0, r0, #0x4
	and	r0, r0, r4
	cmp	r0, #0x1
	bne	.L27	@cond_branch
	mov	r1, #0xfb
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	mov	r1, #0x78
	str	r1, [sp]
	mov	r1, #0x2
	str	r1, [sp, #0x4]
	mov	r1, #0x40
	mov	r3, #0x46
	bl	sub_804E594
.L27:
	ldr	r2, [r7, #0xc]
	mov	sp, r2
	add	sp, sp, #0x24
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L29:
	.align	2, 0
.L28:
	.4byte	0xffff0000
	.4byte	0x3000e30
	thumb_func_end sub_804B8F0

.align 2, 0 @ Don't pad with nop.
