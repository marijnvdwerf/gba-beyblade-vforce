	.include "asm/common.inc"

	thumb_func_start sub_80594FC
sub_80594FC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	mov	ip, r0
	add	r7, r1, #0
	mov	r9, r2
	add	r5, r3, #0
	ldr	r6, [sp, #0x38]
	ldr	r4, [r0, #0x70]
	add	r0, r0, #0x5c
	ldrb	r0, [r0]
	lsl	r1, r0, #0xb
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r1, r1, r0
	str	r1, [sp]
	mov	r3, #0x2
	neg	r3, r3
	mov	r0, ip
	ldr	r0, [r0]
	str	r0, [sp, #0x4]
	mov	r2, ip
	add	r2, r2, #0x5f
	mov	r0, #0x1
	add	r1, r0, #0
	ldrb	r2, [r2]
	lsl	r1, r2
	sub	r2, r1, #1
	mov	r8, r2
	mov	r2, ip
	add	r2, r2, #0x60
	ldrb	r2, [r2]
	lsl	r0, r2
	sub	r0, r0, #0x1
	str	r0, [sp, #0x8]
	str	r1, [sp, #0xc]
	and	r6, r6, r3
	and	r5, r5, r3
	and	r7, r7, r3
	cmp	r6, #0
	bne	.L8059556	@cond_branch
	mov	r6, #0x2
.L8059556:
	ldr	r1, [sp, #0x4]
	mov	r0, r9
	mul	r0, r0, r1
	add	r0, r0, r7
	add	r4, r4, r0
	mov	r2, r8
	and	r5, r5, r2
	ldr	r3, [sp, #0x34]
	ldr	r7, [sp, #0x3c]
	add	r0, r3, r7
	cmp	r3, r0
	bcs	.L80595EC	@cond_branch
	ldr	r2, .L80595C8
	ldr	r0, [sp, #0xc]
	sub	r0, r0, r5
	mov	sl, r0
	lsr	r0, r0, #0x1
	mov	r1, #0x80
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	mov	r9, r0
	mov	r7, sl
	sub	r0, r6, r7
	lsr	r0, r0, #0x1
	mov	r8, r0
	orr	r0, r0, r1
	mov	r8, r0
	lsr	r0, r6, #0x1f
	add	r0, r6, r0
	asr	r0, r0, #0x1
	orr	r0, r0, r1
	str	r0, [sp, #0x10]
.L8059596:
	add	r1, r3, #0
	ldr	r7, [sp, #0x8]
	and	r1, r1, r7
	mov	r0, ip
	add	r0, r0, #0x5f
	ldrb	r0, [r0]
	lsl	r1, r0
	add	r0, r5, r6
	ldr	r7, [sp, #0xc]
	cmp	r0, r7
	bls	.L80595CC	@cond_branch
	str	r4, [r2]
	ldr	r0, [sp]
	add	r1, r0, r1
	add	r0, r1, r5
	str	r0, [r2, #0x4]
	mov	r7, r9
	str	r7, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	mov	r7, sl
	add	r0, r4, r7
	str	r0, [r2]
	str	r1, [r2, #0x4]
	mov	r0, r8
	b	.L80595D8
.L80595C8:
	.align	2, 0

	.4byte	0x40000d4
.L80595CC:
	str	r4, [r2]
	ldr	r7, [sp]
	add	r0, r7, r1
	add	r0, r0, r5
	str	r0, [r2, #0x4]
	ldr	r0, [sp, #0x10]
.L80595D8:
	str	r0, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	ldr	r1, [sp, #0x4]
	add	r4, r4, r1
	add	r3, r3, #0x1
	ldr	r7, [sp, #0x34]
	ldr	r1, [sp, #0x3c]
	add	r0, r7, r1
	cmp	r3, r0
	bcc	.L8059596	@cond_branch
.L80595EC:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80594FC

.align 2, 0 @ Don't pad with nop.
