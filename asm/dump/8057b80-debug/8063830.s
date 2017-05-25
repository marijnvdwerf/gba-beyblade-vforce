	.include "asm/common.inc"

	thumb_func_start sub_8063830
sub_8063830:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	add	r5, r0, #0
	str	r1, [sp]
	mov	r8, r2
	mov	sl, r3
	mov	r0, #0x8
	ldsh	r6, [r5, r0]
	cmp	r8, r6
	blt	.L1	@cond_branch
	b	.L26
.L1:
	ldr	r4, [sp, #0x34]
	ADD r4, sl
	ldr	r1, [sp, #0x38]
	add	r4, r4, r1
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	add	r1, r6, #0
	bl	sub_8066084
	mov	r2, r8
	mul	r2, r2, r0
	str	r2, [sp, #0xc]
	ldrh	r7, [r5, #0x6]
	lsr	r7, r7, #0x1
	mov	ip, r7
	ldr	r0, [r5, #0xc]
	mov	r9, r0
	ldrh	r5, [r5, #0x4]
	lsl	r0, r5, #0x1
	ldr	r1, [sp]
	add	r0, r1, r0
	str	r0, [sp, #0x4]
	cmp	r4, #0
	bne	.L3	@cond_branch
	sub	r0, r6, #1
	cmp	r8, r0
	bne	.L4	@cond_branch
	ldr	r0, .L6
	lsl	r2, r7, #0x2
	ldr	r3, [r0]
	mov	r0, #0x0
	ldr	r1, [sp, #0x4]
	bl	call_via_r3
	b	.L26
.L7:
	.align	2, 0
.L6:
	.4byte	0x807d970
.L4:
	mov	r2, #0x1
	NEG	r2, r2
	ADD ip, r2
	add	r0, r2, #0
	cmp	ip, r0
	bne	.L8	@cond_branch
	b	.L26
.L8:
	mov	r5, #0x1f
	mov	r8, r5
.L10:
	mov	r6, r9
	add	r6, r6, #0x4
	mov	r9, r6
	sub	r6, r6, #0x4
	ldmia	r6!, {r0}
	add	r3, r0, #0
	mov	r7, r8
	and	r3, r3, r7
	lsr	r4, r0, #0x5
	and	r4, r4, r7
	lsr	r1, r0, #0xa
	and	r1, r1, r7
	lsr	r2, r0, #0x10
	and	r2, r2, r7
	lsr	r5, r0, #0x15
	and	r5, r5, r7
	lsr	r0, r0, #0x1a
	and	r0, r0, r7
	str	r0, [sp, #0x10]
	ldr	r6, [sp, #0xc]
	add	r0, r3, #0
	mul	r0, r0, r6
	asr	r0, r0, #0xa
	sub	r3, r3, r0
	add	r0, r4, #0
	mul	r0, r0, r6
	asr	r0, r0, #0xa
	sub	r4, r4, r0
	add	r0, r1, #0
	mul	r0, r0, r6
	asr	r0, r0, #0xa
	sub	r1, r1, r0
	add	r0, r2, #0
	mul	r0, r0, r6
	asr	r0, r0, #0xa
	sub	r2, r2, r0
	add	r0, r5, #0
	mul	r0, r0, r6
	asr	r0, r0, #0xa
	sub	r5, r5, r0
	ldr	r7, [sp, #0x10]
	add	r0, r7, #0
	mul	r0, r0, r6
	asr	r0, r0, #0xa
	add	r6, r7, #0
	sub	r6, r6, r0
	lsl	r0, r4, #0x5
	orr	r3, r3, r0
	lsl	r0, r1, #0xa
	orr	r3, r3, r0
	lsl	r0, r2, #0x10
	orr	r3, r3, r0
	lsl	r0, r5, #0x15
	orr	r3, r3, r0
	lsl	r0, r6, #0x1a
	orr	r3, r3, r0
	ldr	r7, [sp, #0x4]
	stmia	r7!, {r3}
	str	r7, [sp, #0x4]
	mov	r0, #0x1
	NEG	r0, r0
	ADD ip, r0
	cmp	ip, r0
	bne	.L10	@cond_branch
	b	.L26
.L3:
	mov	r1, #0x1
	NEG	r1, r1
	ADD ip, r1
	add	r0, r1, #0
	cmp	ip, r0
	bne	.L12	@cond_branch
	b	.L26
.L12:
	mov	r2, #0x1f
	mov	r8, r2
.L27:
	mov	r5, r9
	ldr	r0, [r5]
	add	r3, r0, #0
	mov	r6, r8
	and	r3, r3, r6
	lsr	r4, r0, #0x5
	and	r4, r4, r6
	lsr	r1, r0, #0xa
	and	r1, r1, r6
	lsr	r2, r0, #0x10
	and	r2, r2, r6
	lsr	r5, r0, #0x15
	and	r5, r5, r6
	lsr	r0, r0, #0x1a
	and	r0, r0, r6
	str	r0, [sp, #0x10]
	mov	r7, sl
	sub	r7, r7, r3
	add	r6, r7, #0
	ldr	r7, [sp, #0xc]
	add	r0, r6, #0
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	str	r0, [sp, #0x8]
	add	r3, r3, r0
	ldr	r6, [sp, #0x34]
	sub	r6, r6, r4
	str	r6, [sp, #0x8]
	add	r0, r7, #0
	add	r7, r6, #0
	mul	r7, r7, r0
	asr	r6, r7, #0xa
	add	r4, r4, r6
	ldr	r7, [sp, #0x38]
	sub	r7, r7, r1
	str	r7, [sp, #0x8]
	add	r6, r7, #0
	mul	r6, r6, r0
	asr	r0, r6, #0xa
	add	r1, r1, r0
	mov	r6, sl
	sub	r6, r6, r2
	ldr	r0, [sp, #0xc]
	add	r7, r6, #0
	mul	r7, r7, r0
	asr	r6, r7, #0xa
	add	r2, r2, r6
	ldr	r7, [sp, #0x34]
	sub	r7, r7, r5
	str	r7, [sp, #0x8]
	add	r6, r7, #0
	mul	r6, r6, r0
	asr	r0, r6, #0xa
	add	r5, r5, r0
	ldr	r6, [sp, #0x38]
	ldr	r7, [sp, #0x10]
	sub	r6, r6, r7
	str	r6, [sp, #0x8]
	ldr	r7, [sp, #0xc]
	add	r0, r6, #0
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	str	r0, [sp, #0x8]
	ldr	r6, [sp, #0x10]
	add	r6, r6, r0
	str	r6, [sp, #0x10]
	cmp	r3, #0x1f
	ble	.L14	@cond_branch
	mov	r3, #0x1f
.L14:
	cmp	r4, #0x1f
	ble	.L15	@cond_branch
	mov	r4, #0x1f
.L15:
	cmp	r1, #0x1f
	ble	.L16	@cond_branch
	mov	r1, #0x1f
.L16:
	cmp	r2, #0x1f
	ble	.L17	@cond_branch
	mov	r2, #0x1f
.L17:
	cmp	r5, #0x1f
	ble	.L18	@cond_branch
	mov	r5, #0x1f
.L18:
	ldr	r7, [sp, #0x10]
	cmp	r7, #0x1f
	ble	.L19	@cond_branch
	mov	r0, #0x1f
	str	r0, [sp, #0x10]
.L19:
	cmp	r3, #0
	bge	.L20	@cond_branch
	mov	r3, #0x0
.L20:
	cmp	r4, #0
	bge	.L21	@cond_branch
	mov	r4, #0x0
.L21:
	cmp	r1, #0
	bge	.L22	@cond_branch
	mov	r1, #0x0
.L22:
	cmp	r2, #0
	bge	.L23	@cond_branch
	mov	r2, #0x0
.L23:
	cmp	r5, #0
	bge	.L24	@cond_branch
	mov	r5, #0x0
.L24:
	ldr	r6, [sp, #0x10]
	cmp	r6, #0
	bge	.L25	@cond_branch
	mov	r7, #0x0
	str	r7, [sp, #0x10]
.L25:
	lsl	r0, r4, #0x5
	orr	r3, r3, r0
	lsl	r0, r1, #0xa
	orr	r3, r3, r0
	lsl	r0, r2, #0x10
	orr	r3, r3, r0
	lsl	r0, r5, #0x15
	orr	r3, r3, r0
	ldr	r1, [sp, #0x10]
	lsl	r0, r1, #0x1a
	orr	r3, r3, r0
	ldr	r2, [sp, #0x4]
	stmia	r2!, {r3}
	str	r2, [sp, #0x4]
	mov	r5, #0x4
	ADD r9, r5
	mov	r6, #0x1
	NEG	r6, r6
	ADD ip, r6
	add	r0, r6, #0
	cmp	ip, r0
	beq	.L26	@cond_branch
	b	.L27
.L26:
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063830

.align 2, 0 @ Don't pad with nop.
