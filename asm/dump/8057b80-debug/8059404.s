	.include "asm/common.inc"

	thumb_func_start sub_8059404
sub_8059404:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	mov	ip, r0
	mov	sl, r3
	ldr	r5, [r0, #0x70]
	add	r0, r0, #0x5c
	ldrb	r0, [r0]
	lsl	r3, r0, #0xb
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r3, r3, r0
	str	r3, [sp]
	mov	r3, ip
	ldr	r0, [r3]
	add	r3, r2, #0
	mul	r3, r3, r0
	add	r3, r3, r1
	str	r0, [sp, #0x4]
	mov	r2, ip
	add	r2, r2, #0x5f
	mov	r0, #0x1
	add	r1, r0, #0
	ldrb	r2, [r2]
	LSL	r1, r2
	sub	r4, r1, #1
	mov	r2, ip
	add	r2, r2, #0x60
	ldrb	r2, [r2]
	LSL	r0, r2
	sub	r0, r0, #0x1
	str	r0, [sp, #0x8]
	str	r1, [sp, #0xc]
	lsl	r3, r3, #0x1
	add	r5, r5, r3
	mov	r7, sl
	and	r7, r7, r4
	mov	sl, r7
	ldr	r3, [sp, #0x34]
	ldr	r1, [sp, #0x3c]
	add	r0, r3, r1
	cmp	r3, r0
	bcs	.L1	@cond_branch
	ldr	r2, .L4
	add	r4, r7, #0
	lsl	r4, r4, #0x1
	mov	r8, r4
	ldr	r1, [sp, #0xc]
	sub	r0, r1, r7
	lsl	r4, r0, #0x1
	mov	r9, r4
	lsr	r4, r4, #0x1
	mov	r1, #0x80
	lsl	r1, r1, #0x18
	orr	r4, r4, r1
	str	r4, [sp, #0x10]
	ldr	r7, [sp, #0x38]
	sub	r0, r7, r0
	lsl	r0, r0, #0x1
	lsr	r6, r0, #0x1
	orr	r6, r6, r1
	lsl	r0, r7, #0x1
	lsr	r4, r0, #0x1
	orr	r4, r4, r1
.L6:
	add	r1, r3, #0
	ldr	r0, [sp, #0x8]
	and	r1, r1, r0
	mov	r0, ip
	add	r0, r0, #0x5f
	ldrb	r0, [r0]
	LSL	r1, r0
	ldr	r0, [sp, #0x38]
	ADD r0, sl
	ldr	r7, [sp, #0xc]
	cmp	r0, r7
	bls	.L2	@cond_branch
	str	r5, [r2]
	lsl	r1, r1, #0x1
	ldr	r0, [sp]
	add	r1, r0, r1
	mov	r7, r8
	add	r0, r1, r7
	str	r0, [r2, #0x4]
	ldr	r0, [sp, #0x10]
	str	r0, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	mov	r7, r9
	add	r0, r5, r7
	str	r0, [r2]
	str	r1, [r2, #0x4]
	str	r6, [r2, #0x8]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x40000d4
.L2:
	str	r5, [r2]
	lsl	r0, r1, #0x1
	ldr	r1, [sp]
	add	r0, r1, r0
	ADD r0, r8
	str	r0, [r2, #0x4]
	str	r4, [r2, #0x8]
.L3:
	ldr	r0, [r2, #0x8]
	ldr	r7, [sp, #0x4]
	lsl	r0, r7, #0x1
	add	r5, r5, r0
	add	r3, r3, #0x1
	ldr	r1, [sp, #0x34]
	ldr	r7, [sp, #0x3c]
	add	r0, r1, r7
	cmp	r3, r0
	bcc	.L6	@cond_branch
.L1:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059404

.align 2, 0 @ Don't pad with nop.
