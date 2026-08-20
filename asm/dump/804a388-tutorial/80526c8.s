	.include "asm/common.inc"

	thumb_func_start sub_80526C8
sub_80526C8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffcc
	str	r0, [sp]
	mov	r9, r1
	str	r2, [sp, #0x4]
	ldr	r0, .L8052750
	ldr	r0, [r0]
	ldr	r2, .L8052750 + 4
	add	r1, r0, r2
	ldr	r1, [r1]
	str	r1, [sp, #0x8]
	mov	r3, r9
	ldrh	r3, [r3, #0x22]
	mov	sl, r3
	ldr	r4, .L8052750 + 8
	add	r1, r0, r4
	ldr	r7, [r1]
	ldr	r1, [sp]
	ldr	r1, [r1]
	str	r1, [sp, #0x20]
	ldr	r1, [sp, #0x4]
	add	r1, r1, #0xb8
	ldr	r1, [r1]
	str	r1, [sp, #0x24]
	ldr	r2, .L8052750 + 12
	add	r2, r0, r2
	str	r2, [sp, #0x28]
	ldr	r3, .L8052750 + 16
	add	r0, r0, r3
	bl	nullsub_12
	str	r0, [sp, #0x2c]
	ldr	r4, [sp, #0x8]
	cmp	r4, #0
	bne	.L8052718	@cond_branch
	b	.L805294C
.L8052718:
	ldr	r0, .L8052750 + 20
	mov	r1, r9
	ldrh	r1, [r1, #0x14]
	and	r0, r0, r1
	mov	r2, r9
	strh	r0, [r2, #0x14]
	ldr	r0, [r7, #0x3c]
	ldr	r3, [sp, #0x4]
	str	r0, [r3, #0x3c]
	sub	r4, r4, #0x1
	str	r4, [sp, #0x8]
.L805272E:
	add	r0, r7, #0
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L805273A	@cond_branch
	b	.L80528F8
.L805273A:
	add	r6, r0, #0
	add	r0, r7, #0
	add	r0, r0, #0xb4
	ldr	r5, [r0]
	cmp	r5, #0
	blt	.L8052768	@cond_branch
	lsl	r1, r5, #0x5
	ldr	r4, [sp, #0x28]
	ldr	r0, [r4, #0xc]
	add	r2, r0, r1
	b	.L805276A
.L8052750:
	.align	2, 0

	.4byte	_gameData
	.4byte	0xc84
	.4byte	0xc7c
	.4byte	0x65c
	.4byte	0x434
	.4byte	0xf3ff
.L8052768:
	mov	r2, #0x0
.L805276A:
	cmp	r2, #0
	beq	.L80527B8	@cond_branch
	ldr	r0, [r2]
	lsl	r0, r0, #0x4
	ldr	r3, [sp, #0x28]
	ldr	r1, [r3, #0x4]
	add	r4, r1, r0
	ldr	r0, [r2, #0x4]
	lsl	r0, r0, #0x4
	add	r3, r1, r0
	ldr	r2, [r4]
	ldr	r0, [r3]
	lsl	r1, r0, #0x5
	str	r1, [sp, #0x14]
	cmp	r2, r0
	bge	.L805278E	@cond_branch
	lsl	r2, r2, #0x5
	str	r2, [sp, #0x14]
.L805278E:
	ldr	r2, [r4, #0x4]
	ldr	r0, [r3, #0x4]
	lsl	r1, r0, #0x5
	str	r1, [sp, #0x18]
	cmp	r2, r0
	bge	.L805279E	@cond_branch
	lsl	r2, r2, #0x5
	str	r2, [sp, #0x18]
.L805279E:
	ldr	r1, [r4, #0x8]
	ldr	r0, [r3, #0x8]
	lsl	r2, r0, #0x5
	str	r2, [sp, #0x1c]
	cmp	r1, r0
	bge	.L80527AE	@cond_branch
	lsl	r1, r1, #0x5
	str	r1, [sp, #0x1c]
.L80527AE:
	add	r0, r5, #0
	bl	GetStruct4
	add	r4, r0, #0
	b	.L80527C6
.L80527B8:
	ldr	r3, [r7, #0x4]
	str	r3, [sp, #0x14]
	ldr	r4, [r7, #0x8]
	str	r4, [sp, #0x18]
	ldr	r0, [r7, #0xc]
	str	r0, [sp, #0x1c]
	mov	r4, #0x0
.L80527C6:
	ldr	r1, [r6, #0x8]
	str	r1, [sp, #0xc]
	ldr	r2, [r6, #0xc]
	str	r2, [sp, #0x10]
	add	r0, r6, #0
	bl	sub_80610EC
	lsl	r0, r0, #0x8
	ldr	r1, [r6, #0x8]
	add	r1, r1, r0
	mov	r8, r1
	add	r0, r6, #0
	bl	sub_8061110
	lsl	r0, r0, #0x8
	ldr	r1, [r6, #0xc]
	add	r1, r1, r0
	mov	r5, #0x0
	cmp	r4, #0
	beq	.L80527F6	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	beq	.L80527F6	@cond_branch
	add	r5, r0, #0
.L80527F6:
	mov	r3, #0x0
	mov	r4, r9
	ldr	r0, [r4, #0x8]
	cmp	r8, r0
	blt	.L805281E	@cond_branch
	mov	r2, #0x80
	lsl	r2, r2, #0x6
	add	r0, r0, r2
	ldr	r4, [sp, #0xc]
	cmp	r4, r0
	bge	.L805281E	@cond_branch
	mov	r4, r9
	ldr	r0, [r4, #0xc]
	cmp	r1, r0
	blt	.L805281E	@cond_branch
	add	r0, r0, r2
	ldr	r1, [sp, #0x10]
	cmp	r1, r0
	bge	.L805281E	@cond_branch
	mov	r3, #0x1
.L805281E:
	add	r0, r3, #0
	cmp	r5, #0
	beq	.L8052870	@cond_branch
	cmp	r0, #0
	bne	.L8052874	@cond_branch
	ldr	r2, [r5, #0x8]
	mov	r8, r2
	ldr	r3, [r5, #0xc]
	str	r3, [sp, #0x30]
	add	r0, r5, #0
	bl	sub_80610EC
	lsl	r0, r0, #0x8
	ldr	r4, [r5, #0x8]
	add	r4, r4, r0
	add	r0, r5, #0
	bl	sub_8061110
	lsl	r0, r0, #0x8
	ldr	r1, [r5, #0xc]
	add	r1, r1, r0
	mov	r3, #0x0
	mov	r2, r9
	ldr	r0, [r2, #0x8]
	cmp	r4, r0
	blt	.L805286E	@cond_branch
	mov	r2, #0x80
	lsl	r2, r2, #0x6
	add	r0, r0, r2
	cmp	r8, r0
	bge	.L805286E	@cond_branch
	mov	r4, r9
	ldr	r0, [r4, #0xc]
	cmp	r1, r0
	blt	.L805286E	@cond_branch
	add	r0, r0, r2
	ldr	r1, [sp, #0x30]
	cmp	r1, r0
	bge	.L805286E	@cond_branch
	mov	r3, #0x1
.L805286E:
	add	r0, r3, #0
.L8052870:
	cmp	r0, #0
	beq	.L80528F8	@cond_branch
.L8052874:
	ldr	r0, [r7, #0x3c]
	ldr	r2, [sp, #0x2c]
	cmp	r0, r2
	beq	.L80528A0	@cond_branch
	ldr	r3, .L80528DC
	add	r0, r3, #0
	mov	r4, r9
	ldrh	r4, [r4, #0x14]
	and	r0, r0, r4
	mov	r1, r9
	strh	r0, [r1, #0x14]
	mov	r2, #0xc0
	lsl	r2, r2, #0x4
	add	r1, r2, #0
	ldrh	r3, [r6, #0x14]
	and	r1, r1, r3
	orr	r0, r0, r1
	mov	r4, r9
	strh	r0, [r4, #0x14]
	ldr	r0, [r7, #0x3c]
	ldr	r1, [sp, #0x4]
	str	r0, [r1, #0x3c]
.L80528A0:
	ldr	r2, [sp, #0x20]
	ldr	r0, [r2, #0x4]
	ldr	r3, [sp, #0x14]
	cmp	r0, r3
	ble	.L80528B2	@cond_branch
	ldr	r0, [r2, #0x8]
	ldr	r4, [sp, #0x18]
	cmp	r0, r4
	bgt	.L80528C2	@cond_branch
.L80528B2:
	ldr	r1, [sp, #0x20]
	ldr	r0, [r1, #0xc]
	asr	r0, r0, #0x8
	add	r0, r0, #0x4
	ldr	r2, [sp, #0x1c]
	asr	r1, r2, #0x8
	cmp	r0, r1
	blt	.L80528E0	@cond_branch
.L80528C2:
	ldrh	r0, [r6, #0x22]
	cmp	sl, r0
	blt	.L80528CC	@cond_branch
	sub	r0, r0, #0x3
	mov	sl, r0
.L80528CC:
	cmp	r5, #0
	beq	.L80528F8	@cond_branch
	ldrh	r0, [r5, #0x22]
	cmp	sl, r0
	blt	.L80528F8	@cond_branch
	sub	r0, r0, #0x3
	b	.L80528F6
.L80528DA:
	.align	2, 0
.L80528DC:
	.4byte	0xf3ff
.L80528E0:
	ldrh	r0, [r6, #0x22]
	cmp	sl, r0
	bgt	.L80528EA	@cond_branch
	add	r0, r0, #0x3
	mov	sl, r0
.L80528EA:
	cmp	r5, #0
	beq	.L80528F8	@cond_branch
	ldrh	r0, [r5, #0x22]
	cmp	sl, r0
	bgt	.L80528F8	@cond_branch
	add	r0, r0, #0x3
.L80528F6:
	mov	sl, r0
.L80528F8:
	add	r7, r7, #0xc4
	ldr	r0, [sp, #0x8]
	add	r3, r0, #0
	sub	r3, r3, #0x1
	str	r3, [sp, #0x8]
	cmp	r0, #0
	beq	.L8052908	@cond_branch
	b	.L805272E
.L8052908:
	mov	r4, r9
	ldrh	r0, [r4, #0x22]
	cmp	r0, sl
	beq	.L805294C	@cond_branch
	mov	r0, sl
	lsl	r1, r0, #0x10
	lsr	r1, r1, #0x10
	mov	r0, r9
	bl	sub_8061078
	ldr	r1, [sp]
	mov	r2, #0xfa
	lsl	r2, r2, #0x2
	add	r0, r1, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8052938	@cond_branch
	mov	r3, #0xfb
	lsl	r3, r3, #0x2
	add	r0, r1, r3
	mov	r1, sl
	add	r1, r1, #0x1
	bl	sub_804E530
.L8052938:
	ldr	r4, [sp, #0x24]
	cmp	r4, #0
	beq	.L805294C	@cond_branch
	mov	r1, sl
	add	r1, r1, #0x2
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r0, r4, #0
	bl	sub_8061078
.L805294C:
	add	sp, sp, #0x34
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80526C8

.align 2, 0 @ Don't pad with nop.
