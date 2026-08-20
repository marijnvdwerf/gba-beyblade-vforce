	.include "asm/common.inc"

	thumb_func_start actor_8058638
actor_8058638:
	push	{r4, r5, lr}
	add	r2, r0, #0
	ldrh	r1, [r2, #0x20]
	lsl	r0, r1, #0x3
	add	r0, r0, #0x20
	ldr	r3, [r2]
	add	r4, r3, r0
	add	r1, r2, #0
	add	r1, r1, #0x98
	mov	r0, #0x4
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8058664	@cond_branch
	ldr	r1, [r3, #0x8]
	lsl	r1, r1, #0x3
	add	r1, r1, #0x20
	ldr	r0, [r3, #0x18]
	add	r0, r3, r0
	add	r1, r3, r1
	cmp	r1, r0
	bne	.L8058666	@cond_branch
.L8058664:
	mov	r1, #0x0
.L8058666:
	mov	r3, #0x36
	ldsh	r0, [r2, r3]
	ldrh	r5, [r2, #0x34]
	add	r3, r5, r0
	cmp	r1, #0
	beq	.L8058682	@cond_branch
	mov	r5, #0x22
	ldsh	r0, [r2, r5]
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r0, [r0]
	add	r0, r0, r3
	lsl	r0, r0, #0x10
	b	.L8058684
.L8058682:
	lsl	r0, r3, #0x10
.L8058684:
	lsr	r0, r0, #0x10
	add	r1, r0, #0
	ldr	r3, .L80586C4
	ldr	r0, [r3, #0x8]
	cmp	r1, r0
	bcs	.L8058694	@cond_branch
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L8058694:
	ldr	r0, [r3]
	ldr	r3, [r2, #0x58]
	sub	r0, r0, r3
	cmp	r0, r1
	bcc	.L805874A	@cond_branch
	add	r0, r3, r1
	str	r0, [r2, #0x58]
	ldrh	r3, [r4]
	ldrh	r5, [r4, #0x2]
	ldrh	r1, [r2, #0x22]
	add	r0, r2, #0
	add	r0, r0, #0x60
	strh	r1, [r0]
	add	r1, r2, #0
	add	r1, r1, #0x33
	mov	r0, #0x2
	ldrb	r4, [r1]
	and	r0, r0, r4
	add	r4, r1, #0
	cmp	r0, #0
	beq	.L80586C8	@cond_branch
	ldrh	r0, [r2, #0x22]
	sub	r0, r0, #0x1
	b	.L80586CC
.L80586C4:
	.align	2, 0

	.4byte	_unk3000E30
.L80586C8:
	ldrh	r0, [r2, #0x22]
	add	r0, r0, #0x1
.L80586CC:
	strh	r0, [r2, #0x22]
	mov	r0, #0x22
	ldsh	r1, [r2, r0]
	sub	r0, r3, #1
	add	r0, r0, r5
	cmp	r1, r0
	ble	.L8058704	@cond_branch
	ldrb	r1, [r4]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80586F8	@cond_branch
	mov	r0, #0x2
	EOR	r0, r1
	strb	r0, [r4]
	ldr	r1, .L80586F4
	add	r0, r5, r1
	add	r0, r3, r0
	strh	r0, [r2, #0x22]
	b	.L80586FA
.L80586F4:
	.align	2, 0

	.4byte	0xfffe
.L80586F8:
	strh	r3, [r2, #0x22]
.L80586FA:
	add	r1, r2, #0
	add	r1, r1, #0x24
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
.L8058704:
	mov	r1, #0x22
	ldsh	r0, [r2, r1]
	cmp	r0, r3
	bge	.L8058732	@cond_branch
	ldrb	r1, [r4]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8058720	@cond_branch
	mov	r0, #0x2
	EOR	r0, r1
	strb	r0, [r4]
	add	r0, r3, #1
	b	.L8058726
.L8058720:
	ldr	r4, .L8058750
	add	r0, r5, r4
	add	r0, r3, r0
.L8058726:
	strh	r0, [r2, #0x22]
	add	r1, r2, #0
	add	r1, r1, #0x24
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
.L8058732:
	add	r0, r2, #0
	add	r0, r0, #0x32
	ldrb	r1, [r0]
	cmp	r1, #0
	beq	.L805874A	@cond_branch
	sub	r0, r0, #0xe
	ldrb	r0, [r0]
	cmp	r0, r1
	bcc	.L805874A	@cond_branch
	add	r0, r2, #0
	bl	sub_80581B8
.L805874A:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8058750:
	.align	2, 0

	.4byte	0xffff
	thumb_func_end actor_8058638

.align 2, 0 @ Don't pad with nop.
