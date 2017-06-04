	.include "asm/common.inc"

	thumb_func_start sub_8058AA8
sub_8058AA8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	add	r7, r0, #0
	add	r5, r2, #0
	ldr	r6, [sp, #0x28]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	str	r1, [sp]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	str	r3, [sp, #0x4]
	lsl	r6, r6, #0x10
	lsr	r6, r6, #0x10
	str	r5, [r7, #0x68]
	ldrb	r1, [r5, #0x18]
	add	r0, r0, #0x64
	mov	r4, #0x0
	strh	r1, [r0]
	ldrh	r2, [r0]
	add	r0, r7, #0
	ldr	r1, [sp, #0x4]
	bl	sub_8059284
	mov	sl, r0
	ldrb	r0, [r5, #0x19]
	mov	r9, r0
	ldr	r1, [sp]
	lsl	r2, r1, #0x1
	add	r2, r2, r1
	lsl	r2, r2, #0x3
	ldr	r0, .L3
	add	r2, r2, r0
	str	r2, [r7, #0x8]
	str	r4, [r2, #0x10]
	str	r4, [r2, #0x14]
	str	r4, [r2]
	add	r3, r7, #0
	add	r3, r3, #0x5f
	mov	r1, #0x1
	add	r0, r1, #0
	ldrb	r3, [r3]
	LSL	r0, r3
	sub	r0, r0, #0x1
	str	r0, [r2, #0x8]
	str	r4, [r2, #0x4]
	add	r0, r7, #0
	add	r0, r0, #0x60
	ldrb	r0, [r0]
	LSL	r1, r0
	sub	r1, r1, #0x1
	str	r1, [r2, #0xc]
	ldrh	r0, [r5, #0x1c]
	str	r0, [r7]
	ldrh	r0, [r5, #0x1e]
	str	r0, [r7, #0x4]
	add	r0, r7, #0
	add	r0, r0, #0x5e
	mov	r2, sp
	ldrb	r2, [r2]
	strb	r2, [r0]
	str	r4, [r7, #0xc]
	str	r4, [r7, #0x10]
	str	r4, [r7, #0x14]
	str	r4, [r7, #0x18]
	str	r4, [r7, #0x1c]
	str	r4, [r7, #0x20]
	str	r4, [r7, #0x54]
	str	r4, [r7, #0x58]
	mov	r0, #0x10
	str	r0, [r7, #0x24]
	str	r4, [r7, #0x40]
	str	r4, [r7, #0x44]
	str	r4, [r7, #0x28]
	str	r4, [r7, #0x2c]
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r7, #0x30]
	str	r0, [r7, #0x34]
	str	r4, [r7, #0x38]
	str	r4, [r7, #0x3c]
	add	r0, r7, #0
	add	r0, r0, #0x48
	strh	r4, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
	str	r4, [r7, #0x4c]
	str	r4, [r7, #0x50]
	mov	r0, #0xc
	and	r6, r6, r0
	add	r0, r7, #0
	add	r0, r0, #0x7c
	strb	r6, [r0]
	add	r1, r7, #0
	add	r1, r1, #0x80
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r1]
	add	r0, r7, #0
	add	r0, r0, #0x84
	str	r4, [r0]
	ldr	r0, [r5, #0x4]
	add	r0, r5, r0
	str	r0, [r7, #0x6c]
	ldr	r1, [r5, #0x8]
	str	r1, [r7, #0x74]
	ldr	r0, [r5, #0xc]
	add	r0, r5, r0
	str	r0, [r7, #0x70]
	ldr	r0, [r5, #0x10]
	str	r0, [r7, #0x78]
	sub	r1, r1, #0x1
	lsr	r1, r1, #0xe
	mov	r8, r1
	ldr	r6, .L3 + 4
	ldrb	r0, [r6]
	add	r2, r7, #0
	add	r2, r2, #0x5d
	strb	r0, [r2]
	ldrb	r0, [r5, #0x14]
	add	r1, r7, #0
	add	r1, r1, #0x61
	strb	r0, [r1]
	ldr	r4, [r7, #0x74]
	cmp	r4, #0
	beq	.L1	@cond_branch
	ldr	r3, .L3 + 8
	ldr	r0, [r7, #0x6c]
	ldrb	r2, [r2]
	lsl	r1, r2, #0xe
	mov	r2, #0xc0
	lsl	r2, r2, #0x13
	add	r1, r1, r2
	ldr	r3, [r3]
	add	r2, r4, #0
	bl	_call_via_r3
	ldrb	r0, [r6]
	add	r0, r0, #0x1
	ADD r0, r8
	strb	r0, [r6]
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000ca0
	.4byte	0x3000de0
	.4byte	0x807d974
.L1:
	mov	r0, #0x0
	strb	r0, [r2]
.L2:
	mov	r0, r8
	add	r0, r0, #0x1
	lsl	r0, r0, #0xe
	ldr	r1, [r7, #0x74]
	sub	r0, r0, r1
	cmp	r0, sl
	bcc	.L6	@cond_branch
	cmp	r1, #0
	beq	.L6	@cond_branch
	mov	r3, sl
	lsr	r2, r3, #0xb
	add	r1, r2, #0
	cmp	r2, #0
	bne	.L7	@cond_branch
	mov	r1, #0x1
.L7:
	ldr	r0, .L10
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	sub	r0, r0, r1
	add	r1, r7, #0
	add	r1, r1, #0x5c
	strb	r0, [r1]
	ldr	r3, .L10 + 4
	ldrb	r4, [r3]
	sub	r0, r4, r2
	add	r4, r1, #0
	ldrb	r1, [r4]
	cmp	r1, r0
	bcc	.L9	@cond_branch
	strb	r0, [r3]
	strb	r0, [r4]
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3000de0
	.4byte	0x3000e3c
.L6:
	ldr	r0, .L12
	mov	r2, sl
	lsr	r1, r2, #0xb
	ldrb	r3, [r0]
	sub	r1, r3, r1
	strb	r1, [r0]
	add	r0, r7, #0
	add	r0, r0, #0x5c
	strb	r1, [r0]
	add	r4, r0, #0
.L9:
	ldr	r0, [sp]
	bl	GetBGLayerCntPtr
	ldrb	r4, [r4]
	lsl	r1, r4, #0x8
	ldr	r4, [sp, #0x4]
	orr	r1, r1, r4
	add	r2, r7, #0
	add	r2, r2, #0x5d
	ldrb	r2, [r2]
	lsl	r2, r2, #0x2
	orr	r1, r1, r2
	mov	r3, #0x1
	mov	r2, #0x1
	mov	r4, r9
	and	r4, r4, r2
	EOR	r4, r3
	lsl	r2, r4, #0x7
	orr	r1, r1, r2
	strh	r1, [r0]
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.4byte	0x3000e3c
	thumb_func_end sub_8058AA8

.align 2, 0 @ Don't pad with nop.
