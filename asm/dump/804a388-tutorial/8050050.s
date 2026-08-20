	.include "asm/common.inc"

	thumb_func_start sub_8050050
sub_8050050:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	add	r5, r1, #0
	ldr	r0, .L80500A0
	mov	ip, r0
	ldr	r3, .L80500A0 + 4
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldrh	r1, [r0]
	ldr	r2, .L80500A0 + 8
	ldrh	r4, [r2]
	mov	r7, #0x0
	ldsh	r0, [r2, r7]
	cmp	r0, #0
	beq	.L80500B0	@cond_branch
	ldrh	r0, [r5, #0xa]
	cmp	r1, r0
	bne	.L80500AE	@cond_branch
	sub	r0, r4, #1
	strh	r0, [r2]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	.L80500AC	@cond_branch
	ldrh	r0, [r3]
	add	r0, r0, #0x1
	strh	r0, [r3]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0xf
	ble	.L8050094	@cond_branch
	mov	r0, #0x0
	strh	r0, [r3]
.L8050094:
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldrh	r1, [r0]
	b	.L80500AE
.L80500A0:
	.align	2, 0

	.4byte	_unk3000F20
	.4byte	_unk3000F44
	.4byte	_unk3000F40
.L80500AC:
	mov	r1, #0x0
.L80500AE:
	strh	r1, [r6, #0x8]
.L80500B0:
	ldrh	r0, [r5, #0x8]
	ldrh	r7, [r6, #0xa]
	cmp	r7, r0
	beq	.L80500EE	@cond_branch
	cmp	r0, #0
	beq	.L80500EE	@cond_branch
	ldr	r4, .L8050100
	ldr	r1, [r4]
	ldr	r0, .L8050100 + 4
	add	r1, r1, r0
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L80500EE	@cond_branch
	ldr	r0, .L8050100 + 8
	ldr	r0, [r0]
	ldr	r1, .L8050100 + 12
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L80500EE	@cond_branch
	mov	r0, #0x0
	bl	SetRiderGlobal
	ldr	r0, [r4]
	ldr	r7, .L8050100 + 16
	add	r0, r0, r7
	ldrh	r1, [r5, #0x8]
	bl	handleEventListeners
.L80500EE:
	ldrh	r0, [r5, #0x8]
	strh	r0, [r6, #0xa]
	add	r0, r6, #0
	bl	sub_805024C
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L80500FE:
	.align	2, 0
.L8050100:
	.4byte	_gameData
	.4byte	0x161c
	.4byte	_currentGameState
	.4byte	0x6a4
	.4byte	0x65c
	thumb_func_end sub_8050050

.align 2, 0 @ Don't pad with nop.
