	.include "asm/common.inc"

	thumb_func_start sub_805ED60
sub_805ED60:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff4
	add	r7, r0, #0
	add	r4, r1, #0
	bl	nullsub_12
	add	r5, r0, #0
	add	r0, r4, #0
	mov	r1, sp
	bl	sub_8058754
	mov	r0, #0xd5
	lsl	r0, r0, #0x2
	add	r1, r7, r0
	mov	r0, #0x1
	ldrb	r2, [r1]
	orr	r0, r0, r2
	strb	r0, [r1]
	ldrb	r6, [r4, #0x10]
	lsr	r1, r6, #0x1
	mov	r0, #0xa0
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	ldr	r3, [r5, #0x40]
	add	r0, r3, r0
	ldr	r2, [sp]
	sub	r2, r2, r0
	str	r2, [r5, #0x14]
	add	r0, r4, #0
	add	r0, r0, #0xa2
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	add	r0, r0, #0x50
	ldrb	r4, [r4, #0x11]
	lsr	r1, r4, #0x1
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	ldr	r1, [r5, #0x44]
	add	r1, r1, r0
	ldr	r0, [sp, #0x4]
	sub	r0, r0, r1
	str	r0, [r5, #0x18]
	add	r2, r3, r2
	cmp	r2, #0
	bge	.L1	@cond_branch
	NEG	r0, r3
	str	r0, [r5, #0x14]
.L1:
	ldr	r3, [r5, #0x44]
	ldr	r0, [r5, #0x18]
	add	r0, r3, r0
	add	r1, r3, #0
	cmp	r0, #0
	bge	.L2	@cond_branch
	NEG	r0, r1
	str	r0, [r5, #0x18]
.L2:
	ldr	r4, [r5, #0x40]
	ldr	r0, [r5, #0x14]
	add	r0, r4, r0
	ldr	r1, [r5]
	lsl	r2, r1, #0xb
	ldr	r6, .L8
	add	r1, r2, r6
	cmp	r0, r1
	ble	.L3	@cond_branch
	mov	r1, #0xf0
	lsl	r1, r1, #0x8
	add	r0, r4, r1
	sub	r0, r2, r0
	str	r0, [r5, #0x14]
.L3:
	ldr	r0, [r5, #0x18]
	add	r0, r3, r0
	ldr	r1, [r5, #0x4]
	lsl	r2, r1, #0xb
	ldr	r4, .L8 + 4
	add	r1, r2, r4
	cmp	r0, r1
	ble	.L4	@cond_branch
	mov	r6, #0xa0
	lsl	r6, r6, #0x8
	add	r0, r3, r6
	sub	r0, r2, r0
	str	r0, [r5, #0x18]
.L4:
	mov	r1, #0x0
	mov	r0, #0x88
	lsl	r0, r0, #0x2
	add	r0, r0, r7
	mov	ip, r0
.L7:
	mov	r2, ip
	ldr	r4, [r2]
	lsl	r1, r1, #0x10
	asr	r3, r1, #0x10
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r2, r0, #0x3
	add	r0, r4, #0
	add	r0, r0, #0x14
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r6, r1, #0
	cmp	r0, #0
	beq	.L6	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x28
	add	r0, r0, r2
	ldrh	r2, [r0]
	lsl	r0, r3, #0x4
	add	r0, r0, r3
	lsl	r0, r0, #0x3
	add	r3, r7, r0
	cmp	r3, r5
	beq	.L6	@cond_branch
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	ldr	r1, [r5, #0x14]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x5
	add	r1, r1, r0
	str	r1, [r3, #0x14]
	ldr	r1, [r5, #0x18]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r0, r0, #0x5
	add	r1, r1, r0
	str	r1, [r3, #0x18]
.L6:
	mov	r4, #0x80
	lsl	r4, r4, #0x9
	add	r0, r6, r4
	lsr	r1, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x3
	ble	.L7	@cond_branch
	add	sp, sp, #0xc
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L9:
	.align	2, 0
.L8:
	.4byte	0xffff1000
	.4byte	0xffff6000
	thumb_func_end sub_805ED60

.align 2, 0 @ Don't pad with nop.
