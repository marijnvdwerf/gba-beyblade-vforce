	.include "asm/common.inc"

	thumb_func_start sub_8056910
sub_8056910:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	add	r4, r0, #0
	str	r1, [sp]
	mov	r8, r2
	add	r7, r3, #0
	ldr	r1, [r1]
	bl	GetPointAtIndex
	mov	sl, r0
	ldr	r0, [sp]
	ldr	r1, [r0, #0x4]
	add	r0, r4, #0
	bl	GetPointAtIndex
	mov	r9, r0
	mov	r0, #0x2
	ldr	r1, [sp]
	ldrb	r1, [r1, #0x11]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L805697C	@cond_branch
	mov	r2, r9
	ldr	r2, [r2, #0x4]
	lsl	r2, r2, #0x5
	mov	ip, r2
	mov	r3, sl
	ldr	r4, [r3, #0x4]
	lsl	r6, r4, #0x5
	sub	r2, r2, r6
	str	r2, [sp, #0x4]
	mov	r3, r8
	add	r3, r3, #0x9c
	mov	r5, #0x0
	ldsh	r0, [r3, r5]
	lsl	r0, r0, #0x8
	mov	r1, r8
	ldr	r2, [r1, #0x8]
	add	r0, r2, r0
	ldr	r1, [r1, #0x44]
	add	r0, r0, r1
	sub	r0, r0, r6
	mov	r8, r0
	add	r0, r3, #0
	str	r2, [sp, #0xc]
	mov	r2, r9
	ldr	r2, [r2, #0x4]
	cmp	r4, r2
	blt	.L80569B2	@cond_branch
	b	.L80569BC
.L805697C:
	mov	r3, r9
	ldr	r3, [r3]
	lsl	r3, r3, #0x5
	mov	ip, r3
	mov	r5, sl
	ldr	r4, [r5]
	lsl	r6, r4, #0x5
	sub	r3, r3, r6
	str	r3, [sp, #0x4]
	mov	r3, r8
	add	r3, r3, #0x9a
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x8
	mov	r5, r8
	ldr	r2, [r5, #0x4]
	add	r0, r2, r0
	ldr	r1, [r5, #0x40]
	add	r0, r0, r1
	sub	r0, r0, r6
	mov	r8, r0
	add	r0, r3, #0
	str	r2, [sp, #0xc]
	mov	r2, r9
	ldr	r2, [r2]
	cmp	r4, r2
	bge	.L80569BC	@cond_branch
.L80569B2:
	add	r4, r6, #0
	mov	r5, ip
	mov	r3, sl
	mov	ip, r9
	b	.L80569C4
.L80569BC:
	mov	r4, ip
	add	r5, r6, #0
	mov	r3, r9
	mov	ip, sl
.L80569C4:
	mov	r6, #0x0
	ldsh	r0, [r0, r6]
	lsl	r0, r0, #0x8
	ldr	r2, [sp, #0xc]
	add	r0, r2, r0
	add	r0, r0, r1
	sub	r2, r0, r4
	sub	r5, r5, r4
	str	r5, [sp, #0x8]
	mov	r4, sl
	ldr	r0, [r4, #0x8]
	lsl	r0, r0, #0x5
	mov	sl, r0
	mov	r5, r9
	ldr	r0, [r5, #0x8]
	lsl	r0, r0, #0x5
	mov	r9, r0
	ldr	r6, [sp]
	ldrh	r6, [r6, #0x1a]
	mov	r0, r8
	mul	r0, r0, r6
	asr	r5, r0, #0x10
	ldr	r0, [sp, #0x4]
	cmp	r0, #0
	bge	.L80569F8	@cond_branch
	neg	r5, r5
.L80569F8:
	ldr	r1, [sp]
	mov	r0, #0x18
	ldsb	r0, [r1, r0]
	ldrb	r1, [r1, #0x19]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	sub	r1, r1, r0
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	ldr	r4, [sp, #0x4]
	cmp	r4, #0
	bge	.L8056A1C	@cond_branch
	lsl	r0, r1, #0x10
	neg	r0, r0
	lsr	r1, r0, #0x10
.L8056A1C:
	mov	r0, #0x2
	ldr	r6, [sp]
	ldrb	r6, [r6, #0x11]
	and	r0, r0, r6
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8056A3A	@cond_branch
	strb	r0, [r7, #0xd]
	strb	r1, [r7, #0xe]
	mov	r0, #0x2
	neg	r0, r0
	ldrb	r4, [r7, #0xc]
	and	r0, r0, r4
	b	.L8056A46
.L8056A3A:
	mov	r0, #0x0
	strb	r1, [r7, #0xd]
	strb	r0, [r7, #0xe]
	mov	r0, #0x1
	ldrb	r6, [r7, #0xc]
	orr	r0, r0, r6
.L8056A46:
	strb	r0, [r7, #0xc]
	strb	r1, [r7, #0xf]
	cmp	r2, #0
	bge	.L8056A5E	@cond_branch
	ldr	r0, [r3, #0x8]
	lsl	r0, r0, #0x5
	str	r0, [r7, #0x8]
	mov	r0, #0x3
	neg	r0, r0
	ldrb	r1, [r7, #0xc]
	and	r0, r0, r1
	b	.L8056ACA
.L8056A5E:
	ldr	r3, [sp, #0x8]
	cmp	r2, r3
	blt	.L8056A76	@cond_branch
	mov	r4, ip
	ldr	r0, [r4, #0x8]
	lsl	r0, r0, #0x5
	str	r0, [r7, #0x8]
	mov	r0, #0x3
	neg	r0, r0
	ldrb	r5, [r7, #0xc]
	and	r0, r0, r5
	b	.L8056ACA
.L8056A76:
	ldr	r6, [sp]
	mov	r1, #0x1c
	ldsh	r0, [r6, r1]
	lsl	r0, r0, #0x5
	mov	r3, sl
	add	r2, r3, r0
	mov	r4, #0x12
	ldsh	r3, [r6, r4]
	lsl	r3, r3, #0x5
	mov	r6, r9
	add	r4, r6, r3
	add	r1, r0, #0
	mul	r1, r1, r5
	asr	r1, r1, #0xa
	add r1, sl
	sub	r0, r4, r2
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r2, r2, r0
	neg	r3, r3
	add	r0, r3, #0
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r4, r4, r0
	sub	r0, r2, r1
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r1, r1, r0
	sub	r4, r4, r2
	add	r0, r4, #0
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r2, r2, r0
	sub	r2, r2, r1
	add	r0, r2, #0
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	add	r1, r1, r0
	str	r1, [r7, #0x8]
	mov	r0, #0x2
	ldrb	r1, [r7, #0xc]
	orr	r0, r0, r1
.L8056ACA:
	strb	r0, [r7, #0xc]
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8056910

.align 2, 0 @ Don't pad with nop.
