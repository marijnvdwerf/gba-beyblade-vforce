	.include "asm/common.inc"

	thumb_func_start sub_8050050
sub_8050050:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	add	r5, r1, #0
	ldr	r0, .L6
	mov	ip, r0
	ldr	r3, .L6 + 4
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldrh	r1, [r0]
	ldr	r2, .L6 + 8
	ldrh	r4, [r2]
	mov	r7, #0x0
	ldsh	r0, [r2, r7]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldrh	r0, [r5, #0xa]
	cmp	r1, r0
	bne	.L5	@cond_branch
	sub	r0, r4, #1
	strh	r0, [r2]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldrh	r0, [r3]
	add	r0, r0, #0x1
	strh	r0, [r3]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0xf
	ble	.L4	@cond_branch
	mov	r0, #0x0
	strh	r0, [r3]
.L4:
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldrh	r1, [r0]
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x3000f20
	.4byte	0x3000f44
	.4byte	0x3000f40
.L3:
	mov	r1, #0x0
.L5:
	strh	r1, [r6, #0x8]
.L1:
	ldrh	r0, [r5, #0x8]
	ldrh	r7, [r6, #0xa]
	cmp	r7, r0
	beq	.L11	@cond_branch
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r4, .L12
	ldr	r1, [r4]
	ldr	r0, .L12 + 4
	add	r1, r1, r0
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L11	@cond_branch
	ldr	r0, .L12 + 8
	ldr	r0, [r0]
	ldr	r1, .L12 + 12
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L11	@cond_branch
	mov	r0, #0x0
	bl	SetRiderGlobal
	ldr	r0, [r4]
	ldr	r7, .L12 + 16
	add	r0, r0, r7
	ldrh	r1, [r5, #0x8]
	bl	handleEventListeners
.L11:
	ldrh	r0, [r5, #0x8]
	strh	r0, [r6, #0xa]
	add	r0, r6, #0
	bl	sub_805024C
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.4byte	0x3000fb0
	.4byte	0x161c
	.4byte	0x3000f48
	.4byte	0x6a4
	.4byte	0x65c
	thumb_func_end sub_8050050

.align 2, 0 @ Don't pad with nop.
