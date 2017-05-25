	.include "asm/common.inc"

	thumb_func_start sub_8055D64
sub_8055D64:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	str	r0, [sp, #0x4]
	add	r4, r1, #0
	mov	r9, r2
	mov	r8, r3
	ldr	r0, [sp, #0x34]
	ldr	r1, [sp, #0x38]
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	sl, r0
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	lsl	r0, r5, #0x18
	lsr	r0, r0, #0x18
	ldrb	r2, [r4, #0x8]
	lsl	r1, r2, #0x1c
	lsr	r1, r1, #0x18
	bl	sub_804E358
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	mov	r3, #0x10
	str	r3, [sp, #0x8]
	str	r5, [sp, #0xc]
	mov	r7, #0x8
	add	r0, r7, #0
	mov	r1, r8
	ldrb	r1, [r1, #0x11]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, r9
	mov	r1, r8
	bl	sub_805BAC0
	bl	GetStruct4
	str	r0, [sp, #0x10]
.L1:
	mov	r1, #0x80
	lsl	r1, r1, #0xe
	add	r0, r4, #0
	bl	SetRiderFlag
	mov	r2, #0xdc
	lsl	r2, r2, #0x1
	add	r0, r4, r2
	strh	r7, [r0]
	lsl	r0, r6, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0
	bge	.L2	@cond_branch
	NEG	r0, r0
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	ldr	r3, [sp, #0x8]
	NEG	r0, r3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x8]
.L2:
	lsl	r2, r6, #0x10
	mov	r0, #0x90
	mov	r1, sl
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L3	@cond_branch
	add	r0, r7, #0
	mov	r3, r8
	ldrb	r3, [r3, #0x11]
	and	r0, r0, r3
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r0, [r4, #0x40]
	NEG	r0, r0
	str	r0, [r4, #0x40]
	b	.L7
.L4:
	ldr	r1, [sp, #0x10]
	ldr	r0, [r1, #0x40]
	lsl	r0, r0, #0x1
	ldr	r1, [r4, #0x40]
	sub	r0, r0, r1
	str	r0, [r4, #0x40]
	b	.L7
.L3:
	mov	r0, #0x9
	mov	r3, sl
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L7	@cond_branch
	add	r0, r7, #0
	mov	r1, r8
	ldrb	r1, [r1, #0x11]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8	@cond_branch
	ldr	r0, [r4, #0x44]
	b	.L9
.L8:
	ldr	r3, [sp, #0x10]
	ldr	r1, [r3, #0x44]
	lsl	r1, r1, #0x1
	ldr	r0, [r4, #0x44]
	add	r0, r0, r1
.L9:
	NEG	r0, r0
	str	r0, [r4, #0x44]
.L7:
	ldr	r1, .L12
	add	r0, r2, r1
	cmp	r0, #0
	blt	.L10	@cond_branch
	lsl	r0, r5, #0x10
	mov	r2, #0x80
	lsl	r2, r2, #0x10
	add	r0, r0, r2
	asr	r0, r0, #0x10
	ldr	r3, [sp, #0x8]
	lsl	r1, r3, #0x10
	asr	r1, r1, #0x10
	add	r0, r0, r1
	b	.L11
.L13:
	.align	2, 0
.L12:
	.4byte	0xffc00000
.L10:
	lsl	r0, r5, #0x10
	asr	r0, r0, #0x10
	ldr	r2, [sp, #0x8]
	lsl	r1, r2, #0x10
	asr	r1, r1, #0x10
	sub	r0, r0, r1
.L11:
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	mov	r0, #0xff
	and	r5, r5, r0
	add	r0, r4, #0
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L14	@cond_branch
	ldr	r3, [sp, #0xc]
	lsl	r0, r3, #0x10
	asr	r0, r0, #0x10
	str	r0, [sp]
	ldr	r0, [sp, #0x4]
	add	r1, r4, #0
	mov	r2, r8
	mov	r3, sl
	bl	sub_8055F04
	b	.L15
.L14:
	lsl	r1, r5, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	bl	sub_804E1FC
.L15:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L18	@cond_branch
	mov	r0, #0x4
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	bl	sub_80558B8
	mov	r0, #0x0
	bl	sub_804ABFC
	ldr	r0, .L19
	ldr	r0, [r0]
	ldr	r1, .L19 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L18	@cond_branch
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r1, r4, r2
	ldr	r2, [r1]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r2, r0
	ble	.L18	@cond_branch
	ldr	r3, .L19 + 8
	add	r0, r2, r3
	str	r0, [r1]
.L18:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L20:
	.align	2, 0
.L19:
	.4byte	0x3000f48
	.4byte	0xc64
	.4byte	0xffffff00
	thumb_func_end sub_8055D64

.align 2, 0 @ Don't pad with nop.
