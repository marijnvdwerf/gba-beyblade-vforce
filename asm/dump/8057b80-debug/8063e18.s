	.include "asm/common.inc"

	thumb_func_start sub_8063E18
sub_8063E18:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff0
	add	r4, r0, #0
	mov	r9, r1
	mov	r8, r2
	add	r6, r3, #0
	ldr	r0, [sp, #0x34]
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	mov	r7, #0x0
	mov	r0, #0xf8
	bl	slowAllocate
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L1	@cond_branch
	ldr	r7, [r1]
	add	r0, r7, #0
	add	r0, r0, #0xc4
	str	r1, [r0]
	str	r4, [r7]
	mov	r4, #0x0
	mov	r0, r8
	strb	r0, [r7, #0x11]
	add	r0, r7, #0
	add	r0, r0, #0xb8
	mov	r2, #0x0
	strh	r5, [r0]
	sub	r0, r0, #0x1c
	str	r6, [r0]
	add	r1, r7, #0
	add	r1, r1, #0xa0
	ldr	r0, [sp, #0x2c]
	str	r0, [r1]
	add	r1, r1, #0x4
	ldr	r0, [sp, #0x30]
	str	r0, [r1]
	add	r0, r7, #0
	add	r0, r0, #0xa8
	str	r4, [r0]
	add	r1, r1, #0x8
	add	r0, r0, #0x8
	str	r4, [r0]
	str	r4, [r1]
	add	r0, r0, #0xe
	strb	r2, [r0]
	sub	r0, r0, #0x2
	strh	r4, [r0]
	add	r0, r0, #0x4
	strb	r2, [r0]
	sub	r0, r0, #0x6
	strh	r4, [r0]
	add	r0, r7, #0
	mov	r1, r9
	bl	sub_8063DF0
	add	r0, r7, #0
	add	r0, r0, #0xf4
	str	r4, [r0]
	sub	r0, r0, #0x4
	str	r4, [r0]
	add	r5, r7, #0
	add	r5, r5, #0xec
	str	r4, [r5]
	mov	r0, r8
	lsl	r1, r0, #0x10
	lsr	r1, r1, #0x10
	add	r0, r5, #0
	mov	r2, #0x0
	bl	sub_8060C1C
	add	r1, r7, #0
	add	r1, r1, #0xc8
	str	r0, [r1]
	ldr	r6, [r5]
	cmp	r4, r8
	bcs	.L2	@cond_branch
	mov	r5, #0x0
.L3:
	ldr	r1, [r7, #0x4]
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r0, r6, #0
	mov	r2, #0xf0
	lsl	r2, r2, #0x8
	mov	r3, #0xa0
	lsl	r3, r3, #0x8
	bl	LoadSpriteSheet
	ldr	r6, [r6, #0x4]
	add	r4, r4, #0x1
	cmp	r4, r8
	bcc	.L3	@cond_branch
.L2:
	add	r1, r7, #0
	add	r1, r1, #0xdc
	ldr	r0, .L6
	str	r0, [r1]
	add	r1, r1, #0x4
	ldr	r0, .L6 + 4
	str	r0, [r1]
	add	r1, r1, #0x4
	ldr	r0, .L6 + 8
	str	r0, [r1]
	add	r1, r1, #0x4
	ldr	r0, .L6 + 12
	str	r0, [r1]
	mov	r0, #0x0
	strb	r0, [r7, #0x13]
	mov	r4, #0x0
	add	r3, r7, #0
	add	r3, r3, #0x1c
	add	r2, r7, #0
	add	r2, r2, #0x14
.L4:
	add	r1, r2, r4
	mov	r5, r9
	ldrb	r0, [r5, #0xa]
	strb	r0, [r1]
	add	r4, r4, #0x1
	cmp	r4, #0x7
	ble	.L4	@cond_branch
	add	r1, r3, #0
	mov	r2, #0x0
	add	r0, r1, #0
	add	r0, r0, #0x7f
.L5:
	strb	r2, [r0]
	sub	r0, r0, #0x1
	cmp	r0, r1
	bge	.L5	@cond_branch
.L1:
	add	r0, r7, #0
	add	sp, sp, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L7:
	.align	2, 0
.L6:
	.4byte	nullsub_22 + 1
	.4byte	nullsub_16 + 1
	.4byte	nullsub_21 + 1
	.4byte	sub_8063DAC + 1
	thumb_func_end sub_8063E18

.align 2, 0 @ Don't pad with nop.
