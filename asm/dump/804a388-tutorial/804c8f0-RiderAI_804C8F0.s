	.include "asm/common.inc"

	thumb_func_start RiderAI_804C8F0
RiderAI_804C8F0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffffe8
	add	r7, r0, #0
	mov	r1, #0xe2
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	ldrh	r0, [r0]
	mov	r8, r0
	mov	r6, #0x0
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804C97C	@cond_branch
	ldr	r2, .L804C934
	add	r0, r7, r2
	ldrb	r0, [r0]
	add	r0, r0, #0x10
	mov	r1, #0xff
	and	r0, r0, r1
	lsr	r0, r0, #0x5
	cmp	r0, #0x7
	bls	.L804C92A	@cond_branch
	b	.L804CA9E
.L804C92A:
	lsl	r0, r0, #0x2
	ldr	r1, .L804C934 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L804C934:
	.align	2, 0

	.4byte	0x1c3
	.4byte	.L804C93C
.L804C93C:
	.4byte	.L804C95C
	.4byte	.L804C960
	.4byte	.L804C964
	.4byte	.L804C968
	.4byte	.L804C96C
	.4byte	.L804C970
	.4byte	.L804C974
	.4byte	.L804C978
.L804C95C:
	mov	r6, #0x20
	b	.L804CA9E
.L804C960:
	mov	r6, #0x60
	b	.L804CA9E
.L804C964:
	mov	r6, #0x40
	b	.L804CA9E
.L804C968:
	mov	r6, #0x50
	b	.L804CA9E
.L804C96C:
	mov	r6, #0x10
	b	.L804CA9E
.L804C970:
	mov	r6, #0x90
	b	.L804CA9E
.L804C974:
	mov	r6, #0x80
	b	.L804CA9E
.L804C978:
	mov	r6, #0xa0
	b	.L804CA9E
.L804C97C:
	add	r0, r7, #0
	mov	r1, #0x1
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L804C998	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x40
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804CA14	@cond_branch
.L804C998:
	mov	r3, #0x83
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804CA14	@cond_branch
	ldr	r2, [r0]
	ldr	r3, [r7]
	ldr	r0, [r2, #0x4]
	ldr	r1, [r3, #0x4]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	ldr	r1, [r7, #0x40]
	sub	r4, r0, r1
	ldr	r0, [r2, #0x8]
	ldr	r1, [r3, #0x8]
	sub	r0, r0, r1
	asr	r0, r0, #0x2
	ldr	r1, [r7, #0x44]
	sub	r5, r0, r1
	add	r0, r7, #0
	mov	r1, #0x40
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804C9D2	@cond_branch
	NEG	r4, r4
	NEG	r5, r5
.L804C9D2:
	cmp	r4, #0
	ble	.L804C9DA	@cond_branch
	mov	r6, #0x10
	b	.L804C9E0
.L804C9DA:
	cmp	r4, #0
	bge	.L804C9E0	@cond_branch
	mov	r6, #0x20
.L804C9E0:
	cmp	r5, #0
	ble	.L804C9EA	@cond_branch
	mov	r0, #0x80
	orr	r6, r6, r0
	b	.L804C9F6
.L804C9EA:
	cmp	r5, #0
	bge	.L804C9F6	@cond_branch
	mov	r0, #0x40
	orr	r6, r6, r0
	lsl	r0, r6, #0x10
	lsr	r6, r0, #0x10
.L804C9F6:
	ldr	r0, .L804CA10
	add	r1, r7, r0
	ldrh	r0, [r1]
	sub	r0, r0, #0x1
	strh	r0, [r1]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L804CA9E	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x41
	bl	UnsetRiderFlag
	b	.L804CA9E
.L804CA10:
	.align	2, 0

	.4byte	0x21e
.L804CA14:
	ldr	r0, .L804CA68
	ldr	r0, [r0]
	ldr	r1, .L804CA68 + 4
	add	r2, r0, r1
	mov	r3, #0x85
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804CA9E	@cond_branch
	mov	r1, #0x86
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	mov	r3, #0x89
	lsl	r3, r3, #0x2
	add	r0, r7, r3
	ldr	r3, [r0]
	asr	r3, r3, #0x8
	add	r0, r2, #0
	mov	r2, sp
	bl	sub_805DFD4
	ldr	r0, [sp]
	lsl	r0, r0, #0x5
	ldr	r2, [r7]
	ldr	r1, [r2, #0x4]
	sub	r0, r0, r1
	asr	r3, r0, #0x2
	ldr	r0, [sp, #0x4]
	lsl	r0, r0, #0x5
	ldr	r1, [r2, #0x8]
	sub	r0, r0, r1
	asr	r1, r0, #0x2
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r3, r0
	ble	.L804CA70	@cond_branch
	mov	r0, #0x10
	b	.L804CA78
.L804CA66:
	.align	2, 0
.L804CA68:
	.4byte	_gameData
	.4byte	0x65c
.L804CA70:
	ldr	r0, .L804CA8C
	cmp	r3, r0
	bge	.L804CA7E	@cond_branch
	mov	r0, #0x20
.L804CA78:
	orr	r6, r6, r0
	lsl	r0, r6, #0x10
	lsr	r6, r0, #0x10
.L804CA7E:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r1, r0
	ble	.L804CA90	@cond_branch
	mov	r0, #0x80
	b	.L804CA98
.L804CA8A:
	.align	2, 0
.L804CA8C:
	.4byte	0xffffff00
.L804CA90:
	ldr	r0, .L804CB04
	cmp	r1, r0
	bge	.L804CA9E	@cond_branch
	mov	r0, #0x40
.L804CA98:
	orr	r6, r6, r0
	lsl	r0, r6, #0x10
	lsr	r6, r0, #0x10
.L804CA9E:
	add	r0, r7, #0
	mov	r1, #0x40
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804CACE	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804CACE	@cond_branch
	mov	r0, #0x88
	lsl	r0, r0, #0x2
	add	r1, r7, r0
	mov	r0, #0x0
	strh	r0, [r1]
	add	r0, r7, #0
	mov	r1, #0x40
	bl	UnsetRiderFlag
.L804CACE:
	mov	r1, #0xe2
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r6, [r0]
	mov	r2, r8
	BIC	r6, r2
	mov	r3, #0xe4
	lsl	r3, r3, #0x1
	add	r1, r7, r3
	strh	r6, [r1]
	ldrh	r0, [r0]
	BIC	r2, r0
	mov	r1, #0xe3
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r2, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	add	r0, r7, #0
	bl	UnsetRiderFlag
	add	sp, sp, #0x18
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804CB04:
	.align	2, 0

	.4byte	0xffffff00
	thumb_func_end RiderAI_804C8F0

.align 2, 0 @ Don't pad with nop.
