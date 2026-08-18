	.include "asm/common.inc"

	thumb_func_start sub_8046500
sub_8046500:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	cmp	r1, #0x8
	bls	.L804650C	@cond_branch
	b	.L8046806
.L804650C:
	lsl	r0, r1, #0x2
	ldr	r1, .L8046518
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8046516:
	.align	2, 0
.L8046518:
	.4byte	.L804651C
.L804651C:
	.4byte	.L8046540
	.4byte	.L8046680
	.4byte	.L8046770
	.4byte	.L8046806
	.4byte	.L8046806
	.4byte	.L8046806
	.4byte	.L8046806
	.4byte	.L804661C
	.4byte	.L8046650
.L8046540:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L80465F0
	str	r4, [r0]
	cmp	r4, #0
	beq	.L8046568	@cond_branch
	ldr	r1, .L80465F0 + 4
	ldr	r2, .L80465F0 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L8046568:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L80465F0 + 12
	str	r5, [r0]
	cmp	r5, #0
	beq	.L8046594	@cond_branch
	ldr	r1, .L80465F0 + 4
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r4, #0x0
	str	r4, [sp]
	str	r4, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r0, r5, #0
	bl	LoadSpriteSheet
.L8046594:
	ldr	r1, .L80465F0 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L80465F0 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	ldr	r0, .L80465F0 + 24
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L80465F0 + 28
	mov	r5, #0x0
	str	r5, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	NEG	r1, r1
	mov	r2, #0x90
	lsl	r2, r2, #0x6
	bl	sub_80596AC
	ldr	r4, .L80465F0 + 32
	mov	r6, #0x0
	strh	r5, [r4, #0xc]
	mov	r0, #0x0
	bl	sub_804A0E0
	str	r0, [r4, #0x4]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x8]
	ldr	r0, .L80465F0 + 36
	strb	r6, [r0]
	ldr	r1, .L80465F0 + 40
	mov	r0, #0x1
	strb	r0, [r1]
	add	r1, r7, #0
	add	r1, r1, #0x80
	mov	r0, #0x30
	ldrb	r3, [r1]
	orr	r0, r0, r3
	strb	r0, [r1]
	b	.L8046806
.L80465F0:
	.align	2, 0

	.4byte	0x3000494
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x3000498
	.4byte	0x300049c
	.4byte	0x30004a0
	.4byte	0x3000478
	.4byte	0x3000474
	.4byte	0x3000480
	.4byte	0x3000491
	.4byte	0x3000490
.L804661C:
	ldr	r0, .L8046644
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8046628	@cond_branch
	bl	sub_8060A94
.L8046628:
	ldr	r0, .L8046644 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8046634	@cond_branch
	bl	sub_8060A94
.L8046634:
	ldr	r0, .L8046644 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L804663E	@cond_branch
	b	.L8046806
.L804663E:
	bl	sub_8060A94
	b	.L8046806
.L8046644:
	.align	2, 0

	.4byte	0x3000494
	.4byte	0x3000498
	.4byte	0x3000480
.L8046650:
	cmp	r2, #0x1
	beq	.L8046656	@cond_branch
	b	.L8046806
.L8046656:
	ldr	r0, .L8046678
	strb	r2, [r0]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r4, .L8046678 + 4
	str	r0, [r4]
	mov	r1, #0xc
	ldsh	r0, [r4, r1]
	bl	sub_80570C0
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0x1
	bl	sub_8046468
	b	.L8046806
.L8046678:
	.align	2, 0

	.4byte	0x3000491
	.4byte	0x3000480
.L8046680:
	mov	r2, #0xa0
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	bl	sub_80439A0
	ldr	r5, .L804674C
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L80466BC	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L804674C + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L804674C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	ldr	r0, .L804674C + 12
	ldr	r0, [r0]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L80466BC:
	ldr	r5, .L804674C + 16
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L80466EE	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L804674C + 20
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L804674C + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	ldr	r0, .L804674C + 12
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L80466EE:
	ldr	r0, .L804674C + 24
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8046724	@cond_branch
	ldr	r0, .L804674C + 28
	ldr	r0, [r0]
	asr	r0, r0, #0x8
	cmp	r0, #0xfe
	ble	.L8046724	@cond_branch
	ldr	r5, .L804674C + 12
	ldr	r1, [r5]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	cmp	r1, r0
	bne	.L8046724	@cond_branch
	ldr	r4, .L804674C + 32
	mov	r1, #0xc
	ldsh	r0, [r4, r1]
	bl	sub_80570C0
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0x1
	bl	sub_8046468
	mov	r0, #0x0
	str	r0, [r5]
.L8046724:
	ldr	r0, .L804674C + 12
	ldr	r5, .L804674C + 28
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r1, [r5]
	add	r1, r1, r4
	str	r1, [r5]
	ldr	r0, .L804674C + 32
	bl	sub_80464C0
	b	.L8046806
.L804674C:
	.align	2, 0

	.4byte	0x3000494
	.4byte	0x300049c
	.4byte	0x874cc3c
	.4byte	0x3000474
	.4byte	0x3000498
	.4byte	0x30004a0
	.4byte	0x3000491
	.4byte	0x3000478
	.4byte	0x3000480
.L8046770:
	ldr	r4, .L80467C4
	mov	r0, #0x3
	ldrh	r3, [r4]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L804679C	@cond_branch
	ldr	r1, .L80467C4 + 4
	ldr	r0, .L80467C4 + 8
	str	r0, [r1]
	ldr	r1, .L80467C4 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L80467C4 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L80467C4 + 20
	mov	r0, #0x0
	strb	r0, [r1]
	bl	sub_8049178
.L804679C:
	ldrh	r1, [r4]
	mov	r0, #0x30
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046806	@cond_branch
	mov	r0, #0x20
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, #0
	beq	.L80467E6	@cond_branch
	ldr	r1, .L80467C4 + 24
	ldrh	r2, [r1, #0xc]
	mov	r4, #0xc
	ldsh	r0, [r1, r4]
	cmp	r0, #0
	ble	.L80467E0	@cond_branch
	sub	r0, r2, #1
	strh	r0, [r1, #0xc]
	b	.L80467FE
.L80467C4:
	.align	2, 0

	.4byte	0x3005da0
	.4byte	0x300049c
	.4byte	0xffff0000
	.4byte	0x30004a0
	.4byte	0x3000474
	.4byte	0x3000491
	.4byte	0x3000480
.L80467E0:
	mov	r0, #0x6c
	strh	r0, [r1, #0xc]
	b	.L80467FE
.L80467E6:
	ldr	r1, .L80467F8
	ldrh	r2, [r1, #0xc]
	mov	r4, #0xc
	ldsh	r0, [r1, r4]
	cmp	r0, #0x6b
	bgt	.L80467FC	@cond_branch
	add	r0, r2, #1
	strh	r0, [r1, #0xc]
	b	.L80467FE
.L80467F8:
	.align	2, 0

	.4byte	0x3000480
.L80467FC:
	strh	r3, [r1, #0xc]
.L80467FE:
	ldr	r1, .L8046810
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
.L8046806:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804680E:
	.align	2, 0
.L8046810:
	.4byte	0x3000474
	thumb_func_end sub_8046500

.align 2, 0 @ Don't pad with nop.
