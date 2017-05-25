	.include "asm/common.inc"

	thumb_func_start sub_8063220
sub_8063220:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	add	r4, r0, #0
	str	r1, [sp]
	str	r2, [sp, #0x4]
	str	r3, [sp, #0x8]
	mov	r0, #0x8
	ldsh	r5, [r4, r0]
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	add	r1, r5, #0
	bl	sub_8066084
	str	r0, [sp, #0xc]
	mov	r1, #0x0
	mov	ip, r1
	ldrh	r2, [r4, #0x6]
	lsr	r2, r2, #0x1
	mov	sl, r2
	ldrh	r3, [r4, #0x4]
	lsl	r1, r3, #0x1
	ldr	r0, [r4]
	add	r0, r0, r1
	str	r0, [sp, #0x10]
	ldr	r4, [r4, #0xc]
	str	r4, [sp, #0x14]
	ldr	r6, [sp]
	ldr	r7, [sp, #0x4]
	add	r0, r6, r7
	ldr	r1, [sp, #0x8]
	CMN	r0, r1
	bne	.L1	@cond_branch
	sub	r5, r5, #0x2
	mov	r0, #0x1
	NEG	r0, r0
	lsl	r2, r2, #0x2
	str	r2, [sp, #0x20]
	cmp	r5, r0
	beq	.L2	@cond_branch
.L5:
	ldr	r2, [sp, #0x10]
	mov	r8, r2
	mov	r3, #0x0
	mov	r9, r3
	sub	r5, r5, #0x1
	str	r5, [sp, #0x1c]
	ldr	r5, [sp, #0xc]
	ADD r5, ip
	str	r5, [sp, #0x18]
	cmp	r9, sl
	bcs	.L3	@cond_branch
	mov	r7, #0x1f
.L4:
	mov	r6, r8
	add	r6, r6, #0x4
	mov	r8, r6
	sub	r6, r6, #0x4
	ldmia	r6!, {r0}
	add	r4, r0, #0
	and	r4, r4, r7
	lsr	r1, r0, #0x5
	and	r1, r1, r7
	lsr	r2, r0, #0xa
	and	r2, r2, r7
	lsr	r3, r0, #0x10
	and	r3, r3, r7
	lsr	r5, r0, #0x15
	and	r5, r5, r7
	lsr	r6, r0, #0x1a
	and	r6, r6, r7
	mov	r0, ip
	mul	r0, r0, r4
	asr	r0, r0, #0xa
	sub	r4, r4, r0
	mov	r0, ip
	mul	r0, r0, r1
	asr	r0, r0, #0xa
	sub	r1, r1, r0
	mov	r0, ip
	mul	r0, r0, r2
	asr	r0, r0, #0xa
	sub	r2, r2, r0
	mov	r0, ip
	mul	r0, r0, r3
	asr	r0, r0, #0xa
	sub	r3, r3, r0
	mov	r0, ip
	mul	r0, r0, r5
	asr	r0, r0, #0xa
	sub	r5, r5, r0
	mov	r0, ip
	mul	r0, r0, r6
	asr	r0, r0, #0xa
	sub	r6, r6, r0
	lsl	r0, r1, #0x5
	orr	r4, r4, r0
	lsl	r0, r2, #0xa
	orr	r4, r4, r0
	lsl	r0, r3, #0x10
	orr	r4, r4, r0
	lsl	r0, r5, #0x15
	orr	r4, r4, r0
	lsl	r0, r6, #0x1a
	orr	r4, r4, r0
	ldr	r0, [sp, #0x14]
	stmia	r0!, {r4}
	str	r0, [sp, #0x14]
	mov	r1, #0x1
	ADD r9, r1
	cmp	r9, sl
	bcc	.L4	@cond_branch
.L3:
	ldr	r2, [sp, #0x18]
	mov	ip, r2
	ldr	r5, [sp, #0x1c]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r5, r0
	bne	.L5	@cond_branch
.L2:
	ldr	r5, .L7
	ldr	r3, [r5]
	mov	r0, #0x0
	ldr	r1, [sp, #0x14]
	ldr	r2, [sp, #0x20]
	bl	call_via_r3
	b	.L24
.L8:
	.align	2, 0
.L7:
	.4byte	0x807d970
.L1:
	sub	r5, r5, #0x1
	b	.L9
.L25:
	ldr	r6, [sp, #0x10]
	mov	r8, r6
	mov	r7, #0x0
	mov	r9, r7
	sub	r5, r5, #0x1
	str	r5, [sp, #0x1c]
	ldr	r0, [sp, #0xc]
	ADD r0, ip
	str	r0, [sp, #0x18]
	cmp	r9, sl
	bcs	.L10	@cond_branch
.L23:
	mov	r1, r8
	ldr	r0, [r1]
	add	r4, r0, #0
	mov	r2, #0x1f
	and	r4, r4, r2
	lsr	r1, r0, #0x5
	and	r1, r1, r2
	lsr	r2, r0, #0xa
	mov	r3, #0x1f
	and	r2, r2, r3
	lsr	r3, r0, #0x10
	mov	r5, #0x1f
	and	r3, r3, r5
	lsr	r5, r0, #0x15
	mov	r6, #0x1f
	and	r5, r5, r6
	lsr	r6, r0, #0x1a
	mov	r7, #0x1f
	and	r6, r6, r7
	ldr	r0, [sp]
	sub	r0, r0, r4
	str	r0, [sp, #0x24]
	add	r7, r0, #0
	mov	r0, ip
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	add	r4, r4, r0
	ldr	r0, [sp, #0x4]
	sub	r0, r0, r1
	str	r0, [sp, #0x24]
	add	r7, r0, #0
	mov	r0, ip
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	add	r1, r1, r0
	ldr	r0, [sp, #0x8]
	sub	r0, r0, r2
	str	r0, [sp, #0x24]
	add	r7, r0, #0
	mov	r0, ip
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	add	r2, r2, r0
	ldr	r0, [sp]
	sub	r0, r0, r3
	str	r0, [sp, #0x24]
	add	r7, r0, #0
	mov	r0, ip
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	add	r3, r3, r0
	ldr	r0, [sp, #0x4]
	sub	r0, r0, r5
	str	r0, [sp, #0x24]
	add	r7, r0, #0
	mov	r0, ip
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	add	r5, r5, r0
	ldr	r0, [sp, #0x8]
	sub	r0, r0, r6
	str	r0, [sp, #0x24]
	add	r7, r0, #0
	mov	r0, ip
	mul	r0, r0, r7
	asr	r0, r0, #0xa
	add	r6, r6, r0
	cmp	r4, #0x1f
	ble	.L11	@cond_branch
	mov	r4, #0x1f
.L11:
	cmp	r1, #0x1f
	ble	.L12	@cond_branch
	mov	r1, #0x1f
.L12:
	cmp	r2, #0x1f
	ble	.L13	@cond_branch
	mov	r2, #0x1f
.L13:
	cmp	r3, #0x1f
	ble	.L14	@cond_branch
	mov	r3, #0x1f
.L14:
	cmp	r5, #0x1f
	ble	.L15	@cond_branch
	mov	r5, #0x1f
.L15:
	cmp	r6, #0x1f
	ble	.L16	@cond_branch
	mov	r6, #0x1f
.L16:
	cmp	r4, #0
	bge	.L17	@cond_branch
	mov	r4, #0x0
.L17:
	cmp	r1, #0
	bge	.L18	@cond_branch
	mov	r1, #0x0
.L18:
	cmp	r2, #0
	bge	.L19	@cond_branch
	mov	r2, #0x0
.L19:
	cmp	r3, #0
	bge	.L20	@cond_branch
	mov	r3, #0x0
.L20:
	cmp	r5, #0
	bge	.L21	@cond_branch
	mov	r5, #0x0
.L21:
	cmp	r6, #0
	bge	.L22	@cond_branch
	mov	r6, #0x0
.L22:
	lsl	r0, r1, #0x5
	orr	r4, r4, r0
	lsl	r0, r2, #0xa
	orr	r4, r4, r0
	lsl	r0, r3, #0x10
	orr	r4, r4, r0
	lsl	r0, r5, #0x15
	orr	r4, r4, r0
	lsl	r0, r6, #0x1a
	orr	r4, r4, r0
	ldr	r0, [sp, #0x14]
	stmia	r0!, {r4}
	str	r0, [sp, #0x14]
	mov	r1, #0x4
	ADD r8, r1
	mov	r2, #0x1
	ADD r9, r2
	cmp	r9, sl
	bcc	.L23	@cond_branch
.L10:
	ldr	r3, [sp, #0x18]
	mov	ip, r3
	ldr	r5, [sp, #0x1c]
.L9:
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r5, r0
	beq	.L24	@cond_branch
	b	.L25
.L24:
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063220

.align 2, 0 @ Don't pad with nop.
