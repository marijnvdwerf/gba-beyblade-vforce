	.include "asm/common.inc"

	thumb_func_start sub_804A908
sub_804A908:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	ldrh	r0, [r7, #0x2]
	mov	r9, r0
	ldrh	r1, [r7, #0x4]
	mov	r8, r1
	mov	r2, #0x1
	NEG	r2, r2
	ADD r9, r2
	cmp	r0, #0
	beq	.L804AA00	@cond_branch
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	mov	sl, r3
.L804A92C:
	mov	r1, r8
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, [r7, #0x8]
	add	r4, r1, r0
	ldr	r5, [r4, #0x18]
	ldrh	r0, [r4, #0xc]
	sub	r0, r0, #0x1
	strh	r0, [r4, #0xc]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L804A94E	@cond_branch
	mov	r2, #0xa0
	lsl	r2, r2, #0x8
	str	r2, [r5, #0xc]
	b	.L804A9D0
.L804A94E:
	ldr	r3, [r7, #0x28]
	cmp	r3, #0
	beq	.L804A982	@cond_branch
	ldr	r1, [r3, #0xc]
	ldr	r2, .L804A974
	and	r1, r1, r2
	ldr	r0, [r4]
	sub	r6, r0, r1
	ldr	r0, [r3, #0x10]
	and	r0, r0, r2
	ldr	r1, [r4, #0x4]
	sub	r2, r1, r0
	str	r6, [r5, #0x8]
	ldr	r0, .L804A974 + 4
	cmp	r2, r0
	blt	.L804A97C	@cond_branch
	str	r2, [r5, #0xc]
	b	.L804A982
.L804A972:
	.align	2, 0
.L804A974:
	.4byte	0xffffff00
	.4byte	0xffffc000
.L804A97C:
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	str	r3, [r5, #0xc]
.L804A982:
	ldrh	r1, [r4, #0xe]
	mov	r2, #0xe
	ldsh	r0, [r4, r2]
	cmp	r0, #0x10
	ble	.L804A994	@cond_branch
	add	r0, r1, #0
	sub	r0, r0, #0x10
	strh	r0, [r4, #0xe]
	b	.L804A9E2
.L804A994:
	add	r0, r1, #0
	add	r0, r0, #0x10
	ldrh	r3, [r4, #0x10]
	add	r0, r3, r0
	strh	r0, [r4, #0xe]
	ldrh	r0, [r5, #0x18]
	add	r0, r0, #0x1
	strh	r0, [r5, #0x18]
	ldrh	r2, [r5, #0x18]
	mov	r1, #0x12
	ldsh	r0, [r4, r1]
	mov	r3, #0x14
	ldsh	r1, [r4, r3]
	add	r0, r0, r1
	cmp	r2, r0
	bne	.L804A9E2	@cond_branch
	ldrh	r0, [r4, #0x16]
	ldrh	r1, [r7, #0x26]
	cmp	r0, r1
	bne	.L804A9CA	@cond_branch
	mov	r3, #0x24
	ldsh	r2, [r7, r3]
	add	r0, r7, #0
	add	r1, r4, #0
	bl	sub_804AB64
	b	.L804A9E2
.L804A9CA:
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r5, #0xc]
.L804A9D0:
	add	r0, r5, #0
	mov	r1, sl
	mov	r2, sl
	mov	r3, #0x0
	bl	sub_8060F64
	ldrh	r0, [r7, #0x2]
	sub	r0, r0, #0x1
	strh	r0, [r7, #0x2]
.L804A9E2:
	mov	r1, #0x1
	NEG	r1, r1
	ADD r8, r1
	mov	r2, r8
	cmp	r2, #0
	bge	.L804A9F4	@cond_branch
	ldrh	r3, [r7]
	sub	r3, r3, #0x1
	mov	r8, r3
.L804A9F4:
	mov	r0, r9
	mov	r1, #0x1
	NEG	r1, r1
	ADD r9, r1
	cmp	r0, #0
	bne	.L804A92C	@cond_branch
.L804AA00:
	ldr	r1, [r7, #0x10]
	ldr	r0, [r7, #0x18]
	sub	r5, r1, r0
	ldr	r1, [r7, #0x14]
	ldr	r0, [r7, #0x1c]
	sub	r6, r1, r0
	add	r1, r5, #0
	mul	r1, r1, r5
	add	r0, r6, #0
	mul	r0, r0, r6
	add	r4, r1, r0
	mov	r2, #0xd0
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	mul	r0, r0, r2
	cmp	r4, r0
	bgt	.L804AA24	@cond_branch
	b	.L804AB3E
.L804AA24:
	add	r0, r4, #0
	bl	Sqrt
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	lsl	r0, r5, #0x8
	add	r1, r4, #0
	bl	__divsi3
	mov	r8, r0
	lsl	r0, r6, #0x8
	add	r1, r4, #0
	bl	__divsi3
	add	r5, r0, #0
	mov	r0, r8
	add	r1, r5, #0
	bl	sub_804AB88
	mov	r9, r0
	mov	r3, #0xd0
	lsl	r3, r3, #0x4
	mov	r0, r8
	mul	r0, r0, r3
	asr	r0, r0, #0x8
	mov	r8, r0
	add	r0, r5, #0
	mul	r0, r0, r3
	asr	r5, r0, #0x8
	ldrh	r1, [r7, #0x4]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, [r7, #0x8]
	add	r4, r1, r0
	mov	r2, #0xc
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	beq	.L804AA86	@cond_branch
	ldrh	r3, [r4, #0x16]
	ldrh	r0, [r7, #0x24]
	cmp	r3, r0
	beq	.L804AA86	@cond_branch
	mov	r1, #0x24
	ldsh	r2, [r7, r1]
	add	r0, r7, #0
	add	r1, r4, #0
	bl	sub_804AB64
.L804AA86:
	ldrh	r0, [r7, #0x4]
	add	r0, r0, #0x1
	strh	r0, [r7, #0x4]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldrh	r1, [r7]
	cmp	r0, r1
	bne	.L804AA9A	@cond_branch
	mov	r0, #0x0
	strh	r0, [r7, #0x4]
.L804AA9A:
	ldrh	r0, [r7, #0x2]
	cmp	r0, r1
	bcs	.L804AAA4	@cond_branch
	add	r0, r0, #0x1
	strh	r0, [r7, #0x2]
.L804AAA4:
	ldrh	r2, [r7, #0x4]
	lsl	r0, r2, #0x3
	sub	r0, r0, r2
	lsl	r0, r0, #0x2
	ldr	r1, [r7, #0x8]
	add	r4, r1, r0
	mov	r3, r8
	asr	r0, r3, #0x1
	ldr	r2, .L804AAEC
	add	r0, r0, r2
	ldr	r1, [r7, #0x18]
	add	r6, r1, r0
	asr	r0, r5, #0x1
	add	r0, r0, r2
	ldr	r1, [r7, #0x1c]
	add	r2, r1, r0
	str	r6, [r4]
	str	r2, [r4, #0x4]
	ldr	r3, [r7, #0x28]
	cmp	r3, #0
	beq	.L804AADC	@cond_branch
	ldr	r0, [r3, #0xc]
	ldr	r1, .L804AAEC + 4
	and	r0, r0, r1
	sub	r6, r6, r0
	ldr	r0, [r3, #0x10]
	and	r0, r0, r1
	sub	r2, r2, r0
.L804AADC:
	ldr	r0, [r4, #0x18]
	str	r6, [r0, #0x8]
	ldr	r1, .L804AAEC + 8
	add	r3, r0, #0
	cmp	r2, r1
	blt	.L804AAF8	@cond_branch
	str	r2, [r3, #0xc]
	b	.L804AAFE
.L804AAEC:
	.align	2, 0

	.4byte	0xfffff800
	.4byte	0xffffff00
	.4byte	0xffffc000
.L804AAF8:
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r3, #0xc]
.L804AAFE:
	mov	r0, #0x0
	strh	r0, [r3, #0x18]
	ldr	r2, [r4, #0x18]
	ldr	r0, .L804AB4C
	ldrh	r1, [r2, #0x14]
	and	r0, r0, r1
	ldrh	r3, [r7, #0x2c]
	lsl	r1, r3, #0xc
	orr	r0, r0, r1
	strh	r0, [r2, #0x14]
	ldr	r0, [r4, #0x18]
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	mov	r1, r9
	lsl	r3, r1, #0x18
	lsr	r3, r3, #0x18
	add	r1, r2, #0
	bl	sub_8060F64
	ldrh	r0, [r7, #0x6]
	strh	r0, [r4, #0xc]
	add	r0, r7, #0
	add	r1, r4, #0
	mov	r2, #0x1
	bl	sub_804AB64
	ldr	r0, [r7, #0x18]
	ADD r0, r8
	str	r0, [r7, #0x18]
	ldr	r0, [r7, #0x1c]
	add	r0, r0, r5
	str	r0, [r7, #0x1c]
.L804AB3E:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804AB4C:
	.align	2, 0

	.4byte	0xfff
	thumb_func_end sub_804A908

.align 2, 0 @ Don't pad with nop.
