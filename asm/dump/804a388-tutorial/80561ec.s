	.include "asm/common.inc"

	thumb_func_start sub_80561EC
sub_80561EC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffff7c
	add	r4, r0, #0
	add	r6, r1, #0
	add	r5, r2, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	mov	sl, r0
	ldr	r0, [r5]
	lsl	r0, r0, #0x4
	ldr	r1, [r6, #0x4]
	add	r0, r0, r1
	mov	r8, r0
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x4
	add	r1, r1, r0
	mov	r9, r1
	mov	r0, r8
	ldr	r1, [r0]
	mov	r2, r9
	ldr	r0, [r2]
	cmp	r1, r0
	bge	.L805622A	@cond_branch
	lsl	r3, r1, #0x5
	lsl	r0, r0, #0x5
	str	r0, [sp, #0x78]
	b	.L8056230
.L805622A:
	lsl	r3, r0, #0x5
	lsl	r1, r1, #0x5
	str	r1, [sp, #0x78]
.L8056230:
	mov	r7, r8
	ldr	r1, [r7, #0x4]
	mov	r2, r9
	ldr	r0, [r2, #0x4]
	cmp	r1, r0
	bge	.L8056244	@cond_branch
	lsl	r2, r1, #0x5
	lsl	r0, r0, #0x5
	str	r0, [sp, #0x7c]
	b	.L805624A
.L8056244:
	lsl	r2, r0, #0x5
	lsl	r1, r1, #0x5
	str	r1, [sp, #0x7c]
.L805624A:
	ldrb	r1, [r5, #0x11]
	mov	r0, #0x8
	and	r0, r0, r1
	add	r7, sp, #0x80
	strb	r1, [r7]
	cmp	r0, #0
	beq	.L8056278	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, r3
	bgt	.L8056260	@cond_branch
	b	.L80565FE
.L8056260:
	ldr	r1, [sp, #0x78]
	cmp	r0, r1
	blt	.L8056268	@cond_branch
	b	.L80565FE
.L8056268:
	ldr	r0, [r4, #0x8]
	cmp	r0, r2
	bgt	.L8056270	@cond_branch
	b	.L80565FE
.L8056270:
	ldr	r2, [sp, #0x7c]
	cmp	r0, r2
	blt	.L8056278	@cond_branch
	b	.L80565FE
.L8056278:
	mov	r7, sp
	mov	r0, sl
	cmp	r0, #0
	beq	.L8056284	@cond_branch
	mov	r7, sl
	add	r7, r7, #0xf4
.L8056284:
	ldrb	r0, [r5, #0xf]
	sub	r0, r0, #0x80
	cmp	r0, #0x18
	bls	.L805628E	@cond_branch
	b	.L80565CC
.L805628E:
	lsl	r0, r0, #0x2
	ldr	r1, .L8056298
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8056298:
	.align	2, 0

	.4byte	.L805629C
.L805629C:
	.4byte	.L8056300
	.4byte	.L80565CC
	.4byte	.L80565CC
	.4byte	.L80565CC
	.4byte	.L80565CC
	.4byte	.L80565CC
	.4byte	.L80565FE
	.4byte	.L80565FE
	.4byte	.L80565CC
	.4byte	.L80565FE
	.4byte	.L8056400
	.4byte	.L8056410
	.4byte	.L8056498
	.4byte	.L805652C
	.4byte	.L80565FE
	.4byte	.L80565CC
	.4byte	.L80565FE
	.4byte	.L80565FE
	.4byte	.L805636C
	.4byte	.L80565CC
	.4byte	.L80565A4
	.4byte	.L80565CC
	.4byte	.L80565CC
	.4byte	.L805659E
	.4byte	.L80565FE
.L8056300:
	add	r7, sp, #0x28
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	ldr	r0, [r4, #0x4]
	ldr	r1, [sp, #0x78]
	cmp	r0, r1
	ble	.L8056318	@cond_branch
	b	.L80565FE
.L8056318:
	ldr	r0, [r4, #0x8]
	ldr	r2, [sp, #0x7c]
	cmp	r0, r2
	ble	.L8056322	@cond_branch
	b	.L80565FE
.L8056322:
	ldr	r1, [r4, #0xc]
	ldr	r0, [r7, #0x8]
	cmp	r1, r0
	ble	.L805633E	@cond_branch
	mov	r7, r8
	ldr	r0, [r7, #0x8]
	cmp	r0, #0
	beq	.L8056334	@cond_branch
	b	.L80565FE
.L8056334:
	mov	r1, r9
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	beq	.L805633E	@cond_branch
	b	.L80565FE
.L805633E:
	mov	r1, #0xe0
	lsl	r1, r1, #0x1
	ADD r1, sl
	ldrb	r0, [r5, #0xd]
	ldrb	r2, [r1]
	cmp	r0, r2
	bls	.L8056350	@cond_branch
	strb	r0, [r1]
	b	.L80563F2
.L8056350:
	mov	r7, #0x16
	ldsh	r0, [r5, r7]
	ldrb	r2, [r1]
	cmp	r0, r2
	bgt	.L805635C	@cond_branch
	b	.L80565FE
.L805635C:
	ldrh	r0, [r5, #0x16]
	strb	r0, [r1]
	mov	r1, #0x80
	lsl	r1, r1, #0x11
	mov	r0, sl
	bl	SetRiderFlag
	b	.L80565FE
.L805636C:
	add	r7, sp, #0x50
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	ldr	r3, [r4, #0x4]
	ldr	r0, [sp, #0x78]
	cmp	r3, r0
	ble	.L8056384	@cond_branch
	b	.L80565FE
.L8056384:
	ldr	r2, [r4, #0x8]
	ldr	r1, [sp, #0x7c]
	cmp	r2, r1
	ble	.L805638E	@cond_branch
	b	.L80565FE
.L805638E:
	ldr	r1, [r4, #0xc]
	ldr	r0, [r7, #0x8]
	cmp	r1, r0
	ble	.L80563AA	@cond_branch
	mov	r7, r8
	ldr	r0, [r7, #0x8]
	cmp	r0, #0
	beq	.L80563A0	@cond_branch
	b	.L80565FE
.L80563A0:
	mov	r1, r9
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	beq	.L80563AA	@cond_branch
	b	.L80565FE
.L80563AA:
	sub	r4, r3, r2
	mov	r2, r8
	ldr	r0, [r2]
	ldr	r1, [r2, #0x4]
	sub	r0, r0, r1
	lsl	r3, r0, #0x5
	mov	r7, r9
	ldr	r0, [r7]
	ldr	r1, [r7, #0x4]
	sub	r0, r0, r1
	lsl	r1, r0, #0x5
	cmp	r3, r1
	ble	.L80563CA	@cond_branch
	add	r0, r3, #0
	add	r3, r1, #0
	add	r1, r0, #0
.L80563CA:
	ldr	r0, .L80563FC
	add	r3, r3, r0
	mov	r2, #0x80
	lsl	r2, r2, #0x5
	add	r1, r1, r2
	mov	r2, #0xe0
	lsl	r2, r2, #0x1
	ADD r2, sl
	ldrb	r0, [r5, #0xd]
	ldrb	r5, [r2]
	cmp	r0, r5
	bhi	.L80563E4	@cond_branch
	b	.L80565FE
.L80563E4:
	cmp	r4, r3
	bge	.L80563EA	@cond_branch
	b	.L80565FE
.L80563EA:
	cmp	r4, r1
	blt	.L80563F0	@cond_branch
	b	.L80565FE
.L80563F0:
	strb	r0, [r2]
.L80563F2:
	mov	r0, sl
	mov	r1, #0x4
	bl	SetRiderFlag
	b	.L80565FE
.L80563FC:
	.align	2, 0

	.4byte	0xfffff000
.L8056400:
	mov	r0, #0x4
	add	r1, sp, #0x80
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L805640E	@cond_branch
	b	.L8056576
.L805640E:
	b	.L8056584
.L8056410:
	mov	r2, r8
	ldr	r1, [r2, #0x8]
	mov	r5, r9
	ldr	r0, [r5, #0x8]
	mov	r2, r9
	cmp	r1, r0
	bge	.L8056420	@cond_branch
	mov	r2, r8
.L8056420:
	ldr	r0, [r2, #0x8]
	lsl	r0, r0, #0x5
	ldr	r1, [r4, #0xc]
	cmp	r1, r0
	ble	.L805642C	@cond_branch
	b	.L80565FE
.L805642C:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L805643E	@cond_branch
	b	.L80565FE
.L805643E:
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0
	beq	.L8056452	@cond_branch
	b	.L80565FE
.L8056452:
	bl	sub_8056EC0
	mov	r0, #0xa
	bl	sub_804ABFC
	ldr	r0, .L8056490
	ldr	r0, [r0]
	ldr	r7, .L8056490 + 4
	add	r0, r0, r7
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L805647A	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, sl
	bl	SetRiderFlag
.L805647A:
	str	r5, [r4, #0x48]
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	mov	r0, sl
	bl	SetRiderFlag
	mov	r0, #0x0
	bl	sub_8053E18
	b	.L80565FE
.L805648E:
	.align	2, 0
.L8056490:
	.4byte	_gameData
	.4byte	0xc6c
.L8056498:
	ldr	r0, [r5]
	lsl	r0, r0, #0x4
	ldr	r1, [r6, #0x4]
	add	r3, r1, r0
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x4
	add	r1, r1, r0
	ldr	r2, [r3, #0x8]
	ldr	r0, [r1, #0x8]
	cmp	r2, r0
	bge	.L80564B0	@cond_branch
	add	r1, r3, #0
.L80564B0:
	mov	r7, #0x16
	ldsh	r0, [r5, r7]
	lsl	r0, r0, #0x3
	ldr	r1, [r1, #0x8]
	sub	r0, r1, r0
	lsl	r7, r0, #0x5
	lsl	r1, r1, #0x5
	mov	r8, r1
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8056528	@cond_branch
	ldrh	r0, [r5, #0x16]
	cmp	r0, #0
	bne	.L80564D8	@cond_branch
	b	.L80565FE
.L80564D8:
	ldrb	r0, [r5, #0x10]
	cmp	r0, #0
	bne	.L80564E0	@cond_branch
	b	.L80565FE
.L80564E0:
	ldr	r1, [r4, #0xc]
	cmp	r1, r7
	bge	.L80564EE	@cond_branch
	ldr	r0, [r4, #0x48]
	add	r0, r1, r0
	cmp	r0, r7
	bgt	.L80564FE	@cond_branch
.L80564EE:
	cmp	r1, r8
	bgt	.L80564F4	@cond_branch
	b	.L80565FE
.L80564F4:
	ldr	r0, [r4, #0x48]
	add	r0, r1, r0
	cmp	r0, r8
	blt	.L80564FE	@cond_branch
	b	.L80565FE
.L80564FE:
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_805BAC0
	add	r1, r0, #0
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L8056528	@cond_branch
	add	r0, r6, #0
	bl	GetLineMetaData
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L8056528	@cond_branch
	add	r0, r6, #0
	mov	r2, #0x6
	bl	getLineMetaObjectBytype
	cmp	r0, #0
	bne	.L80565FE	@cond_branch
.L8056528:
	mov	r0, #0x0
	b	.L80565FE
.L805652C:
	ldr	r0, [r5]
	lsl	r0, r0, #0x4
	ldr	r1, [r6, #0x4]
	add	r0, r0, r1
	mov	ip, r0
	ldr	r0, [r5, #0x4]
	lsl	r0, r0, #0x4
	add	r1, r1, r0
	mov	r0, ip
	ldr	r2, [r0, #0x8]
	ldr	r0, [r1, #0x8]
	add	r3, r1, #0
	cmp	r2, r0
	bge	.L805654A	@cond_branch
	mov	r3, ip
.L805654A:
	ldrh	r2, [r5, #0x16]
	lsl	r1, r2, #0x3
	ldr	r0, [r3, #0x8]
	sub	r0, r0, r1
	lsl	r1, r0, #0x5
	ldr	r2, [r4, #0xc]
	cmp	r2, r1
	bgt	.L805656A	@cond_branch
	ldr	r0, [r4, #0x48]
	add	r0, r2, r0
	cmp	r0, r1
	ble	.L80565FE	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x48]
	str	r1, [r4, #0xc]
	b	.L80565FE
.L805656A:
	mov	r0, #0x4
	add	r1, sp, #0x80
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8056584	@cond_branch
.L8056576:
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	b	.L8056590
.L8056584:
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_8056910
.L8056590:
	add	r0, r6, #0
	add	r1, r5, #0
	mov	r2, sl
	add	r3, r7, #0
	bl	sub_8056610
	b	.L80565FE
.L805659E:
	mov	r2, sl
	str	r5, [r2, #0x68]
	b	.L80565FE
.L80565A4:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r0, sl
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80565FE	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	mov	r0, sl
	bl	SetRiderFlag
	ldrh	r0, [r5, #0x8]
	ldr	r3, .L80565C8
	ADD r3, sl
	strb	r0, [r3]
	b	.L80565FE
.L80565C8:
	.align	2, 0

	.4byte	0x1c3
.L80565CC:
	mov	r0, #0x4
	add	r1, sp, #0x80
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L80565E6	@cond_branch
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_80567E4
	b	.L80565F2
.L80565E6:
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	add	r3, r7, #0
	bl	sub_8056910
.L80565F2:
	add	r0, r6, #0
	add	r1, r5, #0
	mov	r2, sl
	add	r3, r7, #0
	bl	sub_8056610
.L80565FE:
	add	sp, sp, #0x84
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_80561EC

.align 2, 0 @ Don't pad with nop.
