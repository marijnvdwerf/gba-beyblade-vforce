	.include "asm/common.inc"

	thumb_func_start sub_805DF04
sub_805DF04:
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r1]
	lsl	r0, r3, #0x2
	add	r0, r0, #0x20
	add	r6, r1, r0
	cmp	r2, #0
	bge	.L1	@cond_branch
	mov	r2, #0x0
.L1:
	asr	r0, r2, #0xa
	add	r5, r3, #0
	cmp	r0, r5
	blt	.L2	@cond_branch
	sub	r0, r5, #1
	lsl	r0, r0, #0xa
	ldr	r1, .L5
	and	r2, r2, r1
	orr	r2, r2, r0
.L2:
	asr	r4, r2, #0xa
	ldr	r1, .L5
	add	r0, r1, #0
	and	r2, r2, r0
	mov	ip, r2
	cmp	r4, #0
	ble	.L3	@cond_branch
	lsl	r1, r4, #0x4
	add	r0, r1, r6
	sub	r0, r0, #0x10
	ldrh	r7, [r0, #0x8]
	add	r2, r1, #0
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x3ff
.L3:
	ldrh	r7, [r6, #0x8]
	lsl	r2, r4, #0x4
.L4:
	add	r3, r2, r6
	ldrh	r1, [r3, #0xa]
	sub	r0, r5, #2
	cmp	r4, r0
	bge	.L7	@cond_branch
	add	r0, r3, #0
	add	r0, r0, #0x10
	ldrh	r3, [r0, #0x8]
	ldrh	r4, [r0, #0xa]
	b	.L8
.L7:
	ldrh	r3, [r3, #0x8]
	add	r4, r3, #0
.L8:
	lsl	r1, r1, #0x10
	lsl	r0, r7, #0x10
	asr	r5, r0, #0x10
	add	r7, r0, #0
	cmp	r1, r7
	beq	.L10	@cond_branch
	lsl	r1, r4, #0x10
	lsl	r0, r3, #0x10
	asr	r3, r0, #0x10
	cmp	r1, r0
	beq	.L10	@cond_branch
	sub	r0, r3, r5
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	lsl	r1, r3, #0x10
	asr	r0, r1, #0x10
	cmp	r0, #0
	bge	.L11	@cond_branch
	NEG	r0, r0
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	b	.L12
.L11:
	lsr	r1, r1, #0x10
.L12:
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x80
	ble	.L13	@cond_branch
	sub	r0, r0, #0xff
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L13:
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x10
	mov	r1, ip
	mul	r1, r1, r0
	add	r0, r1, #0
	lsl	r0, r0, #0x6
	lsr	r1, r0, #0x10
	lsl	r0, r3, #0x10
	cmp	r0, #0
	bge	.L14	@cond_branch
	lsl	r0, r1, #0x10
	NEG	r0, r0
	lsr	r1, r0, #0x10
.L14:
	asr	r0, r7, #0x10
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	add	r1, r0, r1
	mov	r0, #0xff
	and	r1, r1, r0
	b	.L15
.L10:
	add	r0, r2, r6
	ldrh	r1, [r0, #0x8]
.L15:
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805DF04

.align 2, 0 @ Don't pad with nop.
