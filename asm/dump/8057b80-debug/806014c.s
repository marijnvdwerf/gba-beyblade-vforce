	.include "asm/common.inc"

	thumb_func_start sub_806014C
sub_806014C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	str	r0, [sp]
	add	r6, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r8, r2
	ldr	r1, .L806017C
	ldr	r2, [r1]
	ldrb	r0, [r2, #0x3]
	mov	r9, r0
	ldr	r3, [r2, #0x14]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	and	r0, r0, r3
	add	r7, r1, #0
	cmp	r0, #0
	beq	.L8060180	@cond_branch
	mov	r0, #0x0
	b	.L80603D0
.L806017C:
	.align	2, 0

	.4byte	_unk3005DC4
.L8060180:
	mov	r0, #0xc0
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L806018E	@cond_branch
	mov	r1, #0x0
	mov	sl, r1
	b	.L80601A2
.L806018E:
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L806019E	@cond_branch
	mov	r1, #0x1
	mov	sl, r1
	b	.L80601A6
.L806019E:
	mov	r0, #0x1
	mov	sl, r0
.L80601A2:
	ldrb	r0, [r2, #0x5]
	add	r0, r0, #0x1
.L80601A6:
	strb	r0, [r2, #0x5]
	ldr	r2, [r7]
	ldrb	r1, [r2, #0x5]
	cmp	r1, #0x3b
	bls	.L80601BE	@cond_branch
	ldr	r0, [r2, #0x14]
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	orr	r0, r0, r1
	str	r0, [r2, #0x14]
	mov	r0, #0x0
	b	.L80603D0
.L80601BE:
	ldr	r3, [r2, #0x14]
	ldr	r0, .L80601F0
	and	r3, r3, r0
	str	r3, [r2, #0x14]
	mov	r0, #0x80
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L80601F4	@cond_branch
	ldr	r1, [r2, #0x1c]
	add	r1, r1, #0x1
	str	r1, [r2, #0x1c]
	mov	r4, #0x81
	neg	r4, r4
	and	r4, r4, r3
	str	r4, [r2, #0x14]
	ldr	r0, [r2, #0x20]
	cmp	r1, r0
	bcc	.L80601F6	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	orr	r4, r4, r0
	str	r4, [r2, #0x14]
	mov	r0, #0x0
	b	.L80603D0
.L80601EE:
	.align	2, 0
.L80601F0:
	.4byte	0xfffffbbf
.L80601F4:
	str	r0, [r2, #0x1c]
.L80601F6:
	add	r5, r7, #0
	ldr	r0, [r5]
	ldr	r0, [r0, #0x14]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8060206	@cond_branch
	b	.L8060308
.L8060206:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80602A0	@cond_branch
	ldr	r2, [r5]
	ldr	r1, [r2, #0x14]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8060220	@cond_branch
	b	.L80603D0
.L8060220:
	ldr	r0, .L8060284
	and	r1, r1, r0
	str	r1, [r2, #0x14]
	mov	r0, #0x0
	strb	r0, [r2]
	ldr	r4, .L8060284 + 4
	ldr	r0, [r5]
	ldr	r1, [r0, #0x24]
	ldr	r2, [r0, #0x18]
	ldr	r3, [r4]
	add	r0, r6, #0
	bl	_call_via_r3
	ldr	r1, [r5]
	ldr	r0, [r1, #0x24]
	str	r0, [r1, #0x3c]
	ldr	r2, .L8060284 + 8
	ldr	r0, .L8060284 + 12
	ldr	r0, [r0]
	str	r0, [r2, #0x18]
	ldr	r2, .L8060284 + 16
	ldr	r0, [r1, #0x10]
	strh	r0, [r2]
	ldr	r1, .L8060284 + 20
	mov	r0, #0xc0
	strh	r0, [r1]
	mov	r0, #0x40
	bl	EnableInterrupt
	ldr	r0, .L8060284 + 24
	ldr	r0, [r0]
	bl	_call_via_r0
	mov	r0, sl
	cmp	r0, #0
	bne	.L8060270	@cond_branch
	mov	r1, r8
	cmp	r1, #0
	bne	.L8060270	@cond_branch
	b	.L80603CE
.L8060270:
	ldr	r1, [r5]
	ldr	r0, [r1, #0x38]
	ldr	r1, [r1, #0x18]
	mov	r2, r9
	mul	r2, r2, r1
	ldr	r3, [r4]
	ldr	r1, [sp]
	bl	_call_via_r3
	b	.L80603CE
.L8060284:
	.align	2, 0

	.4byte	0xfffffdff
	.4byte	__fastMemoryCopyARM
	.4byte	_unk3000DF0
	.4byte	__sub_8757D24
	.4byte	0x400010c
	.4byte	0x400010e
	.4byte	__sub_8757CD0
.L80602A0:
	mov	r0, sl
	cmp	r0, #0
	bne	.L80602AC	@cond_branch
	mov	r1, r8
	cmp	r1, #0
	beq	.L80602C0	@cond_branch
.L80602AC:
	ldr	r3, .L80602E4
	ldr	r1, [r5]
	ldr	r0, [r1, #0x38]
	ldr	r1, [r1, #0x18]
	mov	r2, r9
	mul	r2, r2, r1
	ldr	r3, [r3]
	ldr	r1, [sp]
	bl	_call_via_r3
.L80602C0:
	ldr	r3, .L80602E4
	ldr	r4, .L80602E4 + 4
	ldr	r0, [r4]
	ldr	r1, [r0, #0x40]
	ldr	r2, [r0, #0x18]
	ldr	r3, [r3]
	add	r0, r6, #0
	bl	_call_via_r3
	ldr	r4, [r4]
	ldr	r1, [r4, #0x14]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80602EC	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x1c]
	b	.L80602F2
.L80602E4:
	.align	2, 0

	.4byte	__fastMemoryCopyARM
	.4byte	_unk3005DC4
.L80602EC:
	mov	r0, #0x80
	orr	r1, r1, r0
	str	r1, [r4, #0x14]
.L80602F2:
	ldr	r0, .L8060304
	ldr	r2, [r0]
	ldr	r0, [r2, #0x14]
	mov	r1, #0x21
	neg	r1, r1
	and	r0, r0, r1
	str	r0, [r2, #0x14]
	b	.L80603CE
.L8060302:
	.align	2, 0
.L8060304:
	.4byte	_unk3005DC4
.L8060308:
	mov	r4, #0x0
	ldr	r0, .L8060378
	ldr	r1, .L8060378 + 4
	add	r6, r1, #0
	strh	r6, [r0]
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80603B0	@cond_branch
	ldr	r0, .L8060378 + 8
	ldrh	r0, [r0]
	add	r1, r6, #0
	cmp	r0, r1
	bne	.L8060328	@cond_branch
	mov	r4, #0x1
.L8060328:
	ldr	r0, .L8060378 + 12
	ldrh	r0, [r0]
	cmp	r0, r1
	bne	.L8060336	@cond_branch
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L8060336:
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x4]
	cmp	r0, #0x2
	bls	.L806034C	@cond_branch
	ldr	r0, .L8060378 + 16
	ldrh	r0, [r0]
	cmp	r0, r1
	bne	.L806034C	@cond_branch
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L806034C:
	ldr	r0, .L8060378 + 20
	ldr	r1, [r0]
	add	r7, r0, #0
	ldrb	r1, [r1, #0x4]
	cmp	r1, #0x3
	bls	.L8060368	@cond_branch
	ldr	r0, .L8060378 + 24
	ldrh	r1, [r0]
	ldr	r0, .L8060378 + 4
	cmp	r1, r0
	bne	.L8060368	@cond_branch
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L8060368:
	ldr	r3, [r7]
	ldrb	r0, [r3, #0x4]
	cmp	r4, r0
	bcc	.L8060394	@cond_branch
	bl	sub_8060404
	b	.L80603D0
.L8060376:
	.align	2, 0
.L8060378:
	.4byte	0x400012a
	.4byte	0xdeaf
	.4byte	0x4000120
	.4byte	0x4000122
	.4byte	0x4000124
	.4byte	_unk3005DC4
	.4byte	0x4000126
.L8060394:
	ldr	r2, .L80603AC
	ldrh	r0, [r2]
	mov	r1, #0x80
	orr	r0, r0, r1
	strh	r0, [r2]
	ldr	r0, [r3, #0x14]
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	orr	r0, r0, r1
	str	r0, [r3, #0x14]
	b	.L80603CE
.L80603AA:
	.align	2, 0
.L80603AC:
	.4byte	0x4000128
.L80603B0:
	ldr	r1, [r7]
	ldr	r2, [r1, #0x14]
	mov	r3, #0x4
	add	r0, r2, #0
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L80603CE	@cond_branch
	orr	r2, r2, r3
	str	r2, [r1, #0x14]
	ldr	r1, .L80603E0
	ldr	r0, .L80603E0 + 4
	str	r0, [r1, #0x1c]
	mov	r0, #0x80
	bl	EnableInterrupt
.L80603CE:
	mov	r0, sl
.L80603D0:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L80603E0:
	.align	2, 0

	.4byte	_unk3000DF0
	.4byte	onSerialCommunication + 1
	thumb_func_end sub_806014C

.align 2, 0 @ Don't pad with nop.
