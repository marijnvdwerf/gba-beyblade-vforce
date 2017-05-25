	.include "asm/common.inc"

	thumb_func_start updateKeyState
updateKeyState:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r0, .L4
	add	r4, r0, #0
	ldrh	r0, [r4]
	cmp	r0, #0x2
	bne	.L1	@cond_branch
	ldr	r3, .L4 + 4
	ldrh	r2, [r3]
	add	r0, r2, #0
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r0, .L4 + 8
	ldr	r1, [r0]
	ldrh	r5, [r1]
	add	r1, r1, #0x2
	str	r1, [r0]
	sub	r0, r2, #1
	strh	r0, [r3]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3005ca4
	.4byte	0x3005db4
	.4byte	0x3005db0
.L2:
	strh	r0, [r4]
.L3:
	ldr	r0, .L13
	ldr	r1, .L13 + 4
	ldr	r1, [r1]
	str	r1, [r0]
.L1:
	ldrh	r1, [r4]
	cmp	r1, #0x2
	beq	.L9	@cond_branch
	ldr	r0, .L13 + 8
	ldrh	r0, [r0]
	MVN	r0, r0
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r0, .L13 + 12
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r0, .L13
	ldr	r1, .L13 + 4
	ldr	r1, [r1]
	str	r1, [r0]
.L7:
	ldrh	r4, [r4]
	cmp	r4, #0x1
	bne	.L9	@cond_branch
	ldr	r2, .L13 + 16
	ldrh	r0, [r2]
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r0, .L13 + 20
	ldr	r1, [r0]
	strh	r5, [r1]
	add	r1, r1, #0x2
	str	r1, [r0]
	ldrh	r0, [r2]
	sub	r0, r0, #0x1
	strh	r0, [r2]
.L9:
	ldr	r4, .L13 + 24
	ldr	r1, .L13 + 28
	ldrh	r2, [r1]
	add	r0, r5, #0
	BIC	r0, r2
	strh	r0, [r4]
	ldr	r3, .L13 + 32
	mov	r0, #0x0
	strh	r0, [r3]
	ldr	r0, .L13 + 36
	strh	r2, [r0]
	strh	r5, [r1]
	mov	r5, #0x0
	mov	sl, r3
	mov	r2, #0x1
	mov	r9, r2
	ldr	r7, .L13 + 4
	ldr	r6, .L13 + 40
	add	r4, r6, #4
	mov	r8, r4
	mov	r0, #0x8
	add	r0, r0, r6
	mov	ip, r0
.L18:
	mov	r0, r9
	LSL	r0, r5
	ldr	r1, .L13 + 24
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	ble	.L10	@cond_branch
	ldr	r4, .L13 + 40
	lsl	r2, r5, #0x1
	add	r0, r2, r5
	lsl	r3, r0, #0x3
	mov	r0, r8
	add	r1, r3, r0
	add	r0, r4, #0
	add	r0, r0, #0xc
	add	r0, r3, r0
	ldr	r1, [r1]
	ldr	r0, [r0]
	add	r1, r1, r0
	ldr	r0, [r7]
	cmp	r0, r1
	bls	.L11	@cond_branch
	add	r0, r3, r4
	mov	r1, r9
	strh	r1, [r0, #0x10]
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x3005da8
	.4byte	0x3000e30
	.4byte	0x4000130
	.4byte	0x3ff
	.4byte	0x3005db4
	.4byte	0x3005db0
	.4byte	0x3005da0
	.4byte	0x3005ca0
	.4byte	0x3005dac
	.4byte	0x3005da4
	.4byte	0x3005cb0
.L11:
	add	r1, r3, r4
	ldrh	r0, [r1, #0x10]
	add	r0, r0, #0x1
	strh	r0, [r1, #0x10]
.L12:
	add	r0, r2, r5
	lsl	r0, r0, #0x3
	add	r2, r6, #0
	add	r2, r2, #0x14
	add	r2, r0, r2
	add	r0, r0, r6
	ldr	r1, [r0]
	str	r1, [r2]
	ldr	r1, [r7]
	str	r1, [r0]
.L10:
	mov	r4, #0x1
	add	r3, r4, #0
	LSL	r3, r5
	add	r0, r3, #0
	ldr	r2, .L19
	ldrh	r2, [r2]
	and	r0, r0, r2
	cmp	r0, #0
	ble	.L15	@cond_branch
	lsl	r0, r5, #0x1
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	mov	r1, ip
	add	r2, r0, r1
	add	r0, r0, r6
	ldr	r1, [r7]
	ldr	r0, [r0]
	sub	r1, r1, r0
	str	r1, [r2]
.L15:
	ldr	r2, .L19
	ldrh	r0, [r2]
	ASR	r0, r5
	and	r0, r0, r4
	cmp	r0, #0
	bne	.L17	@cond_branch
	add	r0, r3, #0
	ldr	r4, .L19 + 4
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	ble	.L17	@cond_branch
	lsl	r0, r5, #0x1
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	mov	r1, r8
	add	r2, r0, r1
	ldr	r1, [r7]
	str	r1, [r2]
	mov	r4, ip
	add	r2, r0, r4
	add	r0, r0, r6
	ldr	r0, [r0]
	sub	r1, r1, r0
	str	r1, [r2]
	mov	r0, sl
	ldrh	r0, [r0]
	orr	r3, r3, r0
	mov	r1, sl
	strh	r3, [r1]
.L17:
	add	r0, r5, #1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	cmp	r5, #0x9
	bls	.L18	@cond_branch
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
	.4byte	0x3005ca0
	.4byte	0x3005da4
	thumb_func_end updateKeyState

.align 2, 0 @ Don't pad with nop.
